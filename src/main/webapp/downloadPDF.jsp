<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Download Transactions as PDF</title>
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
        max-width: 500px;
        text-align: center;
    }
    .container h2 {
        margin-bottom: 1.5rem;
        font-weight: 300;
        color: #333;
    }
    .btn-custom {
        display: inline-block;
        margin: 10px 0;
        padding: 10px 20px;
        font-size: 18px;
        color: white;
        background-color: #4CAF50;
        text-decoration: none;
        border-radius: 2rem;
        transition: background-color 0.3s, transform 0.3s;
        width: 100%;
        box-sizing: border-box;
    }
    .btn-custom:hover {
        background-color: #45a049;
        transform: scale(1.05);
    }
    .btn-custom:active {
        transform: scale(0.98);
    }
    .btn-secondary {
        display: inline-block;
        margin-top: 20px;
        font-size: 18px;
        color: white;
        background-color: #007bff;
        text-decoration: none;
        border-radius: 2rem;
        transition: background-color 0.3s, transform 0.3s;
        width: 100%;
        box-sizing: border-box;
    }
    .btn-secondary:hover {
        background-color: #0056b3;
        transform: scale(1.05);
    }
    .btn-secondary:active {
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
        <h2>Download Transactions as PDF</h2>
        <p>Click the button below to download the last 10 transactions as a PDF document.</p>
        <form action="downloadPDF" method="get">
            <button type="submit" class="btn btn-custom">Download PDF</button>
        </form>
        <form action="customerDashboard.jsp" method="get">
            <button type="submit" class="btn btn-secondary">Back to Dashboard</button>
        </form>
    </div>

    <!-- Include Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
