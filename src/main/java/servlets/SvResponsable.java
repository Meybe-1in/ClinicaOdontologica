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
import logica.ControladoraLog;
import logica.Responsable;

@WebServlet(name="SvResponsable", urlPatterns={"/SvResponsable"})
public class SvResponsable extends HttpServlet {
    ControladoraLog control = new ControladoraLog();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        List<Responsable> listaResponsables = control.getResponsables();
        if (listaResponsables == null || listaResponsables.isEmpty()) {
            System.out.println("La lista de responsables está vacía o es nula");
        }
        request.setAttribute("listaResponsables", listaResponsables);
        
        // Redirigir a la página de altaPaciente.jsp
        request.getRequestDispatcher("verResponsables.jsp").forward(request, response);

        
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         // Obtener datos del formulario
        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String fechaNacStr = request.getParameter("fecha_nac");
        String tipoParentesco = request.getParameter("tipoParentesco");
        
        Date fechaNac = null;
        try {
            if (fechaNacStr != null && !fechaNacStr.isEmpty()) {
                fechaNac = new SimpleDateFormat("yyyy-MM-dd").parse(fechaNacStr);
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        // Crear un nuevo Responsable
        control.crearResponsable(dni, nombre, apellido, telefono, direccion, fechaNac, tipoParentesco);
        
        // Redirigir a la página de altaResponsable.jsp
        response.sendRedirect("altaResponsable.jsp");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
