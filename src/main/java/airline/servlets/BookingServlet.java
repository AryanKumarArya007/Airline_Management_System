package airline.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String flightId = request.getParameter("flightId");
        String seatsBookedStr = request.getParameter("seatsBooked"); // Get the number of seats booked
        String totalPriceStr = request.getParameter("totalPrice");  // Get the total price

        // Validate the input parameters
        if (userId == null || flightId == null || seatsBookedStr == null || totalPriceStr == null ||
            userId.isEmpty() || flightId.isEmpty() || seatsBookedStr.isEmpty() || totalPriceStr.isEmpty()) {
            request.setAttribute("error", "Missing user or flight details");
            request.getRequestDispatcher("/jsp/booking.jsp").forward(request, response); // Corrected path
            return;
        }

        int seatsBooked = Integer.parseInt(seatsBookedStr);  // Parse the number of seats booked
        double totalPrice = Double.parseDouble(totalPriceStr);  // Parse the total price

        // Insert booking into the database
        try (Connection con = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO bookings (user_id, flight_id, seats_booked, total_price) VALUES (?, ?, ?, ?)";
            try (PreparedStatement stmt = con.prepareStatement(sql)) {
                stmt.setString(1, userId);
                stmt.setString(2, flightId);
                stmt.setInt(3, seatsBooked);  // Set the number of seats booked
                stmt.setDouble(4, totalPrice);  // Set the total price

                int rowsAffected = stmt.executeUpdate();

                if (rowsAffected > 0) {
                    // Successful booking: set success message and forward to booking.jsp
                    request.setAttribute("message", "Booking successful");
                    request.setAttribute("flightId", flightId);
                    request.setAttribute("seatsBooked", seatsBookedStr);
                    request.setAttribute("totalPrice", totalPriceStr);
                    request.getRequestDispatcher("/jsp/booking.jsp").forward(request, response); // Corrected path
                } else {
                    // Failed booking: set error message and forward to booking.jsp
                    request.setAttribute("error", "Booking failed");
                    request.getRequestDispatcher("/jsp/booking.jsp").forward(request, response); // Corrected path
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error occurred");
            request.getRequestDispatcher("/jsp/booking.jsp").forward(request, response); // Corrected path
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An unexpected error occurred");
            request.getRequestDispatcher("/jsp/booking.jsp").forward(request, response); // Corrected path
        }
    }
}
