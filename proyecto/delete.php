<?php

include("conexion.php");
$con=conectar();

$id_Persona=$_GET['id'];

$sql="DELETE FROM personas  WHERE id_Persona='$id_Persona'";
$query=mysqli_query($con,$sql);

    if($query){
        Header("Location: personas.php");
    }
?>
