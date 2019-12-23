
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


@WebServlet(name = "deleteType", urlPatterns = {"/deleteType"})
public class deleteType extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
         
             /* TODO output your page here. You may use following sample code. */
           
             DBconnection conn = new DBconnection();
            Connection connection =null;
            Statement statement = null;
            ResultSet RS = null;
           // String examname=request.getParameter("examname");

            try
            {
                connection = conn.getConnection() ;
               
                
                    //out.print("3232");
                    int examId=Integer.parseInt(request.getParameter("DeleteExamid"));
                    
                     String sql1="DELETE FROM exams where examID="+examId ;
                     //out.print("----"+sql1);
                     statement=connection.createStatement();
                     statement.executeUpdate(sql1);
                    // out.print("----"+sql1);
                    //out.print("$$$$$$$");
                    //out.print("----"+RS);
                     response.sendRedirect("addExam.jsp");
                
                        
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
            }
            catch (SQLException ex) {
                Logger.getLogger(CheckLogin.class.getName()).log(Level.SEVERE, null, ex);
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
