package com.foodmate.daoimpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.foodmate.config.DatabaseConnection;
import com.foodmate.dao.MenuDAO;
import com.foodmate.model.Menu;

public class MenuDAOImpl implements MenuDAO {
    
    @Override
    public int addMenu(Menu menu) {
        String sql = "INSERT INTO menu (menuName, description, price, category, isAvailable, imageUrl, rating) VALUES (?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            pstmt.setString(1, menu.getMenuName());
            pstmt.setString(2, menu.getDescription());
            pstmt.setDouble(3, menu.getPrice());
            pstmt.setString(4, menu.getCategory());
            pstmt.setBoolean(5, menu.isAvailable());
            pstmt.setString(6, menu.getImageUrl());
            pstmt.setDouble(7, menu.getRating());
            
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
    public Menu getMenuById(int menuId) {
        String sql = "SELECT * FROM menu WHERE menuId = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, menuId);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return extractMenuFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    @Override
    public List<Menu> getAllMenus() {
        List<Menu> menus = new ArrayList<>();
        String sql = "SELECT * FROM menu ORDER BY menuName";
        
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                menus.add(extractMenuFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menus;
    }
    
    @Override
    public List<Menu> getMenusByCategory(String category) {
        List<Menu> menus = new ArrayList<>();
        String sql = "SELECT * FROM menu WHERE category = ? ORDER BY menuName";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, category);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                menus.add(extractMenuFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menus;
    }
    
    @Override
    public List<Menu> getAvailableMenus() {
        List<Menu> menus = new ArrayList<>();
        String sql = "SELECT * FROM menu WHERE isAvailable = true ORDER BY menuName";
        
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                menus.add(extractMenuFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menus;
    }
    
    
    @Override
    public List<Menu> getMenusByRestaurant(int restaurantId) {

        List<Menu> menus = new ArrayList<>();
        String sql = "SELECT * FROM menu WHERE restaurantId = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, restaurantId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                menus.add(extractMenuFromResultSet(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return menus;
    }


    @Override
    public boolean updateMenu(Menu menu) {
    	String sql = "UPDATE menu SET menuName=?, description=?, price=?, category=?, isAvailable=?, imageUrl=?, rating=? WHERE menuId=?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
        	pstmt.setString(1, menu.getMenuName());
        	pstmt.setString(2, menu.getDescription());
        	pstmt.setDouble(3, menu.getPrice());
        	pstmt.setString(4, menu.getCategory());
        	pstmt.setBoolean(5, menu.isAvailable());
        	pstmt.setString(6, menu.getImageUrl());
        	pstmt.setDouble(7, menu.getRating());
        	pstmt.setInt(8, menu.getMenuId());
        	
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    @Override
    public boolean deleteMenu(int menuId) {
        String sql = "DELETE FROM menu WHERE menuId = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, menuId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    @Override
    public boolean updateMenuAvailability(int menuId, boolean isAvailable) {
        String sql = "UPDATE menu SET isAvailable = ? WHERE menuId = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setBoolean(1, isAvailable);
            pstmt.setInt(2, menuId);
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    private Menu extractMenuFromResultSet(ResultSet rs) throws SQLException {
        Menu menu = new Menu();
        menu.setMenuId(rs.getInt("menuId"));
        menu.setRestaurantId(rs.getInt("restaurantId"));
        menu.setMenuName(rs.getString("menuName"));
        menu.setDescription(rs.getString("description"));
        menu.setPrice(rs.getDouble("price"));
        menu.setCategory(rs.getString("category"));
        menu.setAvailable(rs.getBoolean("isAvailable"));
        menu.setImageUrl(rs.getString("imageUrl"));
        menu.setRating(rs.getDouble("rating"));
        menu.setCreatedDate(rs.getTimestamp("createdDate"));
        return menu;
    }
}