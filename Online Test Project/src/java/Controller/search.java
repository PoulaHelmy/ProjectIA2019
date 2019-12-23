
package Controller;


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
import model.DBconnection;

@WebServlet(name = "search", urlPatterns = {"/search"})
public class search extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Connection connection=null;
            DBconnection con = new DBconnection();
           
            try {

                connection = con.getConnection() ;
                Statement statement = connection.createStatement();
                String sql = "";
                String searchResults = "";
                if (request.getParameter("search") != null && request.getParameter("search").compareTo("") != 0) 
                {
                    String input = request.getParameter("search");
                    sql = "select * from users where (email like '%" + input + "%' or username like '%" + input + "%') and usertype='candidate'  ";
                    statement = connection.createStatement();
                    ResultSet rsCandidates = statement.executeQuery(sql);
                    while (rsCandidates.next()) {
                        String row = "<li class='list-group-item'>"
                                + "<div class='row'>"
                                + "<div class='col-6'>Candidate: " + rsCandidates.getString("username") + "</div>"
                                + "<div class='col-6'> Email: " + rsCandidates.getString("email") + "</div>"
                                + "</div>"
                                + "</li>";
                        searchResults += row;

                    }

                    sql = "select * from examssent where examName like '%" + input + "%'";
                    statement = connection.createStatement();
                    ResultSet rsExams = statement.executeQuery(sql);
                    while (rsExams.next()) {
                        sql = "select * from users where id=" + rsExams.getInt("candidateID");
                        statement = connection.createStatement();
                        ResultSet rsCandidate = statement.executeQuery(sql);
                        String candidateName = "";
                        if (rsCandidate.next()) {
                            candidateName = rsCandidate.getString("username");
                        }
                        String row = "<li class='list-group-item'>"
                                + "<div class='row'>"
                                + "<div class='col-3'>Exam: " + rsExams.getString("examName") + "</div>"
                                + "<div class='col-3'> Candidate: " + candidateName + "</div>"
                                + "<div class='col-3'>Status: " + (rsExams.getBoolean("isexamined") ? (rsExams.getBoolean("isPassed") ? "Passed" : "Failed") : "Not tested yet") + "</div>"
                                + "<div class='col-3'>Score: " + rsExams.getInt("score") + "</div>"
                                + "</div>"
                                + "</li>";
                        searchResults += row;

                    }
                    out.print(searchResults);
                }

            } catch (Exception e) {

                System.out.println(e);
            }
        } catch (Exception e) {

            System.out.println(e);
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
