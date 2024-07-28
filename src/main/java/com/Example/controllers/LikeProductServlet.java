package com.Example.controllers;

import java.io.IOException;
import com.Example.dao.CustomerDao;
import com.Example.models.CustomerLoginModel;
import com.Example.models.LikedProductModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LikeProductServlet")
public class LikeProductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("productName");
        String productid = request.getParameter("productId");

        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");

        if (userId == null) {
            response.setContentType("text/plain");
            response.getWriter().write("User not logged in.");
            return;
        }

        CustomerLoginModel crtp = new CustomerLoginModel();
        crtp.setUserId(userId);

        LikedProductModel lpm = new LikedProductModel();
        int intProductid = Integer.parseInt(productid);
        lpm.setProductid(intProductid);
        lpm.setProductname(productName);

        CustomerDao cd = new CustomerDao();
        String status = cd.insertLikedData(crtp, lpm);

        response.setContentType("text/plain");
        if ("Success".equalsIgnoreCase(status)) {
            response.getWriter().write("Successfully liked " + productName + " " + productid);
        } else if ("Removed".equalsIgnoreCase(status)) {
            response.getWriter().write("Successfully removed like for " + productName + " " + productid);
            
        } else {
            response.getWriter().write("Failed to like the product");
        }
    }
}
