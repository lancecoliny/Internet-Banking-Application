import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DepositServlet")
public class DepositServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String accountNo = (String) session.getAttribute("account_no");
        double amount = Double.parseDouble(request.getParameter("amount"));

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Bankingdb", "root", "root");
            PreparedStatement ps = con.prepareStatement("UPDATE Customer SET initial_balance = initial_balance + ? WHERE account_no = ?");
            ps.setDouble(1, amount);
            ps.setString(2, accountNo);
            ps.executeUpdate();

            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            ps = con.prepareStatement("INSERT INTO Transactions (account_no, amount, transaction_type, transaction_date) VALUES (?, ?, 'Deposit', ?)");
            ps.setString(1, accountNo);
            ps.setDouble(2, amount);
            ps.setTimestamp(3, timestamp);
            ps.executeUpdate();

            response.sendRedirect("depositSuccess.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
