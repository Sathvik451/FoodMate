package com.foodmate.dao;

import java.util.List;

import com.foodmate.model.Order;
public interface OrderDAO {
	int createOrder(Order order);
    Order getOrderById(int orderId);
    List<Order> getOrdersByUserId(int userId);
    List<Order> getAllOrders();
    List<Order> getOrdersByStatus(String status);
    boolean updateOrderStatus(int orderId, String status);
    boolean updateOrder(Order order);
    boolean deleteOrder(int orderId);
    double getTotalRevenue();
    int getOrderCountByStatus(String status);
}
