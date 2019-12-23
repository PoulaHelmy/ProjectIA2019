

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="model.DBconnection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
     Connection connection = null;
     DBconnection con = new DBconnection();
     connection = con.getConnection() ;

    int examID = Integer.parseInt(request.getParameter("examID"));
    Statement statement = connection.createStatement();
    String sql = "Select * from examssent where id=" + examID;
    ResultSet rsuserExam = statement.executeQuery(sql);
    rsuserExam.next();
    String examName = rsuserExam.getString("examName");
    int score = rsuserExam.getInt("score");

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Score</title>
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
  
        <div class="container" style="height: 100vh">
            <div class="d-flex justify-content-center mt-5">
                <div class="card">
                    <div class="card-body">
                        <h4>Great job <%out.print(session.getAttribute("username")); %></h4>
                        <h3>Your score in the <%out.print(examName); %> exam is </h3>
                        <h2 class="text-success text-center"><%out.print(score);%></h2>
                    </div>
                    <div class="card-footer">
                        <a href="candidateHome.jsp" class="card-link">Back</a>
                    </div>
                </div>
            </div>

        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

    </body>
</html>
