package com.foodmate.dao;

import java.util.List;

import com.foodmate.model.Menu;
public interface MenuDAO {
    // CRUD operations
    int addMenu(Menu menu);
    Menu getMenuById(int menuId);
    List<Menu> getAllMenus();
    List<Menu> getMenusByCategory(String category);
    List<Menu> getAvailableMenus();
    List<Menu> getMenusByRestaurant(int restaurantId);

    boolean updateMenu(Menu menu);
    boolean deleteMenu(int menuId);
    boolean updateMenuAvailability(int menuId, boolean isAvailable);
}
