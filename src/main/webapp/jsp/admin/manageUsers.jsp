<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Users</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
</head>
<body>
    <h2>Manage Users</h2>
    <p>Admin can view and manage all registered users here.</p>
    
    <!-- Displaying users in a table -->
    <table border="1">
        <tr>
            <th>Username</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.username}</td>
                <td>
                    <a href="editUser.jsp?id=${user.id}">Edit</a>
                    <a href="deleteUser.jsp?id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    
    <script src="${pageContext.request.contextPath}/js/admin.js"></script>
</body>
</html>
