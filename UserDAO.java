package com.applestore.dao;


import com.applestore.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;



import java.sql.*;

public class UserDAO {
    private Connection con;

    public UserDAO() {
        try {
            con = DBConnection.getConnection();
            if (con == null) {
                System.out.println("❌ DB connection is null.");
            } else {
                System.out.println("✅ DB connected.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public User authenticate(String email, String password) {
        try {
            String sql = "SELECT * FROM users WHERE email=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setAddress(rs.getString("address"));
                u.setRole(rs.getString("role"));
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean register(User user) {
        try {
            String query = "INSERT INTO users (name, email, password, address) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword()); // 🔒 Encrypt in real use
            ps.setString(4, user.getAddress());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public int getUserCount() {
        try {
            String sql = "SELECT COUNT(*) FROM users";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM users";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setAddress(rs.getString("address"));
                u.setRole(rs.getString("role"));
                list.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public boolean updateUser(User user) {
        try {
            String query = "UPDATE users SET name=?, address=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getAddress());
            ps.setInt(3, user.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    


}
