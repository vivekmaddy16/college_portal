package com.university.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class AdminSecurityFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        HttpSession session = httpRequest.getSession(false);
        boolean loggedIn = false;
        
        if (session != null) {
            Boolean adminLoggedIn = (Boolean) session.getAttribute("adminLoggedIn");
            if (adminLoggedIn != null && adminLoggedIn) {
                loggedIn = true;
            }
        }
        
        if (loggedIn) {
            chain.doFilter(request, response);
        } else {
            httpResponse.sendRedirect("admin-login.jsp");
        }
    }

    @Override
    public void destroy() {
    }
}
