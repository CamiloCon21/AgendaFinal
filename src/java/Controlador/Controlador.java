package Controlador;

import Modelo.Persona;
import ModeloDAO.PersonaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Controlador extends HttpServlet {

    String listar="vistas/listar.jsp";
    String add="vistas/add.jsp";
    String edit="vistas/edit.jsp";
    Persona p=new Persona();
    PersonaDAO dao=new PersonaDAO();
    int id;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controlador</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controlador at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso="";
        String action=request.getParameter("accion");
        if(action.equalsIgnoreCase("listar")){
            acceso=listar;            
        }else if(action.equalsIgnoreCase("add")){
            acceso=add;
        }
        else if(action.equalsIgnoreCase("Agregar")){
            int dni = Integer.parseInt(request.getParameter("txtDni"));
            String nom=request.getParameter("txtNom");
            String ape = request.getParameter("txtApe");
            int Ed = Integer.parseInt(request.getParameter("txtEd"));
            String Fec = request.getParameter("txtFec");
            String Hor = request.getParameter("txtHor");
            String Des = request.getParameter("txtDes");
            p.setDni(dni);
            p.setNombre(nom);
            p.setApellido(ape);
            p.setEdad(Ed);
            p.setFecha(Fec);
            p.setHora(Hor);
            p.setDescripcion(Des);
            dao.add(p);
            acceso=listar;
        }
        else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("idper",request.getParameter("id"));
            acceso=edit;
        }
        else if(action.equalsIgnoreCase("Actualizar")){
            id=Integer.parseInt(request.getParameter("txtid"));
            int dni = Integer.parseInt(request.getParameter("txtDni"));
            String nom=request.getParameter("txtNom");
            String ape = request.getParameter("txtApe");
            int Ed = Integer.parseInt(request.getParameter("txtEd"));
            String Fec = request.getParameter("txtFec");
            String Hor = request.getParameter("txtHor");
            String Des = request.getParameter("txtDes");
            p.setId(id);
            p.setDni(dni);
            p.setNombre(nom);
            p.setApellido(ape);
            p.setEdad(Ed);
            p.setFecha(Fec);
            p.setHora(Hor);
            p.setDescripcion(Des);
            dao.edit(p);
            acceso=listar;
        }
        else if(action.equalsIgnoreCase("eliminar")){
            id=Integer.parseInt(request.getParameter("id"));
            p.setId(id);
            dao.eliminar(id);
            acceso=listar;
        }
        else if(action.equalsIgnoreCase("Buscar")){
            String Buscar = request.getParameter("txtBuscar");
            request.setAttribute("mensaje", Buscar);
            acceso = listar;
        }
            
        RequestDispatcher vista=request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
