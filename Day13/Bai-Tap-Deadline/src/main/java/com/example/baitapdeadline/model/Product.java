package com.example.baitapdeadline.model;

public class Product {
    private int id;
    private String name;
    private double price;
    private int quantity;
    private Category Category;

    public Product(int id, String name, double price, int quantity, Category category) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        Category = category;
    }
    public Product( String name, double price, int quantity, Category category) {
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        Category = category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public com.example.baitapdeadline.model.Category getCategory() {
        return Category;
    }

    public void setCategory(com.example.baitapdeadline.model.Category category) {
        Category = category;
    }
}
