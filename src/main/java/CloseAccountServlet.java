import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CloseAccountServlet")
public class CloseAccountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String accountNo = (String) session.getAttribute("account_no");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Update the driver class name if necessary
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Bankingdb", "root", "root");

            // Check if the balance is 0
            PreparedStatement checkBalanceStmt = con.prepareStatement("SELECT initial_balance FROM Customer WHERE account_no = ?");
            checkBalanceStmt.setString(1, accountNo);
            ResultSet rs = checkBalanceStmt.executeQuery();
            
            if (rs.next()) {
                double balance = rs.getDouble("initial_balance");
                if (balance == 0) {
                    // Delete the account if balance is 0
                    PreparedStatement deleteStmt = con.prepareStatement("DELETE FROM Customer WHERE account_no = ?");
                    deleteStmt.setString(1, accountNo);
                    deleteStmt.executeUpdate();

                    session.invalidate();
                    response.sendRedirect("customerLogin.jsp");
                } else {
                    // Handle the case where the balance is not zero
                    session.setAttribute("errorMessage", "Account cannot be closed because the balance is not zero.");
                    response.sendRedirect("errorPage.jsp"); // Redirect to an error page or show a message
                }
            } else {
                // Handle the case where the account does not exist
                session.setAttribute("errorMessage", "Account not found.");
                response.sendRedirect("errorPage.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
