package com.example.baitapdeadline.service;

import com.example.baitapdeadline.DAO.CategoryDAO;
import com.example.baitapdeadline.model.Category;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class CategoryService {
    private final CategoryDAO categoryDAO;

    private static CategoryService categoryService;

    public CategoryService() {
        categoryDAO = new CategoryDAO();
    }

    public static CategoryService getInstance() {
        if (categoryService == null) {
            categoryService = new CategoryService();
        }
        return categoryService;
    }

    public List<Category> findAll() {
        return categoryDAO.findAll();
    }

    public Category getById(int id) {
        return categoryDAO.findById(id);
    }

    public void deleteById(int id) {
        categoryDAO.deleteById(id);
    }

    public boolean checkById(int id) {
        Category category = categoryService.getById(id);
        return category != null;
    }

    public void save(HttpServletRequest request) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        if (id != null) {
            int idUpdate = Integer.parseInt(id);
            categoryDAO.updateCategory(new Category(idUpdate, name));
        } else {
            categoryDAO.addCategory(new Category(name));
        }
    }

}
