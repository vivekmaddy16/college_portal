package com.university.servlet;

import com.university.dao.InquiryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class AdminServlet extends HttpServlet {

    private final InquiryDAO inquiryDAO = new InquiryDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        String idStr = request.getParameter("id");

        if ("logout".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect("admin-login.jsp");
            return;
        }

        if ("delete".equals(action) && idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                inquiryDAO.delete(id);
                response.sendRedirect("admin-dashboard.jsp?status=deleted");
                return;
            } catch (Exception e) {
                System.err.println("Error deleting inquiry: " + e.getMessage());
                e.printStackTrace();
                response.sendRedirect("admin-dashboard.jsp?status=error");
                return;
            }
        }
        
        response.sendRedirect("admin-dashboard.jsp");
    }
}
