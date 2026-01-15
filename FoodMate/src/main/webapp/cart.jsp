<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.foodmate.model.Cart,com.foodmate.model.CartItem" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FoodMate | Your Cart</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Montserrat:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        /* =============================================
           CSS RESET & BASE STYLES
        ============================================= */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            /* Modern Color Palette */
            --primary: #FF6B35;
            --primary-dark: #E85A2C;
            --primary-light: #FF9A76;
            --secondary: #2D3436;
            --accent: #00B894;
            --danger: #FF4757;
            --warning: #FFA502;
            --info: #2ED573;
            
            /* Neutrals */
            --white: #FFFFFF;
            --light: #F8F9FA;
            --gray-100: #E9ECEF;
            --gray-200: #DEE2E6;
            --gray-300: #CED4DA;
            --gray-400: #ADB5BD;
            --gray-500: #6C757D;
            --gray-600: #495057;
            --gray-700: #343A40;
            --dark: #212529;
            
            /* UI Colors */
            --bg-color: #FFF9F5;
            --card-bg: var(--white);
            --header-bg: rgba(255, 255, 255, 0.98);
            --border-color: rgba(0, 0, 0, 0.08);
            
            /* Shadows */
            --shadow-sm: 0 2px 4px rgba(0, 0, 0, 0.04);
            --shadow-md: 0 4px 12px rgba(0, 0, 0, 0.08);
            --shadow-lg: 0 8px 24px rgba(0, 0, 0, 0.12);
            --shadow-xl: 0 16px 48px rgba(0, 0, 0, 0.16);
            
            /* Border Radius */
            --radius-sm: 8px;
            --radius-md: 12px;
            --radius-lg: 16px;
            --radius-xl: 20px;
            --radius-round: 50px;
            
            /* Spacing */
            --space-xs: 0.5rem;
            --space-sm: 0.75rem;
            --space-md: 1rem;
            --space-lg: 1.5rem;
            --space-xl: 2rem;
            --space-xxl: 3rem;
            
            /* Typography */
            --font-sans: 'Poppins', -apple-system, BlinkMacSystemFont, sans-serif;
            --font-heading: 'Montserrat', var(--font-sans);
            
            /* Transitions */
            --transition-fast: 150ms ease;
            --transition-normal: 250ms ease;
            --transition-slow: 350ms ease;
            
            /* Z-index */
            --z-dropdown: 1000;
            --z-sticky: 1020;
            --z-modal: 1050;
        }

        html {
            font-size: 16px;
            scroll-behavior: smooth;
        }

        body {
            font-family: var(--font-sans);
            line-height: 1.6;
            color: var(--gray-700);
            background-color: var(--bg-color);
            min-height: 100vh;
            overflow-x: hidden;
        }

        /* =============================================
           TYPOGRAPHY
        ============================================= */
        h1, h2, h3, h4, h5, h6 {
            font-family: var(--font-heading);
            font-weight: 700;
            line-height: 1.2;
            margin-bottom: var(--space-md);
        }

        h1 {
            font-size: 2.5rem;
            background: linear-gradient(135deg, var(--primary), var(--warning));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }

        h2 { font-size: 2rem; }
        h3 { font-size: 1.5rem; }
        h4 { font-size: 1.25rem; }

        p {
            margin-bottom: var(--space-md);
            color: var(--gray-600);
        }

        a {
            color: var(--primary);
            text-decoration: none;
            transition: color var(--transition-fast);
        }

        a:hover {
            color: var(--primary-dark);
        }

        /* =============================================
           LAYOUT & CONTAINERS
        ============================================= */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 var(--space-lg);
            width: 100%;
        }

        /* =============================================
           HEADER & NAVIGATION
        ============================================= */
        .header {
            position: sticky;
            top: 0;
            z-index: var(--z-sticky);
            background: var(--header-bg);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-bottom: 1px solid var(--border-color);
            box-shadow: var(--shadow-sm);
        }

        .navbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: var(--space-md) 0;
            gap: var(--space-lg);
        }

        .logo {
            display: flex;
            align-items: center;
            gap: var(--space-sm);
            font-family: var(--font-heading);
            font-size: 1.75rem;
            font-weight: 800;
            color: var(--primary);
        }

        .logo-icon {
            font-size: 1.5rem;
            color: var(--primary);
        }

        .nav-menu {
            display: flex;
            list-style: none;
            gap: var(--space-sm);
            margin: 0;
            padding: 0;
        }

        .nav-link {
            display: flex;
            align-items: center;
            gap: var(--space-xs);
            padding: var(--space-sm) var(--space-md);
            border-radius: var(--radius-round);
            font-weight: 500;
            color: var(--gray-700);
            transition: all var(--transition-normal);
        }

        .nav-link:hover,
        .nav-link.active {
            background: linear-gradient(135deg, rgba(255, 107, 53, 0.1), rgba(255, 165, 2, 0.1));
            color: var(--primary);
            transform: translateY(-1px);
        }

        .cart-badge {
            background: var(--primary);
            color: var(--white);
            font-size: 0.75rem;
            font-weight: 600;
            min-width: 20px;
            height: 20px;
            border-radius: 10px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin-left: var(--space-xs);
        }

        /* =============================================
           MAIN CONTENT
        ============================================= */
        .main-content {
            padding: var(--space-xxl) 0;
            animation: fadeIn 0.5s ease;
        }

        .page-header {
            text-align: center;
            margin-bottom: var(--space-xxl);
        }

        .page-subtitle {
            color: var(--gray-500);
            font-size: 1.125rem;
            max-width: 600px;
            margin: 0 auto;
        }

        /* =============================================
           CART COMPONENTS
        ============================================= */
        .cart-section {
            display: grid;
            grid-template-columns: 1fr 380px;
            gap: var(--space-xl);
            align-items: start;
        }

        @media (max-width: 992px) {
            .cart-section {
                grid-template-columns: 1fr;
            }
        }

        /* Cart Items */
        .cart-card {
            background: var(--card-bg);
            border-radius: var(--radius-xl);
            box-shadow: var(--shadow-lg);
            overflow: hidden;
        }

        .cart-header {
            padding: var(--space-xl);
            border-bottom: 1px solid var(--border-color);
            background: linear-gradient(135deg, rgba(255, 107, 53, 0.05), rgba(0, 184, 148, 0.05));
        }

        .cart-header h2 {
            display: flex;
            align-items: center;
            gap: var(--space-sm);
            color: var(--gray-700);
        }

        .cart-items {
            padding: var(--space-xl);
        }

        .cart-item {
            display: grid;
            grid-template-columns: auto 1fr auto;
            align-items: center;
            gap: var(--space-lg);
            padding: var(--space-lg);
            background: var(--light);
            border-radius: var(--radius-lg);
            margin-bottom: var(--space-md);
            border: 1px solid transparent;
            transition: all var(--transition-normal);
            position: relative;
        }

        .cart-item:hover {
            border-color: var(--primary-light);
            box-shadow: var(--shadow-md);
            transform: translateY(-2px);
        }

        .item-image {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, var(--primary), var(--primary-light));
            border-radius: var(--radius-md);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--white);
            font-size: 1.5rem;
            flex-shrink: 0;
        }

        .item-details {
            flex: 1;
        }

        .item-name {
            font-weight: 600;
            color: var(--gray-700);
            margin-bottom: var(--space-xs);
            font-size: 1.125rem;
        }

        .item-price {
            color: var(--primary);
            font-weight: 600;
            font-size: 1rem;
        }

        /* Quantity Controls */
        .quantity-section {
            display: flex;
            align-items: center;
            gap: var(--space-lg);
        }

        .quantity-controls {
            display: flex;
            align-items: center;
            background: var(--white);
            border-radius: var(--radius-round);
            padding: var(--space-xs);
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--border-color);
        }

        .quantity-btn {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            border: none;
            background: var(--light);
            color: var(--gray-700);
            font-size: 1.25rem;
            cursor: pointer;
            transition: all var(--transition-fast);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .quantity-btn:hover:not(:disabled) {
            background: var(--primary);
            color: var(--white);
            transform: scale(1.1);
        }

        .quantity-btn:disabled {
            opacity: 0.4;
            cursor: not-allowed;
        }

        .quantity-value {
            min-width: 40px;
            text-align: center;
            font-weight: 600;
            color: var(--gray-700);
            font-size: 1.125rem;
        }

        .item-total {
            font-weight: 700;
            font-size: 1.25rem;
            color: var(--gray-700);
            min-width: 100px;
            text-align: right;
        }

        /* Remove Button */
        .remove-btn {
            background: transparent;
            border: none;
            color: var(--danger);
            font-size: 1.125rem;
            cursor: pointer;
            padding: var(--space-sm);
            border-radius: var(--radius-sm);
            transition: all var(--transition-fast);
            position: absolute;
            top: var(--space-md);
            right: var(--space-md);
        }

        .remove-btn:hover {
            background: rgba(255, 71, 87, 0.1);
            transform: rotate(15deg);
        }

        /* Cart Summary */
        .cart-summary {
            background: var(--card-bg);
            border-radius: var(--radius-xl);
            padding: var(--space-xl);
            box-shadow: var(--shadow-lg);
            position: sticky;
            top: 100px;
        }

        .summary-header {
            margin-bottom: var(--space-lg);
            padding-bottom: var(--space-md);
            border-bottom: 1px solid var(--border-color);
        }

        .summary-header h3 {
            display: flex;
            align-items: center;
            gap: var(--space-sm);
            color: var(--gray-700);
        }

        .summary-items {
            margin-bottom: var(--space-lg);
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: var(--space-sm) 0;
            color: var(--gray-600);
        }

        .summary-row.total {
            margin-top: var(--space-md);
            padding-top: var(--space-md);
            border-top: 2px solid var(--border-color);
            font-weight: 700;
            color: var(--gray-700);
            font-size: 1.25rem;
        }

        .summary-value {
            font-weight: 600;
            color: var(--gray-700);
        }

        .summary-row.total .summary-value {
            color: var(--primary);
            font-size: 1.5rem;
        }

        .free-delivery {
            color: var(--accent);
            font-weight: 600;
        }

        /* Action Buttons */
        .action-buttons {
            display: flex;
            flex-direction: column;
            gap: var(--space-md);
            margin-top: var(--space-xl);
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: var(--space-sm);
            padding: var(--space-md) var(--space-xl);
            border: none;
            border-radius: var(--radius-lg);
            font-family: var(--font-sans);
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all var(--transition-normal);
            text-decoration: none;
            text-align: center;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            color: var(--white);
            width: 100%;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-lg);
            background: linear-gradient(135deg, var(--primary-dark), var(--primary));
        }

        .btn-outline {
            background: transparent;
            border: 2px solid var(--primary);
            color: var(--primary);
        }

        .btn-outline:hover {
            background: var(--primary);
            color: var(--white);
        }

        .btn-ghost {
            background: transparent;
            border: 2px solid var(--gray-300);
            color: var(--gray-600);
        }

        .btn-ghost:hover {
            border-color: var(--primary);
            color: var(--primary);
        }

        /* Hidden forms */
        .hidden-form {
            display: inline;
        }

        /* =============================================
           EMPTY CART STATE
        ============================================= */
        .empty-state {
            text-align: center;
            padding: var(--space-xxl) var(--space-xl);
        }

        .empty-icon {
            width: 120px;
            height: 120px;
            background: linear-gradient(135deg, var(--light), var(--gray-100));
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto var(--space-xl);
            font-size: 3rem;
            color: var(--gray-400);
            box-shadow: var(--shadow-md);
        }

        .empty-state h2 {
            color: var(--gray-700);
            margin-bottom: var(--space-sm);
        }

        .empty-state p {
            color: var(--gray-600);
            max-width: 400px;
            margin: 0 auto var(--space-xl);
        }

        /* =============================================
           ANIMATIONS
        ============================================= */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateX(-20px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes pulse {
            0%, 100% {
                opacity: 1;
            }
            50% {
                opacity: 0.7;
            }
        }

        .cart-item {
            animation: slideIn 0.3s ease forwards;
            opacity: 0;
        }

        .cart-item:nth-child(1) { animation-delay: 0.1s; }
        .cart-item:nth-child(2) { animation-delay: 0.2s; }
        .cart-item:nth-child(3) { animation-delay: 0.3s; }
        .cart-item:nth-child(4) { animation-delay: 0.4s; }
        .cart-item:nth-child(5) { animation-delay: 0.5s; }

        /* =============================================
           LOADING STATES
        ============================================= */
        .loading {
            animation: pulse 1.5s ease-in-out infinite;
        }

        /* =============================================
           CUSTOM SCROLLBAR
        ============================================= */
        ::-webkit-scrollbar {
            width: 8px;
        }

        ::-webkit-scrollbar-track {
            background: var(--light);
        }

        ::-webkit-scrollbar-thumb {
            background: var(--primary);
            border-radius: 4px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: var(--primary-dark);
        }

        /* =============================================
           UTILITY CLASSES
        ============================================= */
        .text-center { text-align: center; }
        .text-right { text-align: right; }
        .text-left { text-align: left; }

        .mt-1 { margin-top: var(--space-sm); }
        .mt-2 { margin-top: var(--space-md); }
        .mt-3 { margin-top: var(--space-lg); }
        .mt-4 { margin-top: var(--space-xl); }

        .mb-1 { margin-bottom: var(--space-sm); }
        .mb-2 { margin-bottom: var(--space-md); }
        .mb-3 { margin-bottom: var(--space-lg); }
        .mb-4 { margin-bottom: var(--space-xl); }

        .d-flex { display: flex; }
        .d-grid { display: grid; }
        .align-center { align-items: center; }
        .justify-between { justify-content: space-between; }
        .justify-center { justify-content: center; }

        /* =============================================
           RESPONSIVE DESIGN
        ============================================= */
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                padding: var(--space-sm) 0;
            }

            .nav-menu {
                width: 100%;
                justify-content: center;
                flex-wrap: wrap;
                gap: var(--space-xs);
            }

            .nav-link span {
                display: none;
            }

            .nav-link {
                padding: var(--space-sm);
            }

            .cart-item {
                grid-template-columns: 1fr;
                gap: var(--space-md);
            }

            .quantity-section {
                flex-direction: column;
                align-items: stretch;
                gap: var(--space-md);
            }

            .item-total {
                text-align: left;
            }

            .remove-btn {
                position: static;
            }

            h1 {
                font-size: 2rem;
            }

            h2 {
                font-size: 1.5rem;
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 0 var(--space-md);
            }

            .main-content {
                padding: var(--space-xl) 0;
            }

            .cart-items,
            .cart-summary {
                padding: var(--space-lg);
            }

            .item-image {
                width: 60px;
                height: 60px;
                font-size: 1.25rem;
            }

            .btn {
                padding: var(--space-md) var(--space-lg);
            }
        }

        /* =============================================
           ACCESSIBILITY
        ============================================= */
        @media (prefers-reduced-motion: reduce) {
            *,
            *::before,
            *::after {
                animation-duration: 0.01ms !important;
                animation-iteration-count: 1 !important;
                transition-duration: 0.01ms !important;
            }
        }

        .focus-visible:focus {
            outline: 2px solid var(--primary);
            outline-offset: 2px;
        }

        .sr-only {
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip: rect(0, 0, 0, 0);
            white-space: nowrap;
            border: 0;
        }
    </style>
