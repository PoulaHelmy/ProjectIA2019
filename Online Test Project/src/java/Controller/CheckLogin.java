
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DBconnection;



@WebServlet(name = "CheckLogin", urlPatterns = {"/CheckLogin"})
public class CheckLogin extends HttpServlet 
{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            DBconnection conn = new DBconnection();
            Connection connection =null;
            Statement statement = null;
            ResultSet RS = null;
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            String usertype=request.getParameter("type");
            HttpSession session = request.getSession();
            try
            {
                connection = conn.getConnection() ;
                Statement stat = connection.createStatement();
                String sql = "Select * from users where username='"+username+"' and password='"+password+"' and usertype= '"+usertype+"'";
                ResultSet rs = stat.executeQuery(sql);
                if(rs.next())
                {
                    session.setAttribute("username", rs.getString("username"));
                    session.setAttribute("usertype", rs.getString("usertype"));
                    session.setAttribute("userID", rs.getInt("id"));
                    session.setAttribute("isValidated", rs.getBoolean("validated"));
                    response.sendRedirect(rs.getString("usertype")+"Home.jsp");
                }
                else
                {
                    response.sendRedirect("login.jsp");
                }
                
                
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(CheckLogin.class.getName()).log(Level.SEVERE, null, ex);
            }
        }//end of big try 
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
