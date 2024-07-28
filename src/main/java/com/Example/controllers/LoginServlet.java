package com.Example.controllers;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import com.Example.dao.CustomerDao;
import com.Example.models.*;
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Login Servlet");
		String userId = request.getParameter("UserName");
		String passWord = request.getParameter("PassWord");

		CustomerLoginModel clm = new CustomerLoginModel();
		clm.setUserId(userId);
		clm.setPassWord(passWord);

		CustomerDao cd = new CustomerDao();
		String status = cd.customerlogin(clm);
		System.out.println(status);

		if ("Success".equals(status)) {
			HttpSession session = request.getSession();
			session.setAttribute("userId", userId); // Set the userId attribute
			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
			rd.include(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
			rd.include(request, response);
		}
	}
}
