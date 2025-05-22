package com.applestore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SalesDAO {

    private Connection con;

    public SalesDAO() {
        try {
            con = DBConnection.getConnection();
            if (con == null) {
                System.out.println("❌ DB connection is null in SalesDAO.");
            } else {
                System.out.println("✅ SalesDAO connected to DB.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Returns the total sales amount from all orders
    public double getTotalSales() {
        double total = 0.0;
        String query = "SELECT SUM(total_price) AS total_sales FROM orders";

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getDouble("total_sales");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return total;
    }
}
