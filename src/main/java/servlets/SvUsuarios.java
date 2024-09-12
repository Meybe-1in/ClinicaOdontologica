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
import logica.Usuario;

@WebServlet(name = "SvUsuarios", urlPatterns = {"/SvUsuarios"})
public class SvUsuarios extends HttpServlet {
    
    ControladoraLog control = new ControladoraLog();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Usuario> listaUsuarios = control.getUsuarios();
        request.setAttribute("listaUsuarios", listaUsuarios);
        
        request.getRequestDispatcher("verUsuarios.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String rol = request.getParameter("rol");
        String nombreUsuario = request.getParameter("nombreusu");
        String contra = request.getParameter("contrasenia");
        
        control.crearUsuario(nombreUsuario, contra, rol);
        
        HttpSession session = request.getSession();
        session.setAttribute("nombreUsuario", nombreUsuario);
        session.setAttribute("contrasenia", contra);
        session.setAttribute("rol", rol);

        response.sendRedirect("altaUsuario.jsp");
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
