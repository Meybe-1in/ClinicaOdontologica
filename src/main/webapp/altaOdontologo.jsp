<%@page import="java.util.List"%>
<%@page import="logica.Usuario"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="components/header.jsp" %>
<%@include file="components/sideBar.jsp" %>
<%@include file="components/topBar.jsp" %>

<!-- Main Content -->
<div id="content">
<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-center mb-4">
    <h1 class="h3 mb-0 text-gray-800">Alta Odontólogo</h1>   
</div>

<c:if test="${not empty error}">
    <div class="alert alert-danger">${error}</div>
</c:if>

<form class="user" action="SvOdonto" method="POST">
    <div class="mx-3">
        <div class="form-group row">
            <div class="col-6 mb-3">
                <input type="text" class="form-control form-control-user" id="dni" 
                       name="dni" placeholder="DNI" required>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-6 mb-2">
                <input type="text" class="form-control form-control-user" id="nombre" 
                       name="nombre" placeholder="Nombre" required>
            </div>
            <div class="col-sm-6 mb-2">
                <input type="text" class="form-control form-control-user" id="apellido" 
                       name="apellido" placeholder="Apellido" required>
            </div>
        </div>
        
        <div class="form-group row">
            <div class="col-sm-6 mb-2">
                <input type="text" class="form-control form-control-user" id="telefono" 
                       name="telefono" placeholder="Teléfono" required>
            </div>
            <div class="col-sm-6 mb-2">
                <input type="text" class="form-control form-control-user" id="direccion" 
                       name="direccion" placeholder="Dirección" required>
            </div>
        </div>
        
        <div class="form-group row">
            <div class="col-sm-6 mb-2">
                <input type="date" class="form-control form-control-user" id="fechanac" 
                       name="fecha_nac" placeholder="" required>
            </div>
            <div class="col-sm-6 mb-2">
                <input type="text" class="form-control form-control-user" id="especialidad" 
                       name="especialidad" placeholder="Especialidad" required>
            </div>
            
            
        </div>
        <div class="form-group row">
            <div class="col-sm-6 mb-2">
                <div class="input-group">
                <select name="unUsuario" class="form-control" style="font-size: 0.9rem; border-radius: 2rem;"required>
                     <option selected>Seleccione un usuario</option>
                    <c:forEach var="usuario" items="${listaUsuarios}">
                        <option value="${usuario.id_usuario}">${usuario.nombreUsuario}</option>
                    </c:forEach>
                </select>
                </div>
            </div>
        
        
        <div class="col-sm-6 mb-2">
            <select name="unHorario" class="form-control" style="font-size: 0.9rem; border-radius: 2rem;" required>
            <option selected>Seleccione un horario</option>
            <c:forEach var="horario" items="${listaHorarios}">
                <option value="${horario.id_horario}">${horario.diaSemana} de ${horario.horario_inicio} a ${horario.horario_fin}</option>
            </c:forEach>
        </select>
        </div>
        </div>

        <div class="form-group row">
            <div class="col-12 mb-3">
                <button type="submit" class="btn btn-primary btn-user btn-block">
                    Crear Odontólogo
                </button>
            </div>
        </div>
    </div>
</form>   
          
</div>
<!-- End of Main Content -->      
<%@include file="components/footer.jsp" %>
