<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="components/header.jsp" %>
<%@include file="components/sideBar.jsp" %>
<%@include file="components/topBar.jsp" %>

<!-- Main Content -->
<div id="content">
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-center mb-4">
        <h1 class="h3 mb-0 text-gray-800">Lista Odontólogos</h1>
    </div>
    <div class="container-fluid">
        <!-- DataTables -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Odontólogos</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Dni</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Teléfono</th>
                                <th>Dirección</th>
                                <th>FechaNac</th>
                                <th>Especialidad</th>
                                <th style="width: 210px">Acción</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Id</th>
                                <th>Dni</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Teléfono</th>
                                <th>Dirección</th>
                                <th>FechaNac</th>
                                <th>Especialidad</th>
                                <th style="width: 210px">Acción</th>
                            </tr>
                        </tfoot>
                        <tbody>
                            <c:if test="${not empty listaOdonto}">
                                <c:forEach var="odon" items="${listaOdonto}">
                                    <tr>
                                        <td>${odon.id_persona}</td>
                                        <td>${odon.dni}</td>
                                        <td>${odon.nombre}</td>
                                        <td>${odon.apellido}</td>
                                        <td>${odon.telefono}</td>
                                        <td>${odon.direccion}</td>
                                        <td>${odon.formattedFechaNac}</td>
                                        <td>${odon.especialidad}</td>
                                        <td style="display: flex;">
                                            <!-- Formulario para eliminar -->
                                            <form name="eliminar" action="SvElimOdonto" method="POST" style="margin-right: 4px;">
                                                <input type="hidden" name="id" value="${odon.id_persona}">
                                                <button type="submit" class="btn btn-danger btn-sm">
                                                    <span class="icon text-white-50">
                                                        <i class="fas fa-trash"></i>
                                                    </span>
                                                    <span class="text"></span>
                                                </button>
                                            </form>
                                            <!-- Formulario para editar -->
                                            <form name="editar" action="SvEditOdonto" method="GET">
                                                <input type="hidden" name="id" value="${odon.id_persona}">
                                                <button type="submit" class="btn btn-primary  btn-sm">
                                                    <span class="icon text-white-50">
                                                        <i class="fas fa-pencil-alt"></i>
                                                    </span>
                                                    <span class="text"></span>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty listaOdonto}">
                                <tr>
                                    <td colspan="9" class="text-center">No hay odontólogos disponibles</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End of Main Content -->

<%@include file="components/footer.jsp" %>
