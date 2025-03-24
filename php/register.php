<?php 

// Conexión con la base de datos
require('../ficheros/conexion.php');

// Configurar MySQL para reportar errores
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_OFF);

// Recibir datos del formulario
$v1 = strtoupper(trim($_POST['nombre']));
$v2 = trim($_POST['correo']);
$v3 = trim($_POST['password']); // Encriptar contraseña
$v4 = trim($_POST['telefono']);  
$v5 = trim($_POST['direccion']);

// Consulta SQL para insertar en la tabla usuarios
$consulta = "INSERT INTO usuarios (nombre, correo, contraseña, telefono, direccion) VALUES ('$v1', '$v2', '$v3', '$v4', '$v5')";

// Ejecutar la consulta SQL
if (mysqli_query($conn, $consulta)) {
    // Si la inserción es exitosa, redirigir al usuario a index1.html
    header("Location: ../index.html");
    exit(); // Importante para asegurarse de que no se ejecute nada más después de la redirección
} else {
    // Si hay un error, mostrar un mensaje de error
    echo 1; // Error al registrar usuario
}

// Cerrar conexión
mysqli_close($conn);

?> 
