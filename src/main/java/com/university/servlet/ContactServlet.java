package com.university.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDateTime;

/**
 * Handles the Contact Us form submission.
 * In a real project, replace the console logging below with a database
 * insert (JDBC / JPA) or an email dispatch (JavaMail) call.
 */
public class ContactServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String program = request.getParameter("program");
        String message = request.getParameter("message");

        // Basic server-side validation
        if (name == null || name.trim().isEmpty()
                || email == null || email.trim().isEmpty()
                || phone == null || phone.trim().isEmpty()) {
            response.sendRedirect("contact.jsp?status=error");
            return;
        }

        // TODO: persist to database instead of logging
        System.out.println("=== New Contact Enquiry [" + LocalDateTime.now() + "] ===");
        System.out.println("Name: " + name);
        System.out.println("Email: " + email);
        System.out.println("Phone: " + phone);
        System.out.println("Program: " + program);
        System.out.println("Message: " + message);
        System.out.println("=========================================");

        response.sendRedirect("contact.jsp?status=success");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("contact.jsp");
    }
}
