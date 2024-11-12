package airline.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/FlightServlet")
public class FlightServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handles GET requests to fetch all flights
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> flights = new ArrayList<>();
        String sql = "SELECT * FROM flights";

        try (Connection con = DatabaseConnection.getConnection(); 
             PreparedStatement stmt = con.prepareStatement(sql); 
             ResultSet rs = stmt.executeQuery()) {

            // Fetch flight names from result set and add to list
            while (rs.next()) {
                flights.add(rs.getString("flight_name"));
            }

            // Set flights list as a request attribute and forward the request
            request.setAttribute("flights", flights);
            request.getRequestDispatcher("/jsp/flights.jsp").forward(request, response);
        } catch (Exception e) {
            // Log the error and send an error message to the user
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while fetching the flights.");
            request.getRequestDispatcher("/jsp/error.jsp").forward(request, response);
        }
    }

    // Handles POST requests to add a new flight
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flightName = request.getParameter("flightName");
        String departure = request.getParameter("departure");
        String arrival = request.getParameter("arrival");

        String sql = "INSERT INTO flights (flight_name, departure, arrival) VALUES (?, ?, ?)";

        try (Connection con = DatabaseConnection.getConnection(); 
             PreparedStatement stmt = con.prepareStatement(sql)) {

            // Set the parameters for the insert statement
            stmt.setString(1, flightName);
            stmt.setString(2, departure);
            stmt.setString(3, arrival);

            // Execute the update
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                // Redirect to the admin dashboard if the insertion is successful
                response.sendRedirect("admin/dashboard.jsp");
            } else {
                // If no rows were affected, redirect with an error
                response.sendRedirect("admin/dashboard.jsp?error=Failed to add flight.");
            }
        } catch (Exception e) {
            // Log the error and send an error message to the user
            e.printStackTrace();
            response.sendRedirect("admin/dashboard.jsp?error=Error occurred while adding the flight.");
        }
    }
}
