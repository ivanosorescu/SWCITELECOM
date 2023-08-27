package com.pe.DAO;

import com.pe.conection.ConexionBD;
import com.pe.model.entity.Auxiliar;
import com.pe.model.entity.Trabajador;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;


public class EmpleadoDAO {

    ConexionBD cn = new ConexionBD();
    Connection con;
    int mensaje = 0;
    PreparedStatement ps;
    ResultSet rs;
    CallableStatement call = null;
    String mensaj = "";
    Trabajador emp = new Trabajador();
    Trabajador Empleado = new Trabajador();

//Listar cliente uso en Cliente.jsp.jsp
    public List ListadoEmpleado() {
        ArrayList<Trabajador> listaEmpleado = new ArrayList<>();
        String sql = "SELECT * FROM Empleado";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Trabajador e = new Trabajador();
                e.setId(rs.getInt("id"));
                e.setCodigo(rs.getString("Codigo"));
                e.setNombre(rs.getString("Nombre"));
                e.setIdTipodocumento(rs.getInt("idTipodocumento"));
                e.setNrodocumento(rs.getString("dni"));     
                e.setSueldo(rs.getDouble("sueldo"));
                e.setTelefono(rs.getString("Telefono"));
                e.setDireccion(rs.getString("Direccion"));
                e.setEmail(rs.getString("Email"));
                e.setFechaderegistro(rs.getString("fecharegistro"));
                e.setEstado(rs.getString("Estado"));
                listaEmpleado.add(e);
            }
        } catch (Exception e) {
        }
        return listaEmpleado;
    }

  

    //Insertar Cliente uso ControllerCliente
    public boolean add(Trabajador trab) {
        boolean flag = false;
         String sql = "insert into empleado(Codigo, nombre, Idtipodocumento, dni, sueldo, telefono, direccion, email, fecharegistro, estado)values('" + trab.getCodigo() + "','" + trab.getNombre() + "','" + trab.getIdTipodocumento() + "','" + trab.getNrodocumento() + "','" + trab.getSueldo() + "','" + trab.getTelefono() + "','" + trab.getDireccion() + "','" + trab.getEmail() + "','" + trab.getFechaderegistro() + "','" + trab.getEstado() + "')";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            if (ps.executeUpdate() == 1) {
                flag = true;
            }

        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return flag;
    }
        public boolean validacion(Trabajador cli) {
        boolean flag = false;
        String sql = "select * from empleado where dni=" + cli.getNrodocumento();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                flag = true;
            }
        } catch (Exception e) {

        }
        return flag;
    }

