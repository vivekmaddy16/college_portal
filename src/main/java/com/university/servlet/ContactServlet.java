package com.university.servlet;

import com.university.dao.InquiryDAO;
import com.university.model.Inquiry;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Handles the Contact Us and Application form submission.
 * Persists details to the SQL database using InquiryDAO.
 */
public class ContactServlet extends HttpServlet {

    private final InquiryDAO inquiryDAO = new InquiryDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String program = request.getParameter("program");
        String message = request.getParameter("message");

        // Detect referring page for dynamic routing UX
        String referer = request.getHeader("referer");
        String redirectPage = "contact.jsp";
        if (referer != null && referer.contains("apply.jsp")) {
            redirectPage = "apply.jsp";
        }

        // Basic server-side validation
        if (name == null || name.trim().isEmpty()
                || email == null || email.trim().isEmpty()
                || phone == null || phone.trim().isEmpty()) {
            response.sendRedirect(redirectPage + "?status=error");
            return;
        }

        try {
            Inquiry inquiry = new Inquiry(name, email, phone, program, message);
            inquiryDAO.save(inquiry);
            response.sendRedirect(redirectPage + "?status=success");
        } catch (Exception e) {
            System.err.println("Error saving inquiry: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect(redirectPage + "?status=error");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("contact.jsp");
    }
}
