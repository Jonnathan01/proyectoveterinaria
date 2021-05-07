<?php
include("conexion.php");
$con=conectar();

$id_Persona=$_POST['id_Persona'];
$identificacion=$_POST['Identificacion'];
$nombres=$_POST['nombres'];
$apellidos=$_POST['apellidos'];
$telefono=$_POST['telefono'];
$tipo_identificacion=$_POST['tipo_identificacion'];
$direccion=$_POST['direccion'];
$email=$_POST['email'];



$sql="INSERT INTO personas VALUES('$id_Persona','$identificacion','$nombres','$apellidos','$telefono','$tipo_identificacion','$direccion','$email')";
$query= mysqli_query($con,$sql);

if($query){
    Header("Location: personas.php");
    
}else {
}
?>