
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="model.DBconnection"%>

<%
    if (session.getAttribute("username") == null) 
    {
        response.sendRedirect("login.html");
    }

 
    Connection connection = null;
     DBconnection con = new DBconnection();
    connection = con.getConnection() ;

   int examID = Integer.parseInt(request.getParameter("id"));
    String examName = request.getParameter("examName");
   String CandidateUsername = request.getParameter("username");

    Statement statement = connection.createStatement();
    String sql = "Select * from examsquestions where examID=" + examID;
    ResultSet rsQuestions = statement.executeQuery(sql);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Exam review</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    </head>
    <body>
    
    
    
    
    
        <div class="container">
            <h4 class="mt-2">
                <% out.print(CandidateUsername);%>'s exam: <% out.print(examName);%>  </h4>

            <ul class="list-group ml-2">
                <%
                    int questionNumber = 1;
                    while (rsQuestions.next())
                    {
                        out.print("<h4>" + (questionNumber++) + ") " + rsQuestions.getString("questionName") + "</h4>");
                        statement = connection.createStatement();
                        sql = "Select * from examsanswers where questionID=" + rsQuestions.getInt("id") + " ORDER BY Rand()";
                        ResultSet rsAnswers = statement.executeQuery(sql);
                        while (rsAnswers.next()) 
                        {
                            String answerColor = "";
                            if (rsAnswers.getBoolean("isChosen")) 
                            {
                                if (rsAnswers.getBoolean("isCorrect")) 
                                    {
                                        answerColor = "text-success font-weight-bold";
                                    } 
                                else 
                                    {
                                        answerColor = "text-danger font-weight-bold";
                                    }
                            }
                %>
                <label class="ml-5 <% out.print(answerColor); %>"><% out.print(rsAnswers.getString("answerName"));%>  </label>

                <%
                        }
                    }

                %>
            </ul>

        </div>

     
    
    
    
    
    
    
   
        
        
        
        
        
        
        
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

    </body>
</html>
