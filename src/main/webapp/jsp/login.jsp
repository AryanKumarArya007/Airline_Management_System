<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <!-- Correct CSS and JS paths using contextPath -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="${pageContext.request.contextPath}/js/script.js"></script>
</head>
<body>
    <h2>Login</h2>
    <form action="${pageContext.request.contextPath}/UserServlet" method="post">
        <input type="hidden" name="action" value="login">

        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>

        <button type="submit">Login</button>
    </form>

    <!-- Provide link for registration -->
    <p>Don't have an account? <a href="${pageContext.request.contextPath}/jsp/register.jsp">Register here</a>.</p>

    <!-- Display error messages if there is any -->
    <c:if test="${not empty param.error}">
        <p style="color: red;">${param.error}</p>
    </c:if>

    <c:if test="${not empty param.message}">
        <p style="color: green;">${param.message}</p>
    </c:if>
</body>
</html>
