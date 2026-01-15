package com.foodmate.main;

import com.foodmate.dao.*;
import com.foodmate.daoimpl.*;
import com.foodmate.model.*;

import java.util.List;
import java.util.Scanner;

public class FoodMateMain {
    private static Scanner scanner = new Scanner(System.in);
    private static UserDAO userDAO = new UserDAOImpl();
    private static MenuDAO menuDAO = new MenuDAOImpl();

    private static OrderDAO orderDAO = new OrderDAOImpl();
    private static OrderItemDAO orderItemDAO = new OrderItemDAOImpl(); // IMPORTANT
    private static RestaurantDAO restaurantDAO = new RestaurantDAOImpl();

    public static void main(String[] args) {
        System.out.println("========== FOODSPRINT FOOD DELIVERY SYSTEM ==========");
        
        boolean exit = false;
        while (!exit) {
            System.out.println("\n=== MAIN MENU ===");
            System.out.println("1. User Management");
            System.out.println("2. Menu Management");
            System.out.println("3. Restaurant Management");
            System.out.println("4. Order Management");
            System.out.println("5. Order Items Management");
            System.out.println("6. Test All Operations");
            System.out.println("7. Exit");
            System.out.print("Enter your choice: ");
            
            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume newline
            
            switch (choice) {
                case 1:
                    userManagement();
                    break;
                case 2:
                    menuManagement();
                    break;
                case 3:
                    restaurantManagement();
                    break;
                case 4:
                    orderManagement();
                    break;
                case 5:
                    orderItemManagement();
                    break;
                case 6:
                    testAllOperations();
                    break;
                case 7:
                    exit = true;
                    System.out.println("Thank you for using FoodSprint!");
                    break;
                default:
                    System.out.println("Invalid choice! Please try again.");
            }
        }
        scanner.close();
    }
    
    private static void userManagement() {
        boolean back = false;
        while (!back) {
            System.out.println("\n=== USER MANAGEMENT ===");
            System.out.println("1. Add User");
            System.out.println("2. Get User by ID");
            System.out.println("3. Get User by Username");
            System.out.println("4. Get All Users");
            System.out.println("5. Update User");
            System.out.println("6. Delete User");
            System.out.println("7. Authenticate User");
            System.out.println("8. Check Username Exists");
            System.out.println("9. Back to Main Menu");
            System.out.print("Enter your choice: ");
            
            int choice = scanner.nextInt();
            scanner.nextLine();
            
            switch (choice) {
                case 1:
                    addUser();
                    break;
                case 2:
                    getUserById();
                    break;
                case 3:
                    getUserByUsername();
                    break;
                case 4:
                    getAllUsers();
                    break;
                case 5:
                    updateUser();
                    break;
                case 6:
                    deleteUser();
                    break;
                case 7:
                    authenticateUser();
                    break;
                case 8:
                    checkUsernameExists();
                    break;
                case 9:
                    back = true;
                    break;
                default:
                    System.out.println("Invalid choice!");
            }
        }
    }
    
    private static void addUser() {
        System.out.println("\n--- Add New User ---");
        System.out.print("Enter username: ");
        String username = scanner.nextLine();
        System.out.print("Enter password: ");
        String password = scanner.nextLine();
        System.out.print("Enter phone: ");
        String phone = scanner.nextLine();
        System.out.print("Enter address: ");
        String address = scanner.nextLine();
        System.out.print("Enter email: ");
        String email = scanner.nextLine();
        System.out.print("Enter role (customer/admin): ");
        String role = scanner.nextLine();
        
        User user = new User(username, password, phone, address, email);
        user.setRole(role);
        
        int userId = userDAO.addUser(user);
        if (userId > 0) {
            System.out.println("User added successfully with ID: " + userId);
        } else {
            System.out.println("Failed to add user!");
        }
    }
    
