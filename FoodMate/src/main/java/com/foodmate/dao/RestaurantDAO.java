package com.foodmate.dao;

import java.util.List;

import com.foodmate.model.Restaurant;
public interface RestaurantDAO {
	  int addRestaurant(Restaurant restaurant);
	    Restaurant getRestaurantById(int restaurantId);
	    List<Restaurant> getAllRestaurants();
	 // In RestaurantDAO.java
	    List<Restaurant> getOpenRestaurants(); // Change from getActiveRestaurants()
	    boolean updateRestaurant(Restaurant restaurant);
	    boolean deleteRestaurant(int restaurantId);
	    boolean toggleRestaurantStatus(int restaurantId, boolean isActive);
}
