<?php
require(__DIR__ . '../ficheros/conexion.php'); 
require(__DIR__ . '../fpdf/fpdf.php'); 

if (!isset($_GET['id_pedido'])) {
    die("ID de pedido no especificado.");
}

$id_pedido = intval($_GET['id_pedido']);

$sql = "SELECT 
pe.id_pedido, 
pe.nombre AS nombre_pedido,
pe.correo AS correo_pedido,
pp.id_vehiculo, 
pp.cantidad, 
CONCAT(v.marca, ' ', v.modelo) AS vehiculo,  
v.precio,  
v.año AS año,  
u.nombre AS usuario,
pe.fecha_compra,
pe.metodo_pago,
pe.pais
FROM 
pedidos pe
JOIN 
pedido_producto pp ON pe.id_pedido = pp.id_pedido
JOIN 
vehiculos v ON pp.id_vehiculo = v.id_vehiculo
JOIN 
usuarios u ON pp.id_usuario = u.id_usuario
WHERE pe.id_pedido = ?";

$stmt = mysqli_prepare($conn, $sql);
if (!$stmt) {
    die("Error en la preparación de la consulta: " . mysqli_error($conn));
}

mysqli_stmt_bind_param($stmt, "i", $id_pedido);
mysqli_stmt_execute($stmt);
$resultado = mysqli_stmt_get_result($stmt);
$pedido = mysqli_fetch_assoc($resultado);

if (!$pedido) {
    die("Pedido no encontrado.");
}

$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial', 'B', 16);
$pdf->Cell(190, 10, 'Factura de Compra', 0, 1, 'C');
$pdf->Ln(10);

$pdf->SetFont('Arial', '', 12);
$pdf->Cell(50, 10, "Nombre del Cliente:", 0);
$pdf->Cell(100, 10, $pedido['nombre_pedido'], 0, 1);

$pdf->Cell(50, 10, "Usuario:", 0);
$pdf->Cell(100, 10, $pedido['usuario'], 0, 1);

$pdf->Cell(50, 10, "Correo:", 0);
$pdf->Cell(100, 10, $pedido['correo_pedido'], 0, 1);

$pdf->Cell(50, 10, "Fecha de Compra:", 0);
$pdf->Cell(100, 10, $pedido['fecha_compra'], 0, 1);

$pdf->Cell(50, 10, "Metodo de Pago:", 0);
$pdf->Cell(100, 10, $pedido['metodo_pago'], 0, 1);

$pdf->Cell(50, 10, "Pais:", 0);
$pdf->Cell(100, 10, $pedido['pais'], 0, 1);

$pdf->Ln(10);
$pdf->SetFont('Arial', 'B', 14);
$pdf->Cell(190, 10, 'Detalles del Vehiculo', 0, 1, 'C');
$pdf->SetFont('Arial', '', 12);

$pdf->Cell(50, 10, "Marca:", 0);
$pdf->Cell(100, 10, $pedido['vehiculo'], 0, 1);

$pdf->Cell(50, 10, "Año:", 0);
$pdf->Cell(100, 10, $pedido['año'], 0, 1);

$pdf->Cell(50, 10, "Cantidad:", 0);
$pdf->Cell(100, 10, $pedido['cantidad'], 0, 1);

$pdf->Cell(50, 10, "Precio Unitario:", 0);
$pdf->Cell(100, 10, "$" . number_format($pedido['precio'], 2), 0, 1);

$total = $pedido['cantidad'] * $pedido['precio'];
$pdf->Cell(50, 10, "Total a Pagar:", 0);
$pdf->Cell(100, 10, "$" . number_format($total, 2), 0, 1);

$pdf->Ln(10);
$pdf->SetFont('Arial', 'B', 14);
$pdf->Cell(190, 10, "Gracias por su compra!", 0, 1, 'C');

// Limpia cualquier salida previa antes de enviar el PDF
ob_clean();
flush();
header('Content-Type: application/pdf');
header('Content-Disposition: inline; filename="factura.pdf"');

$pdf->Output('I');
exit;
?>
