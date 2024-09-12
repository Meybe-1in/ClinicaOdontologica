package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.ControladoraLog;
import logica.Odontologo;

@WebServlet(name = "SvEditOdonto", urlPatterns = {"/SvEditOdonto"})
public class SvEditOdonto extends HttpServlet {
    ControladoraLog control = new ControladoraLog();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            int id =Integer.parseInt(request.getParameter("id")); 
            Odontologo odon =control.traerOdonto(id);
            
            HttpSession misession = request.getSession();
            misession.setAttribute("odonEditar", odon);
            response.sendRedirect("editarOdonto.jsp");   
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String fechaNacStr = request.getParameter("fecha_nac");
        String especialidad = request.getParameter("especialidad");
        
        // Parsear la fecha
        Date fecha_nac = null;
        try {
            fecha_nac = new SimpleDateFormat("yyyy-MM-dd").parse(fechaNacStr);
        } catch (ParseException e) {
            e.printStackTrace();
            // Manejar el error de parseo
            response.sendRedirect("error.jsp");
            return;
        }
        
        Odontologo odon = (Odontologo)request.getSession().getAttribute("odonEditar");
         if (odon != null) {
            // Actualizar los datos del odontólogo
            odon.setDni(dni);
            odon.setNombre(nombre);
            odon.setApellido(apellido);
            odon.setTelefono(telefono);
            odon.setDireccion(direccion);
            odon.setFecha_nac(fecha_nac);
            odon.setEspecialidad(especialidad);

            control.editarOdonto(odon);
        
        response.sendRedirect("SvOdonto");
        } else {
            // Manejar el caso donde el odontólogo no se encuentra en la sesión
            response.sendRedirect("error.jsp");
        }
    
    }
                

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
