<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
    <title>Available Flights</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <h2>Available Flights</h2>

    <!-- Check if the user is logged in -->
    <c:if test="${not empty sessionScope.username}">
        <!-- Display flights -->
        <ul>
            <c:forEach var="flight" items="${flights}">
                <li>${flight}</li>
            </c:forEach>
        </ul>
    </c:if>

    <!-- If no flights are available, show this message -->
    <c:if test="${empty flights}">
        <p>1	AI101	New York	Los Angeles	2024-11-10 10:00:00	2024-11-10 13:00:00	100	299.99
</p>
    </c:if>

    <!-- If the user is not logged in, show a login prompt -->
    <c:if test="${empty sessionScope.username}">
        <p>Please <a href="${pageContext.request.contextPath}/jsp/login.jsp">login</a> to view available flights.</p>
    </c:if>

    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>
