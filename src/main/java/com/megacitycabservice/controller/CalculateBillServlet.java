package com.megacitycabservice.controller;

import com.megacitycabservice.model.Payment;
import com.megacitycabservice.service.DatabaseConnection;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/calculateBill")
public class CalculateBillServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Payment> paymentList = new ArrayList<>();
        String query = "SELECT * FROM payments";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Payment payment = new Payment(
                        rs.getInt("payment_id"),
                        rs.getInt("booking_number"),
                        rs.getDouble("total_amount"),
                        rs.getTimestamp("payment_date")
                );
                paymentList.add(payment);
            }

        } catch (SQLException e) {
            getServletContext().log("Database error while fetching payment data", e);
        }

        request.setAttribute("paymentList", paymentList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("adminManagePayments.jsp");
        dispatcher.forward(request, response);
    }
}
