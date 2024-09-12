<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp" %>
<%@include file="components/sideBar.jsp" %>
<%@include file="components/topBar.jsp" %>

<div class="container">
    <h2>Crear Horario</h2>
    <form action="SvHorario" method="POST" class="user">
        <div class="form-group">
            <label for="diaSemana">Día de la Semana</label>
            <input type="text" class="form-control form-control-user" id="diaSemana" name="diaSemana" placeholder="Ej. Lunes, Fin de semana" required>
        </div>
        <div class="form-group">
            <label for="horario_inicio">Horario Inicio</label>
            <input type="time" class="form-control form-control-user" id="horario_inicio" name="horario_inicio" required>
        </div>
        <div class="form-group">
            <label for="horario_fin">Horario Fin</label>
            <input type="time" class="form-control form-control-user" id="horario_fin" name="horario_fin" required>
        </div>
        <button type="submit" class="btn btn-primary btn-user btn-block">Crear Horario</button>
    </form>
</div>

<%@include file="components/footer.jsp" %>
