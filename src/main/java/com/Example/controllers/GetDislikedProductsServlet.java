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
import com.Example.models.getDislikedProduct;

@WebServlet("/getDislikedProductsServlet")
public class GetDislikedProductsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        System.out.println("entered getDislikedProductsServlet");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        CustomerDao customerDao = new CustomerDao();
        List<getDislikedProduct> dislikedProducts = customerDao.getDislikedProductsByUserId(userId);

        // Set dislikedProducts as a request attribute to be forwarded to the JSP
        request.setAttribute("dislikedProducts", dislikedProducts);
        request.getRequestDispatcher("dislikedproducts.jsp").forward(request, response);
    }
}
