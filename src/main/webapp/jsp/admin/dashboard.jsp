<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
</head>
<body>
    <h2>Admin Dashboard</h2>
    <nav>
        <a href="${pageContext.request.contextPath}/jsp/addFlight.jsp">Add Flight</a> | 
        <a href="${pageContext.request.contextPath}/jsp/manageBookings.jsp">Manage Bookings</a> | 
        <a href="${pageContext.request.contextPath}/jsp/manageUsers.jsp">Manage Users</a>
    </nav>
    <script src="${pageContext.request.contextPath}/js/admin.js"></script>
</body>
</html>
