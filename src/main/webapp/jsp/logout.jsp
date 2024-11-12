<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>
</head>
<body>

<%
    // Invalidate the session to log out the user
    HttpSession sessionn = request.getSession(false); // Get the current session without creating a new one
    if (sessionn != null) {
        sessionn.invalidate(); // Invalidate the session
    }

    // Redirect the user to the login or home page
    response.sendRedirect(request.getContextPath() + "/jsp/index.jsp");
%>

</body>
</html>
