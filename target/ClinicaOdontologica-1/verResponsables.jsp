<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="components/header.jsp" %>
<%@include file="components/sideBar.jsp" %>
<%@include file="components/topBar.jsp" %>

<!-- Main Content -->
<div id="content">
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-center mb-4">
        <h1 class="h3 mb-0 text-gray-800">Lista de Responsables</h1>
    </div>
    <div class="container-fluid">
        <!-- DataTables -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Responsables</h6>
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
                                <th>Tipo Parentesco</th>
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
                                <th>Tipo Parentesco</th>
                                <th style="width: 210px">Acción</th>
                            </tr>
                        </tfoot>
                        <tbody>
                                <c:if test="${not empty listaResponsables}">
                                    <c:forEach var="resp" items="${listaResponsables}">
                                    <tr>
                                        <td>${resp.id_persona}</td>
                                        <td>${resp.dni}</td>
                                        <td>${resp.nombre}</td>
                                        <td>${resp.apellido}</td>
                                        <td>${resp.telefono}</td>
                                        <td>${resp.direccion}</td>
                                        <td>${resp.formattedFechaNac}</td>
                                        <td>${resp.tipo_responsable}</td>
                                        <td style="display: flex;">
                                            <!-- Formulario para eliminar -->
                                            
                                            <form name="eliminar" action="SvElimResponsable" method="POST" style="margin-right: 4px;">
                                                <input type="hidden" name="id" value="${resp.id_persona}">
                                                <button type="submit" class="btn btn-danger btn-icon-split btn-sm">
                                                    <span class="icon text-white-50">
                                                        <i class="fas fa-trash"></i>
                                                    </span>
                                                    <span class="text">Eliminar</span>
                                                </button>
                                            </form>
                                            <!-- Formulario para editar -->
                                            <form name="editar" action="SvEditResponsable" method="GET">
                                                <input type="hidden" name="id" value="${resp.id_persona}">
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
                            <c:if test="${empty listaResponsables}">
                                <tr>
                                    <td colspan="9" class="text-center">No hay responsables disponibles</td>
                                </tr>
                            </c:if>
                            <c:out value="${not empty listaResponsables ? 'Lista recibida' : 'Lista vacía'}" />

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End of Main Content -->

<%@include file="components/footer.jsp" %>


