package com.megacitycabservice.controller;

import com.megacitycabservice.model.Booking;
import com.megacitycabservice.model.Customer;
import com.megacitycabservice.service.DatabaseConnection;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/manageBookings")
public class ManageBookingsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Booking> bookingList = new ArrayList<>();
        String bookingQuery = "SELECT * FROM booking";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(bookingQuery);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Booking booking = new Booking(
                        rs.getInt("booking_number"),
                        rs.getInt("CustomerID"),
                        rs.getInt("CarID"),
                        rs.getString("PickupLocation"),
                        rs.getString("DropoffLocation"),
                        rs.getTimestamp("BookingDate"),
                        rs.getString("PaymentMethod"),
                        rs.getInt("Distance"),
                        rs.getString("Status"),
                        rs.getString("PaymentStatus")
                );
                bookingList.add(booking);
            }

        } catch (SQLException e) {
            getServletContext().log("Database error while fetching bookings", e);
        }


        List<Customer> customerList = new ArrayList<>();
        String customerQuery = "SELECT * FROM customer";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(customerQuery);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Customer customer = new Customer(
                        rs.getInt("CustomerID"),
                        rs.getString("Name"),
                        rs.getString("Address"),
                        rs.getString("NIC"),
                        rs.getString("ContactNumber"),
                        rs.getString("Email"),
                        rs.getString("Username"),
                        rs.getString("Password")
                );
                customerList.add(customer);
            }

        } catch (SQLException e) {
            getServletContext().log("Database error while fetching customers", e);
        }


        request.setAttribute("bookingList", bookingList);
        request.setAttribute("customerList", customerList);


        RequestDispatcher dispatcher = request.getRequestDispatcher("adminManageBookings.jsp");
        dispatcher.forward(request, response);
    }


}
