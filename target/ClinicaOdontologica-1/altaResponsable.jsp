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
    <h1 class="h3 mb-0 text-gray-800">Alta Responsable</h1>   
</div>

<c:if test="${not empty error}">
    <div class="alert alert-danger">${error}</div>
</c:if>
    <form class="user" action="SvResponsable" method="POST">
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
                <input type="text" class="form-control form-control-user" id="tipoParentesco" 
                       name="tipoParentesco" placeholder="Tipo de Parentesco" required>
            </div>
        </div>
            
        <div class="form-group row">
            <div class="col-12 mb-3">
                <button type="submit" class="btn btn-primary btn-user btn-block" onclick="return validarEdad()">
                    Crear Responsable
                </button>
            </div>
        </div>
    </form>
</div>
<!-- End of Main Content -->      

<%@include file="components/footer.jsp" %>

<!-- Script para validar la edad -->
<script>
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

        if (edad < 18) {
            alert("El responsable debe ser mayor de edad (18 años o más).");
            return false;
        }

        return true;
    }
</script>
