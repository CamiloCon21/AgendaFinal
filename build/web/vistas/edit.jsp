<%@page import="Modelo.Persona"%>
<%@page import="ModeloDAO.PersonaDAO"%>
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
              <%
              PersonaDAO dao=new PersonaDAO();
              int id=Integer.parseInt((String)request.getAttribute("idper"));
              Persona p=(Persona)dao.list(id);
          %>
            <h1>Modificar Persona</h1>
            
            <form action="Controlador">
                <p style="color:black;">DNI:</p>
                <input class="form-control" type="text" name="txtDni" value="<%= p.getDni()%>"><br>
                <p style="color:black;">Nombres: </p>
                <input class="form-control" type="text" name="txtNom" value="<%= p.getNombre()%>"><br>
                <p style="color:black;">APELLIDOS: </p>
                <input class="form-control" type="text" name="txtApe" value="<%= p.getApellido()%>"><br>
                <p style="color:black;">EDAD: </p>
                <input class="form-control" type="text" name="txtEd" value="<%= p.getEdad()%>"><br>
                <p style="color:black;">FECHA: </p>
                <input class="form-control" type="text" name="txtFec" value="<%= p.getFecha()%>"><br>
                <p style="color:black;">HORA: </p>
                <input class="form-control" type="text" name="txtHor" value="<%= p.getHora()%>"><br>
                <p style="color:black;">DESCRIPCION: </p> 
                <input class="form-control" type="text" name="txtDes" value="<%= p.getDescripcion()%>"><br>
                
                <input type="hidden" name="txtid" value="<%= p.getId()%>">
                <input class="btn btn-success" type="submit" name="accion" value="Actualizar"> 
                <a class="btn btn-danger" href="Controlador?accion=listar">Regresar</a>
            </form>
          </div>
          
        </div>
    </body>
</html>
