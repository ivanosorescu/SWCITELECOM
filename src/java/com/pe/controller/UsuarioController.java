/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.pe.controller;

import com.pe.DAO.UsuarioDAO;
import com.pe.model.entity.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author fanay
 */
public class UsuarioController extends HttpServlet {

    int id;
    UsuarioDAO usuarioDao = new UsuarioDAO();
    Usuario usuario = new Usuario();
    UsuarioDAO usuDAO;
    DecimalFormat formateadorcliente;
    ArrayList<String> listaErrores = new ArrayList<>();

    public UsuarioController() {
        usuDAO = new UsuarioDAO();
        formateadorcliente = new DecimalFormat("000000");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion.equals("add")) {
            this.add(request, response);
        }
        if (accion.equals("Actualizar")) {
            this.Edit(request, response);
        }
        if (accion.equals("editar")) {
            this.Editar(request, response);
        }
        if (accion.equals("detalle")) {
            this.Detalle(request, response);
        }
        if (accion.equals("eliminar")) {
            this.eliminar(request, response);
        }
//        if (accion.equals("Estado")) {
//            this.Estado(request, response);
//        }
    }

    private void Editar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("idusu", request.getParameter("id"));
        request.getRequestDispatcher("EditarUsuarios.jsp").forward(
                request, response);
    }

    private void Detalle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("idusu", request.getParameter("id"));
        request.getRequestDispatcher("DetalleUsuario.jsp").forward(
                request, response);
    }

    private void add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Usuario usu = new Usuario();
        int emp = Integer.parseInt(request.getParameter("txtidempleado"));
        String Usua = request.getParameter("txtusu");
        String pass = request.getParameter("txtpassword");
        String rol = request.getParameter("txtrol");

        int Nusuarios = usuDAO.BuscarNusuarios();
        Nusuarios = Nusuarios + 1;
        String format = formateadorcliente.format(Nusuarios);
        usu.setCodigo(format);
        usu.setIdempleado(emp);
        usu.setUsu(Usua);
        usu.setPassword(pass);
        usu.setRol(rol);

        UsuarioDAO usudao = new UsuarioDAO();
        boolean validacion = false;
        validacion = usudao.vali(usu);
        if (validacion == true) {
            response.getWriter().print("yaexiste");
        } else {
            if (usudao.add(usu)) {
                response.getWriter().print("ok");
            } else {
                response.getWriter().print("no ha sido registrado correctamente");
            }
        }
    }

    private void Edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("txtid"));
        int idempleados = Integer.parseInt(request.getParameter("txtidempleado"));
        String usuarios = request.getParameter("Txtnomusu");
        String pass = request.getParameter("Txtpass");
        String rol = request.getParameter("Txtrol");
        usuario.setId(id);
        usuario.setIdempleado(idempleados);
        usuario.setUsu(usuarios);
        usuario.setPassword(pass);
        usuario.setRol(rol);
        if (usuDAO.Edit(usuario)) {
            response.getWriter().print("ok");

        } else {
            response.getWriter().print("El cliente no ha sido registrado");

        }
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("idUsu"));
        System.out.println("[ID] " + id);
        usuDAO.Eliminar(id);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
