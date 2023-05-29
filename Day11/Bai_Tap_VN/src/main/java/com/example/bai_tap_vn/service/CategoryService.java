package com.example.bai_tap_vn.service;

import com.example.bai_tap_vn.model.Category;

import java.util.ArrayList;
import java.util.List;

public class CategoryService {
    private final List<Category> categoryList;
    private static CategoryService categoryService;

    private CategoryService() {
        categoryList = new ArrayList<>();
        categoryList.add(new Category(1L,"1A"));
        categoryList.add(new Category(2L,"2A"));
        categoryList.add(new Category(3L,"3A"));
    }

    public static CategoryService getInstance(){
        if (categoryService == null) {
            categoryService = new CategoryService();
        }
        return categoryService;
    }

    public List<Category> getCategoryList(){
        return categoryList;
    }

    public void  addCategory( Category category){
        categoryList.add(category);
    }

    public Category getById(Long id) {
        for (Category category : categoryList) {
            if (category.getId()==(id)) {
                return category;
            }
        }
        return null;
    }

    public void deleteById(Long id) {
        Category category = getById(id);
        if (category != null) {
            categoryList.remove(category);
        }
    }
}
