<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body style="background: url(Imagenes/FONDO1.jpg) no-repeat; background-size: cover "
        <div class="container">
            <div class="col-lg-6">
                <h1>Agregar Persona</h1>
                <form action="Controlador">
                    DNI:<br> 
                    <input class="form-control" type="text" name="txtDni"><br>
                    NOMBRES: <br> 
                    <input class="form-control" type="text" name="txtNom"><br>
                    APELLIDOS:<br> 
                    <input class="form-control" type="text" name="txtApe"><br>
                    EDAD:<br> 
                    <input class="form-control" type="text" name="txtEd"><br>
                    FECHA:<br> 
                    <input class="form-control" type="text" name="txtFec"><br>
                    HORA:<br> 
                    <input class="form-control" type="text" name="txtHor"><br>
                    DESCRIPCION:<br> 
                    <input class="form-control" type="text" name="txtDes"><br>
                    <input class="btn btn-primary" type="submit" name="accion" value="Agregar">
                    <a class="btn btn-danger" href="Controlador?accion=listar">Regresar</a>
                </form>
            </div>

        </div>
    </body>
</html>
