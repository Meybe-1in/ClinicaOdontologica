<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
    <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-thin fa-tooth"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Clínica Odontológica</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="../index.jsp">
                    <i class="fas fa-regular fa-bars"></i>
                    <span>Menú</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Gestión
            </div>

            <!-- Nav Item - gestion odontologos -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                   <i class="uil uil-user-md"></i>
                    <span>Odontólogo</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Acciones:</h6>
                        <a class="collapse-item" href="SvVerOdonto">Lista Odontólogo</a>
                        <a class="collapse-item" href="SvOdonto">Alta Odontólogo</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - gestion pacientes y responsables -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="uil uil-user-plus"></i>
                    <span>Pacientes</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Acciones:</h6>
                        <a class="collapse-item" href="SvVerPaciente">Lista Pacientes</a>
                        <a class="collapse-item" href="SvPaciente">Alta Pacientes</a>
                        <a class="collapse-item" href="SvVerResponsable">Lista Responsable</a>
                        <a class="collapse-item" href="../altaResponsable.jsp">Alta Responsables</a>
                    </div>
                </div>
            </li>
            
            <!-- Nav Item - gestion usuario -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUsu"
                    aria-expanded="true" aria-controls="collapseUsu">
                    <i class="uil uil-user"></i>
                    <span>Usuarios</span>
                </a>
                <div id="collapseUsu" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Acciones:</h6>
                        <a class="collapse-item" href="SvUsuarios">Lista Usuarios</a>
                        <a class="collapse-item" href="../altaUsuario.jsp">Alta Usuarios</a>
                    </div>
                </div>
            </li>
            
            <!-- Nav Item - gestion horario -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseHorario"
                    aria-expanded="true" aria-controls="collapseHorario">
                    <i class="uil uil-user"></i>
                    <span>Horarios</span>
                </a>
                <div id="collapseHorario" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Acciones:</h6>
                        <a class="collapse-item" href="SvHorario">Lista Horarios</a>
                        <a class="collapse-item" href="altaHorario.jsp">Alta Horarios</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">
            
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->
</html>
