<%@page import="java.util.Vector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="model.DBconnection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.html");
    }

%>
<%    Connection connection = null;
     DBconnection con = new DBconnection();
     connection = con.getConnection() ;
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Topic</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        <link rel="stylesheet" href="./app.css">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#"><% out.print("Welcome : " + session.getAttribute("username"));%></a>


  <div class="collapse navbar-collapse " id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item active">
        <a class="nav-link" href="hrHome.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
                <a class="nav-link" href="requests.jsp">Requests</a>
                </li>
                 <li class="nav-item">
                <a class="nav-link" href="addtion.jsp">Exams</a>
                </li>
      <li class="nav-item">
        <a class="nav-link" href="logout.jsp">Logout</a>
      </li>

    </ul>
  </div>
</nav>         
        
        
                <%
                    Statement statement = connection.createStatement();                   
                    String sql2 = "Select *from exams where 1";
                    ResultSet rsExams = statement.executeQuery(sql2);

                %>

            <div class="container">           
            <form class=" container" action="createTopic" method="POST">
                <div class="form-group container">
                    <h2>Choose your topic</h2>                    
                    <%while (rsExams.next()) {%> 
                    <input type="radio" name="choosenTopic" value="<%out.print(rsExams.getString("examName")); %>"/>
                    <label class="mx-3"><%out.print(rsExams.getString("examName")+" | "); %></label>
                    <%}%>                    
                </div>                
 
                <div class="form-group container">
                    <label>Topic name</label>
                    <input type="text" name="topicname" class="form-control" id="topicname"  placeholder="Enter topic name">         
                </div>

                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
            </div>
       <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
                   
    </body>
</html>
