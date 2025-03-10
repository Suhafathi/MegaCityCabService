<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Payment Receipt</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; margin: 20px; background-color: #f4f4f4; }
        .container { width: 50%; margin: auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px; background-color: #fff; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); }
        h2 { color: #333; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; border: 1px solid #ddd; text-align: left; }
        th { background-color: #007BFF; color: white; }
        .button { padding: 10px 20px; background-color: #28a745; color: white; border: none; cursor: pointer; margin-top: 20px; border-radius: 5px; font-size: 16px; }
        .button:hover { background-color: #218838; }
        .download-button { padding: 10px 20px; background-color: #007BFF; color: white; border: none; cursor: pointer; margin-top: 20px; border-radius: 5px; font-size: 16px; }
        .download-button:hover { background-color: #0056b3; }
    </style>
</head>
<body>

<div class="container">
    <h2>🚖 MegaCity Cab Service - Payment Receipt</h2>

    <%
        int bookingID = 0;
        try {

            String bookingIDParam = request.getParameter("bookingID");
            if (bookingIDParam != null && !bookingIDParam.trim().isEmpty()) {
                bookingID = Integer.parseInt(bookingIDParam);
            } else {
                out.println("<p style='color: red;'>❌ Invalid Booking ID</p>");
            }
        } catch (Exception e) {
            out.println("<p style='color: red;'>❌ Invalid Booking ID</p>");
        }

        if (bookingID > 0) {

            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycabdb", "root", "admin1234@");


                String query = "SELECT b.*, c.Model AS CarModel, c.RentalPricePerKm, cust.Name AS CustomerName, d.Name AS DriverName " +
                        "FROM booking b " +
                        "JOIN car c ON b.CarID = c.CarID " +
                        "JOIN customer cust ON b.CustomerID = cust.CustomerID " +
                        "JOIN driver d ON b.DriverID = d.DriverID " +
                        "WHERE b.booking_number = ?";

                stmt = conn.prepareStatement(query);
                stmt.setInt(1, bookingID);
                rs = stmt.executeQuery();

                if (rs.next()) {
                    String customerName = rs.getString("CustomerName");
                    String driverName = rs.getString("DriverName");
                    String carModel = rs.getString("CarModel");
                    String pickupLocation = rs.getString("PickupLocation");
                    String dropoffLocation = rs.getString("DropoffLocation");
                    String bookingDate = rs.getString("BookingDate");


                    double distance = rs.getDouble("Distance");
                    double rentalPricePerKm = rs.getDouble("RentalPricePerKm");


                    double subtotal = distance * rentalPricePerKm;
                    double vat = subtotal * 0.1;
                    double totalAmount = subtotal + vat;
    %>

    <table>
        <tr><th>Booking Number</th><td><%= bookingID %></td></tr>
        <tr><th>Customer Name</th><td><%= customerName %></td></tr>
        <tr><th>Driver Name</th><td><%= driverName %></td></tr>
        <tr><th>Car Model</th><td><%= carModel %></td></tr>
        <tr><th>Pickup Location</th><td><%= pickupLocation %></td></tr>
        <tr><th>Dropoff Location</th><td><%= dropoffLocation %></td></tr>
        <tr><th>Booking Date</th><td><%= (bookingDate != null) ? bookingDate : "N/A" %></td></tr>
        <tr><th>Rental Price Per Km</th><td><%= rentalPricePerKm %> LKR</td></tr>
        <tr><th>Distance (Km)</th><td><%= distance %> Km</td></tr>
        <tr><th>VAT (10%)</th><td><b><%= String.format("%.2f", vat) %> LKR</b></td></tr>
        <tr><th>Total Amount</th><td><b><%= String.format("%.2f", totalAmount) %> LKR</b></td></tr>
    </table>

    <form action="downloadBill" method="GET">
        <input type="hidden" name="bookingID" value="<%= bookingID %>">
        <button type="submit" class="download-button">📥 Download PDF</button>
    </form>

    <%
                } else {
                    out.println("<p style='color: red;'>❌ No booking found for ID: " + bookingID + "</p>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p style='color: red;'>❌ Error: " + e.getMessage() + "</p>");
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        } else {
            out.println("<p style='color: red;'>❌ No valid booking ID provided.</p>");
        }
    %>

</div>

</body>
</html>
