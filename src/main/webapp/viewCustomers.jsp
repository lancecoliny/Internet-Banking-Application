<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Customers</title>
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
    max-width: 1200px;
    text-align: center;
    box-sizing: border-box;
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
    margin-top: 20px;
}
.button:hover {
    background-color: #357ae8;
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
        <h2>Customer List</h2>
        <table>
            <thead>
                <tr>
                    <th>Customer ID</th>
                    <th>Full Name</th>
                    <th>Address</th>
                    <th>Mobile No</th>
                    <th>Email ID</th>
                    <th>Account Type</th>
                    <th>Date of Birth</th>
                    <th>Account No</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Bankingdb", "root", "root");
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM Customer");

                        while (rs.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rs.getInt("id") + "</td>");
                            out.println("<td>" + rs.getString("full_name") + "</td>");
                            out.println("<td>" + rs.getString("address") + "</td>");
                            out.println("<td>" + rs.getString("mobile_no") + "</td>");
                            out.println("<td>" + rs.getString("email_id") + "</td>");
                            out.println("<td>" + rs.getString("account_type") + "</td>");
                            out.println("<td>" + rs.getDate("date_of_birth") + "</td>");
                            out.println("<td>" + rs.getString("account_no") + "</td>");
                            out.println("</tr>");
                        }
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
        <a href="adminDashboard.jsp" class="button">Back to Dashboard</a>
    </div>
</body>
</html>