    private static void getUserById() {
        System.out.print("Enter User ID: ");
        int userId = scanner.nextInt();
        scanner.nextLine();
        
        User user = userDAO.getUserById(userId);
        if (user != null) {
            System.out.println("User Found: " + user);
        } else {
            System.out.println("User not found!");
        }
    }
    
    private static void getAllUsers() {
        List<User> users = userDAO.getAllUsers();
        System.out.println("\n--- All Users ---");
        if (users.isEmpty()) {
            System.out.println("No users found!");
        } else {
            for (User user : users) {
                System.out.println(user);
            }
        }
    }
    
    private static void menuManagement() {
        boolean back = false;
        while (!back) {
            System.out.println("\n=== MENU MANAGEMENT ===");
            System.out.println("1. Add Menu Item");
            System.out.println("2. Get Menu Item by ID");
            System.out.println("3. Get All Menu Items");
            System.out.println("4. Get Menu by Category");
            System.out.println("5. Get Available Menu Items");
            System.out.println("6. Update Menu Item");
            System.out.println("7. Delete Menu Item");
            System.out.println("8. Back to Main Menu");
            System.out.print("Enter your choice: ");
            
            int choice = scanner.nextInt();
            scanner.nextLine();
            
            switch (choice) {
                case 1:
                    addMenuItem();
                    break;
                case 2:
                    getMenuById();
                    break;
                case 3:
                    getAllMenuItems();
                    break;
                case 4:
                    getMenuByCategory();
                    break;
                case 5:
                    getAvailableMenuItems();
                    break;
                case 6:
                    updateMenuItem();
                    break;
                case 7:
                    deleteMenuItem();
                    break;
                case 8:
                    back = true;
                    break;
                default:
                    System.out.println("Invalid choice!");
            }
        }
    }
    
    private static void addMenuItem() {
        System.out.println("\n--- Add New Menu Item ---");
        System.out.print("Enter menu name: ");
        String menuName = scanner.nextLine();
        System.out.print("Enter description: ");
        String description = scanner.nextLine();
        System.out.print("Enter price: ");
        double price = scanner.nextDouble();
        scanner.nextLine();
        System.out.print("Enter rating: ");
        double rating = scanner.nextDouble();
        scanner.nextLine();
        System.out.print("Enter category: ");
        String category = scanner.nextLine();
        System.out.print("Is available (true/false): ");
        boolean isAvailable = scanner.nextBoolean();
        scanner.nextLine();
        
        Menu menu = new Menu(menuName, description, price, category,rating);
        menu.setAvailable(isAvailable);
       
        int menuId = menuDAO.addMenu(menu);
        if (menuId > 0) {
            System.out.println("Menu item added successfully with ID: " + menuId);
        } else {
            System.out.println("Failed to add menu item!");
        }
    }
    
    private static void orderManagement() {
        boolean back = false;
        while (!back) {
            System.out.println("\n=== ORDER MANAGEMENT ===");
            System.out.println("1. Create Order");
            System.out.println("2. Get Order by ID");
            System.out.println("3. Get Orders by User ID");
            System.out.println("4. Get All Orders");
            System.out.println("5. Get Orders by Status");
            System.out.println("6. Update Order Status");
            System.out.println("7. Get Total Revenue");
            System.out.println("8. Back to Main Menu");
            System.out.print("Enter your choice: ");
            
            int choice = scanner.nextInt();
            scanner.nextLine();
            
            switch (choice) {
                case 1:
                    createOrder();
                    break;
                case 2:
                    getOrderById();
                    break;
                case 3:
                    getOrdersByUserId();
                    break;
                case 4:
                    getAllOrders();
                    break;
                case 5:
                    getOrdersByStatus();
                    break;
                case 6:
                    updateOrderStatus();
                    break;
                case 7:
                    getTotalRevenue();
                    break;
                case 8:
                    back = true;
                    break;
                default:
                    System.out.println("Invalid choice!");
            }
        }
    }
    
