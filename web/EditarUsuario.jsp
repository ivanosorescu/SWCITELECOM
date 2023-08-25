<%@page import="com.pe.model.entity.Trabajador"%>
<%@page import="com.pe.model.entity.Auxiliar"%>
<%@page import="com.pe.DAO.EmpleadoDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.pe.model.entity.Usuario"%>
<%@page import="com.pe.DAO.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Usuario</title>
    </head>
    <body>
        <!-- add Modal HTML -->
        <div >
            <%
                UsuarioDAO dao = new UsuarioDAO();
                int id = Integer.parseInt((String) request.getAttribute("Eu"));
                Usuario u = (Usuario) dao.list(id);
            %>
            <div class="modal-content">
                <div class="modal-header" style="">      
                    <h4 class="modal-title"   id="myModalLabel">Editar Usuario</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <form id="editusu" method="post" action="UsuarioController" name="frm_edit"> 
                    <div class="modal-body">  
                        <input class="form-control" type="hidden"  name="txtid" value="<%=u.getId()%>" required="">
                        <div class="form-group">
                            <label>Empleado</label>
                            <select class="border-focus-darkblue form-control" name="txtidempleado" id="txtidempleado">
                                <% EmpleadoDAO tdoc = new EmpleadoDAO();
                                    List<Trabajador> lista = tdoc.ListadoEmpleado();
                                    for (Trabajador tipodo : lista) {
                                        if (tipodo.getId() == u.getIdempleado()) {
                                            out.println("<option   value='" + tipodo.getId()
                                                    + "'selected>" + tipodo.getNombre() + "</option>");
                                        } else {
                                            out.println("<option   value='" + tipodo.getId()
                                                    + "'>" + tipodo.getNombre() + "</option>");
                                        }

                                    }

                                %>
                            </select>
                        </div> 
                        <div class="form-group"> 
                            <label >Usuario</label> 
                            <input class="form-control" type="text"  name="Txtnomusu" value="<%=u.getUsu()%>" required="">
                        </div>
                        <div class="form-group"> 
                            <label >Password</label> 
                            <input class="form-control" type="password"  name="Txtpass" value="<%=u.getPassword()%>" required="">
                        </div>
                        <div class="form-group">
                            <label>Rol</label>
                            <select class="form-control select2" name="Txtrol">
                                <% if (u.getRol().equalsIgnoreCase("Almacen")) { %>
                                <option value="Almacen">Almacen</option>
                                <% } else { %><option value="Almacen">Almacen</option>
                                <% } %>
                                <% if (u.getRol().equalsIgnoreCase("Compra")) { %>
                                <option value="Compra">Compra</option>
                                <% } else { %>
                                <option value="Compra">Compra</option>
                                <% }%>
                            </select>
                        </div> 
                    </div>
                    <div class="modal-footer">
                        <a href="Usuario.jsp" class="btn btn-default" >Cancelar</a> 
                        <input onclick="return valeditarusuario()"  class="btn btn-success" type="submit" name="accion" value="Actualizar">
                        <!--<input id="btnguardar" type="submit" class="btn btn-success" name="accion" value="add">-->
                    </div>
                </form>
            </div>
        </div>
    </body>
    <script src="Validacionysweetalert/Usuario.js" type="text/javascript"></script>
</html>
