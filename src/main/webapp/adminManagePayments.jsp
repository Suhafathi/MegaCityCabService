<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.megacitycabservice.model.Payment" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Payments - Mega City Cab Service</title>
    <style>

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #1d1f22;
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


        .container {
            width: 90%;
            max-width: 1200px;
            margin: 100px auto;
            padding: 20px;
            background: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;

        }

        h1 {
            text-align: center;
            color: #333;
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
            background-color: #ae8b1c;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }


        .footer {
            text-align: center;
            padding: 8px;
            background-color: #333;
            color: white;
            position: fixed;
            bottom: 0;
            width: 100%;
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


<div class="container">
    <h1>View Payments</h1>

    <%
        List<Payment> paymentList = (List<Payment>) request.getAttribute("paymentList");
        if (paymentList == null) {
            paymentList = new ArrayList<>();
        }
    %>

    <% if (!paymentList.isEmpty()) { %>
    <table>
        <thead>
        <tr>
            <th>Payment ID</th>
            <th>Booking Number</th>
            <th>Total Amount</th>
            <th>Payment Date</th>
        </tr>
        </thead>
        <tbody>
        <% for (Payment payment : paymentList) { %>
        <tr>
            <td><%= payment.getPaymentId() %></td>
            <td><%= payment.getBookingNumber() %></td>
            <td><%= payment.getTotalAmount() %></td>
            <td><%= payment.getPaymentDate() %></td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <% } else { %>
    <p style="text-align: center; font-size: 18px;">No payment records available.</p>
    <% } %>
</div>


<div class="footer">
    <p>&copy; 2025 Mega City Cab Service. All rights reserved.</p>
</div>

</body>
</html>