    private static void createOrder() {
        System.out.println("\n--- Create New Order ---");
        System.out.print("Enter User ID: ");
        int userId = scanner.nextInt();
        System.out.print("Enter Restaurant ID: ");
        int restaurantId = scanner.nextInt();
        System.out.print("Enter Total Amount: ");
        double totalAmount = scanner.nextDouble();
        scanner.nextLine();
        System.out.print("Enter Payment Mode: ");
        String paymentMode = scanner.nextLine();
        System.out.print("Enter Delivery Address: ");
        String deliveryAddress = scanner.nextLine();
        
        
        Order order = new Order(userId, restaurantId, totalAmount, deliveryAddress);
        order.setPaymentMode(paymentMode);
        
        int orderId = orderDAO.createOrder(order);
        if (orderId > 0) {
            System.out.println("Order created successfully with ID: " + orderId);
        } else {
            System.out.println("Failed to create order!");
        }
    }
    
    private static void getAllOrders() {
    	 List<Order> orders = orderDAO.getAllOrders();
         System.out.println("\n--- All Orders ---");
         if (orders.isEmpty()) {
             System.out.println("No orders found!");
         } else {
             for (Order order : orders) {
                 System.out.println(order);
             }
        }
    }
    
    private static void testAllOperations() {
        System.out.println("\n=== TESTING ALL OPERATIONS ===\n");
        
        // Test User Operations
        System.out.println("1. Testing User Operations:");
        User testUser = new User("testuser", "testpass", "1234567890", "Test Address", "test@email.com");
        int userId = userDAO.addUser(testUser);
        System.out.println("Added User with ID: " + userId);
        
        User retrievedUser = userDAO.getUserById(userId);
        System.out.println("Retrieved User: " + retrievedUser);
        
        // Test Menu Operations
        System.out.println("\n2. Testing Menu Operations:");
        Menu testMenu = new Menu("Test Burger", "Delicious test burger", 9.99, "Burger", 5.5);
        int menuId = menuDAO.addMenu(testMenu);
        System.out.println("Added Menu Item with ID: " + menuId);
        
        List<Menu> menus = menuDAO.getAllMenus();
        System.out.println("Total Menu Items: " + menus.size());
        
        // Test Restaurant Operations
        System.out.println("\n3. Testing Restaurant Operations:");
        Restaurant testRestaurant = new Restaurant("Test Restaurant","Test Location","5555555555",
        		 "test@restaurant.com","Test image","Test description",5.5,"30 mins");


        int restaurantId = restaurantDAO.addRestaurant(testRestaurant);
        System.out.println("Added Restaurant with ID: " + restaurantId);
        
        // Test Order Operations
        System.out.println("\n4. Testing Order Operations:");
        Order testOrder = new Order(userId, restaurantId, 29.97, "Test Delivery Address");
        testOrder.setPaymentMode("Cash");
        int orderId = orderDAO.createOrder(testOrder);
        System.out.println("Created Order with ID: " + orderId);
        
        // Test OrderItem Operations
        System.out.println("\n5. Testing OrderItem Operations:");
        OrderItem testOrderItem = new OrderItem(orderId, menuId, 2, 9.99);
        int orderItemId = orderItemDAO.addOrderItem(testOrderItem);
        System.out.println("Added OrderItem with ID: " + orderItemId);
        
        // Display Statistics
        System.out.println("\n=== SYSTEM STATISTICS ===");
        System.out.println("Total Users: " + userDAO.getAllUsers().size());
        System.out.println("Total Menu Items: " + menuDAO.getAllMenus().size());
        System.out.println("Total Restaurants: " + restaurantDAO.getAllRestaurants().size());
        System.out.println("Total Orders: " + orderDAO.getAllOrders().size());
        System.out.println("Total Revenue: $" + orderDAO.getTotalRevenue());
        
        System.out.println("\nAll operations tested successfully!");
    }
    
