

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    </head>
    <body>

        <div class="d-flex align-items-center justify-content-center" style="height: 100vh">
            <div class="card login-card">
                <div class="card-header">
                    Login as
                </div>
                <div class="card-body">
                    <ul class="nav nav-tabs" id="myTab">
                        <li class="nav-item">
                            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#login-candi" role="tab"  aria-selected="true">Candidate</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#login-hr" role="tab"  aria-selected="false">HR</a>
                        </li>

                    </ul>
                    <div class="tab-content" id="myTabContent">
                      
                        <div class="tab-pane fade show active" id="login-candi" role="tabpanel" aria-labelledby="home-tab">
                            <form class="login_form" action="CheckLogin" method="POST">
                                <div class="form-group">
                                    <label for="Candi-username">Candidate Username</label>
                                    <input type="text" name="username" class="form-control" id="Candi-username"  placeholder="Enter Username">
                                </div>
                                <div class="form-group">
                                    <label for="Candi-password">Password</label>
                                    <input type="password" name="password" class="form-control" id="Candi-password" placeholder="Password">
                                </div>
                                <input type="text" name="type" class="d-none" value="candidate">

                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                        
                        <div class="tab-pane fade" id="login-hr" role="tabpanel" aria-labelledby="profile-tab">
                            <form class="login_form" action="CheckLogin" method="POST">
                                <div class="form-group">
                                    <label for="HR-username">HR Username</label>
                                    <input type="text" name="username" class="form-control" id="HR-username"  placeholder="Enter Username">
                                </div>
                                <div class="form-group">
                                    <label for="HR-password">Password</label>
                                    <input type="password" name="password" class="form-control" id="HR-password" placeholder="Password">
                                </div>
                                <!--class d-done is equal type hidden to hide input-->
                                <input type="text" name="type" class="d-none" value="hr">

                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>

                    </div>
                </div>
                <div class="card-footer">
                    <small class="text-muted">Don't have an account? <a href="register.jsp">Register</a></small>
                </div>
            </div>

        </div>



        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
    </body>
</html>
