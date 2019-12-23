
package Controller;
import model.DBconnection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "ExamSubmission", urlPatterns = {"/ExamSubmission"})
public class ExamSubmission extends HttpServlet 
{

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            Connection connection = null;
            DBconnection con = new DBconnection();
               
            try
            {
                connection = con.getConnection() ;
                Statement statement=connection.createStatement();
                
                if(request.getParameter("answerID")!=null && request.getParameter("questionID")!=null)
                {
                     out.print("ssssssss  ");

                    int QID=Integer.parseInt(request.getParameter("questionID"));
                    int AID=Integer.parseInt(request.getParameter("answerID"));
                   // out.print("----"+QID+"---"+AID);
                     String ansName="";
                     String sql1="select * from answers where answerID="+AID ;
                     statement=connection.createStatement();
                     ResultSet rsAnswer=statement.executeQuery(sql1);
                     Boolean isCorrect=false;
                      while(rsAnswer.next())
                        {
                            ansName=rsAnswer.getString("answer");
                            isCorrect=rsAnswer.getBoolean("iscorrect");
                        }
                      out.print("  ^^^ ");
                      
                    //to prevent an insert a duplicate of records for the same question
                     statement=connection.createStatement();
                     String sq="select * from examsanswers where questionID="+QID ;
                     ResultSet rsss=statement.executeQuery(sq);
                     if(rsss.next())
                        {
                           // out.print("----"+ansName+"---"+isCorrect);
                            statement = connection.createStatement();
                            String sql3="update examsanswers set isCorrect="+isCorrect;
                            statement.executeUpdate(sql3);
                            out.print("$$$");
                        }
                      //out.print("----"+ansName+"---"+isCorrect);
                   
                    else
                    {  
                    // out.print("@@@@@"+ansName+"@@@@"+isCorrect);
                     statement = connection.createStatement();
                     String sql3="INSERT INTO `examsanswers`(`answerName`, `questionID`, `isCorrect`, `isChosen`) VALUES ('"+ ansName + "'," + QID + "," + isCorrect + "," + 1 + ") ";
                     int rs1 = statement.executeUpdate(sql3);
                     out.print("##");
                    }
                    
                    int examID= Integer.parseInt(request.getParameter("examID"));
                    int score=0;
                    float total=0;
                    //out.print("----"+examID+"---"+score+"---total--=="+total);
                    String sql="select * from examsquestions where examID="+examID;
                    statement=connection.createStatement();
                    ResultSet rsQuestions=statement.executeQuery(sql);
                    rsQuestions.last();
                    total=rsQuestions.getRow();
                  //  out.print("----%%%%%"+total);
                    rsQuestions.beforeFirst();
                    while(rsQuestions.next())
                    {
                        sql="select * from examsanswers where questionID="+rsQuestions.getInt("id")+" and isChosen=1 and isCorrect=1";
                        statement=connection.createStatement();
                        ResultSet rsAnswers=statement.executeQuery(sql);
                        rsAnswers.last();
                       // out.print("----"+rsAnswers.getRow());
                        score+=rsAnswers.getRow();
                       // out.print("----SSCCCC   "+score+" ** ");
                    }
                    boolean succeed=false;
                    if( (score/total)>=0.5)
                        succeed=true;
                    sql="update examssent set score="+score+" , isPassed="+succeed+" where id="+examID ;
                    statement=connection.createStatement();
                    statement.executeUpdate(sql);
                   
                }
                
                
                
                
                
            }
            catch(Exception e)
            {
                
                System.out.println(e);
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
