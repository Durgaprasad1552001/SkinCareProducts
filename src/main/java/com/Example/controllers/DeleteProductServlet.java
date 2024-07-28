package com.Example.controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.Example.dao.CustomerDao;
import com.Example.models.Product;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");

        CustomerDao customerDao = new CustomerDao();
        String status = customerDao.deleteProduct(productId);

        if (status.equals("Success")) {
            response.sendRedirect("productList.jsp?status=deleted");
        } else {
            response.sendRedirect("productList.jsp?status=error");
        }
    }
}
