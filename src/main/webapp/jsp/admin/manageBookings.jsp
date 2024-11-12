<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Bookings</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
</head>
<body>
    <h2>Manage Bookings</h2>
    <p>Admin can view and manage all bookings here.</p>

    <!-- Displaying bookings in a table (make sure the 'bookings' attribute is set in the request) -->
    <table border="1">
        <tr>
            <th>Booking ID</th>
            <th>User</th>
            <th>Flight</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="booking" items="${bookings}">
            <tr>
                <td>${booking.bookingId}</td>
                <td>${booking.user.username}</td> <!-- Assuming 'user' is an object with 'username' -->
                <td>${booking.flight.flightName}</td> <!-- Assuming 'flight' is an object with 'flightName' -->
                <td>
                    <a href="editBooking.jsp?id=${booking.bookingId}">Edit</a>
                    <a href="deleteBooking.jsp?id=${booking.bookingId}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    
    <script src="${pageContext.request.contextPath}/js/admin.js"></script>
</body>
</html>
