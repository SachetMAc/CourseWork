package com.applestore.dao;

import com.applestore.model.Product;
import java.sql.*;
import java.util.*;

public class ProductDAO {
    private Connection con;

    public ProductDAO() {
        try {
            this.con = DBConnection.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM products";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setStock(rs.getInt("stock"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Product getProductById(int id) {
        try {
            String query = "SELECT * FROM products WHERE id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setStock(rs.getInt("stock"));
                p.setImage(rs.getString("image"));
                return p;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

//Count all products
public int getTotalProductCount() {
 try {
     String sql = "SELECT COUNT(*) FROM products";
     PreparedStatement ps = con.prepareStatement(sql);
     ResultSet rs = ps.executeQuery();
     if (rs.next()) return rs.getInt(1);
 } catch (Exception e) {
     e.printStackTrace();
 }
 return 0;
}

//Add new product
public boolean addProduct(Product p) {
 try {
     String sql = "INSERT INTO products (name, description, price, stock, image) VALUES (?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, p.getName());
     ps.setString(2, p.getDescription());
     ps.setDouble(3, p.getPrice());
     ps.setInt(4, p.getStock());
     ps.setString(5, p.getImage());
     return ps.executeUpdate() > 0;
 } catch (Exception e) {
     e.printStackTrace();
 }
 return false;
}

//Update product
public boolean updateProduct(Product p) {
 try {
     String sql = "UPDATE products SET name=?, description=?, price=?, stock=?, image=? WHERE id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, p.getName());
     ps.setString(2, p.getDescription());
     ps.setDouble(3, p.getPrice());
     ps.setInt(4, p.getStock());
     ps.setString(5, p.getImage());
     ps.setInt(6, p.getId());
     return ps.executeUpdate() > 0;
 } catch (Exception e) {
     e.printStackTrace();
 }
 return false;
}

//Delete product
public boolean deleteProduct(int id) {
 try {
     String sql = "DELETE FROM products WHERE id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, id);
     return ps.executeUpdate() > 0;
 } catch (Exception e) {
     e.printStackTrace();
 }
 return false;
}}