//Editar cliente uso en ControllerCliente
    public boolean Edit(Trabajador t) {
        boolean flag = false;
        String sql = "UPDATE Empleado set Codigo='" + t.getCodigo()+ "',nombre='" + t.getNombre()+ "',Idtipodocumento='" + t.getIdTipodocumento()+ "',dni='" + t.getNrodocumento()+ "',sueldo='" + t.getSueldo()+ "',telefono='" + t.getTelefono()+ "',Direccion='" + t.getDireccion()+ "',email='" + t.getEmail()+ "' WHERE id=" + t.getId();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            if (ps.executeUpdate() == 1) {
                flag = true;
            }

        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return flag;
    }

    //Eliminar cliente uso en ControllerCliente
    public boolean Eliminar(int id) {
        String sql = "delete from Empleado where id=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    public static String getEstado(int cod) {

        try {
            String sql = "select Estado from Empleado where id=" + cod;
            Connection connection = ConexionBD.Conectar();
            PreparedStatement prepare = connection.prepareStatement(sql);
            ResultSet resultSet = prepare.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("Estado");
            }
            return "--";
        } catch (Exception e) {
            return "--";
        }
    }

    //Mostrar estado segun el ID del cliente uso en ControllerCliente and Cliente.jsp
    public static String estado(int cod) {
        try {
            String sql = "select Estado from Empleado where id=" + cod;
            Connection connection = ConexionBD.Conectar();
            PreparedStatement prepare = connection.prepareStatement(sql);
            ResultSet resultSet = prepare.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("estado");
            }
            return "--";

        } catch (Exception e) {
            return "--";
        }
    }

    //Editar estado de cliente uso en ControllerCliente
    public boolean editEstado(Trabajador tr, int id) {
        String sql = "update Empleado set Estado='" + tr.getEstado() + "' where id=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    //Codigo para cliente us en InsertarEmpleado.jsp
    public String Numserie() {
        String sql = "{call sp_generar_codigoempleado()}";
        try {
            con = cn.getConnection();
            call = con.prepareCall(sql);
            rs = call.executeQuery();

            if (rs.next()) {
                mensaj = rs.getString(1);
            }
        } catch (SQLException e) {
        }
        return mensaj;
    }

//Llamar al cliente para seleccionar en VInsertarventa uso en // ControllerCliente
    public Trabajador BuscarPorId(int idemp) {
        Trabajador emp = null;
        String sql = "select * from Empleado where id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idemp);
            rs = ps.executeQuery();
            if (rs.next()) {
                emp = new Trabajador();
                emp.setId(rs.getInt("id"));
                emp.setCodigo(rs.getString("Codigo"));
                emp.setNombre(rs.getString("nombre"));
                emp.setIdTipodocumento(rs.getInt("Idtipodocumento"));
                emp.setNrodocumento(rs.getString("dni"));
                emp.setSueldo(rs.getDouble("sueldo"));
                emp.setTelefono(rs.getString("telefono"));
                emp.setDireccion(rs.getString("direccion"));
                emp.setEmail(rs.getString("email"));
                emp.setFechaderegistro(rs.getString("fecharegistro"));
                emp.setEstado(rs.getString("Estado"));
            }
        } catch (SQLException e) {
            mensaj = e.getMessage();
        } finally {
            cn.desconectar();
        }
        return emp;
    }

    public static String getNombre(int cod) {
        try {
            String sql = "Select Nombre from Empleado where id=" + cod;
            Connection connection = ConexionBD.Conectar();
            PreparedStatement prepare = connection.prepareStatement(sql);
            ResultSet resultSet = prepare.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("Nombre");
            }
            return "--";
        } catch (Exception e) {
            return "--";
        }
    }
    
        public static String getCorreo(int cod) {

        try {
            String sql = "Select Correo from Auxiliar where Idauxiliar=" + cod;
            Connection connection = ConexionBD.Conectar();
            PreparedStatement prepare = connection.prepareStatement(sql);
            ResultSet resultSet = prepare.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("Correo");

            }
            return "--";

        } catch (Exception e) {
            return "--";
        }

    }

    public static String getnrodocumento(int cod) {
        try {
            String sql = "Select Numerodocumento from Auxiliar where Idauxiliar=" + cod;
            Connection connection = ConexionBD.Conectar();
            PreparedStatement prepare = connection.prepareStatement(sql);
            ResultSet resultSet = prepare.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("Numerodocumento");
            }
            return "--";

        } catch (Exception e) {
            return "--";
        }
    }

    public static String getDireccion(int cod) {
        try {
            String sql = "Select Direccion from Cliente where Idcliente=" + cod;
            Connection connection = ConexionBD.Conectar();
            PreparedStatement prepare = connection.prepareStatement(sql);
            ResultSet resultSet = prepare.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("Direccion");
            }
            return "--";

        } catch (Exception e) {
            return "--";
        }
    }


//    Agregar Codigo a clientes en Insertarcliente.jsp
    public int BuscarNclientes() {
        String sSQL = "SELECT COUNT(*) as Nclientes FROM Auxiliar WHERE Tipoauxi ='C'";

        try {
            int Nclientes = 0;
            con = cn.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sSQL);
            while (rs.next()) {
                Nclientes = rs.getInt("Nclientes");
            }

            return Nclientes;

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
            return 0;
        }

    }
    
    //    Agregar Codigo a proveedor en Insertarcliente.jsp
    public int BuscarNempleados() {
        String sSQL = "SELECT COUNT(*) as Nempleados FROM Empleado";

        try {
            int Nempleados = 0;
            con = cn.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sSQL);
            while (rs.next()) {
                Nempleados = rs.getInt("Nempleados");
            }

            return Nempleados;

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
            return 0;
        }

    }
}
