
<%@page import="java.util.Vector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="model.DBconnection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("username") == null) 
    {
        response.sendRedirect("login.html");
    }
    Connection connection = null;
    DBconnection con = new DBconnection();
    connection = con.getConnection() ;
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HR Home</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        <link rel="stylesheet" href="./app.css">
    </head>
    <body>
        
    <!--*********************************************************************************--> 
    <!----------------------------------------------------->   
    <!--  navar --->   

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#"><% out.print("Welcome : " + session.getAttribute("username"));%></a>


        <div class="collapse navbar-collapse " id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                
                <li class="nav-item active">
                  <a class="nav-link" href="hrHome.jsp">Home <span class="sr-only">(current)</span></a>
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

    <!-- End navar --->   
    <!----------------------------------------------------->
        
        
        
        
<!--*********************************************************************************-->
  
        <!----------------------------------------------------->
        <!-- Start Of Not Validated Div-->
        
        <div class="row" style="margin-top: 20px">
            <h4 class="mx-auto alert alert-danger text-dark font-weight-bold">Non-Validated Candidates</h4>
            

            <div class="col-11 mx-auto" style="max-height: 70vh;overflow-y: auto">
                <%
                    Statement statement = connection.createStatement();
                    String sql = "Select * from users where usertype='candidate' and validated=0";
                    String sql2 = "Select *from exams where 1";
                    ResultSet rsUsers = statement.executeQuery(sql);

                    statement = connection.createStatement();
                    ResultSet rsExams = statement.executeQuery(sql2);

                %>
                <ul class="list-group">
                    <%    
                        while (rsUsers.next())
                        {
                            //The beforeFirst() method of the ResultSet interface moves the pointer of the current (ResultSet)
                            //object to the default position (before first), from the current position.
                            rsExams.beforeFirst();
                            out.println("<li class='list-group-item'>");
                    %>
                    <div class="row">
                        
                        <div class="col-2">
                            <a  
                               href="candidateProfile.jsp?id=<% out.print(rsUsers.getString("username")); %>">
                                <span class="badge badge-pill badge-primary p-3  font-weight-bold text-uppercase text-black-200">
                                <%
                                    String tempName=rsUsers.getString("username");
                                    out.println(tempName);
                                    session.setAttribute("tempcandidate", tempName);

                                %>
                                </span>
                            </a>
                        </div>
                        
                        <div class="col-4">
                            <div class="form-inline">
                                <select class="form-control add-exam-select-<%out.print(rsUsers.getString("id"));%>">
                                    <%while (rsExams.next()) {%>
                                    <option value=<%out.print(rsExams.getString("examID")); %>>
                                        <%out.print(rsExams.getString("examName"));%>
                                    </option>
                                    <%}%>
                                </select>
                                <button class="btn btn-success ml-1 add-exam-btn" candiID=<%out.print(rsUsers.getString("id")); %>>Add Exam</button>
                            </div>
                        </div>
                            
                        <div class="col-3 px-0">
                            <ul class="list-group taken-exams-list-<%out.print(rsUsers.getString("id"));%>" style="min-height: 50px;border:1px solid rgba(0,0,0,0.4);border-radius: 3px" candiID=<%out.print(rsUsers.getString("id"));%> >
                                <%
                                    statement = connection.createStatement();
                                    sql = "Select * from examssent where candidateID='" + rsUsers.getString("id") + "'";
                                    ResultSet rsUserExams = statement.executeQuery(sql);
                                    while (rsUserExams.next()) 
                                    {
                                %>
                                <li class="list-group-item">
                                    <% out.print(rsUserExams.getString("examName"));%>
                                </li>
                                <%
                                    }//end of while where looping for Exams
                                %>
                            </ul>
                        </div> 
                            
                        <div class="col ml-5 " id="validParent">
                            
                                 <button class="btn btn-warning validate-btn validateBTN-<%out.print(rsUsers.getString("id")); %>" candiID=<%out.print(rsUsers.getString("id")); %>>Validate</button>
                               <span class="badge badge-success d-none validateMSG-<%out.print(rsUsers.getString("id")); %>">Validated</span>
                               <button class="btn btn-outline-danger reject-btn rejectBTN-<%out.print(rsUsers.getString("id")); %>" candiID=<%out.print(rsUsers.getString("id")); %>>Reject</button>
                               <span class="badge badge-danger d-none rejectMSG-<%out.print(rsUsers.getString("id")); %>">Rejected</span>
                          
                              
                                
                        </div>
                            
                            
                        </div>
                        
                            
                    
                    </li>
                    <%
                        }//end of while where looping for users
                    %>
                </ul>
            </div>


        </div>
                
        <!-- End Of Not Validated Div-->
        <!----------------------------------------------------->

     <!--*********************************************************************************-->  
       
      
        
        
        
        
        
        
        
<!--*********************************************************************************-->

        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
   
        <script>
            
        $(document).ready(function () 
        {
                
          
            $(".validate-btn").click(function () 
            {
                var candidateID = $(this).attr("candiID");
                $(this).addClass("d-none");
                $(".rejectBTN-"+candidateID).addClass("d-none");
                $(".rejectMSG-"+candidateID).addClass("d-none");
                
                $(".validateMSG-"+candidateID).removeClass("d-none");
              
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.open("GET", "CandidateValidation?candidateID=" + candidateID + "", true);
                xmlhttp.send();
                xmlhttp.onreadystatechange = function () 
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) 
                    {

                    }

                }

            });
            
            $(".reject-btn").click(function () 
            {
                var candidateID = $(this).attr("candiID");
                $(this).addClass("d-none");
                $(".validateBTN-"+candidateID).addClass("d-none");
                $(".rejectMSG-"+candidateID).removeClass("d-none");
                $(".validateMSG-"+candidateID).addClass("d-none");
                
                
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.open("GET", "CandidateRejection?candidateID=" + candidateID + "", true);
                xmlhttp.send();
                xmlhttp.onreadystatechange = function () 
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) 
                    {
                       console.log("dsfsdfdsfsdfsd");
                    }
                    else
                    {
                        console.log("222222222222");
                    }
                }

            });
            
            
            
            
              $(".add-exam-btn").click(function () 
            {
                var candidateID = $(this).attr("candiID");
                var selectedExam = $(".add-exam-select-" + candidateID).val();
                var examName;
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.open("GET", "CandidateValidation?candidateID=" + candidateID + "&examID=" + selectedExam, true);
                xmlhttp.send();
                xmlhttp.onreadystatechange = function () 
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) 
                    {
                        $(".taken-exams-list-" + candidateID).append("<li class='list-group-item'>" + xmlhttp.responseText + "</li>")
                    }
                }
            });
        });

    </script>
    </body>
</html>
