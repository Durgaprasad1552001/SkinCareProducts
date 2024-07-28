package com.Example.controllers;

import java.io.IOException;
import java.sql.SQLException;

import com.Example.dao.CustomerDao;
import com.Example.models.contactusmodel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/contactus")
public class ContactusServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Hello, I am in servlet");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String message = request.getParameter("message");

		contactusmodel cum = new contactusmodel();
		cum.setName(name);
		cum.setEmail(email);
		cum.setMessage(message);

		CustomerDao cdao = new CustomerDao();
		String status = cdao.getcontactdet(cum);
		if ("Success".equals(status)) {
			RequestDispatcher rd = request.getRequestDispatcher("/successcontactus.jsp");
			rd.include(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
			rd.include(request, response);
		}
		
		
 }
}