    // Other methods for the remaining operations...
    private static void getUserByUsername() {
        System.out.print("Enter Username: ");
        String username = scanner.nextLine();
        
        User user = userDAO.getUserByUsername(username);
        if (user != null) {
            System.out.println("User Found: " + user);
        } else {
            System.out.println("User not found!");
        }
    }
    
    private static void updateUser() {
        System.out.print("Enter User ID to update: ");
        int userId = scanner.nextInt();
        scanner.nextLine();
        
        User user = userDAO.getUserById(userId);
        if (user != null) {
            System.out.print("Enter new phone: ");
            user.setPhone(scanner.nextLine());
            System.out.print("Enter new address: ");
            user.setAddress(scanner.nextLine());
            System.out.print("Enter new email: ");
            user.setEmail(scanner.nextLine());
            
            if (userDAO.updateUser(user)) {
                System.out.println("User updated successfully!");
            } else {
                System.out.println("Failed to update user!");
            }
        } else {
            System.out.println("User not found!");
        }
    }
    
    private static void deleteUser() {
        System.out.print("Enter User ID to delete: ");
        int userId = scanner.nextInt();
        scanner.nextLine();
        
        if (userDAO.deleteUser(userId)) {
            System.out.println("User deleted successfully!");
        } else {
            System.out.println("Failed to delete user!");
        }
    }
    
    private static void authenticateUser() {
        System.out.print("Enter username: ");
        String username = scanner.nextLine();
        System.out.print("Enter password: ");
        String password = scanner.nextLine();
        
        if (userDAO.authenticateUser(username, password)) {
            System.out.println("Authentication successful!");
        } else {
            System.out.println("Authentication failed!");
        }
    }
    
    private static void checkUsernameExists() {
        System.out.print("Enter username to check: ");
        String username = scanner.nextLine();
        
        if (userDAO.checkUsernameExists(username)) {
            System.out.println("Username already exists!");
        } else {
            System.out.println("Username is available!");
        }
    }
    
    private static void getMenuById() {
        System.out.print("Enter Menu ID: ");
        int menuId = scanner.nextInt();
        scanner.nextLine();
        
        Menu menu = menuDAO.getMenuById(menuId);
        if (menu != null) {
            System.out.println("Menu Item Found: " + menu);
        } else {
            System.out.println("Menu item not found!");
        }
    }
    
    private static void getAllMenuItems() {
        List<Menu> menus = menuDAO.getAllMenus();
        System.out.println("\n--- All Menu Items ---");
        if (menus.isEmpty()) {
            System.out.println("No menu items found!");
        } else {
            for (Menu menu : menus) {
                System.out.println(menu);
            }
        }
    }
    
    private static void getMenuByCategory() {
        System.out.print("Enter Category: ");
        String category = scanner.nextLine();
        
        List<Menu> menus = menuDAO.getMenusByCategory(category);
        System.out.println("\n--- Menu Items in Category: " + category + " ---");
        if (menus.isEmpty()) {
            System.out.println("No menu items found in this category!");
        } else {
            for (Menu menu : menus) {
                System.out.println(menu);
            }
        }
    }
    
    private static void getAvailableMenuItems() {
        List<Menu> menus = menuDAO.getAvailableMenus();
        System.out.println("\n--- Available Menu Items ---");
        if (menus.isEmpty()) {
            System.out.println("No available menu items found!");
        } else {
            for (Menu menu : menus) {
                System.out.println(menu);
            }
        }
    }
    
    private static void updateMenuItem() {
        System.out.print("Enter Menu ID to update: ");
        int menuId = scanner.nextInt();
        scanner.nextLine();
        
        Menu menu = menuDAO.getMenuById(menuId);
        if (menu != null) {
            System.out.print("Enter new price: ");
            menu.setPrice(scanner.nextDouble());
            scanner.nextLine();
            System.out.print("Enter new category: ");
            menu.setCategory(scanner.nextLine());
            System.out.print("Is available (true/false): ");
            menu.setAvailable(scanner.nextBoolean());
            scanner.nextLine();
            
            if (menuDAO.updateMenu(menu)) {
                System.out.println("Menu item updated successfully!");
            } else {
                System.out.println("Failed to update menu item!");
            }
        } else {
            System.out.println("Menu item not found!");
        }
    }
    
