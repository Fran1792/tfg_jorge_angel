<?php
session_start();
require('../ficheros/conexion.php'); // Conexión a la base de datos
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '../PHPMailer/src/Exception.php';
require '../PHPMailer/src/PHPMailer.php';
require '../PHPMailer/src/SMTP.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener datos del formulario
    $nombre = $_POST['nombre'] ?? null;
    $correo = $_POST['correo'] ?? null;
    $fecha_compra = $_POST['fecha_compra'] ?? date('Y-m-d');
    $metodo_pago = $_POST['metodo_pago'] ?? null;
    $pais = $_POST['pais'] ?? null;
    $provincia = $_POST['provincia'] ?? null;
    $codigo_postal = $_POST['codigo_postal'] ?? null;
    $numero_telefono = $_POST['numero_telefono'] ?? null;
    $id_vehiculo = $_POST['id_vehiculo'] ?? null;
    $cantidad = $_POST['cantidad'] ?? 1;
    $id_usuario = $_SESSION['userid'];

    if (!$nombre || !$correo || !$metodo_pago || !$pais || !$provincia || !$codigo_postal || !$numero_telefono || !$id_vehiculo) {
        echo json_encode(["error" => "Todos los campos obligatorios deben completarse"]);
        exit;
    }

    // Obtener los detalles del vehículo (marca, modelo y stock) usando el id_vehiculo
    $sql_vehiculo = "SELECT marca, modelo, stock FROM vehiculos WHERE id_vehiculo = ?";
    $stmt_vehiculo = mysqli_prepare($conn, $sql_vehiculo);
    mysqli_stmt_bind_param($stmt_vehiculo, "i", $id_vehiculo);
    mysqli_stmt_execute($stmt_vehiculo);
    mysqli_stmt_bind_result($stmt_vehiculo, $marca, $modelo, $stock);
    mysqli_stmt_fetch($stmt_vehiculo);
    mysqli_stmt_close($stmt_vehiculo);

    // Verificar si se obtuvieron los datos del vehículo
    if (!$marca || !$modelo) {
        echo json_encode(["error" => "No se pudo obtener los detalles del vehículo"]);
        exit;
    }

    // Verificar si hay suficiente stock
    if ($stock < $cantidad) {
        echo json_encode(["error" => "No hay suficiente stock para este vehículo"]);
        exit;
    }

    // Insertar en la tabla `pedidos`
    $sql_pedido = "INSERT INTO pedidos (nombre, correo, fecha_compra, metodo_pago, pais, provincia, codigo_postal, numero_telefono) 
                   VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt_pedido = mysqli_prepare($conn, $sql_pedido);
    mysqli_stmt_bind_param($stmt_pedido, "ssssssss", $nombre, $correo, $fecha_compra, $metodo_pago, $pais, $provincia, $codigo_postal, $numero_telefono);

    if (!mysqli_stmt_execute($stmt_pedido)) {
        echo json_encode(["error" => "Error al registrar la compra"]);
        exit;
    }

    // Obtener el id_pedido del pedido recién insertado
    $id_pedido = mysqli_insert_id($conn);

    // Insertar en la tabla `pedido_producto` con el id_pedido
    $sql_pedido_producto = "INSERT INTO pedido_producto (id_usuario, id_vehiculo, cantidad, id_pedido) 
                            VALUES (?, ?, ?, ?)";
    $stmt_pedido_producto = mysqli_prepare($conn, $sql_pedido_producto);
    mysqli_stmt_bind_param($stmt_pedido_producto, "iiii", $id_usuario, $id_vehiculo, $cantidad, $id_pedido);

    if (!mysqli_stmt_execute($stmt_pedido_producto)) {
        echo json_encode(["error" => "Error al registrar la compra en pedido_producto"]);
        exit;
    }

    // Actualizar el stock del vehículo
    $nuevo_stock = $stock - $cantidad;
    $sql_actualizar_stock = "UPDATE vehiculos SET stock = ? WHERE id_vehiculo = ?";
    $stmt_actualizar_stock = mysqli_prepare($conn, $sql_actualizar_stock);
    mysqli_stmt_bind_param($stmt_actualizar_stock, "ii", $nuevo_stock, $id_vehiculo);
    if (!mysqli_stmt_execute($stmt_actualizar_stock)) {
        echo json_encode(["error" => "Error al actualizar el stock"]);
        exit;
    }

    // Enviar correo al cliente
    $mail = new PHPMailer(true);
    try {
        // Configuración del servidor SMTP
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com'; // Usa el servidor SMTP de tu elección
        $mail->SMTPAuth = true;
        $mail->Username = 'franmorcillo92@gmail.com'; // Tu correo de envío
        $mail->Password = 'rnfs jtvt rmdq fpxl'; // Tu contraseña de correo
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = 587;

        // De: dirección de correo
        $mail->setFrom('franmorcillo92@gmail.com', 'Nombre de tu empresa');

        // A: dirección de correo del cliente
        $mail->addAddress($correo); // El correo del cliente, que viene del formulario

        // Contenido del correo
        $mail->isHTML(true);
        $mail->Subject = 'Confirmación de Compra';
        $mail->Body = "
            <h1>Gracias por tu compra, $nombre!</h1>
            <p>Tu compra ha sido realizada con éxito. Aquí están los detalles:</p>
            <ul>
                <li><strong>Fecha de Compra:</strong> $fecha_compra</li>
                <li><strong>Método de Pago:</strong> $metodo_pago</li>
                <li><strong>Vehículo:</strong> $marca $modelo</li> <!-- Aquí usamos marca y modelo -->
                <li><strong>Teléfono:</strong> $numero_telefono</li>
            </ul>
            <p>Te enviamos la factura a tu correo.</p>
        ";

        // Enviar el correo
        if ($mail->send()) {
            echo json_encode([
                "mensaje" => "Compra realizada con éxito",
                "factura" => "php/generar_pdf.php?id_pedido=" . $id_pedido // Ruta de la factura
            ]);
        } else {
            echo json_encode(["error" => "Error al enviar el correo"]);
        }
    } catch (Exception $e) {
        echo json_encode(["error" => "Mailer Error: {$mail->ErrorInfo}"]);
    }

    mysqli_close($conn);
}
?>
