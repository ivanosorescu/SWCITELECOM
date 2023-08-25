<%@page import="com.pe.model.entity.Trabajador"%>
<%@page import="com.pe.DAO.EmpleadoDAO"%>
<%@page import="com.pe.model.entity.Usuario"%>
<%@page import="com.pe.DAO.UsuarioDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lista de Usuario</title>

        <%@include file="css-plantilla.jsp"%> 
        <%@include file="css-datatable.jsp"%>
        <link rel="stylesheet" href="plugins/toastr/toastr.min.css">
        <link href="dist/css/ColordeEstado.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="hold-transition sidebar-mini">

        <!-- Navbar -->

        <%@include file="Frmplantilla.jsp" %>
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h3>Administrar Usuario</h3>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <a href="#addCategoria" class="bluefacturactivaFocus js-customer-action-add btn-primary btn btn-default"  data-toggle="modal"><i class="fas fa-folder-plus"></i> &nbsp; AGREGAR</a>
                            </ol>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h2 class="card-title">LISTA DE CATEGORIA</h2>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <table id="example"  class="table table-striped table-bordered second" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th style="display:none;">#</th>
                                                <th style="width:300px;">Empleado</th>
                                                <th style="width:300px;display:none;">Empleado</th>
                                                <th>Usuario</th>
                                                <th>Contaseña</th>
                                                <th>Rol</th>
                                                <th style="text-align: center">Opciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%UsuarioDAO dao = new UsuarioDAO();
                                                List<Usuario> list = dao.ListadoUsuario();
                                                Iterator<Usuario> iter = list.iterator();
                                                Usuario per = null;
                                                while (iter.hasNext()) {
                                                    per = iter.next();
                                            %>
                                            <tr>
                                                <td id="idcliet" style="display:none;"><%=per.getId()%></td>
                                                <td ><%= EmpleadoDAO.getNombre(per.getIdempleado())%></td>
                                                <td style="display:none;"><%= per.getIdempleado()%></td>
                                                <td ><%=per.getUsu()%></td>
                                                <td ><%=per.getPassword()%></td>
                                                <td><%= per.getRol()%></td>
                                                
                                                <td style="text-align: center">
                                                    <a class="btn-warning btn-sm editbtn"  data-toggle="modal" data-target="#editar"><i class="glyphicon glyphicon-pencil" data-toggle="tooltip" title="Edit"></i></a>

                                                    <a id='btn-eliminar' class="btn-sm btn-danger"    class="edit"><i class="glyphicon glyphicon-trash"  title="Eliminar"></i></a>          
                                                </td>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                            <!-- /.card -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </section>
            <!-- /.content -->
        </div>
        <!-- add Modal HTML -->
        <div id="addCategoria" class="modal fade" >
            <div class="modal-dialog" role="document" style="z-index: 9999; width: 450px">
                <div class="modal-content">
                    <form id="newusu" action="UsuarioController" method="Post" name="frm_nuevo">
                        <div class="modal-header">      
                            <h4 class="modal-title">Agregar Usuario</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <label for="validationDefault01">Seleccione Trabajador</label>
                            <!--<div class="col-sm-8">-->
                            <select class="form-control select2" name="txtidempleado">
                                <option selected="selected">--</option>
                                <%   EmpleadoDAO edao = new EmpleadoDAO();
                                    List<Trabajador> lista = edao.ListadoEmpleado();
                                    Iterator<Trabajador> itera = lista.iterator();
                                    Trabajador empl = null;
                                    while (itera.hasNext()) {
                                        empl = itera.next();%>
                                <option  value="<%= empl.getId()%>" ><%= empl.getNombre()%></option>
                                <%}%>
                            </select>
                            <!--</div>-->
                        </div>
                        <div class="modal-body">
                            <label>Usuario</label>
                            <input name="txtusu" type="text"  class="form-control" required>
                        </div>
                        <div class="modal-body">
                            <label>Password</label>
                            <input name="txtpassword" type="password" id="passwordAdmin" class="form-control" required>
                        </div>
                        <div class="modal-body">
                            <label for="validationDefault01">Seleccione Rol</label>
                            <!--<div class="col-sm-8">-->
                            <select class="form-control select2" name="txtrol">
                                <option selected="selected">--</option>
                                <option >Almacen</option>
                                <option >Compra</option>
                            </select>
                            <!--</div>-->
                        </div>
                        <div class="modal-footer">
                            <input type="button"  class="btn btn-default" data-dismiss="modal" value="Cancelar">
                            <input onclick="return validarusuario()"  class="btn btn-success" type="submit" name="accion" value="add">
                        </div>
                    </form>
                </div>
            </div>
        </div> 
        <!--Formulario de Modificar-->

        <div id="editar" class="modal fade" >
            <div class="modal-dialog" role="document" style="z-index: 9999; width: 450px">
                <div class="modal-content">
                    <form id="editusu" action="UsuarioController" method="Post" name="frm_nuevo">
                        <div class="modal-header">      
                            <h4 class="modal-title">Editar Usuario</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body" hidden="folse">
                            <label>id</label>
                            <input name="txtid" type="text" id="id"  class="form-control" required>
                        </div>
                        <div class="modal-body">
                            <label>Trabajador</label>
                            <input name="dddd" type="text" id="e"  class="form-control" required>
                        </div>
                        <div class="modal-body" hidden="folse">
                            <label>Trabajador</label>
                            <input name="txtidempleado" type="text" id="1"  class="form-control" required>
                        </div>
                        <div class="modal-body">
                            <label>Usuario</label>
                            <input name="Txtnomusu" type="text" id="2"  class="form-control" required>
                        </div>
                        <div class="modal-body">
                            <label>Password</label>
                            <input name="Txtpass" type="text"  id="3" class="form-control" required>
                        </div>
                        <div class="modal-body" >
                            <label for="validationDefault01">Seleccione Rol</label>
                            <!--<div class="col-sm-8">-->
                            <select class="form-control select2" name="Txtrol" required="">
                                <option selected="selected"> </option>
                                <option >Almacen</option>
                                <option >Compra</option>
                                <option >Administrador</option>
                            </select>
                            <!--</div>-->
                        </div>
                       
                        <div class="modal-footer">
                            <input type="button"  class="btn btn-default" data-dismiss="modal" value="Cancelar">
                            <input class="btn btn-success" type="submit" name="accion" value="Actualizar">
                        </div>
                    </form>
                </div>
            </div>
        </div> 

        <!-- ./wrapper -->
        <script src="assets/jqueryy.js" type="text/javascript"></script>
        <script src="dist/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- ./wrapper -->
        <%@include file="js-plantilla.jsp"%> 
        <%@include file="js-datatable.jsp"%> 
        <script src="plugins/toastr/toastr.min.js"></script>
        <script src="Validacionysweetalert/Usuario.js" type="text/javascript"></script>
        <script >
                                $('.editbtn').on('click', function () {
                                    $tr = $(this).closest('tr');
                                    var datos = $tr.children('td').map(function () {
                                        return $(this).text();
                                    });
                                    $('#id').val(datos[0]);
                                    $('#e').val(datos[1]);
                                    $('#1').val(datos[2]);
                                    $('#2').val(datos[3]);
                                    $('#3').val(datos[4]);

                                })
        </script>
        <!-- AdminLTE for demo purposes -->
        <!-- Page specific script -->
    </body>
</html>
