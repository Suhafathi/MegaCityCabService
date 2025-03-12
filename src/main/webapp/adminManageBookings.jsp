<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.megacitycabservice.model.Booking" %>
<%@ page import="com.megacitycabservice.model.Customer" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Manage Bookings & View Customers - Mega City Cab Service</title>
  <style>

    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-image: url('<c:url value="/images/yellow.png"/>');
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
      margin: 40px auto;
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
  <h1> Customer Bookings</h1>

  <%
    List<Booking> bookingList = (List<Booking>) request.getAttribute("bookingList");
    if (bookingList == null) {
      bookingList = new ArrayList<>();
    }
  %>

  <% if (!bookingList.isEmpty()) { %>
  <table>
    <thead>
    <tr>
      <th>Booking Number</th>
      <th>Customer ID</th>
      <th>Car ID</th>
      <th>Pickup Location</th>
      <th>Dropoff Location</th>
      <th>Booking Date</th>
      <th>Payment Method</th>
      <th>Distance (km)</th>
      <th>Status</th>
      <th>Payment Status</th>
    </tr>
    </thead>
    <tbody>
    <% for (Booking booking : bookingList) { %>
    <tr>
      <td><%= booking.getBookingNumber() %></td>
      <td><%= booking.getCustomerID() %></td>
      <td><%= booking.getCarID() %></td>
      <td><%= booking.getPickupLocation() %></td>
      <td><%= booking.getDropoffLocation() %></td>
      <td><%= booking.getBookingDate() %></td>
      <td><%= booking.getPaymentMethod() %></td>
      <td><%= booking.getDistance() %></td>
      <td style="font-weight: bold; color: <%= booking.getStatus().equals("Completed") ? "green" : "orange" %>;">
        <%= booking.getStatus() %>
      </td>
      <td style="font-weight: bold; color: <%= booking.getPaymentStatus().equals("Paid") ? "green" : "red" %>;">
        <%= booking.getPaymentStatus() %>
      </td>
    </tr>
    <% } %>
    </tbody>
  </table>
  <% } else { %>
  <p style="text-align: center; font-size: 18px;">No bookings available.</p>
  <% } %>
</div>


<div class="container">
  <h1> Customers</h1>

  <%
    List<Customer> customerList = (List<Customer>) request.getAttribute("customerList");
    if (customerList == null) {
      customerList = new ArrayList<>();
    }
  %>

  <% if (!customerList.isEmpty()) { %>
  <table>
    <thead>
    <tr>
      <th>Customer ID</th>
      <th>Name</th>
      <th>Address</th>
      <th>NIC</th>
      <th>Contact Number</th>
      <th>Email</th>
      <th>Username</th>
    </tr>
    </thead>
    <tbody>
    <% for (Customer customer : customerList) { %>
    <tr>
      <td><%= customer.getCustomerID() %></td>
      <td><%= customer.getName() %></td>
      <td><%= customer.getAddress() %></td>
      <td><%= customer.getNic() %></td>
      <td><%= customer.getContactNumber() %></td>
      <td><%= customer.getEmail() %></td>
      <td><%= customer.getUsername() %></td>
    </tr>
    <% } %>
    </tbody>
  </table>
  <% } else { %>
  <p style="text-align: center; font-size: 18px;">No customers available.</p>
  <% } %>
</div>


<div class="footer">
  <p>&copy; 2025 Mega City Cab Service. All rights reserved.</p>
</div>

</body>
</html>
