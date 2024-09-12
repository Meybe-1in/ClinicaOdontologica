<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="components/header.jsp" %>
<%@include file="components/sideBar.jsp" %>
<%@include file="components/topBar.jsp" %>

<!-- Main Content -->
<div id="content">
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-center mb-4">
        <h1 class="h3 mb-0 text-gray-800">Lista de Pacientes</h1>
    </div>
    <div class="container-fluid">
        <!-- DataTables -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Pacientes</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>DNI</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Teléfono</th>
                                <th>Dirección</th>
                                <th>FechaNac</th>
                                <th>Tipo sangre</th>
                                <th>Seguro social</th>
                                <th>Responsable</th>
                                <th style="width: 210px">Acción</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>ID</th>
                                <th>DNI</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Teléfono</th>
                                <th>Dirección</th>
                                <th>FechaNac</th>
                                <th>Tipo sangre</th>
                                <th>Seguro social</th>
                                <th>Responsable</th>
                                <th style="width: 210px">Acción</th>
                            </tr>
                        </tfoot>
                        <tbody>
                                <c:if test="${not empty listaPacientes}">
                                    <c:forEach var="pacient" items="${listaPacientes}">
                                    <tr>
                                        <td>${pacient.id_persona}</td>
                                        <td>${pacient.dni}</td>
                                        <td>${pacient.nombre}</td>
                                        <td>${pacient.apellido}</td>
                                        <td>${pacient.telefono}</td>
                                        <td>${pacient.direccion}</td>
                                        <td>${pacient.formattedFechaNac}</td>
                                        <td>${pacient.tipoSangre}</td>
                                        <td>${pacient.seguro_so}</td>
                                        <td>${pacient.unResponsable.nombre}</td>
                                        <td style="display: flex;">
                                            <!-- Formulario para eliminar -->
                                            
                                            <form name="eliminar" action="SvElimPaciente" method="GET" style="margin-right: 4px;">
                                                <input type="hidden" name="id" value="${pacient.id_persona}">
                                                <button type="submit" class="btn btn-danger btn-icon-split btn-sm">
                                                    <span class="icon text-white-50">
                                                        <i class="fas fa-trash"></i>
                                                    </span>
                                                    <span class="text">Eliminar</span>
                                                </button>
                                            </form>
                                            <!-- Formulario para editar -->
                                            <form name="editar" action="SvEditPaciente" method="POST">
                                                <input type="hidden" name="id" value="${pacient.id_persona}">
                                                <button type="submit" class="btn btn-primary btn-icon-split btn-sm">
                                                    <span class="icon text-white-50">
                                                        <i class="fas fa-pencil-alt"></i>
                                                    </span>
                                                    <span class="text">Editar</span>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty listaPacientes}">
                                <tr>
                                    <td colspan="9" class="text-center">No hay pacientes disponibles</td>
                                </tr>
                            </c:if>
                            <c:out value="${not empty listaPacientes ? 'Lista recibida' : 'Lista vacía'}" />

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End of Main Content -->

<%@include file="components/footer.jsp" %>
