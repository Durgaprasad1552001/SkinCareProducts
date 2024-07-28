package com.Example.controllers;

import java.io.IOException;

import com.Example.dao.CustomerDao;
import com.Example.models.AdminModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Admin Servlet Layer");
		String adminName =request.getParameter("Admin");
		String adminPass =request.getParameter("PassWord");
		// creating object foe admin model to set the values and to call the values
		//setting the values 
		AdminModel am = new AdminModel();
		am.setAdminName(adminName);
		am.setAdminPass(adminPass);
		//getting the values 
		System.out.println(am.getAdminName());
		System.out.println(am.getAdminPass());
		//created object for dao layer and  method adminlogin is invoked and the status from the dao 
		//layer is obtained
	    CustomerDao cd = new CustomerDao();
	    String status =cd.adminlogin(am);
	    if (status.equals("Success")) {
	    	//if status is success the adminlogin page is forwarded to admin  page
			RequestDispatcher rd=request.getRequestDispatcher("/AdminPanel.jsp");
			rd.include(request,response);
			}
		else {
	    	//if status is false then the page is not forwarded to any other page
		RequestDispatcher rd=request.getRequestDispatcher("/AdminLogin.jsp");
		rd.include(request,response);   	
	    }
		
		
		
   	}

}
