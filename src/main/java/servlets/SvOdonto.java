package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.ControladoraLog;
import logica.Horario;
import logica.Odontologo;
import logica.Usuario;

@WebServlet(name = "SvOdonto", urlPatterns = {"/SvOdonto"})
public class SvOdonto extends HttpServlet {

    ControladoraLog control = new ControladoraLog();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // No se necesita implementar aquí
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtén la lista de usuarios y odontólogos desde la controladora
        List<Usuario> listaUsuarios = control.getUsuarios();
        List<Odontologo> listaOdonto = control.getOdontologos();
        List<Horario> listaHorarios = control.getHorarios();

        // Guarda la lista de usuarios en el request para ser accedida en el JSP
        request.setAttribute("listaUsuarios", listaUsuarios);

        // Guarda la lista de odontólogos en la sesión (si es necesario)
        HttpSession session = request.getSession();
        session.setAttribute("listaOdonto", listaOdonto);
        
        request.setAttribute("listaHorarios", listaHorarios);

        // Redirige a la página altaOdontologo.jsp
        request.getRequestDispatcher("altaOdontologo.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener los datos del formulario
        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String especialidad = request.getParameter("especialidad");
        String fechaNacStr = request.getParameter("fecha_nac");
        String idUsuarioStr = request.getParameter("unUsuario");
        

        Date fechaNac = null;
        try {
            if (fechaNacStr != null && !fechaNacStr.isEmpty()) {
                fechaNac = new SimpleDateFormat("yyyy-MM-dd").parse(fechaNacStr);
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }

        // Convertir el ID de usuario a entero
        int idUsuario = Integer.parseInt(idUsuarioStr);
        Usuario unUsuario = control.traerUsuario(idUsuario);
        
        int idHorario = Integer.parseInt(request.getParameter("unHorario"));
        Horario unHorario = control.traerHorario(idHorario);

        // Crear el odontólogo
        control.crearOdonto(dni, nombre, apellido, telefono, fechaNac, direccion, especialidad, unUsuario, unHorario);

        // Redirigir de nuevo a la página de alta odontólogo o a una página de éxito
        response.sendRedirect("SvOdonto");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
