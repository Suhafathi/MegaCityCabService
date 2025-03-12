<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.megacitycabservice.model.Driver" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <title>Manage Drivers</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-image: url('<c:url value="/images/yellow.png"/>');
            color: white;
        }

        h1 {
            color: white;
        }

        .navbar {
            background-color: #333;
            padding: 15px;
            text-align: center;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 2;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            padding: 10px 20px;
            margin: 0 10px;
            transition: 0.3s;
        }

        .navbar a:hover {
            background-color: #ae8b1c;
            border-radius: 5px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            color: rgba(255, 255, 255, 0);
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
            color: white;
        }

        th {
            background-color: #ae8b1c;
        }

        tr:nth-child(even) {
            background-color: rgba(249, 249, 249, 0);
        }

        a {
            text-decoration: none;
            color: #007BFF;
        }

        a:hover {
            text-decoration: underline;
        }

        .add-button {
            margin-top: 20px;
            display: inline-block;
            padding: 10px 20px;
            background-color: #ae8b1c;
            color: white;
            border-radius: 5px;
        }

        .add-button:hover {
            background-color: #ae8b1c;
        }

        .status-available {
            color: #b59000;
            font-weight: bold;
        }

        .status-unavailable {
            color: red;
            font-weight: bold;
        }

        .status-unknown {
            color: orange;
            font-weight: bold;
        }

        .footer {
            text-align: center;
            padding: 8px;
            background-color: #333;
            color: white;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            z-index: 2;
        }

    </style>
</head>
<body>

<div class="navbar">
    <a href="manageCars">Cars</a>
    <a href="manageDrivers">Drivers</a>
    <a href="manageBookings">View Bookings</a>
    <a href="calculateBill">Payments</a>
    <a href="logout">Logout</a>
</div>
<h1>Manage Drivers</h1>

<%
    List<Driver> driverList = (List<Driver>) request.getAttribute("driverList");
    if (driverList == null) {
        driverList = new ArrayList<>();
    }
%>

<% if (!driverList.isEmpty()) { %>
<table>
    <thead>
    <tr>
        <th>Driver ID</th>
        <th>Name</th>
        <th>Age</th>
        <th>Nationality</th>
        <th>Driving Experience</th>
        <th>NIC</th>
        <th>Contact Number</th>
        <th>Username</th>
        <th>Status</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <% for (Driver driver : driverList) { %>
    <tr>
        <td><%= driver.getDriverID() %></td>
        <td><%= driver.getName() %></td>
        <td><%= driver.getAge() %></td>
        <td><%= driver.getNationality() %></td>
        <td><%= driver.getDrivingExperience() %> years</td>
        <td><%= driver.getNic() %></td>
        <td><%= driver.getContactNumber() %></td>
        <td><%= driver.getUsername() %></td>
        <td>
            <% if ("Available".equals(driver.getStatus())) { %>
            <span class="status-available">Available</span>
            <% } else { %>
            <span class="status-journey">On a Journey</span>
            <% } %>
        </td>
        <td>
            <a href="editDriver?driverId=<%= driver.getDriverID() %>">Edit</a> |
            <a href="deleteDriver?driverId=<%= driver.getDriverID() %>" onclick="return confirm('Are you sure?')">Delete</a>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>
<% } else { %>
<p>No drivers found in the database.</p>
<% } %>

<br>
<a href="addDriver.jsp" class="add-button">Add New Driver</a>

<div class="footer">
    <p>&copy; 2025 Mega City Cab Service. All rights reserved.</p>
</div>

</body>
</html>
