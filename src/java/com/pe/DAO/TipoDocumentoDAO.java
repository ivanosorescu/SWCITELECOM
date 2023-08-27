package com.pe.DAO;

import com.pe.conection.ConexionBD;
import com.pe.model.entity.TipoDocumento;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TipoDocumentoDAO {

    ConexionBD cn = new ConexionBD();
    Connection con;
    String mensaje = "";
    PreparedStatement ps;
    ResultSet rs;
    TipoDocumento cat = new TipoDocumento();
    
    //Lista tipo documento uso en Insertar Y Editar cliente como en Provvedores.jsp
    public List<TipoDocumento> listarTipodocumento() {
        String sql = "SELECT * FROM TipoDocumento";
        List<TipoDocumento> lista = new ArrayList<>();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                TipoDocumento Tdoc = new TipoDocumento();
                Tdoc.setIdtipodocumento(rs.getInt("Idtipodocumento"));
                Tdoc.setCodigo(rs.getInt("Codigo"));
                Tdoc.setTipoDocumento(rs.getString("TipoDocumento"));
                lista.add(Tdoc);
            }
        } catch (SQLException e) {
            mensaje = e.getMessage();
        } finally {
            cn.desconectar();
        }
        return lista;
    }
    
     public List ObtenerRUC() {
        ArrayList<TipoDocumento> list=new ArrayList<>();
        String sql="select * from TipoDocumento where Idtipodocumento=4";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                TipoDocumento mat=new TipoDocumento();
                mat.setIdtipodocumento(rs.getInt("Idtipodocumento"));
                mat.setTipoDocumento(rs.getString("TipoDocumento"));
                list.add(mat);
            } 
        } catch (Exception e) {  
        }
        return list;
    }
     
}
