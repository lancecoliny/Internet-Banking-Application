<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Deposit Successful</title>
<!-- Include Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS for additional styling -->
<style>
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        background: linear-gradient(90deg, #4285F4, #EA4335, #FBBC05, #34A853);
        background-size: 400% 400%;
        animation: gradientBG 15s ease infinite;
        font-family: 'Roboto', sans-serif;
    }
    .container {
        background-color: rgba(255, 255, 255, 0.9);
        padding: 2rem;
        border-radius: 1rem;
        box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
        animation: fadeIn 1.5s ease-in-out;
        width: 100%;
        max-width: 400px;
        text-align: center;
    }
    .container h2 {
        margin-bottom: 1.5rem;
        font-weight: 300;
        color: #333;
    }
    .message {
        font-size: 18px;
        margin-bottom: 20px;
        color: #4CAF50;
    }
    .btn-custom, .btn-secondary {
        display: inline-block;
        margin: 10px 5px;
        padding: 10px 20px;
        color: white;
        text-decoration: none;
        border-radius: 2rem;
        transition: background-color 0.3s;
        cursor: pointer;
        width: 100%;
        box-sizing: border-box;
    }
    .btn-custom {
        background-color: #4CAF50;
    }
    .btn-custom:hover {
        background-color: #45a049;
    }
    .btn-secondary {
        background-color: #5bc0de;
    }
    .btn-secondary:hover {
        background-color: #31b0d5;
    }
    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(-20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
    @keyframes gradientBG {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }
    .fa {
        margin-right: 8px;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Deposit Successful</h2>
        <p class="message">The deposit has been processed successfully. Thank you!</p>
        <a href="customerDashboard.jsp" class="btn btn-custom"><i class="fa fa-home"></i> Back to Dashboard</a>
    </div>

    <!-- Include Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
