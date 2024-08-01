import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ViewTransactionsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        String accountNo = (String) session.getAttribute("account_no");

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<title>View Transactions</title>");
        out.println("<link rel='stylesheet' type='text/css' href='css/styles.css'>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h2>Last 10 Transactions</h2>");
        out.println("<table border='1'>");
        out.println("<tr>");
        out.println("<th>Date</th>");
        out.println("<th>Amount</th>");
        out.println("<th>Type</th>");
        out.println("</tr>");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BankingDB", "root", "root");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Transactions WHERE id=(SELECT id FROM Customer WHERE account_no=?) ORDER BY transaction_date DESC LIMIT 10");
            ps.setString(1, accountNo);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getTimestamp("transaction_date") + "</td>");
                out.println("<td>" + rs.getDouble("amount") + "</td>");
                out.println("<td>" + rs.getString("type") + "</td>");
                out.println("</tr>");
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        out.println("</table>");
        out.println("<a href='customerDashboard.jsp'>Back to Dashboard</a>");
        out.println("</body>");
        out.println("</html>");
    }
}
