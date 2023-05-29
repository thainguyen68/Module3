package com.example.bai_tap_vn.service;

import com.example.bai_tap_vn.model.Category;
import com.example.bai_tap_vn.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductService {
    private final List<Product> productList;
    private static ProductService productService;
    private final Product product = new Product();

    public ProductService() {
        productList = new ArrayList<>();
        productList.add(new Product(1L,"ip1",6.8,product.getDate(),new Category(1L,"1A")));
    }

    public static ProductService getInstance() {
        if (productService == null) {
            productService = new ProductService();
        }
        return productService;
    }

    public List<Product> getProductList() {
        return productList;
    }
    public static ProductService getProductService() {
        return productService;
    }

    public void addProduct(Product product) {
        productList.add(product);
    }

    public Product getById(Long id) {
        for (Product p : productList) {
            if (p.getId()==(id)) {
                return p;
            }
        }
        return null;
    }

    public void deleteById(Long id) {
        Product product = getById(id);
        if (product != null) {
            productList.remove(product);
        }
    }

    public List<Product> searchByName(String name) {
        List<Product> productsSearch = new ArrayList<>();
        for (Product product : productList) {
            if (product.getName().toLowerCase().contains(name.toLowerCase())) {
                productsSearch.add(product);
            }
        }
        return productsSearch;
    }

    public void deleteByClasses(Category category) {
        List<Product> productsDelete = new ArrayList<>();
        for (Product p : productList) {
            if (p.getCategory().equals(category)) {
                productsDelete.add(p);
            }
        }
        productList.removeAll(productsDelete);
    }

}
