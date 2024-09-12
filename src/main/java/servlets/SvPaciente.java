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
import logica.Paciente;
import logica.Responsable;

@WebServlet(name="SvPaciente", urlPatterns={"/SvPaciente"})
public class SvPaciente extends HttpServlet {
    ControladoraLog control = new ControladoraLog();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // Obtener lista de responsables
        List<Paciente> listaPacientes = control.getPacientes();
        List<Responsable> listaResponsables = control.getResponsables();
        request.setAttribute("listaPacientes", listaPacientes);
        request.setAttribute("listaResponsables", listaResponsables);
    
        // Redirigir a la página verPaciente.jsp
        request.getRequestDispatcher("altaPaciente.jsp").forward(request, response);


        
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
        String tipoSangre = request.getParameter("tipoSangre");
        boolean seguroSo = Boolean.parseBoolean(request.getParameter("seguroSo"));
        String fechaNacStr = request.getParameter("fecha_nac");
        String idResponsableStr = request.getParameter("unResponsable");

        Date fechaNac = null;
        try {
            if (fechaNacStr != null && !fechaNacStr.isEmpty()) {
                fechaNac = new SimpleDateFormat("yyyy-MM-dd").parse(fechaNacStr);
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }

        // Convertir el ID del responsable a entero
        
        Responsable unResponsable = null;
        if (idResponsableStr != null && !idResponsableStr.equals("Seleccione un responsable")) {
        try {
            int idResponsable = Integer.parseInt(idResponsableStr);
            unResponsable = control.traerResponsable(idResponsable);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            // Manejo del error si es necesario
        }
    }

        // Crear el paciente
        control.crearPaciente(dni, nombre, apellido, telefono, direccion, fechaNac, tipoSangre, seguroSo, unResponsable);

        // Redirigir a la vista de pacientes
        response.sendRedirect("SvPaciente");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