    private static void deleteMenuItem() {
        System.out.print("Enter Menu ID to delete: ");
        int menuId = scanner.nextInt();
        scanner.nextLine();
        
        if (menuDAO.deleteMenu(menuId)) {
            System.out.println("Menu item deleted successfully!");
        } else {
            System.out.println("Failed to delete menu item!");
        }
    }
    
    private static void restaurantManagement() {
        boolean back = false;
        while (!back) {
            System.out.println("\n=== RESTAURANT MANAGEMENT ===");
            System.out.println("1. Add Restaurant");
            System.out.println("2. Get Restaurant by ID");
            System.out.println("3. Get All Restaurants");
            System.out.println("4. Get Active Restaurants");
            System.out.println("5. Update Restaurant");
            System.out.println("6. Delete Restaurant");
            System.out.println("7. Back to Main Menu");
            System.out.print("Enter your choice: ");
            
            int choice = scanner.nextInt();
            scanner.nextLine();
            
            switch (choice) {
                case 1:
                    addRestaurant();
                    break;
                case 2:
                    getRestaurantById();
                    break;
                case 3:
                    getAllRestaurants();
                    break;
                case 4:
                    getActiveRestaurants();
                    break;
                case 5:
                    updateRestaurant();
                    break;
                case 6:
                    deleteRestaurant();
                    break;
                case 7:
                    back = true;
                    break;
                default:
                    System.out.println("Invalid choice!");
            }
        }
    }
    
    private static void addRestaurant() {
        System.out.println("\n--- Add New Restaurant ---");
        System.out.print("Enter restaurant name: ");
        String name = scanner.nextLine();
        System.out.print("Enter address: ");
        String address = scanner.nextLine();
        System.out.print("Enter phone: ");
        String phone = scanner.nextLine();
        System.out.print("Enter email: ");
        String email = scanner.nextLine();
        System.out.print("Enter description: ");
        String description = scanner.nextLine();
        System.out.print("Enter deliveryTime: ");
        String deliveryTime = scanner.nextLine();
        System.out.print("Enter rating: ");
        double rating = scanner.nextDouble();
       

        System.out.print("Enter imageUrl: ");
        String imageUrl = scanner.nextLine();
      
        Restaurant restaurant = new Restaurant(name, address, phone, email, description, deliveryTime, rating, imageUrl);

        
        int restaurantId = restaurantDAO.addRestaurant(restaurant);
        if (restaurantId > 0) {
            System.out.println("Restaurant added successfully with ID: " + restaurantId);
        } else {
            System.out.println("Failed to add restaurant!");
        }
    }
    
    private static void getRestaurantById() {
        System.out.print("Enter Restaurant ID: ");
        int restaurantId = scanner.nextInt();
        scanner.nextLine();
        
        Restaurant restaurant = restaurantDAO.getRestaurantById(restaurantId);
        if (restaurant != null) {
            System.out.println("Restaurant Found: " + restaurant);
        } else {
            System.out.println("Restaurant not found!");
        }
    }
    
    private static void getAllRestaurants() {
        List<Restaurant> restaurants = restaurantDAO.getAllRestaurants();
        System.out.println("\n--- All Restaurants ---");
        if (restaurants.isEmpty()) {
            System.out.println("No restaurants found!");
        } else {
            for (Restaurant restaurant : restaurants) {
                System.out.println(restaurant);
            }
        }
    }
    
    private static void getActiveRestaurants() {
        List<Restaurant> restaurants = restaurantDAO.getAllRestaurants();
        System.out.println("\n--- Active Restaurants ---");
        if (restaurants.isEmpty()) {
            System.out.println("No active restaurants found!");
        } else {
            for (Restaurant restaurant : restaurants) {
                System.out.println(restaurant);
            }
        }
    }
    
