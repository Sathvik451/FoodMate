package com.foodmate.servlet;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.foodmate.daoimpl.RestaurantDAOImpl;
import com.foodmate.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/restaurant")
public class RestaurantServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RestaurantDAOImpl restaurantDAO = new RestaurantDAOImpl();
        List<Restaurant> allRestaurants = restaurantDAO.getAllRestaurants();

        if (allRestaurants != null) {
            request.setAttribute("allRestaurants", allRestaurants);
        }

        RequestDispatcher rd = request.getRequestDispatcher("restaurant.jsp");
        rd.forward(request, response);
    }
}

