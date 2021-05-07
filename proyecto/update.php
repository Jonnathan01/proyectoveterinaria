<?php

include("conexion.php");
$con=conectar();

$id_Persona=$_POST['id_Persona'];
$indentificacion=$_POST['Identificacion'];
$nombres=$_POST['nombres'];
$apellidos=$_POST['apellidos'];
$telefono=$_POST['telefono'];
$tipo_identificacion=$_POST['tipo_identificacion'];
$direccion=$_POST['direccion'];
$correo=$_POST['correo'];



$sql="UPDATE personas SET  Identificacion='$identificacion',nombres='$nombres',apellidos='$apellidos',telefono='$telefono',tipo_identificacion='$tipo_identificacion',direccion='$direccion', email='$email'  WHERE id_Persona='$id_Persona'";
$query=mysqli_query($con,$sql);

    if($query){
        Header("Location: personas.php");
    }
?>