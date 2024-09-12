<%@page import="java.util.List"%>
<%@page import="logica.Usuario"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="components/header.jsp" %>
<%@include file="components/sideBar.jsp" %>
<%@include file="components/topBar.jsp" %>

<!-- Main Content -->
<div id="content">
<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-center mb-4">
    <h1 class="h3 mb-0 text-gray-800">Editar Paciente</h1>   
</div>
<c:set var="paciente" value="${pacEditar}" />
<c:if test="${not empty error}">
    <div class="alert alert-danger">${error}</div>
</c:if>

<c:set var="paciente" value="${pacEditar}" />
<form class="user" action="SvEditPaciente" method="POST">
    <input type="hidden" name="id_persona" value="${paciente.id_persona}" />
    <div class="mx-3">
        <div class="form-group row">
            <div class="col-6 mb-3">
                <input type="text" class="form-control form-control-user" id="dni" 
                       name="dni" placeholder="DNI" value="${paciente.dni}" required>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-6 mb-2">
                <input type="text" class="form-control form-control-user" id="nombre" 
                       name="nombre" value="${paciente.nombre}" required>
            </div>
            <div class="col-sm-6 mb-2">
                <input type="text" class="form-control form-control-user" id="apellido" 
                       name="apellido" value="${paciente.apellido}" required>
            </div>
        </div>
        
        <div class="form-group row">
            <div class="col-sm-6 mb-2">
                <input type="text" class="form-control form-control-user" id="telefono" 
                       name="telefono" value="${paciente.telefono}" required>
            </div>
            <div class="col-sm-6 mb-2">
                <input type="text" class="form-control form-control-user" id="direccion" 
                       name="direccion" value="${paciente.direccion}" required>
            </div>
        </div>
        
        <div class="form-group row">
            <div class="col-sm-6 mb-2">
                <input type="date" class="form-control form-control-user" id="fechanac" 
                       name="fecha_nac" value="<fmt:formatDate value='${paciente.fecha_nac}' pattern='yyyy-MM-dd' />" required onchange="validarEdad()">

            </div>
            <div class="col-sm-6 mb-2">
                <input type="text" class="form-control form-control-user" id="tipoSangre" 
                       name="tipoSangre" value="${paciente.tipoSangre}" required>
            </div>
        </div>
            
        <div class="form-group row">
            <div class="col-sm-6 mb-2">
                <select name="seguro" class="form-control" style="font-size: 0.9rem; border-radius: 2rem;" required>
                    <option value="true" ${paciente.seguro_so ? 'selected' : ''}>Si</option>
                    <option value="false" ${!paciente.seguro_so ? 'selected' : ''}>No</option>
                </select>
            </div>

            <div class="col-sm-6 mb-2" id="responsableField">
                <select name="unResponsable" id="responsableSelect" class="form-control" style="font-size: 0.9rem; border-radius: 2rem;">
                    <option value="">Seleccione un responsable</option>
                    <c:forEach var="responsable" items="${listaResponsables}">
                        <option value="${responsable.id_persona}" 
                            ${responsable.id_persona == paciente.unResponsable.id_persona ? 'selected' : ''}>
                            ${responsable.nombre}
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-12 mb-3">
                <button type="submit" class="btn btn-primary btn-user btn-block">
                    Guardar Cambios
                </button>
            </div>
        </div>
    </div>
</form>
</div>
<!-- End of Main Content -->      
<%@include file="components/footer.jsp" %>

<script>
    // Validar edad al cargar la página
    window.onload = function() {
        validarEdad();
    }
    
    function validarEdad() {
    const fechaNacInput = document.getElementById('fechanac').value;
    if (!fechaNacInput) {
        alert("Por favor, ingrese una fecha de nacimiento.");
        return false;
    }

    const fechaNac = new Date(fechaNacInput);
    const hoy = new Date();
    let edad = hoy.getFullYear() - fechaNac.getFullYear();
    const mes = hoy.getMonth() - fechaNac.getMonth();

    if (mes < 0 || (mes === 0 && hoy.getDate() < fechaNac.getDate())) {
        edad--;
    }

    const responsableField = document.getElementById('responsableField');
    const responsableSelect = document.getElementById('responsableSelect');

    if (edad < 18) {
        responsableField.style.display = 'block';
        responsableSelect.setAttribute("required", "required");
    } else {
        responsableField.style.display = 'none';
        responsableSelect.removeAttribute("required");
    }

    return true;
}

</script>
