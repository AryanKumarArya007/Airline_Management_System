package airline.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;


@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("register".equals(action)) {
            registerUser(request, response);
        } else if ("login".equals(action)) {
            loginUser(request, response);
        }
    }

    private void registerUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");  // Get email from the form
        String password = request.getParameter("password");

        try (Connection con = DatabaseConnection.getConnection()) {
            // Hash the password before storing it in the database
            String hashedPassword = hashPassword(password);

            // Modify the SQL query to include the email field
            String sql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, email);  // Include email in the database insert
            stmt.setString(3, hashedPassword);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("jsp/login.jsp?message=Registration successful");
            } else {
                response.sendRedirect("jsp/register.jsp?error=Registration failed. Try again.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("jsp/register.jsp?error=Error occurred during registration: " + e.getMessage());
        }
    }

    private String hashPassword(String password) throws NoSuchAlgorithmException {
        // Hash the password using SHA-256 algorithm
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hash = md.digest(password.getBytes());
        StringBuilder hexString = new StringBuilder();
        for (byte b : hash) {
            hexString.append(Integer.toHexString(0xFF & b));  // Convert byte to hex
        }
        return hexString.toString();  // Return the hashed password
    }

    private void loginUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection con = DatabaseConnection.getConnection()) {
            // Hash the entered password before checking against the stored hash
            String hashedPassword = hashPassword(password);

            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, hashedPassword);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                request.getSession().setAttribute("username", username);
                response.sendRedirect("jsp/index.jsp");  // Redirect to home page after login
            } else {
                response.sendRedirect("jsp/login.jsp?error=Invalid credentials");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("jsp/login.jsp?error=Error occurred during login: " + e.getMessage());
        }
    }
}
