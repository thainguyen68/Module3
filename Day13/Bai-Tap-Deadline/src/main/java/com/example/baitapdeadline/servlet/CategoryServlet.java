package com.example.baitapdeadline.servlet;

import com.example.baitapdeadline.service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CategoryServlet", urlPatterns = "/categories")
public class CategoryServlet extends HttpServlet {
    private final CategoryService categoryService = CategoryService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCategoryGet(request, response);
                break;
            case "update":
                updateCategoryGet(request, response);
                break;
            case "delete":
                deleteCategory(request, response);
                break;
            default:
                findAddCategory(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCategoryPost(request, response);
                break;
            case "update":
                updateCategoryPost(request, response);
                break;
        }
    }

    private void findAddCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/category/home.jsp");
        request.setAttribute("category", categoryService.findAll());
        requestDispatcher.forward(request, response);
    }

    private void createCategoryGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("/category/create.jsp");
    }

    private void createCategoryPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        categoryService.save(request);
        response.sendRedirect("/categories");
    }

    private void updateCategoryGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        if (categoryService.checkById(id)) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/category/update.jsp");
            request.setAttribute("category", categoryService.getById(id));
            requestDispatcher.forward(request, response);
        }
    }

    private void updateCategoryPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        if (categoryService.checkById(id)) {
            categoryService.save(request);
            response.sendRedirect("/categories");
        }
        else {
            response.sendRedirect("/404.jsp");
        }
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        if (categoryService.checkById(id)){
            categoryService.deleteById(id);
            response.sendRedirect("/categories");
        }
        else {
            response.sendRedirect("/404.jsp");
        }
    }


}
