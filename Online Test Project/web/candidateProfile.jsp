<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="model.DBconnection"%>

<%   
     Connection connection = null;
     DBconnection con = new DBconnection();
     connection = con.getConnection() ;
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

    </head>
    <body>
        
        
    <!--navar-->   
    
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
        <%
        
        //response.sendRedirect(rs.getString("usertype")+"Home.jsp");
       //out.print(session.getAttribute("tempcandidate"));
                   String name=request.getParameter("id").toString();
                  // out.print(name);
                    String email="",phone="",CV="",date="",position="";
                   Statement statement = connection.createStatement();
                   String sql = "Select * from users where usertype='candidate' and username = '" + name + "' ";
                  
                   
                    ResultSet rsUser = statement.executeQuery(sql);
                  
                   while (rsUser.next())
                       {
                          // out.print(name);
                           
                          email=rsUser.getString("email");
                          // out.print(email);
                           phone=rsUser.getString("phone");
                           //out.print(phone);
                         position=rsUser.getString("position");
                          
                      }
                   
                   String sql2 = "Select * from cv where candidateUsername = '" +name+ "' ";
                   statement = connection.createStatement();
                  ResultSet rscv = statement.executeQuery(sql2);
                    while (rscv.next())
                        {
                           CV=rscv.getString("CVtitle");
                        }
    
        
    
        
        %>
        
        
        <!--Candidate Table Data-->
        <div class="container m-4 p-4 m-auto">
            <table class="table table-hover table-dark">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Attribute</th>
                    <th scope="col">Value</th>
                   
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">1</th>
                    <td>Candidate Name</td>
                    <td><%out.print(name);%></td>
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td>Candidate Email</td>
                    <td><%out.print(email);%></td>
                  </tr>
                  <tr>
                    <th scope="row">3</th>
                    <td >Candidate Phone</td>
                    <td><%out.print(phone);%></td>
                  </tr>
                  <tr>
                    <th scope="row">4</th>    
                    <td >Candidate Position</td>
                    <td><%out.print(position);%></td>
                  </tr>
                  <tr>
                    <th scope="row">4</th>    
                    <td >Candidate Cv</td>
                    <td><a href="#"><%out.print(CV);%></a></td>
                  </tr>
                  
                </tbody>
        </table>

            
        </div>
        
        
        
        
        
        
        
        
        
        
        
        
        
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

        
        
    </body>
</html>
