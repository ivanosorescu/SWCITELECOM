<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("tipo") == null) {

        response.sendRedirect("login.jsp");
    } else {
        String tipo = sesion.getAttribute("tipo").toString();
        if (!tipo.equals("Administrador")) {
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
                <li class="nav-header">ADMIN</li>
                <li class="nav-item">
                    <a href="Usuario.jsp" class="nav-link">
                        <i class="nav-icon fas fa-book"></i>
                        <p>Usuario</p>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</section>





