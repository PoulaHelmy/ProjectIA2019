
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

@WebServlet(name = "createTopic", urlPatterns = {"/createTopic"})
public class createTopic extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            DBconnection conn = new DBconnection();
            Connection connection =null;
            Statement statement = null;
            ResultSet RS = null;
            
            
            
            String choosenTopic=request.getParameter("choosenTopic");
            String topicname=request.getParameter("topicname");
            try
            {
                connection = conn.getConnection() ;
                Statement stat = connection.createStatement();
                
                
                String sql = "Select examID from `exams` where examName='"+choosenTopic+"'";

                ResultSet rs = stat.executeQuery(sql);

                int id = 0;
                if(rs.next()){
                    id=rs.getInt("examID");
                }
                
                 sql = "Select * from `topics` where topicName='"+topicname+"'";

                 rs = stat.executeQuery(sql);
                if(rs.next()){
                    response.sendRedirect("addTopic.jsp");
                }
                else{
                sql = "INSERT INTO `topics`(`topicName`, `examID`) VALUES ('"+topicname+"',"+id+")";
                int Rows = stat.executeUpdate(sql);
                
                response.sendRedirect("addTopic.jsp");
                }

                
                
            } catch (SQLException ex) {
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
