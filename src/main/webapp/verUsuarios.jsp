<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="components/header.jsp" %>
<%@include file="components/sideBar.jsp" %>
<%@include file="components/topBar.jsp" %>
 
 <!-- Main Content -->

<div id="content">
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-center mb-4">
        <h1 class="h3 mb-0 text-gray-800">Ver Usuarios</h1>   
    </div>
    <div class="container-fluid">
        <!-- DataTables  -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Usuarios</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Nombre</th>
                                <th>Rol</th>
                                <th style="width: 210px">Acción</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Id</th>
                                <th>Nombre</th>
                                <th>Rol</th>
                                <th style="width: 210px">Acción</th>
                            </tr>
                        </tfoot>
                        <tbody>
                            <!-- Verifica si la lista de usuarios está presente y no es nula -->
                            <c:if test="${not empty listaUsuarios}">
                                <c:forEach var="usu" items="${listaUsuarios}">
                                    <tr>
                                        <td>${usu.id_usuario}</td>
                                        <td>${usu.nombreUsuario}</td>
                                        <td>${usu.rol}</td> 
                                        <td style="display: flex;">
                                            <!-- Formulario para eliminar -->
                                            <form name="eliminar" action="SvElimUsuarios" method="POST" style="margin-right: 4px;">
                                                <input type="hidden" name="id" value="${usu.id_usuario}">
                                                <button type="submit" class="btn btn-danger btn-icon-split btn-sm">
                                                    <span class="icon text-white-50">
                                                        <i class="fas fa-trash"></i>
                                                    </span>
                                                    <span class="text">Eliminar</span>
                                                </button>
                                            </form>
                                            <!-- Formulario para editar -->
                                            <form name="editar" action="SvEditUsuarios" method="GET">
                                                <input type="hidden" name="id" value="${usu.id_usuario}">
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
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


<%@include file="components/footer.jsp" %>


