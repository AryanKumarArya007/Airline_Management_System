<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <title>Book a Flight</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <script>
        // Function to calculate total price based on seats booked
        function calculateTotalPrice() {
            var seatsBooked = document.getElementById('seatsBooked').value;
            var flightId = document.getElementById('flightId').value;
            var pricePerSeat = 0;

            // Fetch the price per seat from the selected flight
            if (flightId === '1') {
                pricePerSeat = 299.99;
            } else if (flightId === '2') {
                pricePerSeat = 249.99;
            } else if (flightId === '3') {
                pricePerSeat = 199.99;
            }

            // Calculate total price
            var totalPrice = seatsBooked * pricePerSeat;
            document.getElementById('totalPrice').value = totalPrice.toFixed(2); // Show total price
        }
    </script>
</head>
<body>
    <h2>Book a Flight</h2>

    <% 
        String message = (String) request.getAttribute("message");
        String error = (String) request.getAttribute("error");
        String flightId = (String) request.getAttribute("flightId");
        String seatsBooked = (String) request.getAttribute("seatsBooked");
        String totalPrice = (String) request.getAttribute("totalPrice");
    %>

    <%-- Display success message if booking is successful --%>
    <% if (message != null && message.equals("Booking successful")) { %>
        <p style="color: green;">Booking was successful!</p>
        <p>Flight ID: <%= flightId != null ? flightId : "N/A" %></p>
        <p>Seats Booked: <%= seatsBooked != null ? seatsBooked : "N/A" %></p>
        <p>Total Price: <%= totalPrice != null ? totalPrice : "N/A" %></p>
        <a href="<%= request.getContextPath() %>/jsp/booking.jsp">Book another flight</a>
        <a href="<%= request.getContextPath() %>/jsp/index.jsp">Go to Home</a>
    <% } else { %>

        <%-- Display error message if there was an issue --%>
        <% if (error != null) { %>
            <p style="color: red;">Error: <%= error %></p>
            <a href="<%= request.getContextPath() %>/jsp/booking.jsp">Try booking again</a>
        <% } %>

        <%-- Booking form --%>
        <form action="<%= request.getContextPath() %>/BookingServlet" method="post">
            <label for="userId">User ID:</label>
            <input type="text" id="userId" name="userId" required><br>

            <label for="flightId">Flight ID:</label>
            <select id="flightId" name="flightId" required onchange="calculateTotalPrice()">
                <option value="1" <%= flightId != null && flightId.equals("1") ? "selected" : "" %>>AI101 - New York to Los Angeles</option>
                <option value="2" <%= flightId != null && flightId.equals("2") ? "selected" : "" %>>AI202 - Chicago to San Francisco</option>
                <option value="3" <%= flightId != null && flightId.equals("3") ? "selected" : "" %>>AI303 - Miami to Houston</option>
            </select><br>

            <label for="seatsBooked">Seats Booked:</label>
            <input type="number" id="seatsBooked" name="seatsBooked" value="<%= seatsBooked != null ? seatsBooked : "" %>" required oninput="calculateTotalPrice()"><br>

            <label for="totalPrice">Total Price:</label>
            <input type="text" id="totalPrice" name="totalPrice" value="<%= totalPrice != null ? totalPrice : "" %>" required readonly><br>

            <button type="submit">Book Flight</button>
        </form>
    <% } %>

    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>
