package com.Example.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import com.Example.dao.CustomerDao;
import com.Example.models.ActiveProducts;
import com.Example.models.CustomerProfile;

@WebServlet("/viewProducts")
public class ActiveProductservlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("ActiveProductsServlet - doGet method called");

        // Instantiate your DAO class
        CustomerDao cd = new CustomerDao();
        CustomerProfile cp = new CustomerProfile();
        
        // Call DAO method to fetch active products
        List<ActiveProducts> products = cd.getActiveProducts();
        
        // Set products as an attribute in request scope
        request.setAttribute("products", products);

        // Print the retrieved products for debugging
        if (products != null) {
            for (ActiveProducts product : products) {
                System.out.println(product.getProduct_id()+"Product: " + product.getProductName() + ", Price: " + product.getProductPrice() + "");
            }
        } else {
            System.out.println("No active products found");
        }
        
        // Forward request to ActiveProducts.jsp for rendering
        request.getRequestDispatcher("ActiveProducts.jsp").forward(request, response);
    }
}
