package com.Example.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import com.Example.dao.CustomerDao;
import com.Example.models.ProductCollectionModel;

@WebServlet("/adminsentprod")
public class adminSentprodServ extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("Entered admin sent product servlet");
		String prodname = request.getParameter("productName");
		String prodprice = request.getParameter("productPrice");
		String prodimage = request.getParameter("productImage");

		System.out.println(prodname);
		System.out.println(prodimage);

		ProductCollectionModel pcm = new ProductCollectionModel();
		pcm.setProductName(prodname);
		pcm.setProductPrice(prodprice);
		pcm.setProductImage(prodimage);

		System.out.println(pcm.getProductImage());

		CustomerDao cd = new CustomerDao();
		String s = cd.adminProdAdd(pcm);
		HttpSession session = request.getSession();
		if (s.equalsIgnoreCase("success")) {
			session.setAttribute("prodstatus", "Successfully added product to the database");
		} else {
			session.setAttribute("prodstatus", "Failed to add product!");
		}

		response.sendRedirect("SuccessprodAdd.jsp"); // Redirect to an appropriate admin page
	}
}
