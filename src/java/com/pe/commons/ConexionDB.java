package com.pe.commons;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConexionDB {
   static Connection con;
    
    
   public ConexionDB () {
     try {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tesisv1","root","");
            System.out.println("conecto exitoso");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("ERROR"+e);
        }    
      
 }   

 public Connection getConnection(){
  
        return con;
        
    }
  public static Connection Conectar(){
  
        return con;
        
    }
 
 
public void desconectar(){
        con = null;
    }
 
 
  public   static void  main(String  args[])  
  {
      ConexionDB obj=new ConexionDB();
        obj.getConnection();   
       
  }     

    public Statement createStatement() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
