<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Skincare Feedback</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa; /* Light grey background */
            font-family: 'Arial', sans-serif;
        }

        .container {
            margin-top: 50px;
        }

        .feedback-form {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
        }

        .feedback-form h3 {
            margin-bottom: 30px;
            font-weight: 600;
            color: #007BFF;
        }

        .feedback-form .form-group {
            position: relative;
        }

        .feedback-form .form-control {
            border-radius: 0;
            box-shadow: none;
            border-color: #ced4da;
            transition: all 0.3s ease;
        }

        .feedback-form .form-control:focus {
            border-color: #007BFF;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }

        .feedback-form .form-group i {
            position: absolute;
            right: 10px;
            top: 35px;
            color: #ced4da;
            transition: color 0.3s ease;
        }

        .feedback-form .form-control:focus + i {
            color: #007BFF;
        }

        .btn-custom {
            background-color: #007BFF;
            color: white;
            border-radius: 0;
            padding: 10px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-custom:hover {
            background-color: #0056b3;
            color: white;
            transform: scale(1.05);
        }

        .feedback-form .alert {
            border-radius: 0;
            margin-top: 20px;
        }

        .video-container {
            margin-top: 30px;
            text-align: center;
        }

        .video-container video {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="feedback-form">
                <h3 class="text-center">Skincare Feedback</h3>
                <form id="feedbackForm" method="post" action="feedbackServlet">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" required>
                        <i class="fas fa-user"></i>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                        <i class="fas fa-envelope"></i>
                    </div>
                    <div class="form-group">
                        <label for="message">Feedback</label>
                        <textarea class="form-control" id="message" name="message" rows="5" placeholder="Enter your feedback" required></textarea>
                        <i class="fas fa-comment"></i>
                    </div>
                    <button type="submit" class="btn btn-custom btn-block">Submit</button>
                </form>
                <div id="formMessage" class="mt-3"></div>
                <div>
                    <a href="index.jsp"><button class="btn btn-custom btn-block">Back to Home</button></a>
                </div>
            </div>
            <div class="video-container">
                <video controls>
                    <source src="https://videos.pexels.com/video-files/3996895/3996895-uhd_2732_1440_25fps.mp4" type="video/mp4">
                    Your browser does not support the video tag.
                </video>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
