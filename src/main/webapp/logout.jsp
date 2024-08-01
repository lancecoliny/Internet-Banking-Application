<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logging Out</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
            text-align: center;
            width: 80%;
            max-width: 400px;
            animation: fadeIn 1.5s ease-in-out;
        }
        .header {
            font-size: 24px;
            margin-bottom: 1.5rem;
            font-weight: 300;
        }
        .message {
            margin-bottom: 1.5rem;
            font-size: 16px;
            color: #555;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 18px;
            text-decoration: none;
            background-color: #4285F4;
            color: #fff;
            border-radius: 2rem;
            transition: background-color 0.3s, transform 0.3s;
            cursor: pointer;
            margin-top: 20px;
        }
        .button:hover {
            background-color: #357ae8;
            transform: scale(1.05);
        }
        .button:active {
            transform: scale(0.98);
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
    </style>
</head>
<body>
    <div class="container">
        <div class="header">Logging Out</div>
        <div class="message">You have been logged out successfully. Redirecting to the login page...</div>
        <a href="login.jsp" class="button">Go to Login</a>
        <script>
            setTimeout(function() {
                window.location.href = 'login.jsp';
            }, 3000); // Redirects after 3 seconds
        </script>
    </div>
</body>
</html>