    private static void updateRestaurant() {
        System.out.print("Enter Restaurant ID to update: ");
        int restaurantId = scanner.nextInt();
        scanner.nextLine();
        
        Restaurant restaurant = restaurantDAO.getRestaurantById(restaurantId);
        if (restaurant != null) {
            System.out.print("Enter new address: ");
            restaurant.setAddress(scanner.nextLine());
            System.out.print("Enter new phone: ");
            restaurant.setPhone(scanner.nextLine());
            System.out.print("Enter new email: ");
            restaurant.setEmail(scanner.nextLine());
            
            if (restaurantDAO.updateRestaurant(restaurant)) {
                System.out.println("Restaurant updated successfully!");
            } else {
                System.out.println("Failed to update restaurant!");
            }
        } else {
            System.out.println("Restaurant not found!");
        }
    }
    
    private static void deleteRestaurant() {
        System.out.print("Enter Restaurant ID to delete: ");
        int restaurantId = scanner.nextInt();
        scanner.nextLine();
        
        if (restaurantDAO.deleteRestaurant(restaurantId)) {
            System.out.println("Restaurant deleted successfully!");
        } else {
            System.out.println("Failed to delete restaurant!");
        }
    }
    
    private static void getOrderById() {
        System.out.print("Enter Order ID: ");
        int orderId = scanner.nextInt();
        scanner.nextLine();
        
        Order order = orderDAO.getOrderById(orderId);
        if (order != null) {
            System.out.println("Order Found: " + order);
        } else {
            System.out.println("Order not found!");
        }
    }
    
    private static void getOrdersByUserId() {
        System.out.print("Enter User ID: ");
        int userId = scanner.nextInt();
        scanner.nextLine();
        
        List<Order> orders = orderDAO.getOrdersByUserId(userId);
        System.out.println("\n--- Orders for User ID: " + userId + " ---");
        if (orders.isEmpty()) {
            System.out.println("No orders found for this user!");
        } else {
            for (Order order : orders) {
                System.out.println(order);
            }
        }
    }
    
    private static void getOrdersByStatus() {
        System.out.print("Enter Status (pending/processing/delivered/cancelled): ");
        String status = scanner.nextLine();
        
        List<Order> orders = orderDAO.getOrdersByStatus(status);
        System.out.println("\n--- Orders with Status: " + status + " ---");
        if (orders.isEmpty()) {
            System.out.println("No orders found with this status!");
        } else {
            for (Order order : orders) {
                System.out.println(order);
            }
        }
    }
    
    private static void updateOrderStatus() {
        System.out.print("Enter Order ID: ");
        int orderId = scanner.nextInt();
        scanner.nextLine();
        System.out.print("Enter new status: ");
        String status = scanner.nextLine();
        
        if (orderDAO.updateOrderStatus(orderId, status)) {
            System.out.println("Order status updated successfully!");
        } else {
            System.out.println("Failed to update order status!");
        }
    }
    
    private static void getTotalRevenue() {
        double revenue = orderDAO.getTotalRevenue();
        System.out.println("Total Revenue from delivered orders: $" + revenue);
    }
    
    private static void orderItemManagement() {
        boolean back = false;
        while (!back) {
            System.out.println("\n=== ORDER ITEM MANAGEMENT ===");
            System.out.println("1. Add Order Item");
            System.out.println("2. Get Order Items by Order ID");
            System.out.println("3. Get Order Item by ID");
            System.out.println("4. Update Order Item");
            System.out.println("5. Delete Order Item");
            System.out.println("6. Get Order Items with Menu Details");
            System.out.println("7. Back to Main Menu");
            System.out.print("Enter your choice: ");
            
            int choice = scanner.nextInt();
            scanner.nextLine();
            
            switch (choice) {
                case 1:
                    addOrderItem();
                    break;
                case 2:
                    getOrderItemsByOrderId();
                    break;
                case 3:
                    getOrderItemById();
                    break;
                case 4:
                    updateOrderItem();
                    break;
                case 5:
                    deleteOrderItem();
                    break;
                case 6:
                    getOrderItemsWithMenuDetails();
                    break;
                case 7:
                    back = true;
                    break;
                default:
                    System.out.println("Invalid choice!");
            }
        }
    }
    
