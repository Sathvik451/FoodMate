package com.foodmate.servlet;

import java.io.IOException;
import java.sql.Timestamp;

import com.foodmate.daoimpl.OrderDAOImpl;
import com.foodmate.model.Cart;
import com.foodmate.model.CartItem;
import com.foodmate.model.Order;
import com.foodmate.model.OrderItem;
import com.foodmate.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


	
	@WebServlet("/checkout")
	public class CheckOutServlet extends HttpServlet{
	
	@Override
    protected  void doPost(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException {
		
		HttpSession session=req.getSession();
		Cart cart =(Cart)session.getAttribute("cart");
		
		User user=(User)session.getAttribute("user");
		int restaurantId=(Integer)session.getAttribute("oldRestaurantId");
		
		String address=req.getParameter("address");
		String paymentMethod=req.getParameter("paymentMethod");
		
		
		if(user== null) {
			RequestDispatcher rd=req.getRequestDispatcher("login.html");
			rd.forward(req,resp);
		}
		
		if(cart != null && user!=null && cart.getItems().isEmpty()) {
			
		Order order=new Order(restaurantId, restaurantId, restaurantId, paymentMethod);	
			
		order.setUserId(user.getUserId());	
		order.setRestaurantId(restaurantId);	
		order.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		order.setDeliveryAddress("adress");	
		order.setPaymentMode(paymentMethod);	
			
		double totalAmount=0.0;
		for(CartItem item : cart.getItems().values()) {
			totalAmount=totalAmount +item.getQuantity()* item.getPrice();
		}
		
		
		order.setTotalAmount(totalAmount);
		OrderDAOImpl orderDAOImpl=new OrderDAOImpl();	
		int orderId=orderDAOImpl.createOrder(order);
		for(CartItem item : cart.getItems().values()) {
		int itemId=item.getItemId();
		int quantity=item.getQuantity();
		
		
	    OrderItem orderItem=new OrderItem();
		orderItem.setMenuId(itemId);
		
		
		
		}

		
		session.removeAttribute("cart");
		session.removeAttribute("oldRestaurantId");
		resp.sendRedirect("oredrConformation");
		
		}else {
			resp.sendRedirect("Cart.jsp");
			
			
		}
		
		
		
		
		
		
		
		
}
}
