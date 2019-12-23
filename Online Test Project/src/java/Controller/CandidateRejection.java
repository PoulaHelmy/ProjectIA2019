
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
import model.DBconnection;


@WebServlet(name = "CandidateRejection", urlPatterns = {"/CandidateRejection"})
public class CandidateRejection extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            DBconnection conn = new DBconnection();
            Connection Con =null;
            Statement statement = null;
            ResultSet RS = null;
            Con = conn.getConnection() ;
            statement = Con.createStatement();
            out.print("dsffdsfdsfd");
                
            if (request.getParameter("candidateID") != null) 
                {
                                out.print("222222");

                  //DELETE FROM `users` WHERE 0  
                               out.print(request.getParameter("candidateID"));

                    String sql = "DELETE FROM `users` WHERE id=" + request.getParameter("candidateID");
                    int rs = statement.executeUpdate(sql);
                    
                     String sql2 = "DELETE * FROM `examssent` WHERE candidateID=" + request.getParameter("candidateID");
                    int rs2 = statement.executeUpdate(sql2);
                    
                    
                   // response.sendRedirect("requests.jsp");
                     out.print("------");
                }
            
            
            
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CandidateRejection.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CandidateRejection.class.getName()).log(Level.SEVERE, null, ex);
        }
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