    private static void addOrderItem() {
        System.out.println("\n--- Add New Order Item ---");
        System.out.print("Enter Order ID: ");
        int orderId = scanner.nextInt();
        System.out.print("Enter Menu ID: ");
        int menuId = scanner.nextInt();
        System.out.print("Enter Quantity: ");
        int quantity = scanner.nextInt();
        System.out.print("Enter Price: ");
        double price = scanner.nextDouble();
        scanner.nextLine();
        
        OrderItem orderItem = new OrderItem(orderId, menuId, quantity, price);
        int orderItemId = orderItemDAO.addOrderItem(orderItem);
        
        if (orderItemId > 0) {
            System.out.println("Order item added successfully with ID: " + orderItemId);
        } else {
            System.out.println("Failed to add order item!");
        }
    }
    
    private static void getOrderItemsByOrderId() {
        System.out.print("Enter Order ID: ");
        int orderId = scanner.nextInt();
        scanner.nextLine();
        
        List<OrderItem> orderItems = orderItemDAO.getOrderItemsByOrderId(orderId);
        System.out.println("\n--- Order Items for Order ID: " + orderId + " ---");
        if (orderItems.isEmpty()) {
            System.out.println("No order items found for this order!");
        } else {
            for (OrderItem item : orderItems) {
                System.out.println(item);
            }
        }
    }
    
    private static void getOrderItemById() {
        System.out.print("Enter Order Item ID: ");
        int orderItemId = scanner.nextInt();
        scanner.nextLine();
        
        OrderItem orderItem = orderItemDAO.getOrderItemById(orderItemId);
        if (orderItem != null) {
            System.out.println("Order Item Found: " + orderItem);
        } else {
            System.out.println("Order item not found!");
        }
    }
    
    private static void updateOrderItem() {
        System.out.print("Enter Order Item ID to update: ");
        int orderItemId = scanner.nextInt();
        scanner.nextLine();
        
        OrderItem orderItem = orderItemDAO.getOrderItemById(orderItemId);
        if (orderItem != null) {
            System.out.print("Enter new quantity: ");
            orderItem.setQuantity(scanner.nextInt());
            System.out.print("Enter new price: ");
            orderItem.setPrice(scanner.nextDouble());
            scanner.nextLine();
            
            if (orderItemDAO.updateOrderItem(orderItem)) {
                System.out.println("Order item updated successfully!");
            } else {
                System.out.println("Failed to update order item!");
            }
        } else {
            System.out.println("Order item not found!");
        }
    }
    
    private static void deleteOrderItem() {
        System.out.print("Enter Order Item ID to delete: ");
        int orderItemId = scanner.nextInt();
        scanner.nextLine();
        
        if (orderItemDAO.deleteOrderItem(orderItemId)) {
            System.out.println("Order item deleted successfully!");
        } else {
            System.out.println("Failed to delete order item!");
        }
    }
    
    private static void getOrderItemsWithMenuDetails() {
        System.out.print("Enter Order ID: ");
        int orderId = scanner.nextInt();
        scanner.nextLine();
        
        List<OrderItem> orderItems = orderItemDAO.getOrderItemsWithMenuDetails(orderId);
        System.out.println("\n--- Order Items with Menu Details for Order ID: " + orderId + " ---");
        if (orderItems.isEmpty()) {
            System.out.println("No order items found!");
        } else {
            for (OrderItem item : orderItems) {
                System.out.println(
                                 ", Quantity: " + item.getQuantity() + 
                                 ", Price: $" + item.getPrice() +
                                 ", Subtotal: $" + item.getPrice());
            }
        }
    }
}