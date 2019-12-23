

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="model.DBconnection"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
     Connection connection = null;
     DBconnection con = new DBconnection();
     connection = con.getConnection() ;

    HttpSession examSession = request.getSession();
    examSession.setMaxInactiveInterval(59);

    Statement statement = connection.createStatement();
    //id=examid
    
    String sql = "Select * from examssent where id=" + Integer.parseInt(request.getParameter("id"));
    ResultSet rsuserExam = statement.executeQuery(sql);
    rsuserExam.first();
    
    statement = connection.createStatement();
    sql = "Select * from examsquestions where examID=" + Integer.parseInt(request.getParameter("id")) + " ORDER BY RAND()";
    ResultSet rsQuestions = statement.executeQuery(sql);

    statement = connection.createStatement();
    sql = "update examssent set isexamined=1, score=0 where id=" + Integer.parseInt(request.getParameter("id"));
    statement.executeUpdate(sql);

 
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EXAM TIME</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    </head>
    <body>
        
 <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#"><% out.print("Welcome : " + session.getAttribute("username"));%></a>


  <div class="collapse navbar-collapse " id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item active">
        <a class="nav-link" href="candidateHome.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
          
        <a class="nav-link" href="logout.jsp">Logout</a>
      </li>

    </ul>
  </div>
</nav>        
       
  
        <div class="container mt-3">
            
            <h3><% out.print(rsuserExam.getString("examName")); %> Exam</h3>
            
            <p class=" display-4 alert alert-danger p-4 m-4 m-auto text-center text-dark">Exam Time: <span class="examtime alert alert-warning p-1 m-4 m-auto"><% out.print(examSession.getMaxInactiveInterval()); %></span> sec </p>
            
            <ul class="list-group ml-2 m-4">
                <%
                    int questionNumber = 1;
                    while (rsQuestions.next()) 
                    {
                        if(questionNumber<6)
                        {   
                            Statement statement222 = connection.createStatement();
                            String sql323 = "Select * from examsquestions where id="+rsQuestions.getInt("id");
                            ResultSet rsss = statement222.executeQuery(sql323);
                            int QQQID=0;
                            if (rsss.next())
                            {
                                QQQID=rsss.getInt("questionID");  
                            }
                            out.print("<h4>" + (questionNumber++) + ") " + rsQuestions.getString("questionName") + "</h4>");
                            Statement statement3333 = connection.createStatement();
                            String sqlll = "Select * from answers where QID=" + QQQID + " ORDER BY RAND()";
                            ResultSet rsAnswers = statement3333.executeQuery(sqlll);
                            while (rsAnswers.next()) 
                            {      
                %>
               
                <label class="ml-5">
                    
                    <input
                        type="radio" 
                        class="choice " 
                        name="<% out.print(rsQuestions.getInt("id")); %>"
                        answerID=<% out.print(rsAnswers.getInt("answerID")); %>
                         
                    >
                    
                    
                    <% out.print(rsAnswers.getString("answer"));%>  
                </label>

                <%
                           }
                       }
                    }

                %>
            </ul>
            <a id="submitBtn" 
               href="score.jsp?examID=<% out.print(Integer.parseInt(request.getParameter("id")));%>" 
               class="btn btn-primary d-inline-block  ml-5  my-4 ">
                Submit</a>
               
               
        </div>


      
                
        </div>  
        
        
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

        <script>
            $(document).ready(function () 
            {

                $(".choice").change(function () 
                {
                    var answerID = parseInt($(this).attr("answerID"));
                    var questionID = parseInt($(this).attr("name"));
                    var examID =<% out.print(Integer.parseInt(request.getParameter("id")));%>
                    console.log(answerID+" -  "+questionID);
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.open("GET", "ExamSubmission?answerID=" + answerID + "&questionID=" + questionID + "&examID=" + examID, true);
                    xmlhttp.send();
                    xmlhttp.onreadystatechange = function () 
                    {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200); 
                        {

                        }

                    };
                });

                var i = (<% out.print(examSession.getMaxInactiveInterval());%>);
                setInterval(function () 
                {
                    $(".examtime").html(--i);
                   if (i === 0) 
                    {
                        document.getElementById("submitBtn").click();
                    }
                }, 60 * 20);

            });
        </script>
    </body>
</html>

