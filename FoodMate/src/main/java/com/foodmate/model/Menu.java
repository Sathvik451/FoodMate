package com.foodmate.model;

import java.util.Date;

public class Menu {
    private int menuId;
    private int restaurantId;
    private String menuName;
    private String description;
    private double price;
    private String category;
    private boolean isAvailable;
    private String imageUrl;
    private double rating;
    private Date createdDate;

   

    
    // Constructors
    public Menu() {}
    
    public Menu(String menuName, String description, double price, String category, double rating) {
        this.menuName = menuName;
        this.description = description;
        this.price = price;
        this.category = category;
        this.rating = rating;
        this.isAvailable = true;
    }
    
    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }
    // Getters and Setters
    public int getMenuId() { return menuId; }
    public void setMenuId(int menuId) { this.menuId = menuId; }
    
    public String getMenuName() { return menuName; }
    public void setMenuName(String menuName) { this.menuName = menuName; }
    
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    
    public boolean isAvailable() { return isAvailable; }
    public void setAvailable(boolean isAvailable) { this.isAvailable = isAvailable; }
    
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    
    public double getRating() {
        return rating;
    }
    public void setRating(double rating) {
        this.rating = rating;
    }
    
    public Date getCreatedDate() { return createdDate; }
    public void setCreatedDate(Date createdDate) { this.createdDate = createdDate; }
    
    @Override
    public String toString() {
        return "Menu [menuId=" + menuId + ", menuName=" + menuName + ", price=" + price + ", rating="+rating+", category=" + category + "]";
    }
}
