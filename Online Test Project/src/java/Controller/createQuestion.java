
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



@WebServlet(name = "createQuestion", urlPatterns = {"/createQuestion"})
public class createQuestion extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            DBconnection conn = new DBconnection();
            Connection connection =null;
            Statement statement = null;
            ResultSet RS = null;
            
            
            
            String choosenTopic=request.getParameter("choosenTopic");
            
            String Question=request.getParameter("Question");
            
            String Correctanswer=request.getParameter("Correctanswer");
            String wronganswer1=request.getParameter("wronganswer1");
            String wronganswer2=request.getParameter("wronganswer2");
            String wronganswer3=request.getParameter("wronganswer3");
            
            try
            {
                connection = conn.getConnection() ;
                Statement stat = connection.createStatement();
                
                
                String sql = "Select topicID from `topics` where topicName='"+choosenTopic+"'";

                ResultSet rs = stat.executeQuery(sql);
               
                int id = 0;
                if(rs.next()){
                    id=rs.getInt("topicID");
                }
               
                sql = "INSERT INTO `questions`(`question`, `topicID`, `created_at`) VALUES ('"+Question+"',"+id+",'20191212')";
                int Rows = stat.executeUpdate(sql);
                
                //----------------answer1
                sql = "Select QID from `questions` where question='"+Question+"'";

                 rs = stat.executeQuery(sql);

                
                if(rs.next())
                {
                    id=rs.getInt("QID");
                }
               
               //----------------answer1
                sql = "INSERT INTO `answers`(`answer`, `QID`,`iscorrect`) VALUES ('"+Correctanswer+"',"+id+",'1')";
                Rows = stat.executeUpdate(sql);
                
                
                //----------------answer2
               
                sql = "INSERT INTO `answers`(`answer`, `QID`,`iscorrect`) VALUES ('"+wronganswer1+"',"+id+",'0')";
                Rows = stat.executeUpdate(sql);

                //----------------answer3
               
                sql = "INSERT INTO `answers`(`answer`, `QID`,`iscorrect`) VALUES ('"+wronganswer2+"',"+id+",'0')";
                Rows = stat.executeUpdate(sql);

                //----------------answer4
               
                sql = "INSERT INTO `answers`(`answer`, `QID`,`iscorrect`) VALUES ('"+wronganswer3+"',"+id+",'0')";
                Rows = stat.executeUpdate(sql);                
                
                
//                //---------------------------------------------
//                sql = "INSERT INTO `examsanswers`(`answerName`, `questionID`, `isCorrect`, `isChosen`) VALUES ('"+Correctanswer+"',"+id+","+1+","+0+")";
//                Rows = stat.executeUpdate(sql); 
//
//                //---------------------------------------------
//                sql = "INSERT INTO `examsanswers`(`answerName`, `questionID`, `isCorrect`, `isChosen`) VALUES ('"+wronganswer1+"',"+id+","+0+","+0+")";
//                Rows = stat.executeUpdate(sql); 
//                
//                //---------------------------------------------
//                sql = "INSERT INTO `examsanswers`(`answerName`, `questionID`, `isCorrect`, `isChosen`) VALUES ('"+wronganswer2+"',"+id+","+0+","+0+")";
//                Rows = stat.executeUpdate(sql); 
//
//                //---------------------------------------------
//                sql = "INSERT INTO `examsanswers`(`answerName`, `questionID`, `isCorrect`, `isChosen`) VALUES ('"+wronganswer3+"',"+id+","+0+","+0+")";
//                Rows = stat.executeUpdate(sql); 
                
                
                response.sendRedirect("addQuestion.jsp");
            } 
            catch (SQLException ex)
            {
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
