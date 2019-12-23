
package Controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DBconnection;

@WebServlet(name = "CandidateValidation", urlPatterns = {"/CandidateValidation"})
public class CandidateValidation extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            
            DBconnection conn = new DBconnection();
            Connection Con =null;
            Statement statement = null;
            ResultSet RS = null;
            try 
            {

                Con = conn.getConnection() ;
                statement = Con.createStatement();
                //To Add Exams for This Candidate
                if (request.getParameter("candidateID") != null && 
                                request.getParameter("examID") != null) 
                {
                    int candidateID = Integer.parseInt(request.getParameter("candidateID"));
                    int examID = Integer.parseInt(request.getParameter("examID"));

                    String examName = "";
                    String sql = "Select * from exams where examID=" + examID;
                    ResultSet rs = statement.executeQuery(sql);

                    if (rs.next()) 
                    {
                        examName = rs.getString("examName");
                    }

                    statement = Con.createStatement();
                    sql = "Select * from examssent where candidateID=" + candidateID;
                    rs = statement.executeQuery(sql);
                    int pre = 0;				//prerequisites
                    if (rs.last()) 
                    {
                        pre = rs.getInt("id");
                    }

                    statement = Con.createStatement();
                    sql = "INSERT INTO examssent (candidateID,examID,examName,prerequisiteID) VALUES (" + candidateID + "," + examID + ",'" + examName + "'," + pre + ")";
                    int rs1 = statement.executeUpdate(sql);

                    statement = Con.createStatement();
                    sql = "Select * from examssent where candidateID=" + candidateID;
                    rs = statement.executeQuery(sql);
                    if (rs.last()) 
                    {
                        out.print(rs.getString("examName"));
                    }
                } 
                
                //when validate button pressed Candidate
                else if (request.getParameter("candidateID") != null) 
                {
                    // 1 - validate The Candidate
                    int candidateID = Integer.parseInt(request.getParameter("candidateID"));
                    String sql = "update users set validated = true where id=" + candidateID;
                    int rs1 = statement.executeUpdate(sql);

                    // 2 - Prepare the Exams
                       
                    //3 -  All Sent Exams
                    sql = "select * from examssent where candidateID=" + candidateID;
                    statement = Con.createStatement();
                    ResultSet rsExams = statement.executeQuery(sql);
 
                    //Looping Exam Exam   
                    while (rsExams.next()) 
                    {
                        //ExamQuestions final Questions
                        Vector<Question> ExamQuestions = new Vector<Question>();
                        
                        int examID = rsExams.getInt("examID");
                        sql = "select * from topics where examID=" + examID;
                        statement = Con.createStatement();
                        ResultSet rsTopics = statement.executeQuery(sql);
                        
                        Vector<Question> questions = new Vector<Question>();
                        //Looping Topic Topic
                        while (rsTopics.next()) 
                        {
                            //Looping Topic Topic
                            int topicID = rsTopics.getInt("topicID");
                            sql = "select * from questions where topicID=" + topicID;
                            statement = Con.createStatement();
                            ResultSet rsQuestions = statement.executeQuery(sql); 
                            
                            //take all questions from Topic Topic
                            while (rsQuestions.next()) 
                            {
                                Question question = new Question();
                                question.questionID = rsQuestions.getInt("QID");
                                question.questionName = rsQuestions.getString("question");
                                questions.add(question);
                            }
                         
                        }//Loop Topics
                        
                        if(questions.size()>5)
                        {
                            //to Choose Random Unique Questions
                            Vector<Integer> RandomNumbers = new Vector<Integer>();
                            for (int i = 0; i < 5; i++) 
                            {
                                Random rand = new Random();
                                int n = rand.nextInt(questions.size());
                                RandomNumbers.add(n);
                                for (int j = 0; j < RandomNumbers.size(); j++) 
                                {
                                    if(RandomNumbers.elementAt(j).equals(n))
                                    {
                                         n = rand.nextInt(questions.size());
                                         j=0;
                                    }
                                }
                                ExamQuestions.add(questions.elementAt(n));
                            } 
                        }
                        else
                        {    
                            for (int i = 0; i < questions.size(); i++) 
                            {
                                ExamQuestions.add(questions.elementAt(i));
                            } 
                        }
                        
                        
                        for (int i = 0; i < ExamQuestions.size(); i++)
                        {
                            //loop for vector ExamQuestions
                            // Insert Exam Qestions Qestion 
                            sql = "insert into examsquestions (questionName,questionID,examID) values ('" + ExamQuestions.elementAt(i).questionName + "'," + ExamQuestions.elementAt(i).questionID + "," + rsExams.getInt("id") + ")";
                            statement = Con.createStatement();
                            statement.executeUpdate(sql);
                        }
                    }//Loop Exams  
                }//end of else if
            }//Second big Try
            catch (Exception e) 
            {
                
            }
        }//first big try
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
