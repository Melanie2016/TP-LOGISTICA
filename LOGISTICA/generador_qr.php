<?php
	include("Conectarbd.php");
	include("phpqrcode/qrlib.php");


	
	$datos = "http://localhost/logistica/chofer_celular.php";
	QRcode::png($datos,false,QR_ECLEVEL_Q,32);

 	QRcode::png($datos,'prueba.png');






?>
