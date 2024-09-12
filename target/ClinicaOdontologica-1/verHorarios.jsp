<%@page import="java.util.List"%>
<%@page import="logica.Horario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="components/header.jsp" %>
<%@include file="components/sideBar.jsp" %>
<%@include file="components/topBar.jsp" %>

<!-- Main Content -->
<div id="content">
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-center mb-4">
        <h1 class="h3 mb-0 text-gray-800">Ver Horarios</h1>   
    </div>
    <div class="container-fluid">
        <!-- DataTales -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Horarios</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Día de la Semana</th>
                                <th>Hora de Inicio</th>
                                <th>Hora de Fin</th>
                                <th>Acción</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Id</th>
                                <th>Día de la Semana</th>
                                <th>Hora de Inicio</th>
                                <th>Hora de Fin</th>
                                <th>Acción</th>
                            </tr>
                        </tfoot>
                        <tbody>
                        <!-- Verifica si la lista de horarios está presente y no es nula -->
                        <c:if test="${not empty listaHorarios}">
                            <c:forEach var="horario" items="${listaHorarios}">
                                <tr>
                                    <td>${horario.id_horario}</td>
                                    <td>${horario.diaSemana}</td>
                                    <td>${horario.horario_inicio}</td>
                                    <td>${horario.horario_fin}</td>
                                    <td style="display: flex;">
                                        <!-- Formulario para eliminar -->
                                        <form name="eliminar" action="SvElimHorario" method="POST" style="margin-right: 4px;">
                                            <input type="hidden" name="id" value="${horario.id_horario}">
                                            <button type="submit" class="btn btn-danger btn-icon-split btn-sm">
                                                <span class="icon text-white-50">
                                                    <i class="fas fa-trash"></i>
                                                </span>
                                                <span class="text">Eliminar</span>
                                            </button>
                                        </form>
                                        <!-- Formulario para editar -->
                                        <form name="editar" action="SvEditHorario" method="GET">
                                            <input type="hidden" name="id" value="${horario.id_horario}">
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
                        <c:if test="${empty listaHorarios}">
                            <tr>
                                <td colspan="5" class="text-center">No hay horarios disponibles</td>
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
