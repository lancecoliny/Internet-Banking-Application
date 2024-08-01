import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/downloadPDF")
public class downloadPDF extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=transaction.pdf");

        try {
            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            String accountNo = (String) request.getSession().getAttribute("account_no");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Bankingdb", "root", "root");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM transactions WHERE account_no=?");
            ps.setString(1, accountNo);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                document.add(new Paragraph("Date: " + rs.getTimestamp("transaction_date")));
                document.add(new Paragraph("Amount: " + rs.getDouble("amount")));
                document.add(new Paragraph("Type: " + rs.getString("transaction_type")));
                document.add(new Paragraph(" "));
            }

            document.close();
        } catch (DocumentException | SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}