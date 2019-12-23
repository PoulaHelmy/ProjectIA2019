<%@page import="java.util.Vector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="model.DBconnection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.html");
    }

%>
<%
    
    
    
     Connection connection = null;
     DBconnection con = new DBconnection();
     connection = con.getConnection() ;
     
     Statement statement = connection.createStatement();
    //id=examid
    
    String sql = "Select * from exams where 1";
    ResultSet rsTypes = statement.executeQuery(sql);
    
    
     
     
     
     
     
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Exam</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
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
  
  
        <div >
            <form class=" container m-4 p-4 m-auto" action="createExam" method="POST">
                <div class="form-group container">
                    <label>Exam name</label>
                    <input type="text" name="examname" class="form-control" id="examname"  placeholder="Enter Exam Type">
                    
                </div>

                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>  
        
  
       
        <div  class=" container m-4  m-auto">
      
        <table class="table table-hover table-dark">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Exam Type</th>
            <th scope="col">Update</th>
            <th scope="col">Delete</th>
          </tr>
        </thead>
        <tbody>
             <%
                    int x=1;
                    while (rsTypes.next()) 
                    {
                        int typeId= rsTypes.getInt("examID");
                        String typeContent = rsTypes.getString("examName");
                        %>
               <tr>
            <th scope="row"><%out.print(x++);%></th>
            <td> <%out.print(typeContent);%></td>
            <td>
                
<!--                <a
                    href="updateExam?updateExamid=<%out.print(typeId);%>"
                   class="btn btn-info d-inline-block  ml-5  my-4 " >
                    Update
                </a>-->
             <!-- Button trigger modal -->
            <button type="button" 
                    class="btn btn-primary uupdate-type btnupdate-<%out.print(typeId);%>" 
                    data-toggle="modal" data-target="#exampleModal"
                    TypeIDe="<%out.print(typeId);%>"
                    TypeContentt="<%out.print(typeContent);%>">
              Update
            </button>

            
            </td>
            <td> 
                <a
                    href="deleteType?DeleteExamid=<%out.print(typeId);%>"
                   class="btn btn-danger d-inline-block  ml-5  my-4 " >
                    Delete
                </a>
            </td>
            </tr>         
             <%           
                        
                    }
         %>
          
        
                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Update Exam Type</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                         <form class=" container  m-auto" action="updateExam" method="Get">
                            <div class="form-group container">
                                <label >Enter New Value</label>
                                <input type="text" name="examnameee" class="form-control" id="examt"  placeholder="Enter Exam Type">
                            </div>
                                <input type="hidden" name="examiiid" id="examtid" >

                            <button type="submit" class="btn btn-primary">Submit</button>

                        </form>

                          
                          
                          
                      </div>
                     
                    </div>
                  </div>
                </div>
                
                
        </tbody>
      </table>



      </div>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
        
        
        
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
        
    </body>
   
    <script>
            $(document).ready(function () 
            {

                $(".uupdate-type").click(function () 
                {
                    examt
                    var typeID = parseInt($(this).attr("TypeIDe"));
                    var typeContent = $(this).attr("TypeContentt");
                    $("#examt").val(typeContent);
                    $("#examtid").val(typeID);
 
                });

                

            });
        </script>
    
    
    
    
</html>
