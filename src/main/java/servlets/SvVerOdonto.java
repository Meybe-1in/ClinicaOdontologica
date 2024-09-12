package servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.ControladoraLog;
import logica.Odontologo;

@WebServlet(name="SvVerOdonto", urlPatterns={"/SvVerOdonto"})
public class SvVerOdonto extends HttpServlet {
    ControladoraLog control = new ControladoraLog();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // Obtén la lista de odontólogos desde la controladora
        List<Odontologo> listaOdonto = control.getOdontologos();

        // Guarda la lista de odontólogos en el request para ser accedida en el JSP
        request.setAttribute("listaOdonto", listaOdonto);

        // Redirige a la página verOdonto.jsp
        request.getRequestDispatcher("verOdonto.jsp").forward(request, response);
        
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
