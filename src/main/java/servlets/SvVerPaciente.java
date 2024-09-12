package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.ControladoraLog;
import logica.Paciente;
import logica.Responsable;

@WebServlet(name="SvVerPaciente", urlPatterns={"/SvVerPaciente"})
public class SvVerPaciente extends HttpServlet {
    ControladoraLog control = new ControladoraLog();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        List<Paciente> listaPacientes = control.getPacientes();
        request.setAttribute("listaPacientes", listaPacientes);
        // Obtener lista de responsables
        List<Responsable> listaResponsables = control.getResponsables();
        request.setAttribute("listaResponsables", listaResponsables);
        
        request.getRequestDispatcher("verPaciente.jsp").forward(request, response);
       
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
