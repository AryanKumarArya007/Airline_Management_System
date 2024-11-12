<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <title>Airline Management System</title>
    <!-- Corrected path for CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <h1>Welcome to Airline Management System</h1>

    <!-- Check if the user is logged in -->
    <c:choose>
        <c:when test="${not empty sessionScope.username}">
            <!-- User is logged in, show options -->
            <p>Hello, ${sessionScope.username}!</p>
            <a href="${pageContext.request.contextPath}/jsp/flights.jsp">Flights</a> | 
            <a href="${pageContext.request.contextPath}/jsp/booking.jsp">Bookings</a> |
            <a href="${pageContext.request.contextPath}/jsp/logout.jsp">Logout</a>
        </c:when>
        <c:otherwise>
            <!-- User is not logged in, show login and register options -->
            <a href="${pageContext.request.contextPath}/jsp/login.jsp">Login</a> | 
            <a href="${pageContext.request.contextPath}/jsp/register.jsp">Register</a>
        </c:otherwise>
    </c:choose>

    <!-- Corrected path for JS -->
    <script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>
