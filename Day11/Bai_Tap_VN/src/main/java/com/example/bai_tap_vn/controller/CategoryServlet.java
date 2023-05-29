package com.example.bai_tap_vn.controller;

import com.example.bai_tap_vn.model.Category;
import com.example.bai_tap_vn.service.CategoryService;
import com.example.bai_tap_vn.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CategoryServlet", urlPatterns = "/categories")
public class CategoryServlet extends HttpServlet {
    private final CategoryService categoryService = CategoryService.getInstance();
    private final ProductService productService = ProductService.getInstance();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createGet(request, response);
                break;
            case "update":
                updateGet(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            default:
                findAdd(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createPost(request, response);
                break;
            case "update":
                updatePost(request, response);
                break;
        }
    }

    private void findAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/category/home.jsp");
        request.setAttribute("categories", categoryService.getCategoryList());
        requestDispatcher.forward(request, response);
    }
    private void createGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
    private void createPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
    private void updateGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
    private void updatePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));

        Category category = categoryService.getById(id);
        if (category != null) {
            categoryService.deleteById(id);
            productService.deleteByClasses(category);
            response.sendRedirect("/categories");
        } else {
            response.sendRedirect("/404.jsp");
        }
    }
}
