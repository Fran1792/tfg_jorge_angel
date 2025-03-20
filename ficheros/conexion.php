<?php
// Configuración de la conexión con variables de entorno
$servidor = getenv("DB_HOST");
$usuario = getenv("DB_USER");
$contraseña = getenv("DB_PASSWORD");
$shema = getenv("DB_NAME");
$puerto = getenv("DB_PORT"); // Render usa normalmente el puerto 3306

try {
    // Establecemos conexión a la base de datos
    $conn = new mysqli($servidor, $usuario, $contraseña, $shema, $puerto);

    // Configurar codificación de caracteres
    $conn->query("SET NAMES 'utf8'");

} catch (Exception $e) {
    die("Error de conexión: " . $e->getMessage());
}
?>
