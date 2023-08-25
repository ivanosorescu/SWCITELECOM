<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("tipo") == null) {

        response.sendRedirect("login.jsp");
    } else {
        String tipo = sesion.getAttribute("tipo").toString();
        if (!tipo.equals("Almacen")) {
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
    <a href="DashboardAlmacen.jsp" class="brand-link">
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
                <!-- Add icons to the links using the .nav-icon class
                     with font-awesome or any other icon font library -->
                <li class="nav-header">ADMINISTRACION</li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-cog"></i>
                        <p>
                            CONFIGURACI�N
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="Clasificacion.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Clasificaci�n</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Categoria.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Categor�a</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Subcategoria.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Subcategoria</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Unidadmedida.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Unidad de Medida</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Producto.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Producto</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Stockminimoymaximo.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Stock m�nimo y m�ximo</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Motivo.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Motivo</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Transporte.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Transporte</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Vehiculo.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Veh�culo</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Conductor.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Conductor</p>
                            </a>
                        </li>
                    </ul>
                </li>
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
                            <a href="Cliente.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Cliente</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Proveedor.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Proveedor</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-header">MOVIMIENTOS</li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-box-open"></i>
                        <p>
                            INGRESOS
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="ListarNotaingreso.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Nota de Ingreso</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-box-open"></i>
                        <p>
                            SALIDAS
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="Generardocumentodealmacen.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Generar Salida de RQ</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="ListarNotasalida.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Nota Salida Directa</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="ListarGuiaremisioncliente.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Gu�a de remisi�n</p>
                            </a>
                        </li>
                    </ul>
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
                            <a href="ReporteIngreso.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Registro de Ingreso</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Reportesalida.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Registro de Salida</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="ReporteStockproducto.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Stock Producto</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="ReporteStockminimo.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Stock M�nimo</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="ReporteStockmaximo.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Stock M�ximo</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="Listaproductoconsultamovimiento.jsp" class="nav-link">
                                <i class="far fas fa-circle nav-icon"></i>
                                <p>Movimiento por Producto</p>
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


