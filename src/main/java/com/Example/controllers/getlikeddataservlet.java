package com.Example.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.Example.dao.CustomerDao;
import com.Example.models.getlikedProduct;

@WebServlet("/getLikedProductsServlet")
public class getlikeddataservlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        System.out.println("entered getLikedProductsServlet");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        CustomerDao customerDao = new CustomerDao();
        List<getlikedProduct> likedProducts = customerDao.getLikedProductsByUserId(userId);

        // Set likedProducts as a request attribute to be forwarded to the JSP
        request.setAttribute("likedProducts", likedProducts);
        request.getRequestDispatcher("likedproducts.jsp").forward(request, response);
    }
}
