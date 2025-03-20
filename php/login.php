<?php
session_start();
usleep(400000);
require('../ficheros/conexion.php');


// Establecer cabecera para JSON
header("Content-type: application/json; charset=utf-8");

$response = array();

try {
    // Verificar que los parámetros tuser y tpassword estén presentes
    if (!isset($_POST['tuser']) || !isset($_POST['tpassword'])) {
        throw new Exception("Faltan parámetros: correo o contraseña.");
    }

    $email = $_POST['tuser'];
    $password = $_POST['tpassword'];

    // Prevenir inyección SQL
    $email = mysqli_real_escape_string($conn, $email);
    $password = mysqli_real_escape_string($conn, $password);

    // Consulta para verificar usuario por correo electrónico y contraseña
    $sql = "SELECT * FROM usuarios WHERE correo = '$email' AND contraseña = '$password'";
    $resultado = mysqli_query($conn, $sql);

    if (!$resultado) {
        throw new Exception("Error en la consulta a la base de datos: " . mysqli_error($conn));
    }

    $nregistros = mysqli_num_rows($resultado);

    // Si se encuentra el usuario, iniciar sesión
    if ($nregistros == 1) {
        $registro = mysqli_fetch_array($resultado);
        
        // Guardar datos en sesión
        $_SESSION['userid'] = $registro['id_usuario'];
        $_SESSION['username'] = $registro['nombre'];
        $_SESSION['email'] = $registro['correo'];

        // Respuesta de éxito con redirección
        $response["status"] = "success";
        $response["message"] = "Inicio de sesión exitoso. Redirigiendo...";
        $response["redirect"] = "panel_usuario.html";
    } else {
        // Si no se encuentra el usuario
        $response["status"] = "error";
        $response["message"] = "Error: Correo o contraseña incorrectos.";
    }
} catch (Exception $e) {
    // En caso de cualquier error, capturamos la excepción y la devolvemos en formato JSON
    $response["status"] = "error";
    $response["message"] = "Error: " . $e->getMessage();
}

// Devolver la respuesta JSON
echo json_encode($response);

// Cerrar conexión
mysqli_close($conn);
?>
