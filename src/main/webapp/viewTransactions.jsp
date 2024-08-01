<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Transactions</title>
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
    max-width: 800px;
    text-align: center;
}
.container h2 {
    margin-bottom: 1.5rem;
    font-weight: 300;
}
table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
    text-align: left;
}
th, td {
    padding: 12px;
    border-bottom: 1px solid #ddd;
}
th {
    background-color: #4285F4;
    color: #fff;
}
tr:nth-child(even) {
    background-color: #f9f9f9;
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
    margin: 10px;
}
.button:hover {
    background-color: #357ae8;
}
.button-container {
    margin-top: 20px;
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
        <h2>Last 10 Transactions</h2>
        <table>
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Amount</th>
                    <th>Type</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        String accountNo = (String) session.getAttribute("account_no");
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BankingDB", "root", "root");
                        PreparedStatement ps = con.prepareStatement("SELECT * FROM Transactions WHERE account_no=? ORDER BY transaction_date DESC LIMIT 10");
                        ps.setString(1, accountNo);
                        ResultSet rs = ps.executeQuery();

                        while (rs.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rs.getTimestamp("transaction_date") + "</td>");
                            out.println("<td>" + rs.getDouble("amount") + "</td>");
                            out.println("<td>" + rs.getString("transaction_type") + "</td>");
                            out.println("</tr>");
                        }
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
        <div class="button-container">
            <a href="downloadPDF.jsp" class="button">Download PDF</a>
            <a href="customerDashboard.jsp" class="button">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
