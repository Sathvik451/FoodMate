package com.foodmate.dao;

import java.util.List;

import com.foodmate.model.OrderItem;
public interface OrderItemDAO {
	 int addOrderItem(OrderItem item);
    List<OrderItem> getOrderItemsByOrderId(int orderId);
    OrderItem getOrderItemById(int orderItemId);
    boolean updateOrderItem(OrderItem orderItem);
    boolean deleteOrderItem(int orderItemId);
    boolean deleteOrderItemsByOrderId(int orderId);
    List<OrderItem> getOrderItemsWithMenuDetails(int orderId);
	List<OrderItem> getAllOrderItems();
}
