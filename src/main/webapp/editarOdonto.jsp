<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Odontologo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="components/header.jsp" %>
<%@include file="components/sideBar.jsp" %>
<%@include file="components/topBar.jsp" %>
 
 <!-- Main Content -->
<div id="content">
<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-center mb-4">
    <h1 class="h3 mb-0 text-gray-800">Editar Odontólogo</h1>   
</div>
    <%Odontologo odon = (Odontologo)request.getSession().getAttribute("odonEditar"); %>
    <form class="user"action="SvEditOdonto" method="POST">
        
    <div class="mx-3">
        <div class="form-group row">
            <div class="col-6 mb-3">
                <input type="text" class="form-control form-control-user" id="dni" 
                       name="dni" placeholder="DNI" required
                       value="<%=odon.getDni()%>">
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-6 mb-2">
                <input type="text" class="form-control form-control-user" id="nombre" 
                       name="nombre" placeholder="Nombre" required
                       value= "<%=odon.getNombre()%>">
            </div>
            <div class="col-sm-6 mb-2">
                <input type="text" class="form-control form-control-user" id="apellido" 
                       name="apellido"placeholder="Apellido" required
                       value= "<%=odon.getApellido()%>">
            </div>
        </div>
        
        <div class="form-group row">
            <div class="col-sm-6 mb-2">
                <input type="text" class="form-control form-control-user" id="telefono" 
                       name="telefono" placeholder="Teléfono" required
                       value= "<%=odon.getTelefono()%>">
            </div>
            <div class="col-sm-6 mb-2">
                <input type="text" class="form-control form-control-user" id="direccion" 
                       name="direccion" placeholder="Dirección" required
                       value= "<%=odon.getDireccion()%>">
            </div>
        </div>
        
        <div class="form-group row">
            <div class="col-sm-6 mb-2">
                <input type="date" class="form-control form-control-user" id="fechanac" 
                       name="fecha_nac" placeholder="" 
                       value="<%= new SimpleDateFormat("yyyy-MM-dd").format(odon.getFecha_nac()) %>" 
                       required>
            </div>
            <div class="col-sm-6 mb-2">
                <input type="text" class="form-control form-control-user" id="especialidad" 
                       name="especialidad" placeholder="Especialidad" required
                       value= "<%=odon.getEspecialidad()%>">
            </div>
        </div>
        <div class="form-group row">
                    <div class="col-12 mb-3">
                        <button type="submit" class="btn btn-primary btn-user btn-block">
                            Editar Odontólogo
                        </button>
                    </div>
         </div>
    </form>   
    </div>           
</div>
<!-- End of Main Content -->      
<%@include file="components/footer.jsp" %>

