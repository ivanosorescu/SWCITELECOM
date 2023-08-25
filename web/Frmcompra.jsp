<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("tipo") == null) {

        response.sendRedirect("login.jsp");
    } else {
        String tipo = sesion.getAttribute("tipo").toString();
        if (!tipo.equals("Compra")) {
            response.sendRedirect("login.jsp");
        }
    }
%>
<!-- Navbar -->
<div class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
    </ul>
    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                <i class="fas fa-expand-arrows-alt"></i>
            </a>
        </li>
        <li class="btn-exit" id="btn-exi">

            <a class="nav-link"  data-slide="true"  role="button">
                <i class="fa fa-power-off" aria-hidden="true" title="Salir" id="btn-exi"></i>
            </a>
        </li>
    </ul>
</div>
<!-- /.navbar -->
<!-- Main Sidebar Container -->
<section class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="DashboardCompra.jsp" class="brand-link">
        <img style=" color: #fff; text-align: center;" src="assets/images/logo (1).png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
    </a>
    <br>
    <a href="" class="brand-link" >
        <span class="brand-text " style=" color: #fff; text-align: center;"><h6>TELECOM SYSTEM </h6></span>
        <span class="brand-text " style="text-align: center;"><h6>Ingenieros Asocidos S.A.C</h6></span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="dist/img/user.png" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="#" class="d-block"><%=sesion.getAttribute("usuario")%></a>
            </div>
        </div>
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-header">COMPRAS</li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-user"></i>
                        <p>
                            AUXILIAR
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="Empleado.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Trabajador</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-header">DOC'S</li>
                <li class="nav-item">
                    <a href="ListarRequerimiento.jsp" class="nav-link">
                        <i class="nav-icon fas fa-book"></i>
                        <p>Registrar Requerimiento</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="Generardocumentodecompras.jsp" class="nav-link">
                        <i class="nav-icon fas fa-book"></i>
                        <p>Registrar Comprobante</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="ListarFacturadeCompra.jsp" class="nav-link">
                        <i class="nav-icon fas fa-book"></i>
                        <p>Factura de Compra</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-file"></i>
                        <p>
                            REPORTES
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                         <li class="nav-item">
                            <a href="ReporteRequerimiento.jsp" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Registro Requerimiento</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Reportecompras.jsp" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Registro de Compra</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="InventarioValorizado.jsp" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Inventario Valorizado</p>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a href="Listadeprecioycosto.jsp" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Lista de Costo y Precio</p>
                            </a>
                        </li>
                    </ul>
                </li>

            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</section>