</head>

<body>
    <!-- Header -->
    <header class="header">
        <nav class="navbar container">
            <a href="restaurant" class="logo">
                <i class="fas fa-utensils logo-icon"></i>
                <span>FoodMate</span>
            </a>
            <ul class="nav-menu">
                <li>
                    <a href="restaurant" class="nav-link">
                        <i class="fas fa-home nav-icon"></i>
                        <span>Home</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="nav-link active">
                        <i class="fas fa-shopping-cart nav-icon"></i>
                        <span>Cart</span>
                        <span class="cart-badge">
                            <%
                            Cart cartCount = (Cart) session.getAttribute("cart");
                            if (cartCount != null && !cartCount.getItems().isEmpty()) {
                                out.print(cartCount.getItems().size());
                            }
                            %>
                        </span>
                    </a>
                </li>
                <li>
                    <a href="#" class="nav-link">
                        <i class="fas fa-user-circle nav-icon"></i>
                        <span>Profile</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="nav-link">
                        <i class="fas fa-sign-in-alt nav-icon"></i>
                        <span>Login</span>
                    </a>
                </li>
            </ul>
        </nav>
    </header>

    <!-- Main Content -->
    <main class="main-content container">
        <div class="page-header">
            <h1 class="page-title">Your Cart</h1>
          </div>

        <%
        Cart cart = (Cart) session.getAttribute("cart");
        Integer restaurantId = (Integer) session.getAttribute("oldRestaurantId");
        
        if(cart != null && !cart.getItems().isEmpty()) {
        %>

        <div class="cart-section">
            <!-- Cart Items -->
            <div class="cart-card">
                <div class="cart-header">
                    <h2><i class="fas fa-shopping-cart"></i> Cart Items</h2>
                </div>
                <div class="cart-items">
                    <% for(CartItem item : cart.getItems().values()) { %>
                    <div class="cart-item">
                        <div class="item-image">
                            <i class="fas fa-hamburger"></i>
                        </div>
                        <div class="item-details">
                            <h3 class="item-name"><%= item.getName() %></h3>
                            <p class="item-price">₹<%= item.getPrice() %> per item</p>
                        </div>
                        
                        <div class="quantity-section">
                            <div class="quantity-controls">
                                <form action="cart" class="hidden-form">
                                    <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                                    <input type="hidden" name="action" value="update">
                                    <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
                                    <input type="hidden" name="quantity" value="<%= item.getQuantity() - 1 %>">
                                    <button type="submit" class="quantity-btn" <%= (item.getQuantity() == 1) ? "disabled" : "" %>>−</button>
                                </form>
                                
                                <span class="quantity-value"><%= item.getQuantity() %></span>
                                
                                <form action="cart" class="hidden-form">
                                    <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                                    <input type="hidden" name="action" value="update">
                                    <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
                                    <input type="hidden" name="quantity" value="<%= item.getQuantity() + 1 %>">
                                    <button type="submit" class="quantity-btn">+</button>
                                </form>
                            </div>
                            
                            <div class="item-total">₹<%= item.getTotalPrice() %></div>
                        </div>
                        
                        <form action="cart" class="hidden-form">
                            <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                            <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
                            <input type="hidden" name="action" value="remove">
                            <button type="submit" class="remove-btn" title="Remove item">
                                <i class="fas fa-trash-alt"></i>
                            </button>
                        </form>
                    </div>
                    <% } %>
                </div>
            </div>

            <!-- Cart Summary -->
            <div class="cart-summary">
                <div class="summary-header">
                    <h3><i class="fas fa-receipt"></i> Order Summary</h3>
                </div>
                
                <div class="summary-items">
                    <div class="summary-row">
                        <span class="summary-label">Subtotal</span>
                        <span class="summary-value">₹<%= cart.getTotalPrice() %></span>
                    </div>
                    <div class="summary-row">
                        <span class="summary-label">Delivery Fee</span>
                        <span class="summary-value free-delivery">FREE</span>
                    </div>
                    <div class="summary-row total">
                        <span class="summary-label">Grand Total</span>
                        <span class="summary-value">₹<%= cart.getTotalPrice() %></span>
                    </div>
                </div>
                
                <!-- Action Buttons -->
                <div class="action-buttons">
                    <form action="checkout.jsp">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-lock"></i>
                            Proceed to Checkout
                        </button>
                    </form>
                    
                    <a href="menu?restaurantId=<%= restaurantId %>" class="btn btn-outline">
                        <i class="fas fa-plus"></i>
                        Add More Items
                    </a>
                   
                </div>
            </div>
        </div>

        <% } else { %>

        <!-- Empty Cart -->
        <div class="cart-card">
            <div class="empty-state">
                <div class="empty-icon">🛒</div>
                <h2>Your Cart is Empty</h2>
                <p>Looks like you haven't added any delicious items yet. Start exploring our restaurants!</p>
                <a href="restaurant" class="btn btn-primary">
                    <i class="fas fa-utensils"></i>
                    Browse Restaurants
                </a>
            </div>
        </div>

        <% } %>
    </main>
</body>
</html>