<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Example.models.CustomerProfile" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Profile</title>
    <style>
        /* Your existing CSS styles */
        /* Resetting default margin and padding */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        /* Full-page background image */
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://images.pexels.com/photos/696644/pexels-photo-696644.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #333;
            overflow: hidden; /* Prevent scrolling */
        }
        /* Container for content */
        .container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 600px;
            overflow: auto; /* Enable scrolling if content exceeds container height */
        }
        /* Heading style */
        h1 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }
        /* Button styles */
        .buttons {
            text-align: center;
            margin-bottom: 20px;
        }
        .buttons a, .button {
            text-decoration: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            margin: 0 10px;
            transition: background-color 0.3s, transform 0.3s;
            display: inline-block;
        }
        .button {
            background-color: #007bff;
            color: #fff;
            border: none;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .button:active {
            background-color: #003f7f;
            transform: scale(0.98);
        }
        /* Profile details */
        .profile-details {
            margin-top: 20px;
            animation: fadeInUp 0.5s ease; /* Adding animation */
        }
        .profile-details p {
            background-color: #e0e0e0;
            padding: 10px;
            border-radius: 5px;
            margin: 5px 0;
        }
        .profile-details hr {
            border: 0;
            height: 1px;
            background-color: #ccc;
        }
        /* Keyframe animation for fadeInUp */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
    
</head>
<body>
    <div class="container">
        <h1>Profile</h1>
        <div class="buttons">
            <form action="profile" method="get" style="display: inline;">
                <input type="submit" class="button" value="Load Profile" />
            </form>
            <a href="changePassword.jsp" class="button">Change Password</a>
        </div>
        <div class="profile-details">
            <%
                List<CustomerProfile> profileDetails = (List<CustomerProfile>) request.getAttribute("profileDetails");
                if (profileDetails == null || profileDetails.isEmpty()) {
                    out.println("<p>No profile details found.</p>");
                } else {
                    for (CustomerProfile profile : profileDetails) {
            %>
                        <p>cid : <%=profile.getCid() %></p>
                        <p>Name: <%= profile.getName() %></p>
                        <p>UserID: <%= profile.getCustomerId() %></p>
                        <p>Email: <%= profile.getEmail() %></p>
                        <p>Phone Number: <%= profile.getPhoneNumber() %></p>
                        <hr>
            <%
                    }
                }
            %>
        </div>
        <div>
            
            <a href="confirmlogout.html" class="button">logout</a>
            <a href="index.jsp" class="button">Back to Home</a>
        </div>
    </div>
</body>
</html>
