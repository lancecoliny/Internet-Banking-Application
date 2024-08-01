<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Dashboard</title>
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
            max-width: 600px;
            text-align: center;
        }
        .container h2 {
            margin-bottom: 1.5rem;
            font-weight: 300;
        }
        .account-info {
            margin-bottom: 1.5rem;
            text-align: left;
        }
        .button {
            display: inline-block;
            margin: 10px 5px;
            padding: 10px 20px;
            color: white;
            background-color: #4285F4;
            text-decoration: none;
            border-radius: 2rem;
            transition: background-color 0.3s;
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
        <h2>Welcome, Customer</h2>
        <div class="account-info">
            <%
                String accountNo = (String) session.getAttribute("account_no");
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Bankingdb", "root", "root");
                PreparedStatement ps = con.prepareStatement("SELECT * FROM Customer WHERE account_no=?");
                ps.setString(1, accountNo);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    out.print("Account No: " + rs.getString("account_no") + "<br>");
                    out.print("Balance: " + rs.getDouble("initial_balance") + "<br>");
                }
            %>
        </div>
        <a href="viewTransactions.jsp" class="button"><i class="fa fa-list"></i> View Transactions</a>
        <a href="deposit.jsp" class="button"><i class="fa fa-plus-circle"></i> Deposit</a>
        <a href="withdraw.jsp" class="button"><i class="fa fa-minus-circle"></i> Withdraw</a>
        <a href="closeAccount.jsp" class="button button-secondary"><i class="fa fa-times-circle"></i> Close Account</a>
        <a href="logoutcustomer.jsp" class="button button-secondary"><i class="fa fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Include Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
</body>
</html>
