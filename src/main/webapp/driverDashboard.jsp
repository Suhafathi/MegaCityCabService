<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Driver Dashboard</title>
    <style>
    body {
    font-family: Arial, sans-serif;
    margin: 20px;
    background-color: #1d1f22;
    color: white;
    }

    h1 {
    text-align: center;
    color: white;
    }

    table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    color: white;
    }

    th, td {
    padding: 10px;
    border: 1px solid #ddd;
    text-align: center;
    color: white;
    }

    th {
    background-color: #f0f0f0;
    color: black;
    }

    .accept-button {
    background-color: green;
    color: white;
    padding: 5px 10px;
    border: none;
    cursor: pointer;
    }

    .reject-button {
    background-color: red;
    color: white;
    padding: 5px 10px;
    border: none;
    cursor: pointer;
    }

    .complete-button {
    background-color: blue;
    color: white;
    padding: 5px 10px;
    border: none;
    cursor: pointer;
    }

    .back-button {
    padding: 10px 20px;
    background-color: #b30000;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    font-size: 16px;
    }

    .back-button:hover {
    background-color: #ffffff;
    color: black;
    }
    </style>
</head>
<c:if test="${not empty sessionScope.username}">
    <script>
        alert("Login Successful! Welcome, ${sessionScope.username} (Driver)");

    </script>
</c:if>
<body>

<h1>Welcome, <%= session.getAttribute("username") %></h1>


<div style="text-align: center; margin-top: 20px;">
    <a href="login.jsp" class="back-button">Logout</a>
</div>


<h2>Bookings</h2>
<c:choose>
    <c:when test="${not empty pendingBookings}">
        <table>
            <tr>
                <th>Booking ID</th>
                <th>Car Model</th>
                <th>Customer</th>
                <th>Pickup</th>
                <th>Dropoff</th>
                <th>Booking Date</th>
                <th>Action</th>
            </tr>
            <c:forEach var="booking" items="${pendingBookings}">
                <tr>
                    <td>${booking.bookingNumber}</td>
                    <td>${booking.carModel}</td>
                    <td>${booking.customerName}</td>
                    <td>${booking.pickupLocation}</td>
                    <td>${booking.dropoffLocation}</td>
                    <td>${booking.bookingDate}</td>
                    <td>
                        <form action="driverBooking" method="POST">
                            <input type="hidden" name="bookingNumber" value="${booking.bookingNumber}">
                            <button type="submit" name="action" value="accept" class="accept-button">Accept</button>
                            <button type="submit" name="action" value="reject" class="reject-button">Reject</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:when>
    <c:otherwise>
        <p style="text-align: center; color: red;">No pending bookings.</p>
    </c:otherwise>
</c:choose>


<h2>Ongoing Bookings</h2>
<c:choose>
    <c:when test="${not empty activeBookings}">
        <table>
            <tr>
                <th>Booking ID</th>
                <th>Car Model</th>
                <th>Customer</th>
                <th>Pickup</th>
                <th>Dropoff</th>
                <th>Booking Date</th>
                <th>Action</th>
            </tr>
            <c:forEach var="booking" items="${activeBookings}">
                <tr>
                    <td>${booking.bookingNumber}</td>
                    <td>${booking.carModel}</td>
                    <td>${booking.customerName}</td>
                    <td>${booking.pickupLocation}</td>
                    <td>${booking.dropoffLocation}</td>
                    <td>${booking.bookingDate}</td>
                    <td>
                        <form action="completeBooking" method="POST">
                            <input type="hidden" name="bookingNumber" value="${booking.bookingNumber}">
                            <button type="submit" class="complete-button">Mark as Completed</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:when>
    <c:otherwise>
        <p style="text-align: center; color: red;">No active bookings.</p>
    </c:otherwise>
</c:choose>


</body>
</html>
