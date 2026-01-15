package com.foodmate.daoimpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.foodmate.config.DatabaseConnection;
import com.foodmate.dao.RestaurantDAO;
import com.foodmate.model.Restaurant;

public class RestaurantDAOImpl implements RestaurantDAO {
    
    @Override
    public int addRestaurant(Restaurant restaurant) {
        String sql = "INSERT INTO restaurants (restaurantName, address, phone, email, description, deliveryTime, imageUrl, rating, isActive) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            pstmt.setString(1, restaurant.getRestaurantName());
            pstmt.setString(2, restaurant.getAddress());
            pstmt.setString(3, restaurant.getPhone());
            pstmt.setString(4, restaurant.getEmail());
            pstmt.setString(5, restaurant.getDescription());
            pstmt.setString(6, restaurant.getDeliveryTime());
            pstmt.setString(7, restaurant.getImageUrl());
            pstmt.setDouble(8, restaurant.getRating());
            pstmt.setBoolean(9, restaurant.isActive());

            
            int affectedRows = pstmt.executeUpdate();
            
            if (affectedRows > 0) {
                try (ResultSet rs = pstmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        return rs.getInt(1);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    @Override
    public Restaurant getRestaurantById(int restaurantId) {
        String sql = "SELECT * FROM restaurants WHERE restaurantId = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, restaurantId);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return extractRestaurantFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    @Override
    public List<Restaurant> getAllRestaurants() {
        List<Restaurant> restaurants = new ArrayList<>();
        String sql = "SELECT * FROM restaurants ORDER BY restaurantName";
        
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                restaurants.add(extractRestaurantFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return restaurants;
    }
   
    @Override
    public List<Restaurant> getOpenRestaurants() {
        List<Restaurant> restaurants = new ArrayList<>();
        String sql = "SELECT * FROM restaurants WHERE isActive = true ORDER BY restaurantName";
        
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                restaurants.add(extractRestaurantFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return restaurants;
    }
    
    @Override
    public boolean updateRestaurant(Restaurant restaurant) {
        String sql = "UPDATE restaurants SET restaurantName = ?, address = ?, phone = ?, email = ?,description = ?,deliveryTime = ?,imageUrl = ?, rating = ?,isActive = ? WHERE restaurantId = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, restaurant.getRestaurantName());
            pstmt.setString(2, restaurant.getAddress());
            pstmt.setString(3, restaurant.getPhone());
            pstmt.setString(4, restaurant.getEmail());
            pstmt.setString(5, restaurant.getDescription());
            pstmt.setString(6, restaurant.getDeliveryTime());
            pstmt.setString(7, restaurant.getImageUrl());
            pstmt.setDouble(8, restaurant.getRating());
            pstmt.setBoolean(9, restaurant.isActive());


            pstmt.setInt(10, restaurant.getRestaurantId());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    @Override
    public boolean deleteRestaurant(int restaurantId) {
        String sql = "DELETE FROM restaurants WHERE restaurantId = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, restaurantId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    @Override
    public boolean toggleRestaurantStatus(int restaurantId, boolean isActive) {
        String sql = "UPDATE restaurants SET isActive = ? WHERE restaurantId = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setBoolean(1, isActive);
            pstmt.setInt(2, restaurantId);
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
   
    
    private Restaurant extractRestaurantFromResultSet(ResultSet rs) throws SQLException {
        Restaurant restaurant = new Restaurant();
        restaurant.setRestaurantId(rs.getInt("restaurantId"));
        restaurant.setRestaurantName(rs.getString("restaurantName"));
        restaurant.setAddress(rs.getString("address"));
        restaurant.setPhone(rs.getString("phone"));
        restaurant.setEmail(rs.getString("email")); 
        restaurant.setImageUrl(rs.getString("imageUrl"));
        restaurant.setDescription(rs.getString("description"));
        restaurant.setDeliveryTime(rs.getString("deliveryTime"));
       
        restaurant.setRating(rs.getDouble("rating"));

        restaurant.setActive(rs.getBoolean("isActive"));
        return restaurant;
    }
}