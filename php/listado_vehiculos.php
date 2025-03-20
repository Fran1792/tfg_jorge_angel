<?php
session_start();
usleep(100000); // Simula una pequeña pausa
require('../ficheros/conexion.php'); // Conexión a la base de datos

// Obtener parámetros de paginación desde GET
$apartirde = $_GET["inicio"] ?? 0;
$cantidad = $_GET["fin"] ?? 6; // 6 vehículos por página

// Array de respuesta
$jsondataLista = array();
$jsondatos = array();

// Consulta con paginación
$query = "SELECT id_vehiculo, marca, modelo, año, precio, stock, imagen FROM vehiculos ORDER BY id_vehiculo ASC LIMIT ?, ?";
$stmt = mysqli_prepare($conn, $query);
mysqli_stmt_bind_param($stmt, "ii", $apartirde, $cantidad);
mysqli_stmt_execute($stmt);
$resultado = mysqli_stmt_get_result($stmt);

while ($fila = mysqli_fetch_assoc($resultado)) {
    $json_data_vehiculo = array();
    $json_data_vehiculo["id_vehiculo"] = $fila["id_vehiculo"];
    $json_data_vehiculo["marca"] = $fila["marca"];
    $json_data_vehiculo["modelo"] = $fila["modelo"];
    $json_data_vehiculo["anio"] = $fila["año"];
    $json_data_vehiculo["precio"] = number_format($fila["precio"], 2);
    $json_data_vehiculo["stock"] = $fila["stock"];
    $json_data_vehiculo["imagen"] = "" . $fila["imagen"];

    $jsondataLista[] = $json_data_vehiculo;
}

$jsondatos["lista"] = $jsondataLista;

// Enviar respuesta en JSON
header("Content-type: application/json; charset=utf-8");
echo json_encode($jsondatos, JSON_UNESCAPED_UNICODE);

// Cerrar conexión
mysqli_close($conn);
?>
