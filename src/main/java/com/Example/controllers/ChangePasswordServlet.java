package com.Example.controllers;

import java.io.IOException;

import com.Example.dao.CustomerDao;
import com.Example.models.PasswordChangeRequest;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/changePassword")
public class ChangePasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerId = request.getParameter("customerId");
        String previousPassword = request.getParameter("previousPassword");
        String newPassword = request.getParameter("newPassword");
        
        System.out.println("Customer ID: " + customerId);
        System.out.println("Previous Password: " + previousPassword);
        System.out.println("New Password: " + newPassword);
        
        PasswordChangeRequest pcr = new PasswordChangeRequest();
        pcr.setCustomerId(customerId);
        pcr.setPreviousPassword(previousPassword);
        pcr.setNewPassword(newPassword);
        
        CustomerDao cd = new CustomerDao();
        String status = cd.passwordChange(pcr);
        
        HttpSession session = request.getSession();

        if(status.equals("Success")) {
            session.setAttribute("PasswordChange", "Successfully Password Changed");

            // Redirect to a success page
            response.sendRedirect(request.getContextPath() + "/changePassword.jsp");
        } else if(status.equals("Failure")) {
            session.setAttribute("PasswordChange", "Failed to change password");

            // Redirect to a failure page
            response.sendRedirect(request.getContextPath() + "/changePassword.jsp");
        }
    }
}
