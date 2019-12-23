
<%@page import="java.util.Vector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="model.DBconnection"%>

<%
   
    Connection connection = null;
    DBconnection con = new DBconnection();
    connection = con.getConnection() ;
    
    Statement statement = connection.createStatement();
    String sql = "Select * from positions where 1";
    ResultSet rsPositions = statement.executeQuery(sql);
   
   
%>

<html>
    <head>
        <title>Register</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    </head>
    <body>
        <div class="d-flex align-items-center justify-content-center" style="height: 100vh">
            <div class="card login-card">
                <div class="card-header">
                    Register
                </div>
                <div class="card-body">

                    <div class="tab-content" id="myTabContent">


                        <form class="register_form" action="SubmitRegisteration" method="POST" >
                            <div class="form-group">
                                <label for="email">Email<small class="text-danger">*</small>
                                    <span class="text-warning email-exist-message d-none">Email has been used</span>
                                    <span class="text-warning email-valid-message d-none">Enter valid email</span> 
                                </label>
                                <input type="text" name="email" required class="form-control" id="email"  placeholder="Enter Email">

                            </div>
                            <div class="form-group">
                                <label for="phone">Phone</label>
                                <input type="text" name="phone" class="form-control" id="phone"  placeholder="Phone number">

                            </div>
                            <div class="form-group">
                                <label for="username">Username <small class="text-danger">*</small> 
                                    <span class="text-warning username-exist-message d-none">Username has been used</span>
                                </label>
                                <input type="text" required name="username" class="form-control" id="username"  placeholder="Enter Username">

                            </div>
                            <div class="form-group">
                                <label for="password">Password <small class="text-danger">*</small></label>
                                <input type="password" required name="password" class="form-control" id="password" placeholder="Password">
                            </div>
                            <div class="form-group">
                                <label for="positoin">Positoin <small class="text-danger">*</small></label>
                           
                                    <select class="form-control"  name="positoin" >
                                <%

                                while (rsPositions.next()) 
                                    {
                                %>
                                    <option value=<%out.print(rsPositions.getString("content")); %>>
                                        <%out.print(rsPositions.getString("content"));%>
                                    </option>
                                <%
                                    }
                                %>
                                     </select>
                            
                        
                            </div>
                            
                            <div class="form-group">
                                <label for="CV">CV <small class="text-danger">*</small></label>
                                <input type='file' required name="CV" class="form-control" id="CV" placeholder="CV">
                            </div>
                            <input type="text" name="type" class="d-none" value="candidate">

                            <button type="submit" class="btn btn-primary">Register</button>
                        </form>


                    </div>
                </div>

            </div>

        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>


        <script>
            
            $(document).ready(function () 
            {
                var submit = true;
                $("#email").keyup(function () 
                {
                    var value = $(this).val();
                    console.log(value);
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.open("GET", "ValidateRegister?email=" + value, true);
                    xmlhttp.send();
                    xmlhttp.onreadystatechange = function () 
                    {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) 
                        {
                            if (xmlhttp.responseText == "true") 
                            {
                                $(".email-exist-message").removeClass("d-none");
                                submit = false
                            } 
                            else 
                            {
                                $(".email-exist-message").addClass("d-none");
                                submit = true;
                                var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                                if (re.test(String(value).toLowerCase())) 
                                {
                                    $(".email-valid-message").addClass("d-none");
                                }
                                else 
                                {
                                    $(".email-valid-message").removeClass("d-none");
                                    submit = false
                                }
                            }
                        }//end of first if

                    }//end of onready state

                });//end of email validation
                
                
                $("#username").keyup(function () 
                {
                    var value = $(this).val();
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.open("GET", "ValidateRegister?username=" + value, true);
                    xmlhttp.send();
                    xmlhttp.onreadystatechange = function () 
                    {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) 
                        {
                            if (xmlhttp.responseText == "true") 
                            {
                                $(".username-exist-message").removeClass("d-none");
                                submit = false;
                            } 
                            else 
                            {
                                $(".username-exist-message").addClass("d-none");
                                submit = true;
                            }
                        }

                    }

                });


                $(".register_form").submit(function (e) 
                {
                    if (!submit) 
                    {
                        e.preventDefault();
                    }
                });
            });
             </script>
    </body>
</html>
