<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <!-- Correct CSS and JS path with the proper context path -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="${pageContext.request.contextPath}/js/script.js"></script>
</head>
<body>
    <h2>Register</h2>
    
    <!-- Show error message if it exists -->
    <c:if test="${not empty param.error}">
        <div style="color: red; font-weight: bold;">
            ${param.error}
        </div>
    </c:if>

    <!-- Correct form action to match your servlet URL mapping -->
    <form action="${pageContext.request.contextPath}/user" method="post">
        <input type="hidden" name="action" value="register">

        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>

        <button type="submit">Register</button>
    </form>
</body>
</html>
