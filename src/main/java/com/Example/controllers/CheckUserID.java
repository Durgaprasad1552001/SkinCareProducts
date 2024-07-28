package com.Example.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.Example.dao.CustomerDao;

@WebServlet("/checkUsername")
public class CheckUserID extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("username");
        CustomerDao cd = new CustomerDao();
        String status = cd.checkUserID(userId);
        if(status.equals("Failure")) {
            response.setContentType("text/plain");
            response.getWriter().write("Username is not available");
        } else {
            System.out.println("Username is available");
            response.setContentType("text/plain");
            response.getWriter().write("Username is available");
        }
    }
}


