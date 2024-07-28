package com.Example.controllers;

import java.io.IOException;
import com.Example.dao.CustomerDao;
import com.Example.models.CustomerLoginModel;
import com.Example.models.DislikedProductModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DislikeProductServlet")
public class DislikeProductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("productName");
        String productId = request.getParameter("productId");

        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");

        if (userId == null) {
            response.setContentType("text/plain");
            response.getWriter().write("User not logged in.");
            return;
        }

        CustomerLoginModel customer = new CustomerLoginModel();
        customer.setUserId(userId);

        DislikedProductModel dislikedProduct = new DislikedProductModel();
        if (productId == null || productId.isEmpty()) {
            response.setContentType("text/plain");
            response.getWriter().write("productId parameter is missing.");
            return;
        }

        try {
            int intProductId = Integer.parseInt(productId);
            dislikedProduct.setProductId(intProductId);
        } catch (NumberFormatException e) {
            response.setContentType("text/plain");
            response.getWriter().write("Invalid productId format.");
            return;
        }

        dislikedProduct.setProductName(productName);

        CustomerDao customerDao = new CustomerDao();
        String status = customerDao.insertDislikedData(customer, dislikedProduct);

        response.setContentType("text/plain");
        if ("Success".equalsIgnoreCase(status)) {
            response.getWriter().write("Successfully disliked " + productName + " " + productId);
        } else if ("Removed".equalsIgnoreCase(status)) {
            response.getWriter().write("Successfully removed dislike for " + productName + " " + productId);
        } else {
            response.getWriter().write("Failed to dislike the product");
        }
    }
}
