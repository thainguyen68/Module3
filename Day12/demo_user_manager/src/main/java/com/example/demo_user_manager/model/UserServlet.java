package com.example.demo_user_manager.model;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/users")
public class UserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                updateUserGet(request, response);
                break;
            case "delete":
                deleteGet(request,response);
                break;
            case "create":
                createUserGet(request, response);
                break;
            default:
                listUser(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                updateUserPost(request, response);
                break;
            case "create":
                createUserPost(request, response);
                break;
            case "delete":
                deletePost(request,response);
                break;
            default:
                listUser(request, response);
                break;
        }
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> listUser = UserDAO.selectAllUsers();
        request.setAttribute("listUser", listUser);
        request.getRequestDispatcher("users.jsp").forward(request, response);
    }

    private void createUserGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("create.jsp").forward(request, response);
    }

    private void createUserPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(name, email, country);
        UserDAO.insertUser(user);
        response.sendRedirect("users");
    }

    private void updateUserGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("user", UserDAO.selectUser(id));
        request.getRequestDispatcher("update.jsp").forward(request, response);
    }

    private void updateUserPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        int id = Integer.parseInt(request.getParameter("id"));
        User user = new User(id, name, email, country);
        UserDAO.updateUser(user);
        response.sendRedirect("users");
    }

    private void deleteGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

    }
    private void deletePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}