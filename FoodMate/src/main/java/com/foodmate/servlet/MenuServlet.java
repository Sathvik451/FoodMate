package com.foodmate.servlet;

import java.io.IOException;
import java.util.List;

import com.foodmate.daoimpl.MenuDAOImpl;
import com.foodmate.model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    String rid = request.getParameter("restaurantId");
	    System.out.println("restaurantId = " + rid);

	    int restaurantId = Integer.parseInt(rid);

	    MenuDAOImpl dao = new MenuDAOImpl();
	    List<Menu> list = dao.getMenusByRestaurant(restaurantId);

	    request.setAttribute("allMenus", list);
	    request.getRequestDispatcher("menu.jsp").forward(request, response);
	    
	    
	    
	}


}