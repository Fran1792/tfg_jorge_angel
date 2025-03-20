<?php
require('../ficheros/conexion.php'); // Conexión a la base de datos

$query = "SELECT COUNT(*) AS total FROM vehiculos";
$resultado = mysqli_query($conn, $query);
$fila = mysqli_fetch_assoc($resultado);
$total_vehiculos = $fila['total'];

echo $total_vehiculos;

mysqli_close($conn);
?>
