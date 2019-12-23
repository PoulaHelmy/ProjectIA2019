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


@WebServlet(name = "ValidateRegister", urlPatterns = {"/ValidateRegister"})
public class ValidateRegister extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            DBconnection conn = new DBconnection();
            Connection Con = null;
            ResultSet RS = null;
            try 
            {
                Con = conn.getConnection() ;
                Statement statement = Con.createStatement();
                if (request.getParameter("email") != null) 
                {
                    String sql = "Select * from users where email='" + request.getParameter("email") + "'";
                    ResultSet rs = statement.executeQuery(sql);
                    boolean exist = false;
                    if (rs.next())
                    {
                        exist = true;
                    }
                    out.print(exist);
                } 
                else if (request.getParameter("username") != null) 
                {
                    String sql = "Select * from users where username='" + request.getParameter("username") + "'";
                    ResultSet rs = statement.executeQuery(sql);
                    boolean exist = false;
                    if (rs.next()) 
                    {
                        exist = true;
                    }
                    out.print(exist);
                }

            }
            catch (Exception e) 
            {
                
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
