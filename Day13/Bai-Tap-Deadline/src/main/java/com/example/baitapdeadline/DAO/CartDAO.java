package com.example.baitapdeadline.DAO;

import com.example.baitapdeadline.DAO.connection.MyConnection;
import com.example.baitapdeadline.model.Cart;
import com.example.baitapdeadline.model.Product;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {
    private Connection connection = MyConnection.getConnection();
    private static CartDAO cartDAO;



    public static CartDAO getInstance() {
        if (cartDAO == null) {
            cartDAO = new CartDAO();
        }
        return cartDAO;
    }

    public List<Cart> findAll() {
        List<Cart> cartList = new ArrayList<>();
        String query = "SELECT * FROM cart;";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int productId = resultSet.getInt("product_id");
                Product product = ProductDAO.getInstance().findById(productId);
                int quantity = resultSet.getInt("quantity");
                cartList.add(new Cart(id, product, quantity));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return cartList;
    }

    public Cart findById(int id) {
        Cart cart = null;
        String query = "select * from cart where id = ?;";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int productId = resultSet.getInt("product_id");
                Product product = ProductDAO.getInstance().findById(productId);
                int quantity = resultSet.getInt("quantity");
                cart = new Cart(id, product, quantity);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return cart;
    }

    public void addCart(Cart cart) {
        String query = "insert into cart(product_id,quantity) values (?,?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, cart.getProduct().getId());
            preparedStatement.setInt(2, cart.getQuantity());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateCart(Cart cart) {
        String query = "update cart set product_id = ?, quantity = ? where id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, cart.getProduct().getId());
            preparedStatement.setInt(2, cart.getQuantity());
            preparedStatement.setInt(3, cart.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteById(int id) {
        String query = "delete from cart where id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setLong(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public double getTotalPrice() {
        double totalPrice = 0;
        String query = "select sum(price * cart.quantity) as total_price from cart join product p on p.id = cart.product_id;";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                totalPrice = resultSet.getDouble("total_price");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalPrice;
    }

    public void updateCartQuantity(int id, int quantity) {
        String query = "update cart set quantity = quantity + ? where id = ? ";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, quantity);
            preparedStatement.setInt(2, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}