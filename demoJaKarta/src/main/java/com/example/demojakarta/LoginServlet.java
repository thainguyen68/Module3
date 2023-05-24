package com.example.demojakarta;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", urlPatterns = "/login/*")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

//        PrintWriter writer = response.getWriter();
//        writer.println("<html>");
//
//        if ("admin".equals(username) && "admin".equals(password)) {
//            writer.println("<h1 style=\"color: blue; display: block; " +
//                    "text-align: center; margin-top: 50px\">Welcome " + username + " to website</h1>");
//        } else if ("user".equals(username) && "user".equals(password)) {
//            writer.println("<h1 style=\"color: blue; display: block; " +
//                    "text-align: center; margin-top: 50px\">Welcome " + username + " to website</h1>");
//        } else {
//            writer.println("<h1 style=\"color: red; display: block; " +
//                    "text-align: center; margin-top: 50px\"> Login Error !!!</h1>");
//        }
//        writer.println("</html>");
//
//        writer.println("<html>");


        if ("admin".equals(username) && "admin".equals(password)) {
            String name = request.getParameter("username");
            request.setAttribute("name",name);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Admin.jsp");
            dispatcher.forward(request, response);
        } else {
            String name = request.getParameter("username");
            request.setAttribute("name1",name);
            RequestDispatcher dispatcher = request.getRequestDispatcher("User.jsp");
            dispatcher.forward(request, response);
        }
    }
}
