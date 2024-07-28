package com.Example.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;



@WebServlet("/updateUserServlet")
public class updateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	String username = request.getParameter("username");
    	String firstname = request.getParameter("firstname");
    	System.out.println(username);
    	
    	
    	
 //  	    request.setAttribute("firstName", firstName);  	    
//   	    if(firstName != null) {
//        RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
//        try {
//			rd.include(request, response);
//		} catch (Exception e) {
//			e.printStackTrace();
//		} 
//   	    }
//   	    else {
//   	        RequestDispatcher rd = request.getRequestDispatcher("login.html");
//   	        try {
//   				rd.include(request, response);
//   			} catch (Exception e) {
//   				e.printStackTrace();
//   			} 
//   	    }	
//       
    }
}




