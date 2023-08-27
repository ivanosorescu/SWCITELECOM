package com.pe.DAO;

import com.pe.Interfaz.CRUDUsuario;
import com.pe.conection.ConexionBD;
import com.pe.model.entity.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

public class UsuarioDAO implements CRUDUsuario {

    ConexionBD cn = new ConexionBD();
    int mensaje = 0;
    PreparedStatement ps = null;
    ResultSet rs = null;
    Connection con = null;
    String mensaj = "";
    Usuario U = new Usuario();

    @Override
    public List ListadoUsuario() {
        ArrayList<Usuario> list = new ArrayList<>();
        String sql = "select * from usuario";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                Usuario usu = new Usuario();
                usu.setId(rs.getInt("id"));
                usu.setIdempleado(rs.getInt("idempleado"));
                usu.setUsu(rs.getString("usu"));
                usu.setPassword(rs.getString("password"));
                usu.setRol(rs.getString("rol"));
                list.add(usu);
            }
        } catch (Exception e) {

        }
        return list;

    }

    @Override
    public Usuario list(int id) {
        ArrayList<Usuario> list = new ArrayList<>();
        String sql = "select * from usuario where id=" + id;

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                U.setId(rs.getInt("id"));
                U.setIdempleado(rs.getInt("idempleado"));
                U.setUsu(rs.getString("usu"));
                U.setPassword(rs.getString("password"));
                U.setRol(rs.getString("rol"));
                list.add(U);
            }

        } catch (Exception e) {

        }
        return U;
    }

    @Override
    public boolean add(Usuario usu) {
        boolean flag = false;
        String sql = "INSERT INTO usuario(Codigo,idempleado,usu,password,rol)"
                + "VALUES('" + usu.getCodigo() + "','" + usu.getIdempleado() + "','" + usu.getUsu() + "','" + usu.getPassword() + "','" + usu.getRol() + "')";

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

    @Override
    public boolean Edit(Usuario usu) {
        boolean flag = false;
        String sql = "update usuario set idempleado='" + usu.getIdempleado() + "',usu='" + usu.getUsu() + "',password='" + usu.getPassword() + "',rol='" + usu.getRol() + "' where id=" + usu.getId();
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

    @Override
    //Eliminar usuario
    public boolean Eliminar(int id) {
        boolean flag = false;
        String sql = "delete from usuario where id=" + id;
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

    public int usu(String usu, String pass) {
        String sql = "SELECT id FROM usuario WHERE usu ='" + usu + "' AND password='" + pass + "'";

        try {
            int Nfactura = 0;
            con = cn.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Nfactura = rs.getInt("id");
            }

            return Nfactura;

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
            return 0;
        }

    }
//Llamar al cliente para seleccionar en VInsertarventa uso en // ControllerCliente

    public Usuario BuscarPorId(int idUsuario) {
        Usuario u = null;
        String sql = "select * from usuario where idempleado = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idUsuario);
            rs = ps.executeQuery();
            if (rs.next()) {
                u = new Usuario();
                u.setIdempleado(rs.getInt("idempleado"));
                u.setUsu(rs.getString("usu"));
                u.setPassword(rs.getString("password"));
                u.setRol(rs.getString("rol"));
            }
        } catch (SQLException e) {
            mensaj = e.getMessage();
        } finally {
            cn.desconectar();
        }
        return u;
    }

    public boolean validacion(String cl) {
        boolean flag = false;
        String sql = "select usu from Usuario where usu=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cl);
            rs = ps.executeQuery();
            while (rs.next()) {
                flag = true;
            }
        } catch (Exception e) {

        }
        return flag;
    }

    public boolean vali(Usuario cli) {
        boolean flag = false;
        String sql = "select * from Usuario where idempleado=" + cli.getIdempleado();
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
//    Agregar Codigo a clientes en Insertarcliente.jsp

    public int BuscarNusuarios() {
        String sSQL = "SELECT COUNT(*) as Nusuarios FROM usuario";

        try {
            int Nusuarios = 0;
            con = cn.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sSQL);
            while (rs.next()) {
                Nusuarios = rs.getInt("Nusuarios");
            }
            return Nusuarios;
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
            return 0;
        }

    }

    public static String getNombre(int cod) {
        try {
            String sql = "Select Usu from Usuario where id=" + cod;
            Connection connection = ConexionBD.Conectar();
            PreparedStatement prepare = connection.prepareStatement(sql);
            ResultSet resultSet = prepare.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("Usu");
            }
            return "--";
        } catch (Exception e) {
            return "--";
        }
    }

}
