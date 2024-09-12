package servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.ControladoraLog;
import logica.Responsable;

@WebServlet(name="SvVerResponsable", urlPatterns={"/SvVerResponsable"})
public class SvVerResponsable extends HttpServlet {
    ControladoraLog control = new ControladoraLog();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
          // Obtener lista de responsables
        List<Responsable> listaResponsables = control.getResponsables();
        request.setAttribute("listaResponsables", listaResponsables);
        
        // Redirigir a la página verResponsable.jsp
        request.getRequestDispatcher("verResponsables.jsp").forward(request, response);
        
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
