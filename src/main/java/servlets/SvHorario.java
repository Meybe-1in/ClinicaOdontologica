package servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.ControladoraLog;
import logica.Horario;

@WebServlet(name="SvHorario", urlPatterns={"/SvHorario"})
public class SvHorario extends HttpServlet {
    ControladoraLog control = new ControladoraLog();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String diaSemana = request.getParameter("diaSemana");
        String horario_inicio = request.getParameter("horario_inicio");
        String horario_fin = request.getParameter("horario_fin");

        control.crearHorario(diaSemana, horario_inicio, horario_fin);
        HttpSession session = request.getSession();
        session.setAttribute(diaSemana, "diaSemana");
        session.setAttribute(horario_inicio, "horario_inicio");
        session.setAttribute(horario_fin, "horario_fin");
        response.sendRedirect("altaHorario.jsp"); // Redirige a la vista de horarios
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Obtén la lista de horarios
        List<Horario> listaHorarios = control.getHorarios();

        // Guarda la lista de horarios en el request para ser accedida en el JSP
        request.setAttribute("listaHorarios", listaHorarios);

        // Redirige a la página verHorarios.jsp
        request.getRequestDispatcher("verHorarios.jsp").forward(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
