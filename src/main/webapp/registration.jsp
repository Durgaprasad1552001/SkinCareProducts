<!DOCTYPE html>
<html>
<head>
    <title>Product Store</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function() {
            // Function to trim inputs
            function trimInputs() {
                $('input').each(function() {
                    $(this).val($.trim($(this).val()));
                });
            }

            // Check username availability
            $("#username").blur(function(event) {
                var name = $.trim($("#username").val());
                if (name) {
                    $.get('checkUsername', { username: name }, function(info) {
                        $("#ajaxinfo").text(info);
                        if (info === "Not available") {
                            $("#username").val('');
                            $("#username").css("border", "2px solid red");
                            if ($("#usernameError").length == 0) {
                                $("#username").after('<div class="text-danger" id="usernameError">Username not available</div>');
                            }
                        } else {
                            $("#username").css("border", "");
                            $("#usernameError").remove();
                        }
                    });
                }
            });

            // Form submission
            $("form[name='registration']").submit(function(event) {
                trimInputs();
                var isValid = true;

                // Validate inputs
                $('input').each(function() {
                    if (!$(this).val()) {
                        isValid = false;
                        $(this).css("border", "2px solid red");
                    } else {
                        $(this).css("border", "");
                    }
                });

                if (!isValid) {
                    event.preventDefault();
                    alert("Please fill all fields.");
                }
            });
        });
    </script>
    <style>
        body {
            background-color: #f8f9fa;
        }
        #name, #pw, #pw2, #mail, #number, #username {
            margin: 15px 0;
        }
        .navbar {
            background-color: #343a40;
        }
        h1 {
            text-align: center;
            color: white;
            background-color: black;
            padding: 20px;
            margin-bottom: 30px;
        }
        .container-fluid {
            padding: 20px;
        }
        pre {
            padding: 20px;
            background-color: #f8d7da;
            color: #721c24;
        }
        .form-group {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
        }
        .form-control {
            transition: border-color 0.3s ease-in-out;
        }
        .btn-success {
            width: 100%;
            padding: 10px;
            transition: background-color 0.3s ease-in-out;
        }
        .btn-success:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <h1>Welcome To Product Store</h1>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-8"></div>
            <div class="col-md-4 bg-dark">
                <nav class="navbar navbar-expand-md">
                    <ul class="navbar-nav">
                        <li class="nav-item"><a href="login.jsp" class="nav-link">LOGIN</a></li>
                        <li class="nav-item"><a href="AdminLogin.jsp" class="nav-link"> ADMIN </a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <h3 style="text-align:center"><b>Registration Form</b></h3>
                <div class="form-group">
                    <form name="registration" method="post" action="register">
                        <div>
                            <input type="text" name="Full Name" class="form-control" id="name" placeholder="Full Name">
                        </div>
                        <div>
                            <input type="text" name="User-id" class="form-control" id="username" placeholder="User-id">
                            <span id="ajaxinfo"></span>
                        </div>
                         <div>
                            <input type="text" name="gmail" class="form-control" id="gmail" placeholder="Gmail">
                        </div>
                        <br>
                         <div>
                            <input type="text" name="phoneno" class="form-control" id="phoneno" placeholder="Phone-Number">
                        </div>
                        <div>
                            <input type="password" name="PassWord" class="form-control" id="pw" placeholder="Password">
                        </div>
                        <div>
                            <input type="password" name="PassWords" class="form-control" id="pw" placeholder="Confirm Password">
                        </div>
                        <div>
                            <input type="submit" name="btn" class="btn btn-success" value="Register">
                        </div>
                    </form>
                    <form name="login" method="post" action="login.jsp">
                        <div class="form-group">
                            <input type="submit" name="btn" class="btn btn-primary" value="Login">
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
</body>
</html>
