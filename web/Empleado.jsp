<%@page import="com.pe.model.entity.Trabajador"%>
<%@page import="com.pe.DAO.EmpleadoDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lista de Empleados</title>

        <%@include file="css-plantilla.jsp"%> 
        <%@include file="css-datatable.jsp"%>
        <link href="dist/css/Stilodetabla.css" rel="stylesheet" type="text/css"/>
        <link href="dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="dist/css/ColordeEstado.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="hold-transition sidebar-mini">

        <!-- Navbar -->

        <%@include file="Frmcompra.jsp" %>
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>Administrar Empleado</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <a class="bluefacturactivaFocus js-customer-action-add btn-primary btn btn-default" href="InsertarEmpleados.jsp"><i class="fas fa-folder-plus"></i> &nbsp; AGREGAR</a>
                                <!--<a class="bluefacturactivaFocus js-customer-action-add btn-primary btn btn-default" href="ControllerdatosModal?accion=addCliente"  data-toggle="modal" data-target="#addcliente" class="edit"><i class="fas fa-folder-plus"></i> &nbsp; AGREGAR</a>-->
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
                                    <h3 class="card-title">LISTA DE EMPLEADOS</h3>
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
                                                <th style="display:none;;">#</th>
                                                <th>Código</th>
                                                <th style="width:300px">Empleado</th>
                                                <th>Nro. Documento</th>
                                                <th>Correo</th> 
                                                <th style="text-align: center">Estado</th>
                                                <th style="text-align: center">Opciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% EmpleadoDAO emp = new EmpleadoDAO();
                                                List<Trabajador> listar = emp.ListadoEmpleado();
                                                Iterator<Trabajador> iter = listar.iterator();
                                                Trabajador tr = null;
                                                while (iter.hasNext()) {
                                                    tr = iter.next();
                                            %>
                                            <tr>
                                                <td  style="display:none;;"id="idempl"><%=tr.getId()%></td>
                                                <td><%=tr.getCodigo()%></td>
                                                <td style="width:300px"><%=tr.getNombre()%></td>
                                                <td><%=tr.getNrodocumento()%></td>
                                                <td><%=tr.getEmail()%></td>
                                                <% String Estado = EmpleadoDAO.estado(tr.getId());
                                                    if (Estado.equalsIgnoreCase("Activo")) {%>

                                                <td style="text-align: center"><markactivo><%= Estado%></markactivo></td>   
                                                <%   } else {%>

                                        <td style="text-align: center"><markdesactivado><%= Estado%></markdesactivado></td>    
                                            <%     }
                                            %>
                                        <td style="text-align: center"> 
                                            <a href="EmpleadoController?accion=editar&id=<%=tr.getId()%>" class="btn-warning btn-sm editbtn"><i class="glyphicon glyphicon-pencil"  data-toggle="tooltip" title="Edit"></i></a>
                                            <a id='btn-estado' class="btn-sm btn-primary"   class="edit"><i class="glyphicon glyphicon-refresh" data-toggle="tooltip" title="Estado"></i></a>
                                            <a id='btn-eliminar' class="btn-sm btn-danger"    class="edit"><i class="glyphicon glyphicon-trash" data-toggle="tooltip" title="Eliminar"></i></a>          
                                            <!--<a href="EmpleadoController?accion=detalle&id=<%=tr.getId()%>" class="btn btn-success"><i class="glyphicon glyphicon-eye-open" data-toggle="tooltip" title="Detalle"></i></a>-->
                                        </td>
                                        </tr>
                                        <%
                                            }
                                        %>
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
        <!-- ./wrapper -->
        <%@include file="js-plantilla.jsp"%> 
        <%@include file="js-datatable.jsp"%> 
        <script src="assets/jqueryy.js" type="text/javascript"></script>
        <script src="assets/bootstrapp.min.js" type="text/javascript"></script>
        <script src="Validacionysweetalert/Empleado.js" type="text/javascript"></script>

    </body>
</html>
