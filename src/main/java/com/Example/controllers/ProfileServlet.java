package com.Example.controllers;

import com.Example.dao.CustomerDao;
import com.Example.models.CustomerProfile;
import com.Example.models.CustomerLoginModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userID = (String) session.getAttribute("userId");
        if (userID == null || userID.isEmpty()) {
            response.sendRedirect("login.jsp");
            return;
        }

        CustomerDao csd = new CustomerDao();
        List<CustomerProfile> profileDetails = null;
        try {
            CustomerLoginModel customerLoginModel = new CustomerLoginModel();
            customerLoginModel.setUserId(userID);
            profileDetails = csd.profileDet(customerLoginModel);
        } catch (Exception e) {
            e.printStackTrace();
        }
       


        request.setAttribute("profileDetails", profileDetails);
        request.getRequestDispatcher("/profile.jsp").forward(request, response);
    }
}
