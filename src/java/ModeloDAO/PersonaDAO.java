
package ModeloDAO;

import Config.Conexion;
import Intefaces.CRUD;
import Modelo.Persona;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PersonaDAO implements CRUD{
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Persona p=new Persona();
    
    @Override
    public List listar() {
        ArrayList<Persona>list=new ArrayList<>();
        String sql="select * from persona";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Persona per=new Persona();
                per.setId(rs.getInt("Id"));
                per.setDni(rs.getInt("DNI"));
                per.setNombre(rs.getString("Nombres"));
                per.setApellido(rs.getString("APELLIDO"));
                per.setEdad(Integer.parseInt(rs.getString("EDAD")));
                per.setFecha(rs.getString("FECHA"));
                per.setHora(rs.getString("HORA"));
                per.setDescripcion(rs.getString("DESCRIPCION"));
                list.add(per);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public Persona list(int id) {
        String sql="select * from persona where Id="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){                
                p.setId(rs.getInt("Id"));
                p.setDni(rs.getInt("DNI"));
                p.setNombre(rs.getString("Nombres"));
                p.setApellido(rs.getString("APELLIDO"));
                p.setEdad(Integer.parseInt(rs.getString("EDAD")));
                p.setFecha(rs.getString("FECHA"));
                p.setHora(rs.getString("HORA"));
                p.setDescripcion(rs.getString("DESCRIPCION"));
            }
        } catch (Exception e) {
        }
        return p;
    }

    @Override
    public boolean add(Persona per) {
       String sql="insert into persona(DNI, Nombres, Apellido, Edad, Fecha, Hora, Descripcion)values('"+per.getDni()+"','"+per.getNombre()+"','"+per.getApellido()+"','"+per.getEdad()+"','"+per.getFecha()+"','"+per.getHora()+"','"+per.getDescripcion()+"')";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }

    @Override
    public boolean edit(Persona per) {
        String sql="update persona set DNI='"+per.getDni()+"',Nombres='"+per.getNombre()+"',Apellido='"+per.getApellido()+"',Edad='"+per.getEdad()+"',Fecha='"+per.getFecha()+"',Hora='"+per.getHora()+"',Descripcion='"+per.getDescripcion()+"'where Id="+per.getId();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean eliminar(int id) {
        String sql="delete from persona where Id="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public List consultar(String fecha) {
        ArrayList<Persona>lista2=new ArrayList<>();
        String sql="select * from persona where Fecha="+fecha;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){    
                Persona per2=new Persona();
                per2.setId(rs.getInt("Id"));
                per2.setDni(rs.getInt("DNI"));
                per2.setNombre(rs.getString("Nombres"));
                per2.setApellido(rs.getString("APELLIDO"));
                per2.setEdad(Integer.parseInt(rs.getString("EDAD")));
                per2.setFecha(rs.getString("FECHA"));
                per2.setHora(rs.getString("HORA"));
                per2.setDescripcion(rs.getString("DESCRIPCION"));
                lista2.add(per2);
            }
        } catch (Exception e) {
        }       
        return lista2;
        
    }

}
