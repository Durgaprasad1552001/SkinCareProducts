package com.Example.controllers;

import java.io.IOException;
import java.sql.SQLException;

import com.Example.dao.CustomerDao;
import com.Example.models.FeedbackModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/feedbackServlet")
public class FeedbackServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Handling feedback submission");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        FeedbackModel feedback = new FeedbackModel();
        feedback.setName(name);
        feedback.setEmail(email);
        feedback.setMessage(message);

        CustomerDao cdao = new CustomerDao();
        String status;
        status = cdao.saveFeedback(feedback);

        if ("Success".equals(status)) {
            request.getRequestDispatcher("successfeedback.jsp").forward(request, response);
        } else {
            response.setContentType("text/html");
            response.getWriter().write("There was an error submitting your feedback. Please try again.");
        }
    }
}
