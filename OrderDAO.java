package com.applestore.dao;
import com.applestore.model.Order;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    private Connection con;

    public OrderDAO() {
        try {
            this.con = DBConnection.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Dummy method - total order count
    public int getTotalOrderCount() {
        try {
            String sql = "SELECT COUNT(*) FROM orders";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Dummy method - total sales amount
    public double getTotalSales() {
        try {
            String sql = "SELECT SUM(total_amount) FROM orders";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getDouble(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    public List<Order> getOrdersByUserId(int userId) {
        List<Order> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM orders WHERE user_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setUserId(rs.getInt("user_id"));
                o.setTotalAmount(rs.getDouble("total_amount"));
                o.setCreatedAt(rs.getTimestamp("created_at"));
                list.add(o);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

}
