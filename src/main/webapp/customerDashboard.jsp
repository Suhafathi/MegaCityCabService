<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.megacitycabservice.model.Car" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <title>Customer Dashboard - Book a Car</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #ffffff;
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
        .navbar a.active {
            background-color: #ae8b1c;
            border-radius: 5px;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            background-color: #ae8b1c;
            color: white;
            margin-top: 60px;
        }
        .header h2 {
            margin: 0;
            margin: 30px;
        }
        .logout-button {
            padding: 8px 15px;
            background-color: #dc3545;
            color: white;
            border: none;
            cursor: pointer;
        }
        .logout-button:hover {
            background-color: #c82333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #f0f0f0;
        }
        .book-button {
            padding: 8px 15px;
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
        }
        .book-button:hover {
            background-color: #218838;
        }
        .cancel-button {
            padding: 8px 15px;
            background-color: #dc3545;
            color: white;
            border: none;
            cursor: pointer;
        }
        .cancel-button:hover {
            background-color: #c82333;
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
    <a href="index.jsp">Home</a>
    <a href="about-us.jsp">About Us</a>
    <a href="services.jsp">Services</a>
    <a href="contactus.jsp">Contact</a>
</div>

<!-- Header -->
<div class="header">
    <h2>Welcome,
        <%
            String customerName = (String) session.getAttribute("username");
            if (customerName != null) {
                out.print(customerName);
            } else {
                response.sendRedirect("login.jsp");
            }
        %>
    </h2>
    <button id="logoutLink" class="logout-button">Logout</button>
</div>

<h2>Available Cars for Booking</h2>

<%
    List<Car> carList = (List<Car>) request.getAttribute("availableCars");
    if (carList == null) carList = new ArrayList<>();
%>

<% if (!carList.isEmpty()) { %>
<table>
    <thead>
    <tr>
        <th>Model</th>
        <th>License Plate</th>
        <th>Capacity</th>
        <th>Fuel Type</th>
        <th>Rental Price per Km</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <% for (Car car : carList) { %>
    <tr>
        <td><%= car.getModel() %></td>
        <td><%= car.getLicensePlate() %></td>
        <td><%= car.getCapacity() %></td>
        <td><%= car.getFuelType() %></td>
        <td><%= car.getRentalPricePerKm() %> LKR</td>
        <td>
            <form action="selectDriver" method="POST">
                <input type="hidden" name="carID" value="<%= car.getCarID() %>">
                <button type="submit" class="book-button">Book Now</button>
            </form>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>
<% } else { %>
<p style="text-align: center; color: red;">No available cars at the moment.</p>
<% } %>

<h2>My Bookings</h2>

<%
    List<Map<String, String>> customerBookings = (List<Map<String, String>>) request.getAttribute("customerBookings");
%>

<% if (customerBookings != null && !customerBookings.isEmpty()) { %>
<table>
    <thead>
    <tr>
        <th>Booking ID</th>
        <th>Car Model</th>
        <th>Driver Name</th>
        <th>Pickup Location</th>
        <th>Dropoff Location</th>
        <th>Booking Date</th>
        <th>Payment Method</th>
        <th>Payment Status</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <% for (Map<String, String> booking : customerBookings) { %>
    <tr>
        <td><%= booking.get("bookingNumber") %></td>
        <td><%= booking.get("carModel") %></td>
        <td><%= booking.get("driverName") %></td>
        <td><%= booking.get("pickupLocation") %></td>
        <td><%= booking.get("dropoffLocation") %></td>
        <td><%= booking.get("bookingDate") %></td>
        <td><%= booking.get("paymentMethod") %></td>
        <td><%= booking.get("paymentStatus") %></td>
        <td>
            <% if ("Pending".equals(booking.get("paymentStatus"))) { %>
            <form action="payment.jsp" method="GET">
                <input type="hidden" name="bookingID" value="<%= booking.get("bookingNumber") != null ? booking.get("bookingNumber") : "" %>">
                <input type="hidden" name="carID" value="<%= booking.get("carID") != null ? booking.get("carID") : "" %>">
                <input type="hidden" name="carModel" value="<%= booking.get("carModel") != null ? booking.get("carModel") : "" %>">
                <input type="hidden" name="driverID" value="<%= booking.get("driverID") != null ? booking.get("driverID") : "" %>">
                <input type="hidden" name="customerName" value="<%= customerName %>">
                <input type="hidden" name="driverName" value="<%= booking.get("driverName") %>">
                <input type="hidden" name="pickupLocation" value="<%= booking.get("pickupLocation") %>">
                <input type="hidden" name="dropoffLocation" value="<%= booking.get("dropoffLocation") %>">
                <input type="hidden" name="bookingDate" value="<%= booking.get("bookingDate") %>">
                <input type="hidden" name="rentalPricePerKm" value="<%= booking.get("rentalPricePerKm") %>">
                <input type="hidden" name="distance" value="<%= booking.get("distance") %>">
                <button type="submit" class="pay-button" style="background-color: blue; color: white; padding: 8px;">Pay Now</button>
            </form>
            <% } else if ("Paid".equals(booking.get("paymentStatus"))) { %>
            <span style="color: green;">✔ Paid</span>
            <% } %>
            <form action="cancelBooking" method="POST">
                <input type="hidden" name="bookingNumber" value="<%= booking.get("bookingNumber") %>">
                <input type="hidden" name="carID" value="<%= booking.get("carID") %>">
                <input type="hidden" name="driverID" value="<%= booking.get("driverID") %>">
                <button type="submit" class="cancel-button">Cancel</button>
            </form>
        </td>
    </tr>
    <% } %>

    <c:if test="${not empty sessionScope.username}">
        <script>
            alert("Login Successful! Welcome, ${sessionScope.username} (Customer)");
        </script>
    </c:if>

    <script>
        console.log("Customer Dashboard loaded. Session username: ${sessionScope.username}, Role: ${sessionScope.role}");
    </script>
    </tbody>
</table>
<% } else { %>
<p style="text-align: center; color: red;">No bookings found.</p>
<% } %>

<div class="footer">
    <p>© 2025 Mega City Cab Service. All rights reserved.</p>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="<%= request.getContextPath() %>/js/sweetalert2.min.js"></script>
<script>
    console.log("SweetAlert2 script loaded");

    document.addEventListener('DOMContentLoaded', function() {
        console.log("DOM fully loaded");

        const logoutLink = document.getElementById('logoutLink');
        if (logoutLink) {
            console.log("Logout link found");
            logoutLink.addEventListener('click', async function(event) {
                console.log("Logout link clicked");
                event.preventDefault();

                try {
                    const result = await Swal.fire({
                        title: 'Are you sure?',
                        text: 'Do you want to logout?',
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#ae8b1c',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Yes, Logout!'
                    });

                    if (result.isConfirmed) {
                        console.log("User confirmed logout");
                        const logoutUrl = '<%= request.getContextPath() %>/logout';
                        console.log("Redirecting to: " + logoutUrl);
                        window.location.href = logoutUrl;
                    } else {
                        console.log("User cancelled logout");
                    }
                } catch (error) {
                    console.error("Error displaying SweetAlert2:", error);
                    const logoutUrl = '<%= request.getContextPath() %>/logout';
                    console.log("Fallback redirect to: " + logoutUrl);
                    window.location.href = logoutUrl;
                }
            });
        } else {
            console.error("Logout link not found in the DOM");
        }
    });
</script>
</body>
</html>