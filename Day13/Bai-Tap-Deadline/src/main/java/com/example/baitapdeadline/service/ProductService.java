package com.example.baitapdeadline.service;

import com.example.baitapdeadline.DAO.ProductDAO;
import com.example.baitapdeadline.model.Category;
import com.example.baitapdeadline.model.Product;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class ProductService {
    private static ProductService productService;
    private final  CategoryService categoryService = CategoryService.getInstance();
    private final ProductDAO productDAO;

    public ProductService() {
        productDAO = new ProductDAO();
    }

    public static ProductService getProductService() {
        if (productService == null) {
            productService = new ProductService();
        }
        return productService;
    }

    public List<Product> findAll(){
        return productDAO.findAll();
    }

    public void save(HttpServletRequest request) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int categoryID =Integer.parseInt(request.getParameter("category"));
        Category category = categoryService.getById(categoryID);
        if (id != null) {
            int idUpdate = Integer.parseInt(id);
            productDAO.updateProduct(new Product(idUpdate, name, price, quantity, category));
        } else {
            productDAO.addProduct(new Product(name, price, quantity, category));
        }
    }

    public Product getById(int id) {
        return productDAO.findById(id);
    }

    public void deleteById(HttpServletRequest request) {
      int id = Integer.parseInt(request.getParameter("id"));
        productDAO.deleteById(id);
    }

    public List<Product> searchByName(HttpServletRequest request) {
        String search = request.getParameter("search");
        return productDAO.searchByName(search);
    }

    public boolean checkById(int id) {
        Product product = productDAO.findById(id);
        return product != null;
    }
}
