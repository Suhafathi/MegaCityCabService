package com.megacitycabservice.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("LogoutServlet invoked: Request URI = " + request.getRequestURI());

        try {

            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
                System.out.println("Session invalidated successfully");
            } else {
                System.out.println("No session found to invalidate");
            }


            String redirectPath = request.getContextPath() + "/login.jsp";
            System.out.println("Redirecting to: " + redirectPath);
            response.sendRedirect(redirectPath);
        } catch (Exception e) {

            System.err.println("Error in LogoutServlet: " + e.getMessage());
            e.printStackTrace();

            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);
    }
}