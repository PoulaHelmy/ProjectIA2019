
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
     
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Candidate Home</title>
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
                // if user request is binding yet
            if (Boolean.parseBoolean(session.getAttribute("isValidated").toString()) == false) 
                {
                    %>
                    <div class="container m-4 p-4 text-center m-auto">
                            <div class="alert alert-danger text-dark font-weight-bold" role="alert">
                                You are not validated yet
                            </div>
                            <div class="alert alert-warning col-4 m-auto text-dark " role="alert">
                                your request will be responded soon
                            </div>
                    </div>
                    <%
                }
            
            else
            {
                // Then This User Id Validated
        
            Statement statement = connection.createStatement();
            String sql = "Select * from examssent where candidateID=" + session.getAttribute("userID");
            ResultSet rsuserExams = statement.executeQuery(sql);
        %>
        
        <div class="container mt-2 ">
            <div class="card mx-auto">
                <div class="card-header bg-dark text-white">
                    Your Exams 
                </div>
                
                <div class="card-body">

                    <ul class="list-group">

                        <%
                        while (rsuserExams.next()) 
                            {
                                String badgeContent = "";
                                String badgeColor = "";
                                String status = "";

                                if (rsuserExams.getBoolean("isexamined") == true) 
                                    {
                                        if (rsuserExams.getBoolean("isPassed")) 
                                            {
                                                badgeContent = "passed";
                                                badgeColor = "success";
                                                status = "style='pointer-events: none;cursor: no-drop;color:gray'";
                                            } 
                                        else 
                                            {
                                                badgeContent = "failed";
                                                badgeColor = "danger";
                                                status = "style='pointer-events: none;cursor: no-drop;color:gray'";
                                            }
                                    } 
                                else 
                                    {
                                        if (rsuserExams.getInt("prerequisiteID") != 0) 
                                            {
                                                statement = connection.createStatement();
                                                sql = "Select * from examssent where id=" + rsuserExams.getInt("prerequisiteID");
                                                ResultSet rsPrequisite = statement.executeQuery(sql);
                                                if (rsPrequisite.next()) 
                                                    {
                                                        if (rsPrequisite.getBoolean("isPassed")) 
                                                            {
                                                                badgeContent = "available";
                                                                badgeColor = "primary";
                                                            } 
                                                        else 
                                                            {
                                                                badgeContent = "closed";
                                                                badgeColor = "secondary";
                                                                status = "style='pointer-events: none;cursor: no-drop;color:gray'";
                                                            }
                                                    }
                                            } 
                                        else 
                                            {
                                                badgeContent = "available";
                                                badgeColor = "primary";
                                            }
                                    }
                        %>

                        <a 
                            href="exam.jsp?id=<%out.print(rsuserExams.getInt("id"));%>" 
                            class="d-flex list-group-item justify-content-between list-group-item-action "
                            <%out.print(status);%>
                        ><!--end of a start tag--->
                            
                            
                            <!--tag body --->
                            
                            <%
                            out.print(rsuserExams.getString("examName")); 
                            %>
                            
                            <span class="badge badge-<%out.print(badgeColor);%> badge-pill">
                                <%
                                    out.print(badgeContent);
                                %>
                            </span>
                            
                            <!--end of tag body --->
                       
                        
                        </a><!--end of tag a  --->

                        <%
                            }//end of While
                        %>
                        
                    </ul>
                </div>
            </div>
        </div>

        <%
            }//end of big else that check is user is validatet or not
        %>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

    </body>
</html>
