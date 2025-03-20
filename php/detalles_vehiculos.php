<?php
session_start();
usleep(30000); // Simula un pequeño retardo en la respuesta

require('../ficheros/conexion.php'); // Incluye la conexión a la base de datos

// Verificar si el parámetro ID está presente en la URL
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    echo json_encode(["error" => "ID de vehículo no válido."]);
    exit;
}

$idVehiculo = intval($_GET['id']); // Convertir a entero para seguridad

// Consulta segura con sentencia preparada
$consulta = "SELECT * FROM vehiculos WHERE id_vehiculo = ?";
$stmt = mysqli_prepare($conn, $consulta);
mysqli_stmt_bind_param($stmt, "i", $idVehiculo);
mysqli_stmt_execute($stmt);
$resultado = mysqli_stmt_get_result($stmt);

if ($registro = mysqli_fetch_assoc($resultado)) {
    $vehiculo = array(
        "id" => $registro["id_vehiculo"],
        "marca" => $registro["marca"],
        "modelo" => $registro["modelo"],
        "anio" => $registro["año"],
        "precio" => number_format($registro["precio"], 2),
        "stock" => $registro["stock"],
        "imagen" => $registro["imagen"], // Ruta de la imagen
        "tipo" => $registro["tipo"], // Tipo de vehículo
        "color" => $registro["color"], // Color
        "combustible" => $registro["combustible"], // Tipo de combustible
        "transmision" => $registro["transmision"] // Transmisión
    );

    // Devolver los datos en formato JSON
    header("Content-Type: application/json; charset=utf-8");
    echo json_encode($vehiculo, JSON_PRETTY_PRINT);
} else {
    echo json_encode(["error" => "Vehículo no encontrado."]);
}

// Cerrar conexión y consulta
mysqli_stmt_close($stmt);
mysqli_close($conn);
?>
