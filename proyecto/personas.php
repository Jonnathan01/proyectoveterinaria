<?php 
    include("conexion.php");
    $con=conectar();

    $sql="SELECT *  FROM personas";
    $query=mysqli_query($con,$sql);

    $row=mysqli_fetch_array($query);
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title> PAGINA PERSONAS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/style.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        
    </head>
    <body>
            <div class="container mt-5">
                    <div class="row"> 
                        
                        <div class="col-md-3">
                            <h1>Ingrese datos</h1>
                                <form action="insertar.php" method="POST">

                                    <input type="text" class="form-control mb-3" name="id_Persona" placeholder="id Persona">
                                    <input type="text" class="form-control mb-3" name="Identificacion" placeholder="Identificacion">
                                    <input type="text" class="form-control mb-3" name="nombres" placeholder="Nombres">
                                    <input type="text" class="form-control mb-3" name="apellidos" placeholder="Apellidos">
                                    <input type="text" class="form-control mb-3" name="telefono" placeholder="Telefono">
                                     <input type="text" class="form-control mb-3" name="tipo_identificacion" placeholder="tipo_identificacion">
                                     <input type="text" class="form-control mb-3" name="direccion" placeholder="direccion">
                                   <input type="text" class="form-control mb-3" name="email" placeholder="email">
                                    <input type="submit" class="btn btn-primary">
                                </form>
                        </div>

                        <div class="col-md-8">
                            <table class="table" >
                                <thead class="table-success table-striped" >
                                    <tr>
                                        <th>id_Persona</th>
                                        <th>Identificacion</th>
                                        <th>Nombres</th>
                                        <th>Apellidos</th>
                                        <th>Telefono</th>
                                        <th>Tipo_Identificacion</th>
                                        <th>Direccion</th>
                                        <th>Email</th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>

                                <tbody>
                                        <?php
                                            while($row=mysqli_fetch_array($query)){
                                        ?>
                                            <tr>
                                                <th><?php  echo $row['id_Persona']?></th>
                                                <th><?php  echo $row['Identificacion']?></th>
                                                <th><?php  echo $row['nombres']?></th>
                                                <th><?php  echo $row['apellidos']?></th> 
                                                <th><?php  echo $row['telefono']?></th> 
                                                <th><?php  echo $row['tipo_identificacion']?></th>
                                                <th><?php  echo $row['direccion']?></th> 
                                                <th><?php  echo $row['email']?></th> 

                                                

                                              

                                                 

                                                <th><a href="actualizar.php?id=<?php echo $row['id_Persona'] ?>" class="btn btn-info">Editar</a></th>
                                                <th><a href="delete.php?id=<?php echo $row['id_Persona'] ?>" class="btn btn-danger">Eliminar</a></th>                                        
                                            </tr>
                                        <?php 
                                            }
                                        ?>
                                </tbody>
                            </table>
                        </div>
                    </div>  
            </div>
    </body>
</html>