<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="components/header.jsp" %>
<%@include file="components/sideBar.jsp" %>
<%@include file="components/topBar.jsp" %>
 
 <!-- Main Content -->
<div id="content">
<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-center mb-4">
    <h1 class="h3 mb-0 text-gray-800">Alta Usuarios</h1>   
</div>

<form class="user" action="SvUsuarios" method="POST">
        <div class="container d-flex justify-content-center">
            <div class="w-50">
                
                <div class="form-group row">
                    <div class="col-12 mb-3">
                        <input type="text" class="form-control form-control-user" 
                               id="nombreusu" name="nombreusu"
                               placeholder="Nombre Usuario">
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-12 mb-3">
                        <input type="password" class="form-control form-control-user" 
                               id="contrasenia" name="contrasenia" 
                               placeholder="Contraseña">
                    </div>
                </div>
                
                <div class="form-group row">
                    <div class="col-12 mb-3">
                        <input type="text" class="form-control form-control-user" 
                               id="rol" name="rol"
                               placeholder="Rol">
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-12 mb-3">
                        <button type="submit" class="btn btn-primary btn-user btn-block">
                            Crear Usuario
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </form>          
</div>
<!-- End of Main Content -->      
<%@include file="components/footer.jsp" %>


