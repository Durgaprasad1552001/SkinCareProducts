<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Change Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }
        .button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            margin: 0 10px;
            transition: background-color 0.3s, transform 0.3s;
            display: inline-block;
            text-decoration: none;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .button:active {
            background-color: #003f7f;
            transform: scale(0.98);
        }
        .container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #007bff;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input[type="text"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-group input[type="submit"] {
            display: block;
            width: 100%;
            padding: 10px;
            font-size: 16px;
            cursor: pointer;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
        }
        .form-group input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }
        .result-message {
            color: green;
            font-size: 16px;
            margin-top: 10px;
            text-align: center;
        }
    </style>
    <script>
        function validateForm() {
            var customerId = document.forms["changePasswordForm"]["customerId"].value;
            var previousPassword = document.forms["changePasswordForm"]["previousPassword"].value;
            var newPassword = document.forms["changePasswordForm"]["newPassword"].value;
            var errorMessage = document.getElementById("errorMessage");

            if (customerId === "" || previousPassword === "" || newPassword === "") {
                errorMessage.textContent = "All fields must be filled out";
                return false;
            }

            if (previousPassword === newPassword) {
                errorMessage.textContent = "New password cannot be the same as the previous password";
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Change Password</h1>
        <form name="changePasswordForm" action="changePassword" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="customerId">Customer UserID:</label>
                <input type="text" id="customerId" name="customerId" placeholder="Enter Customer UserID" required>
            </div>
            <div class="form-group">
                <label for="previousPassword">Previous Password:</label>
                <input type="password" id="previousPassword" name="previousPassword" placeholder="Enter Previous Password" required>
            </div>
            <div class="form-group">
                <label for="newPassword">New Password:</label>
                <input type="password" id="newPassword" name="newPassword" placeholder="Enter New Password" required>
            </div>
            <input type="submit" value="Change Password">
        </form>
        <div id="errorMessage" class="error-message"></div>
        <div class="result-message">
            <% 
                String passwordChangeResult = (String) session.getAttribute("PasswordChange");
                if (passwordChangeResult != null && !passwordChangeResult.isEmpty()) {
                    out.println(passwordChangeResult);
                    session.removeAttribute("PasswordChange"); // Remove the session attribute
                }
            %>
        </div>
            <a href="profile.jsp" class="button">Back to Profile</a>
        
    </div>
</body>
</html>
