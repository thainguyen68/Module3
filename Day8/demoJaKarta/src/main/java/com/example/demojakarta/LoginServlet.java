package com.example.demojakarta;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = "/login/*")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if ("admin".equals(username) && "admin".equals(password)) {
            String name = request.getParameter("username");
            request.setAttribute("name",name);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Admin.jsp");
            dispatcher.forward(request, response);
        } else {
//            RequestDispatcher dispatcher = request.getRequestDispatcher("User.jsp");
//            dispatcher.forward(request, response);
            response.sendRedirect("User.jsp");
        }
    }
}
