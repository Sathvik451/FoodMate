package com.foodmate.daoimpl;

import com.foodmate.dao.OrderItemDAO;
import com.foodmate.model.OrderItem;
import com.foodmate.config.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderItemDAOImpl implements OrderItemDAO {

    @Override
    public int addOrderItem(OrderItem orderItem) {

        String sql = "INSERT INTO orderItems(orderId, menuId, quantity, price) VALUES (?, ?, ?, ?)";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, orderItem.getOrderId());
            ps.setInt(2, orderItem.getMenuId());
            ps.setInt(3, orderItem.getQuantity());
            ps.setDouble(4, orderItem.getPrice());

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) return rs.getInt(1);

        } catch (Exception e) {
            System.err.println("Error adding order item: " + e.getMessage());
        }
        return 0;
    }

    @Override
    public OrderItem getOrderItemById(int orderItemId) {

        String sql = "SELECT *, (quantity * price) AS subTotal FROM orderItems WHERE orderItemId=?";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, orderItemId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) return extractOrderItem(rs);

        } catch (Exception e) {
            System.err.println("Error fetching order item: " + e.getMessage());
        }
        return null;
    }

    @Override
    public boolean updateOrderItem(OrderItem orderItem) {

        String sql = "UPDATE orderItems SET orderId=?, menuId=?, quantity=?, price=? WHERE orderItemId=?";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, orderItem.getOrderId());
            ps.setInt(2, orderItem.getMenuId());
            ps.setInt(3, orderItem.getQuantity());
            ps.setDouble(4, orderItem.getPrice());
            ps.setInt(5, orderItem.getOrderItemId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.err.println("Error updating order item: " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean deleteOrderItem(int orderItemId) {

        String sql = "DELETE FROM orderItems WHERE orderItemId=?";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, orderItemId);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.err.println("Error deleting order item: " + e.getMessage());
        }
        return false;
    }

    @Override
    public List<OrderItem> getAllOrderItems() {

        List<OrderItem> list = new ArrayList<>();
        String sql = "SELECT *, (quantity * price) AS subTotal FROM orderItems ORDER BY orderItemId";

        try (Connection con = DatabaseConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) {
                list.add(extractOrderItem(rs));
            }

        } catch (Exception e) {
            System.err.println("Error fetching all order items: " + e.getMessage());
        }
        return list;
    }

    @Override
    public List<OrderItem> getOrderItemsByOrderId(int orderId) {

        List<OrderItem> list = new ArrayList<>();
        String sql = "SELECT *, (quantity * price) AS subTotal FROM orderItems WHERE orderId=? ORDER BY orderItemId";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(extractOrderItem(rs));
            }

        } catch (Exception e) {
            System.err.println("Error fetching order items: " + e.getMessage());
        }
        return list;
    }

    // helper
    private OrderItem extractOrderItem(ResultSet rs) throws SQLException {

        OrderItem item = new OrderItem();
        item.setOrderItemId(rs.getInt("orderItemId"));
        item.setOrderId(rs.getInt("orderId"));
        item.setMenuId(rs.getInt("menuId"));
        item.setQuantity(rs.getInt("quantity"));
        item.setPrice(rs.getDouble("price"));
        return item;
    }

	@Override
	public boolean deleteOrderItemsByOrderId(int orderId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<OrderItem> getOrderItemsWithMenuDetails(int orderId) {
		// TODO Auto-generated method stub
		return null;
	}
}
