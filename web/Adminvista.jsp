<%@page import="com.pe.model.entity.Movimiento"%>
<%@page import="com.pe.DAO.MovimientoDAO"%>
<%@page import="com.pe.model.entity.Auxiliar"%>
<%@page import="com.pe.DAO.AuxiliarDAO"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link href="plugins/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
  <!-- Theme style -->
  <link href="dist/css/adminlte.min.css" rel="stylesheet" type="text/css"/>
</head>
<body class="hold-transition sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="../../index3.html" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Navbar Search -->
      <li class="nav-item">
        <a class="nav-link" data-widget="navbar-search" href="#" role="button">
          <i class="fas fa-search"></i>
        </a>
        <div class="navbar-search-block">
          <form class="form-inline">
            <div class="input-group input-group-sm">
              <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
              <div class="input-group-append">
                <button class="btn btn-navbar" type="submit">
                  <i class="fas fa-search"></i>
                </button>
                <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                  <i class="fas fa-times"></i>
                </button>
              </div>
            </div>
          </form>
        </div>
      </li>

      <!-- Messages Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-comments"></i>
          <span class="badge badge-danger navbar-badge">3</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="../../dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Brad Diesel
                  <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">Call me whenever you can...</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="../../dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  John Pierce
                  <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">I got your message bro</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="../../dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Nora Silvester
                  <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">The subject goes here</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
        </div>
      </li>
      <!-- Notifications Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-bell"></i>
          <span class="badge badge-warning navbar-badge">15</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <span class="dropdown-item dropdown-header">15 Notifications</span>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-envelope mr-2"></i> 4 new messages
            <span class="float-right text-muted text-sm">3 mins</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-users mr-2"></i> 8 friend requests
            <span class="float-right text-muted text-sm">12 hours</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-file mr-2"></i> 3 new reports
            <span class="float-right text-muted text-sm">2 days</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
          <i class="fas fa-th-large"></i>
        </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="../../index3.html" class="brand-link">
      <img src="../../dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">AdminLTE 3</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="../../dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Alexander Pierce</a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="../../index.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard v1</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../../index2.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard v2</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../../index3.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard v3</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="../widgets.html" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                Widgets
                <span class="right badge badge-danger">New</span>
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-copy"></i>
              <p>
                Layout Options
                <i class="fas fa-angle-left right"></i>
                <span class="badge badge-info right">6</span>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="../layout/top-nav.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Top Navigation</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../layout/top-nav-sidebar.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Top Navigation + Sidebar</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../layout/boxed.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Boxed</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../layout/fixed-sidebar.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Fixed Sidebar</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../layout/fixed-sidebar-custom.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Fixed Sidebar <small>+ Custom Area</small></p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../layout/fixed-topnav.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Fixed Navbar</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../layout/fixed-footer.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Fixed Footer</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../layout/collapsed-sidebar.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Collapsed Sidebar</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-chart-pie"></i>
              <p>
                Charts
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="../charts/chartjs.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>ChartJS</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../charts/flot.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Flot</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../charts/inline.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Inline</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../charts/uplot.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>uPlot</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-tree"></i>
              <p>
                UI Elements
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="../UI/general.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>General</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../UI/icons.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Icons</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../UI/buttons.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Buttons</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../UI/sliders.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Sliders</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../UI/modals.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Modals & Alerts</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../UI/navbar.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Navbar & Tabs</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../UI/timeline.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Timeline</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../UI/ribbons.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Ribbons</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-edit"></i>
              <p>
                Forms
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="../forms/general.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>General Elements</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../forms/advanced.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Advanced Elements</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../forms/editors.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Editors</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../forms/validation.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Validation</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
              <p>
                Tables
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="../tables/simple.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Simple Tables</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../tables/data.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>DataTables</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../tables/jsgrid.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>jsGrid</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-header">LABELS</li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-circle text-danger"></i>
              <p class="text">Important</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-circle text-warning"></i>
              <p>Warning</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-circle text-info"></i>
              <p>Informational</p>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->

    <!-- Main content -->
    <section class="content">
 <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">

                        <div class="col-sm-12">
                            <ol class="breadcrumb float-sm-right">
                                <a href="InsertarNotadeIngreso.jsp" class="bluefacturactivaFocus js-customer-action-add btn-primary" style="height: 30px;display: inline-block;margin-bottom: 0;font-weight: bold;text-align: center;vertical-align: middle;letter-spacing: 1px;text-transform: uppercase;-ms-touch-action: manipulation;touch-action: manipulation;cursor: pointer;transition: all 0.2s;background-image: none;border: 2px solid transparent;white-space: nowrap;padding: 2px 18px;font-size: 12px;line-height: 1.78571;border-radius: 20px;-webkit-user-select: none;-ms-user-select: none;user-select: none;padding-top: 3px;"><i class="fas fa-folder-plus"></i> &nbsp; NUEVO</a>
                            </ol>
                        </div>
                    </div>
                </div>
            </section>
            <section class="content">
                <form id="newmovimiento" method="post" name="accion">
                    <div class="row">
                        <div class="col-md-12">
                            <!--modal listar-->
                            <div class="card card-default">
                                <div class="card-header">
                                    <h3 class="card-title" style="color: white;">NOTA DE INGRESO</h3>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                    <br>
                                    <h6 style="color: white;">Detalle y Anular las Notas de Ingreso</h6>
                                </div>
                                <div class="card-body"> 
                                    <div class="row">
                                        <div class="form-group col-md-3">
                                            <%                                        String clisel = "";
                                                String docsel = "";
                                                String fechSel = "";
                                                String sel = clisel + " " + docsel + " " + fechSel;
                                            %>
                                            <input type="hidden" id="todclisel" value="" />
                                            <input type="hidden" id="clisel" value="" />
                                            <input type="hidden" id="clirucsel" value="" />

                                            <input type="hidden" id="toddocsel" value="" />
                                            <input type="hidden" id="docsel" value="" />

                                            <input type="hidden" id="todpersel" value="" />
                                            <input type="hidden" id="persel" value="" />

                                            <input type="hidden" id="fechsel" value="" />


                                            <script>

                                                function validaciones() {
                                                    if (document.getElementById('rbTodCli').checked ||
                                                            document.getElementById('rbCli').checked ||
                                                            document.getElementById('rbRUC').checked ||
                                                            document.getElementById('rbTodDoc').checked ||
                                                            document.getElementById('rbDoc').checked
                                                            ) {
                                                        document.getElementById('todclisel').value = '';
                                                        document.getElementById('clisel').value = document.getElementById('cbCli').value.toLowerCase();
                                                        document.getElementById('clirucsel').value = document.getElementById('cbRU').value.toLowerCase();

                                                        document.getElementById('toddocsel').value = '';
                                                        document.getElementById('docsel').value = document.getElementById('cbDoc').value.toLowerCase();

                                                        document.getElementById('todpersel').value = '';

                                                        var fecha = '';

                                                    }

                                                    document.getElementById('selInfo').value = document.getElementById('todclisel').value.toLowerCase() + ' ' +
                                                            document.getElementById('clisel').value.toLowerCase() + ' ' +
                                                            document.getElementById('clirucsel').value.toLowerCase() + ' ' +
                                                            document.getElementById('toddocsel').value.toLowerCase() + ' ' +
                                                            document.getElementById('docsel').value.toLowerCase() + ' ' +
                                                            document.getElementById('todpersel').value.toLowerCase() + ' ' +
                                                            document.getElementById('persel').value.toLowerCase() + ' ' + fecha;

                                                    console.log(document.getElementById('selInfo').value.toLowerCase());
                                                }
                                            </script>


                                            <input type="radio" value="" id="rbTodCli" name = "cliente" onclick="
                                                    cbCliente.disabled = true;
                                                    cbRUC.disabled = true;
                                                    document.getElementById('cbCli').value = '';
                                                    document.getElementById('cbRU').value = '';
                                                    validaciones();
                                                    document.getElementById('selInfo').focus();

                                                   "checked="true"  
                                                   >
                                            <label>Todos:</label>

                                            <input type="radio" value="" id="rbCli" name = "cliente" onclick="
                                                    cbCliente.disabled = false;
                                                    cbRUC.disabled = true;
                                                    document.getElementById('cbRU').value = '';

                                                   ">
                                            <label style="text-align:right">Proveedor:</label>
                                            <select class="form-control select2" name="cbCliente" id="cbCli" required="" disabled="true"
                                                    onchange="
                                                            validaciones();
                                                            document.getElementById('selInfo').focus();
                                                    ">
                                                <option value ="" selected ="" >Todos</option>
                                                <%  AuxiliarDAO pdao = new AuxiliarDAO();
                                                    List<Auxiliar> prov = pdao.ListadoProveedor();
                                                    Iterator<Auxiliar> itclient = prov.iterator();
                                                    Auxiliar prove = null;

                                                    while (itclient.hasNext()) {
                                                        prove = itclient.next();
                                                %>
                                                <option value="<%=prove.getNombre()%>"><%=prove.getNombre()%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <input type="radio"  value="" id="rbRUC" name = "cliente" onclick="
                                                    cbCliente.disabled = true;
                                                    cbRUC.disabled = false;
                                                    document.getElementById('cbCli').value = '';

                                                   ">
                                            <label  style="text-align:right">Nro Identidad:</label>
                                            <select class="form-control select2" name="cbRUC" id="cbRU" required="" disabled="true"
                                                    onchange="validaciones();
                                                            document.getElementById('selInfo').focus();">
                                                <option value =""  selected="" style="text-align: center">Todos</option>
                                                <%
                                                    Iterator<Auxiliar> itclien = prov.iterator();
                                                    while (itclien.hasNext()) {
                                                        prove = itclien.next();
                                                %>
                                                <option value="<%=prove.getNumerodocumento()%>"><%=prove.getNumerodocumento()%></option>
                                                <%}%>
                                            </select>
                                            <input type="text" value="" id="selInfo" placeholder="Resultados de la busqueda" 
                                                   readonly="true"
                                                   style="width: 0px;height: 0px; outline: none; border-color: transparent"
                                                   >
                                        </div>
                                        <div class="form-group col-md-2">
                                            <input type="radio" value="" id="rbTodDoc" name ="doc"style="align-items: center" onclick="
                                                    cbDocu.disabled = true;
                                                    document.getElementById('cbDoc').value = '';
                                                    validaciones();
                                                    document.getElementById('selInfo').focus();
                                                   " 
                                                   checked="true">
                                            <label>Todos</label>

                                            <input type="radio" value="" id="rbDoc" name = "doc"style="align-items: center" onclick="
                                                    cbDocu.disabled = false;

                                                   ">
                                            <label>Documentos:</label>
                                            <select class="form-control select2" name="cbDocu" id="cbDoc" required="" disabled="true"
                                                    onchange="validaciones();
                                                            document.getElementById('selInfo').focus();">
                                                <option value ="" selected="" style="text-align: center">Todos</option>
                                                <% MovimientoDAO vddao = new MovimientoDAO();
                                                    List<Movimiento> vdlist = vddao.ListadoNotaIngresoNI();
                                                    Iterator<Movimiento> iitvent = vdlist.iterator();
                                                    Movimiento dvent = null;
                                                    while (iitvent.hasNext()) {
                                                        dvent = iitvent.next();
                                                %>
                                                <option value="<%=dvent.getSerie()%>-<%=dvent.getCorrelativo()%>"><%=dvent.getSerie()%>-<%=dvent.getCorrelativo()%></option>
                                                <%}%>
                                            </select> 

                                        </div>

                                        <%Date date = new Date();
                                            DateFormat dfm = new SimpleDateFormat("yyyy-MM-dd");
                                            String d = dfm.format(date).toString();
                                            int year = date.getYear();
                                        %>
                                        <div class="form-group col-md-2">
                                            <input type="radio" name="periodo" id="rbPer3" style="align-items: center" onclick="

                                                    validaciones();
                                                    document.getElementById('selInfo').focus();
                                                    document.getElementById('fec2').focus();
                                                    document.getElementById('fec3').focus();
                                                    retornarcss()
                                                    fecha2.disabled = false;
                                                    fecha3.disabled = false;
                                                   ">
                                            <label >Desde:</label>
                                            <input class="form-control" type="text" name="fecha2" value="" id="fec2" disabled="true" readonly="true"/>
                                        </div>
                                        <div class="form-group col-md-2">
                                            <label  >Hasta:</label>
                                            <input class="form-control" type="text" name="fecha3" value="" id="fec3" disabled="true" readonly="true"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-12">
                            <div class="card card-outline card-info">
                                <!--   <div class="card card-primary">
                              <div class="card-header">
                                     <h3 class="card-title">Ion Slider</h3>
                                     <div class="card-tools">
                                         <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                             <i class="fas fa-minus"></i>
                                         </button>
                                         <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                                             <i class="fas fa-times"></i>
                                         </button>
                                     </div>
                                 </div>-->

                                <div class="card-body  ">

                                    <div class="full-width panel-content" id="div1">
                                        <table id="B" class="table table-striped table-bordered second" style="width:100%">
                                            <thead>
                                                <tr>
                                                    <th style="display:none;">N°</th>
                                                    <th>Cliente</th>
                                                    <th>Nro Identidad</th>
                                                    <th style="display:none;">Doc</th>
                                                    <th>Numeración</th>
                                                    <th style="display:none;">Correlativo</th>
                                                    <th>Fecha(M/D/A)</th>
                                                    <th>Referencia</th>
                                                    <th>Estado</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%  MovimientoDAO vdao = new MovimientoDAO();
                                                    List<Movimiento> vlist = vdao.ListadoNotaIngresoNI();
                                                    Iterator<Movimiento> itvent = vlist.iterator();
                                                    Movimiento vent = null;
                                                    double tot = 0.00;
                                                    while (itvent.hasNext()) {
                                                        vent = itvent.next();

                                                %>
                                                <tr>
                                                    <td style="display:none;" id="idni"><%= vent.getIdmovimiento()%></td>
                                                    <td><%= AuxiliarDAO.getNombre(vent.getIdauxiliar())%></td>
                                                    <td><%= AuxiliarDAO.getnrodocumento(vent.getIdauxiliar())%></td>
                                                    <td style="display:none;"><%= vent.getTipocomprobante()%></td>
                                                    <td><%= vent.getSerie()%>-<%= vent.getCorrelativo()%></td>
                                                    <td style="display:none;"><%= vent.getCorrelativo()%></td>
                                                    <%
                                                        String da = vent.getFecha();
                                                        String newda = da.substring(0, 10);
                                                        String newdaa = da.substring(0, 2);
                                                        String newdb = newda.substring(3, 5);
                                                        String newdc = newda.substring(6, 10);
                                                        String newdd = newdb + "/" + newdaa + "/" + newdc;
                                                    %>
                                                    <td><%= newdd%></td>
                                                    <td><%= vent.getReferencia()%></td>
                                                    <% String Estado = vent.getEstado();
                                                        if (Estado.equalsIgnoreCase("Ingresado")) {%>
                                                    <td style="width:2px"><markactivo><%= Estado%></markactivo></td>   
                                                    <%   } else {%>
                                            <td style="width:2px"><markdesactivado><%= Estado%></markdesactivado></td>    
                                                <%     }
                                                %>
                                            <td>
                                                <%
                                                    if (Estado.equalsIgnoreCase("Ingresado")) {%>
                                                <a id='btn-anular' class="btn-sm btn-danger" class="anular"><i class="glyphicon glyphicon-remove-sign" data-toggle="tooltip" title="Anular"></i></a>
                                                <%   } else {%>                                           
                                                <%     }
                                                %>
                                                <a href="DetallePDFController?accion=DetalleNI&id=<%= vent.getIdmovimiento()%>" class="btn-sm btn-success" title="Detalle de Nota de Ingreso">Detalle</a>
                                            </td>
                                            <%
                                                }
                                            %>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>                                                             
                        </div>
                    </div>
                </form>   
            </section> 


    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 3.2.0
    </div>
    <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong> All rights reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js" type="text/javascript"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js" type="text/javascript"></script>


    <script src="dist/js/search.js" type="text/javascript"></script>
    <script src ="https://cdn.datatables.net/buttons/1.7.1/js/dataTables.buttons.min.js"></script>
    
    <script src ="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src ="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    
    <script src ="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src ="https://cdn.datatables.net/buttons/1.7.1/js/buttons.html5.min.js"></script>
    <script src ="https://cdn.datatables.net/buttons/1.7.1/js/buttons.print.min.js"></script>
    
    
    
    <script src ="//cdn.datatables.net/tabletools/2.2.4/js/dataTables.tableTools.min.js"></script>
    <script src ="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    <script src ="https://cdn.datatables.net/datetime/1.1.0/js/dataTables.dateTime.min.js"></script>
    <script src="plugins/select2/js/select2.full.min.js"></script>
    <script src="Validacionysweetalert/NotaIngreso.js" type="text/javascript"></script>
    <script>
                                                $(function () {
                                                    //Initialize Select2 Elements
                                                    $('.select2').select2()

                                                    //Initialize Select2 Elements
                                                    $('.select2bs4').select2({
                                                        theme: 'bootstrap4'
                                                    })
                                                })

    </script>
    <script>
        function anularcss() {
            document.getElementById("css").href = "";
        }
        function retornarcss() {
            document.getElementById("css").href = "https://cdn.datatables.net/datetime/1.1.0/css/dataTables.dateTime.min.css";
        }
    </script>
    <script>
        var minDate, maxDate;
        // Custom filtering function which will search data in column four between two values
        $.fn.dataTable.ext.search.push(
                function (settings, data, dataIndex) {
                    var min = minDate.val();
                    var max = maxDate.val();
                    var date = new Date(data[6]);
                    if (
                            (min === null && max === null) ||
                            (min === null && date <= max) ||
                            (min <= date && max === null) ||
                            (min <= date && date <= max)
                            ) {
                        return true;
                    }
                    return false;
                }
        );
        $(document).ready(function () {
            // Create date inputs
            minDate = new DateTime($('#fec2'), {
                format: 'MM/DD/YYYY'
            });
            maxDate = new DateTime($('#fec3'), {
                format: 'MM/DD/YYYY'
            });
            // DataTables initialisation
            var table = $('#B').DataTable({

            });
            // Refilter the table
            $('#fec2, #fec3').on('focus', function () {
                table.draw();
            });
            $('#selInfo').on('focus', function () {
                table.search(this.value).draw();
            });
        });
    </script>
    <script type="text/javascript">
        function func() {
            var cbCli = document.getElementById("cbCli");
            var textCli = cbCli.options[cbCli.selectedIndex].text;
            alert(textCli);

        }
    </script>
</body>
</html>
