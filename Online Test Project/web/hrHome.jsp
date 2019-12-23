
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
    Statement statement = null;
    String sql =" ";
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

    <!-- End navar --->   
    <!----------------------------------------------------->
        
        
        
        
<!--*********************************************************************************-->
  
    

       
        
        <!----------------------------------------------------->
        <!-- Select all Of Exams Has been Taken-->
         
        <%
            sql = "select * from examssent where isexamined=1 order by examName";
            statement = connection.createStatement();
            ResultSet rsExamsSent = statement.executeQuery(sql);
        %>
       
        <!-- End Select all Of Exams Has been Taken-->
        <!----------------------------------------------------->
        
        
   <!--*********************************************************************************-->     
        
        
        <!----------------------------------------------------->
        <!--Start Examined tests And Total Scores -->
        
        <div class="row mt-5">
           
        <!----------------------------------------------------->
        <!--//start of examined tests-->  
        
            <div class="col-9">
                <div class="row ">
                    <h4 class="mx-auto">Examined tests</h4>
                    <div class=" col-11 mx-auto mt-2">
                        <ul class="list-group">
                            <li class="list-group-item bg-dark text-white">
                                <div class="row text-center">
                                    <div class="col-3">
                                        Exam Name
                                    </div>
                                    <div class="col-3">
                                        Candidate Name
                                    </div>
                                    <div class="col-3">
                                        Score
                                    </div>
                                    <div class="col-3">
                                        Status
                                    </div>
                                </div>
                            </li>
                            <%
                                Vector<Integer> candidatesID = new Vector<Integer>();
                                Vector<String> candidatesUsername = new Vector<String>();
                                while (rsExamsSent.next()) 
                                {
                                    sql = "select * from users where id=" + rsExamsSent.getInt("candidateID");
                                    statement = connection.createStatement();
                                    ResultSet rsCandidate = statement.executeQuery(sql);
                                    rsCandidate.next();

                                    if (!candidatesID.contains(rsExamsSent.getInt("candidateID"))) 
                                    {
                                        candidatesID.add(rsExamsSent.getInt("candidateID"));
                                        candidatesUsername.add(rsCandidate.getString("username"));
                                    }
                            %>
                            
                            <a href="EXRV.jsp?id=<% out.print(rsExamsSent.getInt("id")); %>&examName=<% out.print(rsExamsSent.getString("examName")); %>&username=<% out.print(rsCandidate.getString("username")); %>"
                               class='list-group-item list-group-item-action'> 
                                <div class="row text-center"> 
                                    <div class="col-3 ">
                                        <% out.print(rsExamsSent.getString("examName")); %>
                                    </div>
                                    <div class="col-3">
                                        <% out.print(rsCandidate.getString("username")); %>
                                    </div>
                                    <div class="col-3">
                                        <% out.print(rsExamsSent.getInt("score")); %>
                                    </div>
                                    <div class="col-3">
                                        <% String status = "passed";
                                            if (!rsExamsSent.getBoolean("isPassed")) 
                                            {
                                                status = "falid";
                                            }
                                            out.print(status);
                                        %>



                                    </div>

                                </div>

                            </a>
                            <%
                                }
                            %>
                        </ul>
                    </div>
                </div>
            </div>
                        
        <!--//end of examined tests-->
        <!----------------------------------------------------->                
                        
        <!----------------------------------------------------->
        <!--//start of Candidates Scores -->               
                        
            <div class="col-3">
                <h4 class="text-center">Candidates Total Score</h4>
                <div class="row">
                    <div class="col-11 mx-auto">
                        <ul class="list-group">
                            <li class="list-group-item bg-dark text-white">
                                <div class="row text-center">
                                    <div class="col-6">
                                        Candidate
                                    </div>
                                    <div class="col-6">
                                        Total score
                                    </div>
                                </div>
                            </li>
                            <%
                                for(int i=0;i<candidatesID.size();i++)
                                {
                            %>
                            <li class="list-group-item">
                                <div class="row text-center">
                                    <div class="col-6">
                                        <% out.print( candidatesUsername.elementAt(i)); %>
                                    </div>
                                    <div class="col-6">
                                        <%
                                            sql="select sum(score) from examssent where candidateID="+candidatesID.elementAt(i);
                                            statement = connection.createStatement();
                                            ResultSet rsScoreSum = statement.executeQuery(sql);
                                            rsScoreSum.next();
                                            out.print(rsScoreSum.getInt(1));
                                            
                                        %>
                                    </div>
                                </div>
                                
                            </li>
                            <%
                                }
                            %>
                        </ul>
                    </div>
                </div>
                
            </div>
        
        <!--//end of Candidates Scores  -->
        <!----------------------------------------------------->
        
        
        </div>
                        
        <!--End Of Examined tests And Total Scores-->
        <!----------------------------------------------------->
        
        
<!--*********************************************************************************-->    
       
        
        
        <!----------------------------------------------------->
        <!--Start Of Search Part-->
        
        <div class="container mt-5">
            <div class="input-group mb-3">
            <div class="input-group-prepend">
              <span class="input-group-text" id="basic-addon1" >&#128269;</span>
            </div>
            <input type="text" class="form-control" placeholder="Search" id="search">
            
            </div>
            <ul class="list-group mx-auto mb-3 search-rs" style="height: 300px; overflow-y: auto ;border: 1px solid rgba(0,0,0,0.3);border-radius: 4px ">
                
            </ul>
            
        </div>

        <!--End Of Search Part-->
        <!----------------------------------------------------->
        
        
        
        
        
        
        
        
        
        
<!--*********************************************************************************-->

        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
   
        <script>
            
        $(document).ready(function () 
        {
                
            //search
            $("#search").keyup(function()
                {
                    var searchInput=$(this).val()
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.open("GET", "search?search="+searchInput, true);
                    xmlhttp.send();
                    xmlhttp.onreadystatechange = function () 
                    {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) 
                        {
                            $(".search-rs").html(xmlhttp.responseText);  
                        }
                    }    
                });

          
            
           
        });

    </script>
    </body>
</html>
