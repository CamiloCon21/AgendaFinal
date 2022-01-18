<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Persona"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body style="background: url(Imagenes/FONDO1.jpg) no-repeat; background-size: cover"
          
        <div class="container">
            <h1><p style="color:wheat;">PERSONAS Y EVENTOS </p>   </h1>
            <a class="btn btn-success" href="Controlador?accion=add">ANEXAR EVENTO</a>
            <br>
            <br>
            
            <div class="container">
                <form class="form-inline">
                    <input type="search" name="txtBuscar" class="form-control">
                    <input class="btn btn-info" type="submit" name="accion" value="Buscar">
                </form>
            </div>

            <br>
            <br>
            
            <table class="table table-bordered" >
                <thead>
                    <tr>
                        <th class="text-center"><p style="color: #080808">ID</p></th>
                        <th class="text-center"><p style="color: #080808">DNI</p></th>
                        <th class="text-center"><p style="color: #080808">NOMRBES</p></th>
                        <th class="text-center"><p style="color: #080808">APELLIDOS</p></th>
                        <th class="text-center"><p style="color: #080808">EDAD</p></th>
                        <th class="text-center"><p style="color: #080808">FECHA</p></th>
                        <th class="text-center"><p style="color: #080808">HORA</p></th>
                        <th class="text-center"><p style="color: #080808">DESCRIPCION</p></th>
                        <th class="text-center"><p style="color: #080808">OPCIONES</p></th>
                    </tr>
                </thead>
                <%
                    PersonaDAO dao=new PersonaDAO();
                    List<Persona>list=dao.listar();
                    Iterator<Persona>iter=list.iterator();
                    Persona per=null;
                    while(iter.hasNext()){
                        per=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><p style="color: activeborder"><%= per.getId()%></td>
                        <td class="text-center"><p style="color: activeborder"><%= per.getDni()%></td>
                        <td class="text-center"><p style="color: activeborder"><%= per.getNombre()%></td>
                        <td class="text-center"><p style="color: activeborder"><%= per.getApellido()%></td>
                        <td class="text-center"><p style="color: activeborder"><%= per.getEdad()%></td>
                        <td class="text-center"><p style="color: activeborder"><%= per.getFecha()%></td>
                        <td class="text-center"><p style="color: activeborder"><%= per.getHora()%></td>
                        <td class="text-center"><p style="color: activeborder"><%= per.getDescripcion()%></td>
                        <td class="text-center">
                            <a class="btn btn-warning" href="Controlador?accion=editar&id=<%= per.getId()%>">MODIFICAR</a>
                            <a class="btn btn-danger" href="Controlador?accion=eliminar&id=<%= per.getId()%>">ELIMINAR</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            
                <%
                    if(request.getAttribute("mensaje") != null){ 
                        String consulta = (String)request.getAttribute("mensaje");     
                        PersonaDAO dao1 = new PersonaDAO();
                        List<Persona>lista2 = dao1.consultar(consulta);
                        Iterator<Persona>iter2=lista2.iterator();
                        System.out.println(lista2);
                        Persona per2 = null;
                                                        
                %>
                
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th class="text-center"><p style="color: #080808">ID</p></th>
                            <th class="text-center"><p style="color: #080808">DNI</p></th>
                            <th class="text-center"><p style="color: #080808">NOMBRES</p></th>
                            <th class="text-center"><p style="color: #080808">APELLIDOS</p></th>
                            <th class="text-center"><p style="color: #080808">EDAD</p></th>
                            <th class="text-center"><p style="color: #080808">FECHA</p></th>
                            <th class="text-center"><p style="color: #080808">HORA</p></th>
                            <th class="text-center"><p style="color: #080808">DESCRIPCION</p></th>
                        </tr>
                    </thead>
                    
                    <%
                        while(iter2.hasNext()){
                        per2=iter2.next();
                    %>
                    <tbody>
                    <tr>
                        <td class="text-center"><p style="color: activeborder"><%= per2.getId()%></td>
                        <td class="text-center"><p style="color: activeborder"><%= per2.getDni()%></td>
                        <td class="text-center"><p style="color: activeborder"><%= per2.getNombre()%></td>
                        <td class="text-center"><p style="color: activeborder"><%= per2.getApellido()%></td>
                        <td class="text-center"><p style="color: activeborder"><%= per2.getEdad()%></td>
                        <td class="text-center"><p style="color: activeborder"><%= per2.getFecha()%></td>
                        <td class="text-center"><p style="color: activeborder"><%= per2.getHora()%></td>
                        <td class="text-center"><p style="color: activeborder"><%= per2.getDescripcion()%></td>
                        
                    </tr>
                    <%}%>
                </tbody>
                </table>
                <%                   
                      }
                %>        
                
        </div>
    </body>
</html>
