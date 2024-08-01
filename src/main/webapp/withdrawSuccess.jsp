<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Withdrawal Successful</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
    width: 90%;
    max-width: 400px;
    text-align: center;
}
.container h2 {
    margin-bottom: 1.5rem;
    font-weight: 300;
}
.message {
    font-size: 18px;
    margin-bottom: 20px;
    color: #4CAF50;
}
.button {
    display: inline-block;
    padding: 10px 20px;
    color: white;
    background-color: #4285F4;
    text-decoration: none;
    border-radius: 2rem;
    transition: background-color 0.3s;
    cursor: pointer;
    width: 100%;
    box-sizing: border-box;
    margin-top: 10px;
}
.button:hover {
    background-color: #357ae8;
}
.button-secondary {
    background-color: #5bc0de;
}
.button-secondary:hover {
    background-color: #31b0d5;
}
.fa {
    margin-right: 8px;
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
        <h2>Withdrawal Successful</h2>
        <p class="message">Your withdrawal has been processed successfully. Thank you!</p>
        <a href="customerDashboard.jsp" class="button"><i class="fa fa-home"></i> Back to Dashboard</a>
    </div>
</body>
</html>
