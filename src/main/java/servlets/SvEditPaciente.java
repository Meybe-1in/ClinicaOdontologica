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

@WebServlet(name="SvEditPaciente", urlPatterns={"/SvEditPaciente"})
public class SvEditPaciente extends HttpServlet {
    ControladoraLog control = new ControladoraLog();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        Paciente paciente = control.traerPaciente(id);

        if (paciente != null) {
            request.setAttribute("pacEditar", paciente);
            List<Responsable> listaResponsables = control.getResponsables();
            request.setAttribute("listaResponsables", listaResponsables);
            request.getRequestDispatcher("editarPaciente.jsp").forward(request, response);
        } else {
            response.sendRedirect("errorNUE.jsp");
        }
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String tipoSangre = request.getParameter("tipoSangre");
        boolean seguroSo = Boolean.parseBoolean(request.getParameter("seguro"));
        String fechaNacStr = request.getParameter("fecha_nac");
        String idResponsableStr = request.getParameter("unResponsable");
        String idPersonaStr = request.getParameter("id_persona");

        if (fechaNacStr == null || fechaNacStr.isEmpty() || idPersonaStr == null || idPersonaStr.isEmpty()) {
            response.sendRedirect("e.jsp");
            return;
        }

        Date fecha_nac = null;
        try {
            fecha_nac = new SimpleDateFormat("yyyy-MM-dd").parse(fechaNacStr);
        } catch (ParseException e) {
            e.printStackTrace();
            response.sendRedirect("error1.jsp");
            return;
        }

        int id;
        try {
            id = Integer.parseInt(idPersonaStr);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("error2.jsp");
            return;
        }

        Paciente paciente = control.traerPaciente(id);

        if (paciente != null) {
            Responsable unResponsable = null;
            if (idResponsableStr != null && !idResponsableStr.isEmpty()) {
                unResponsable = control.traerResponsable(Integer.parseInt(idResponsableStr));
            }

            paciente.setDni(dni);
            paciente.setNombre(nombre);
            paciente.setApellido(apellido);
            paciente.setTelefono(telefono);
            paciente.setDireccion(direccion);
            paciente.setFecha_nac(fecha_nac);
            paciente.setTipoSangre(tipoSangre);
            paciente.setSeguro_so(seguroSo);
            paciente.setUnResponsable(unResponsable);

            control.editarPaciente(paciente);

            response.sendRedirect("SvPaciente");
        } else {
            response.sendRedirect("error3.jsp");
        }
    }


 

        @Override
        public String getServletInfo() {
            return "Short description";
        }// </editor-fold>

}
