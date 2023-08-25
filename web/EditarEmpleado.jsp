<%@page import="com.pe.model.entity.TipoDocumento"%>
<%@page import="com.pe.DAO.TipoDocumentoDAO"%>
<%@page import="com.pe.model.entity.Trabajador"%>
<%@page import="com.pe.DAO.EmpleadoDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Editar Empleado</title>
        <%@include file="css-plantilla.jsp"%> 
        <link rel="stylesheet" href="plugins/toastr/toastr.min.css">
        <style>
            legend {
                display: block;
                width: 100%;
                padding: 0;
                margin-bottom: 25px;
                font-size: 21px;
                line-height: inherit;
                color: #333;
                border: 0;
                border-bottom: 1px solid #D4D4D4;
            }
            .col-sm-12, .col-md-12, .col-lg-12 {
                position: relative;
                min-height: 1px;
                padding-left: 25px;
                padding-right: 25px;
            }
            .form-horizontal .form-group {
                margin-left: 0!important;
                margin-right: 0!important;
            }
            .form-control {
                color: #000;
                height: 30px;
                padding: 0 12px;
                box-shadow: none !important;
                border-width: 2px;
                letter-spacing: 0.5px;
                border-radius: 0 !important;
            }
            .form-control {
                display: block;
                width: 100%;
                height: 38px;
                padding: 6px 12px;
                font-size: 16px;
                line-height: 1.78571;
                color: #000;
                background-color: #fff;
                background-image: none;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
                transition: border-color ease-in-out 0.15s,box-shadow ease-in-out 0.15s;
            }
        </style>
    </head>
    <body class="hold-transition sidebar-mini">
        <!-- Navbar -->
        <%@include file="Frmcompra.jsp" %>
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
            </section>
            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <%EmpleadoDAO edao = new EmpleadoDAO();
                        int id = Integer.parseInt((String) request.getAttribute("idemp"));
                        Trabajador trab = (Trabajador) edao.BuscarPorId(id);
                    %>
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <!-- /.card-header --> 
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-7 col-sm-7 col-xs-12">
                                            <h1 class="h3" style="margin-bottom: 30px;">
                                                <i class="icon-fontello-users-2">&nbsp;</i>
                                                <!-- react-text: 408 -->Administrar <!-- /react-text -->
                                                <span class="h4"><!-- react-text: 410 -->&gt;<!-- /react-text --><!-- react-text: 411 --> Empleados<!-- /react-text --></span>
                                            </h1>
                                        </div>
                                    </div>
                                    <div class="card-header" style="color: #FFF">
                                        <h1 class="card-title">Editar Empleado</h1>
                                    </div>
                                    <br>
                                    <form id="editempleado" action="EmpleadoController" method="Post" name="frm_edit">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                <fieldset>
                                                    <legend>Datos Personales
                                                    </legend>
                                                    <div class="form-group">
                                                        <input type="hidden" name="txtid" class="form-control" value="<%=trab.getId()%>">
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Código</label>
                                                        <div class="col-lg-4 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" name="Txtcodigo" value="<%=trab.getCodigo()%>" class="border-focus-darkblue form-control" readonly="">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Empleado</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" name="Txtapellidos" onkeypress="return soloLetras(event)" value="<%=trab.getNombre()%>" class="border-focus-darkblue form-control">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-6 col-md-4 col-sm-12 col-xs-12 control-label">Tipo de Doc. de Identidad</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <select class="border-focus-darkblue form-control" name="Txtidtipodocumento" id="Txtidtipodocumento">
                                                                <% TipoDocumentoDAO tdoc = new TipoDocumentoDAO();
                                                                    List<TipoDocumento> lista = tdoc.listarTipodocumento();
                                                                    for (TipoDocumento tipodo : lista) {
                                                                        if (tipodo.getIdtipodocumento() == trab.getIdTipodocumento()) {
                                                                            out.println("<option   value='" + tipodo.getIdtipodocumento()
                                                                                    + "'selected>" + tipodo.getTipoDocumento() + "</option>");
                                                                        } else {
                                                                            out.println("<option   value='" + tipodo.getIdtipodocumento()
                                                                                    + "'>" + tipodo.getTipoDocumento() + "</option>");
                                                                        }

                                                                    }

                                                                %>
                                                            </select>
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-6 col-md-4 col-sm-12 col-xs-12 control-label">Documento de Identidad</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" name="Txtdni" onkeypress="return soloNumeros(event)" value="<%= trab.getNrodocumento()%>" maxlength="11" id="Txtnumerodocumento" class="border-focus-darkblue form-control">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Sueldo</label>
                                                        <div class="col-lg-4 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" name="Txtsueldo" value="<%= trab.getSueldo()%>" id="Txtsueldo" class="border-focus-darkblue form-control">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>

                                                </fieldset>
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                <fieldset>
                                                    <legend>Información de contacto</legend>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Fecha de Registro</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" name="Txtfechaderegistro" value="<%=trab.getFechaderegistro()%>" class="border-focus-darkblue form-control" readonly="">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Teléfono</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" name="Txttelefono" value="<%= trab.getTelefono()%>" onkeypress="return soloNumeros(event)" id="Txttelefono" class="border-focus-darkblue form-control">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Dirección</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" name="Txtdireccion" value="<%= trab.getDireccion()%>" id="Txtdireccion" class="border-focus-darkblue form-control">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Correo</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" name="Txtemail" value="<%= trab.getEmail()%>" id="Txtemail" class="border-focus-darkblue form-control">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </div>


                                        </div>
                                        <div class="modal-footer"> 
                                            <center>
                                                <a class="btn btn-app bg-secondary" href="Empleado.jsp"><i class="fa fa-window-close"></i> CANCELAR</a>
                                                <button onclick="return validareditempleados()" type="submit" name="accion" class="btn btn-app bg-cyan" ><i class="fas fa-check-square"></i> ACTUALIZAR</button>
                                            </center>
                                        </div>
                                    </form>
                                </div>
                                <!-- /.card-body -->
                            </div>
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
        <%@include file="js-plantilla.jsp"%> 
        <script src="plugins/toastr/toastr.min.js"></script>
        <script src="Validacionysweetalert/Empleado.js" type="text/javascript"></script>
    </body>
</html>
