package com.foodmate.model;

public class Restaurant {
    private int restaurantId;
    private String restaurantName;
    private String address;
    private String phone;
    private String email;
    private String imageUrl;
    private boolean isActive;
    private String description; 
    private double rating;
    private String deliveryTime;  
    
    // Constructors
    public Restaurant() {}
    
    public Restaurant(String restaurantName, String address, String phone, String email,String imageUrl,String description,double rating,String deliveryTime) {
        this.restaurantName = restaurantName;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.imageUrl = imageUrl;
        this.description = description;
        this.deliveryTime = deliveryTime;
        this.rating = rating;
        this.isActive = true;
    }
    
    // Getters and Setters
    public int getRestaurantId() { return restaurantId; }
    public void setRestaurantId(int restaurantId) { this.restaurantId = restaurantId; }
    
    public String getRestaurantName() { return restaurantName; }
    public void setRestaurantName(String restaurantName) { this.restaurantName = restaurantName; }
    
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    
    public String getDeliveryTime() { return deliveryTime; }
    public void setDeliveryTime(String deliveryTime) { this.deliveryTime = deliveryTime; }
    
    public double getRating() {
        return rating;
    }
    public void setRating(double rating) {
        this.rating = rating;
    }

    public boolean isActive() { return isActive; }
    public void setActive(boolean isActive) { this.isActive = isActive; }
    
    @Override
	public String toString() {
		return "Restaurant [restaurantId=" + restaurantId + ", restaurantName=" + restaurantName + ", address="
				+ address + ", phone=" + phone + ", email=" + email + ", imageUrl=" + imageUrl + ", isActive="
				+ isActive + ", description=" + description + ", rating=" + rating + ", deliveryTime=" + deliveryTime
				+ "]";
	}
}