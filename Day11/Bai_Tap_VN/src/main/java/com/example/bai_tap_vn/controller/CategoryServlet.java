package com.example.bai_tap_vn.controller;

import com.example.bai_tap_vn.model.Category;
import com.example.bai_tap_vn.model.Product;
import com.example.bai_tap_vn.service.CategoryService;
import com.example.bai_tap_vn.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

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
//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/category/home.jsp");
//        request.setAttribute("categories", categoryService.getCategoryList());
//        requestDispatcher.forward(request, response);
        List<Category> categoryList = CategoryService.getInstance().getCategoryList();
        List<Product> productList = ProductService.getInstance().getProductList();
        for (Category category : categoryList) {
            int i = 0;
            for (Product product : productList) {
                if (category.getName().equals(product.getCategory().getName())) {
                    ++i;
                    category.setQuantity(i);
                }
            }
        }
        request.setAttribute("categories", categoryList);
        request.getRequestDispatcher("/category/home.jsp").forward(request, response);
    }


    private void createGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("categories", categoryService.getCategoryList());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/category/create.jsp");
        requestDispatcher.forward(request, response);
    }

    private void createPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        String name = request.getParameter("name");

        Category category = new Category(id,name);
        categoryService.addCategory(category);
        response.sendRedirect("/products");

    }

    private void updateGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));

        Category category = categoryService.getById(id);

        if (category != null) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/category/update.jsp");
            request.setAttribute("categories", category);
            requestDispatcher.forward(request, response);
        } else {
            response.sendRedirect("/404.jsp");
        }
    }

    private void updatePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        String name = request.getParameter("name");

        Category category = categoryService.getById(id);

        if (category != null) {
            category.setName(name);
            response.sendRedirect("/categories");
        } else {
            response.sendRedirect("/404.jsp");
        }
    }

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

    private  void countQuantity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
