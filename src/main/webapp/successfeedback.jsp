<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Success</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #e8f5e9; /* Light green background */
            font-family: 'Arial', sans-serif;
        }

        .container {
            margin-top: 100px;
        }

        .success-message {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .success-message h3 {
            margin-bottom: 20px;
            font-weight: 600;
            color: #28a745;
        }

        .success-message p {
            margin-bottom: 20px;
            color: #555;
        }

        .success-message .btn-custom {
            background-color: #007BFF;
            color: white;
            border-radius: 0;
            padding: 10px 20px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .success-message .btn-custom:hover {
            background-color: #0056b3;
            color: white;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="success-message">
                <h3>Thank You for Your Feedback!</h3>
                <p>Your feedback on our skincare product has been successfully submitted.</p>
                <a href="index.jsp" class="btn btn-custom">Back to Home</a>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
