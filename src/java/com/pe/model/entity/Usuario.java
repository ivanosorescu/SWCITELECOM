/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pe.model.entity;

/**
 *
 * @author Angel Albinagorta
 */
public class Usuario{
    
  int id;
  int idempleado;
  String Codigo,usu,password,rol;

    public Usuario() {
    }

    public Usuario(int id, int idempleado,String Codigo, String usu, String password, String rol) {
        this.id = id;
        this.idempleado = idempleado;
        this.Codigo = Codigo;
        this.usu = usu;
        this.password = password;
        this.rol = rol;
    }

    public Usuario(int idempleado,String Codigo, String usu, String password, String rol) {
        this.idempleado = idempleado;
        this.Codigo = Codigo;
        this.usu = usu;
        this.password = password;
        this.rol = rol;
    }

    public int getIdempleado() {
        return idempleado;
    }

    public void setIdempleado(int idempleado) {
        this.idempleado = idempleado;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCodigo() {
        return Codigo;
    }

    public void setCodigo(String Codigo) {
        this.Codigo = Codigo;
    }    
    
    public String getUsu() {
        return usu;
    }

    public void setUsu(String usu) {
        this.usu = usu;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

      
  
}
