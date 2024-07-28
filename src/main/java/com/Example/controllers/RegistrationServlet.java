package com.Example.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.Example.dao.CustomerDao;
import com.Example.models.CustomerModel;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("This is Register Servlet Layer Ben Stokes");

        // getting the values from the frontend and storing them into the local variables 
        String fullName = request.getParameter("Full Name");
        String userId = request.getParameter("User-id");
        String passWord = request.getParameter("PassWord");
        String gmail = request.getParameter("gmail");
        String phoneno = request.getParameter("phoneno");
        

        CustomerDao cd = new CustomerDao();
        String checkUserIDStatus = cd.checkUserID(userId);
        if (checkUserIDStatus.equals("Success")) {
            // created a model named customermodel and set the values by creating cm object
            CustomerModel cm = new CustomerModel();
            cm.setFullName(fullName);
            cm.setUserId(userId);
            cm.setGmail(gmail);
            cm.setPhoneno(phoneno);
            cm.setPassWord(passWord);

            // after setting the values the values are printed here from the customer model 
            System.out.println(cm.getFullName());
            System.out.println(cm.getUserId());
            System.out.println(cm.getPassWord());

            // calling the insert method 
            String status = cd.insert(cm);
            if (status.equals("Success")) {
                RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                rd.include(request, response);
            } else {
                request.setAttribute("errorMessage", "Registration failed. Please try again.");
                RequestDispatcher rd = request.getRequestDispatcher("/registration.jsp");
                rd.include(request, response);
            }
        } else if (checkUserIDStatus.equals("Failure")) {
            request.setAttribute("errorMessage", "Username is already taken. Please choose another.");
            RequestDispatcher rd = request.getRequestDispatcher("/registration.jsp");
            rd.include(request, response);
        } else {
            request.setAttribute("errorMessage", "An error occurred. Please try again later.");
            RequestDispatcher rd = request.getRequestDispatcher("/registration.jsp");
            rd.include(request, response);
        }
    }
}
