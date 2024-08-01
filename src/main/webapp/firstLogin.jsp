<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Banking Application</title>
<!-- Include Bootstrap CSS -->
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
    animation: fadeIn 1.5s ease-in-out;
    width: 100%;
    max-width: 400px;
    text-align: center;
}
.header {
    font-size: 28px;
    margin-bottom: 20px;
    color: #333;
}
.button-container {
    margin-top: 20px;
}
.button {
    display: inline-block;
    padding: 10px 20px;
    font-size: 18px;
    background-color: #4CAF50;
    color: #fff;
    border: none;
    border-radius: 5px;
    transition: background-color 0.3s, transform 0.3s;
    cursor: pointer;
    margin: 5px;
    text-align: center;
}
.button:hover {
    background-color: #45a049;
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
        <div class="header">Banking Application</div>
        <div class="button-container">
            <a href="login.jsp" class="button">Admin Login</a>
            <a href="customerLogin.jsp" class="button">Customer Login</a>
        </div>
    </div>
    <!-- Include Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
