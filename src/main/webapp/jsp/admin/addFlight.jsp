<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Flight</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
</head>
<body>
    <h2>Add a New Flight</h2>
    <form action="${pageContext.request.contextPath}/FlightServlet" method="post">
        <label for="flightName">Flight Name:</label>
        <input type="text" id="flightName" name="flightName" required><br>
        
        <label for="departure">Departure:</label>
        <input type="text" id="departure" name="departure" required><br>
        
        <label for="arrival">Arrival:</label>
        <input type="text" id="arrival" name="arrival" required><br>
        
        <button type="submit">Add Flight</button>
    </form>

    <script src="${pageContext.request.contextPath}/js/admin.js"></script>
</body>
</html>
