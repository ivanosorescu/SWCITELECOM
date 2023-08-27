/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.pe.controller;

import com.pe.DAO.EmpleadoDAO;
import com.pe.model.entity.Trabajador;
import java.io.IOException;
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
public class EmpleadoController extends HttpServlet {

    int id;
    EmpleadoDAO empdao = new EmpleadoDAO();
    Trabajador trab = new Trabajador();
    EmpleadoDAO empDAO;
    DecimalFormat formateadorempleado;
    ArrayList<String> listaErrores = new ArrayList<>();

    public EmpleadoController() {
        empDAO = new EmpleadoDAO();
        formateadorempleado = new DecimalFormat("000000");
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
        if (accion.equals("Estado")) {
            this.Estado(request, response);
        }
    }

    private void add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Trabajador emp = new Trabajador();
        String cliente = request.getParameter("Txtapellidos");
        String idtipodocumento = request.getParameter("Txtidtipodocumento");
        String dni = request.getParameter("Txtdni");
        String sueldo = request.getParameter("Txtsueldo");
        String telefono = request.getParameter("Txttelefono");
        String direccion = request.getParameter("Txtdireccion");
        String email = request.getParameter("Txtemail");
        String fechaderegistro = request.getParameter("Txtfechaderegistro");
        int Nempleados = empDAO.BuscarNempleados();
        Nempleados = Nempleados + 1;
        String format = formateadorempleado.format(Nempleados);
        emp.setCodigo(format);
        emp.setNombre(cliente);
        emp.setIdTipodocumento(Integer.parseInt(idtipodocumento));
        emp.setNrodocumento(dni);
        emp.setSueldo(Double.parseDouble(sueldo));
        emp.setTelefono(telefono);
        emp.setDireccion(direccion);
        emp.setEmail(email);
        emp.setFechaderegistro(fechaderegistro);
        emp.setEstado("Activo");
        EmpleadoDAO trabdao = new EmpleadoDAO();
        boolean validacion = false;
        validacion = trabdao.validacion(emp);
        if (validacion == true) {
            response.getWriter().print("yaexiste");
        } else if (trabdao.add(emp)) {
            response.getWriter().print("ok");
        } else {
            response.getWriter().print("no ha sido registrado correctamente");
        }

    }

    private void Edit(HttpServletRequest request, HttpServletResponse response)
            throws IOException, IOException {
        id = Integer.parseInt(request.getParameter("txtid"));
        String codigo = request.getParameter("Txtcodigo");
        String cliente = request.getParameter("Txtapellidos");
        String idtipodocumento = request.getParameter("Txtidtipodocumento");
        String dni = request.getParameter("Txtdni");
        String sueldo = request.getParameter("Txtsueldo");
        String telefono = request.getParameter("Txttelefono");
        String direccion = request.getParameter("Txtdireccion");
        String email = request.getParameter("Txtemail");
        String fechaderegistro = request.getParameter("Txtfechaderegistro");
        trab.setId(id);
        trab.setCodigo(codigo);
        trab.setNombre(cliente);
        trab.setIdTipodocumento(Integer.parseInt(idtipodocumento));
        trab.setNrodocumento(dni);
        trab.setSueldo(Double.parseDouble(sueldo));
        trab.setTelefono(telefono);
        trab.setDireccion(direccion);
        trab.setEmail(email);
        trab.setFechaderegistro(fechaderegistro);

        if (empdao.Edit(trab)) {
            response.getWriter().print("ok");

        } else {
            response.getWriter().print("El empleado no ha sido registrado");

        }
    }

    private void Editar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("idemp", request.getParameter("id"));
        request.getRequestDispatcher("EditarEmpleado.jsp").forward(
                request, response);
    }

    private void Detalle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("idemp", request.getParameter("id"));
        request.getRequestDispatcher("DetalleEmpleado.jsp").forward(
                request, response);
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("Idemp"));
        empdao.Eliminar(id);
    }

    private void Estado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("id"));
        trab.setId(id);
        String estado = EmpleadoDAO.estado(id);
        if (estado.equalsIgnoreCase("Activo")) {
            trab.setEstado("Desactivado");
        } else {
            trab.setEstado("Activo");
        }

        empdao.editEstado(trab, id);
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
