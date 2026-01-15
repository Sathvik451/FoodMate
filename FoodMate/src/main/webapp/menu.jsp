<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@ page import="java.util.List, com.foodmate.model.Menu" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FoodMate - Menu</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Montserrat:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        /* =============================================
           CSS VARIABLES & RESET
        ============================================= */
        :root {
            /* Primary Colors - Food/Appetite Theme */
            --primary-color: #FF6B35;        /* Vibrant Orange - Main brand color */
            --primary-light: #FF9A6B;        /* Lighter Orange */
            --primary-dark: #E55A24;         /* Darker Orange */
            
            /* Secondary Colors */
            --secondary-color: #2D3436;      /* Dark Gray - Text & headings */
            --secondary-light: #636E72;      /* Medium Gray - Subtext */
            
            /* Accent Colors */
            --accent-green: #00C853;         /* Success/Positive */
            --accent-yellow: #FFB300;        /* Warning/Attention */
            --accent-red: #FF3D00;           /* Error/Discount */
            --accent-blue: #2979FF;          /* Information/Links */
            
            /* Neutral Colors */
            --white: #FFFFFF;
            --light-bg: #F8F9FA;
            --light-gray: #ECF0F1;
            --medium-gray: #DFE6E9;
            --dark-gray: #2D3436;
            
            /* Semantic Colors */
            --success-color: #00C853;
            --warning-color: #FFB300;
            --error-color: #FF3D00;
            --info-color: #2979FF;
            
            /* UI Colors */
            --card-bg: var(--white);
            --header-bg: rgba(255, 255, 255, 0.98);
            --footer-bg: #2D3436;
            --overlay-bg: rgba(255, 255, 255, 0.95);
            
            /* Shadows */
            --shadow-sm: 0 2px 8px rgba(0, 0, 0, 0.08);
            --shadow-md: 0 4px 16px rgba(0, 0, 0, 0.12);
            --shadow-lg: 0 8px 32px rgba(0, 0, 0, 0.15);
            --shadow-card: 0 6px 20px rgba(0, 0, 0, 0.1);
            --shadow-hover: 0 12px 40px rgba(0, 0, 0, 0.18);
            
            /* Border Radius */
            --radius-sm: 6px;
            --radius-md: 12px;
            --radius-lg: 16px;
            --radius-xl: 24px;
            --radius-round: 50px;
            
            /* Transitions */
            --transition-fast: 0.2s ease;
            --transition-normal: 0.3s ease;
            --transition-slow: 0.4s ease;
            --transition-bounce: 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            
            /* Spacing */
            --space-xs: 4px;
            --space-sm: 8px;
            --space-md: 16px;
            --space-lg: 24px;
            --space-xl: 32px;
            --space-xxl: 48px;
            
            /* Typography */
            --font-primary: 'Poppins', -apple-system, BlinkMacSystemFont, sans-serif;
            --font-heading: 'Montserrat', -apple-system, BlinkMacSystemFont, sans-serif;
            --font-size-xs: 0.75rem;    /* 12px */
            --font-size-sm: 0.875rem;   /* 14px */
            --font-size-base: 1rem;     /* 16px */
            --font-size-md: 1.125rem;   /* 18px */
            --font-size-lg: 1.5rem;     /* 24px */
            --font-size-xl: 2rem;       /* 32px */
            --font-size-xxl: 3rem;      /* 48px */
            
            /* Line Heights */
            --line-height-tight: 1.2;
            --line-height-normal: 1.5;
            --line-height-relaxed: 1.75;
            
            /* Z-index layers */
            --z-negative: -1;
            --z-base: 1;
            --z-dropdown: 1000;
            --z-sticky: 1020;
            --z-fixed: 1030;
            --z-modal: 1040;
            --z-popover: 1050;
            --z-tooltip: 1060;
        }

        /* CSS Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
            font-size: 16px;
        }

        body {
            font-family: var(--font-primary);
            font-size: var(--font-size-base);
            line-height: var(--line-height-normal);
            color: var(--secondary-color);
            background: linear-gradient(rgba(255, 255, 255, 0.95), rgba(248, 249, 250, 0.95)),
                        url('https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80') center/cover fixed no-repeat;
            min-height: 100vh;
            overflow-x: hidden;
        }

        /* Typography Scale */
        h1, h2, h3, h4, h5, h6 {
            font-family: var(--font-heading);
            font-weight: 700;
            line-height: var(--line-height-tight);
            margin-bottom: var(--space-md);
            color: var(--secondary-color);
        }

        h1 { font-size: var(--font-size-xxl); }
        h2 { font-size: var(--font-size-xl); }
        h3 { font-size: var(--font-size-lg); }
        h4 { font-size: var(--font-size-md); }

        p {
            margin-bottom: var(--space-md);
            line-height: var(--line-height-relaxed);
        }

        a {
            text-decoration: none;
            color: inherit;
            transition: color var(--transition-fast);
        }

        a:hover {
            color: var(--primary-color);
        }

        img {
            max-width: 100%;
            height: auto;
            display: block;
        }

        /* Utility Classes */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 var(--space-lg);
        }

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

        .bg-primary { background-color: var(--primary-color); }
        .bg-light { background-color: var(--light-bg); }
        .bg-white { background-color: var(--white); }

        .text-primary { color: var(--primary-color); }
        .text-secondary { color: var(--secondary-light); }
        .text-success { color: var(--success-color); }
        .text-white { color: var(--white); }

        /* =============================================
           HEADER & NAVIGATION
        ============================================= */
        .header {
            background-color: var(--header-bg);
            backdrop-filter: blur(10px);
            box-shadow: var(--shadow-sm);
            position: sticky;
            top: 0;
            z-index: var(--z-sticky);
            border-bottom: 1px solid var(--medium-gray);
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: var(--space-md) 0;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: var(--space-sm);
            font-family: var(--font-heading);
            font-size: var(--font-size-xl);
            font-weight: 800;
            color: var(--primary-color);
            transition: transform var(--transition-normal);
        }

        .logo:hover {
            transform: scale(1.05);
        }

        .logo-icon {
            font-size: var(--font-size-lg);
            color: var(--primary-color);
        }

        .nav-menu {
            display: flex;
            list-style: none;
            gap: var(--space-md);
        }

        .nav-link {
            display: flex;
            align-items: center;
            gap: var(--space-xs);
            padding: var(--space-sm) var(--space-md);
            border-radius: var(--radius-round);
            font-weight: 500;
            color: var(--secondary-color);
            transition: all var(--transition-normal);
        }

        .nav-link:hover,
        .nav-link.active {
            background-color: rgba(255, 107, 53, 0.1);
            color: var(--primary-color);
            transform: translateY(-1px);
        }

        .nav-icon {
            font-size: var(--font-size-md);
        }

        .cart-badge {
            background-color: var(--primary-color);
            color: var(--white);
            font-size: var(--font-size-xs);
            min-width: 20px;
            height: 20px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-left: var(--space-xs);
            font-weight: 600;
        }

        /* =============================================
           MAIN CONTENT
        ============================================= */
        .main-content {
            padding: var(--space-xxl) 0;
        }

        .page-header {
            text-align: center;
            margin-bottom: var(--space-xxl);
        }

        .page-title {
            font-size: var(--font-size-xxl);
            margin-bottom: var(--space-sm);
            background: linear-gradient(135deg, var(--primary-color), var(--accent-yellow));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            display: inline-block;
        }

        .page-subtitle {
            color: var(--secondary-light);
            font-size: var(--font-size-md);
            font-weight: 400;
        }

        /* =============================================
           RESTAURANT INFO SECTION
        ============================================= */
        .restaurant-info {
            background-color: var(--white);
            border-radius: var(--radius-lg);
            padding: var(--space-xl);
            margin-bottom: var(--space-xxl);
            box-shadow: var(--shadow-card);
            display: flex;
            align-items: center;
            gap: var(--space-xl);
            border: 1px solid var(--light-gray);
        }

        .restaurant-image {
            width: 150px;
            height: 150px;
            border-radius: var(--radius-lg);
            overflow: hidden;
            box-shadow: var(--shadow-md);
            flex-shrink: 0;
        }

        .restaurant-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform var(--transition-slow);
        }

        .restaurant-image:hover img {
            transform: scale(1.05);
        }

        .restaurant-details {
            flex: 1;
        }

        .restaurant-details h2 {
            font-size: var(--font-size-xl);
            margin-bottom: var(--space-sm);
            color: var(--secondary-color);
        }

        .restaurant-meta {
            display: flex;
            gap: var(--space-md);
            margin-bottom: var(--space-md);
            flex-wrap: wrap;
        }

        .restaurant-rating {
            background-color: var(--success-color);
            color: var(--white);
            padding: var(--space-xs) var(--space-md);
            border-radius: var(--radius-round);
            font-size: var(--font-size-sm);
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: var(--space-xs);
        }

        .restaurant-cuisine {
            background-color: var(--light-gray);
            color: var(--secondary-color);
            padding: var(--space-xs) var(--space-md);
            border-radius: var(--radius-round);
            font-size: var(--font-size-sm);
            font-weight: 500;
        }

        .restaurant-location {
            display: flex;
            align-items: center;
            gap: var(--space-xs);
            color: var(--secondary-light);
            font-size: var(--font-size-base);
            margin-bottom: var(--space-md);
        }

        .restaurant-description {
            color: var(--secondary-light);
            line-height: var(--line-height-relaxed);
        }

        /* =============================================
           MENU GRID
        ============================================= */
        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: var(--space-xl);
            margin-bottom: var(--space-xxl);
        }

        .menu-item {
            background-color: var(--card-bg);
            border-radius: var(--radius-lg);
            overflow: hidden;
            box-shadow: var(--shadow-card);
            transition: all var(--transition-bounce);
            border: 1px solid var(--light-gray);
            display: flex;
            flex-direction: column;
            position: relative;
        }

        .menu-item:hover {
            transform: translateY(-8px);
            box-shadow: var(--shadow-hover);
            border-color: var(--primary-light);
        }

        .menu-item::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, var(--primary-color), var(--success-color));
            transform: scaleX(0);
            transform-origin: left;
            transition: transform var(--transition-normal);
        }

        .menu-item:hover::before {
            transform: scaleX(1);
        }

        .menu-item-image {
            height: 200px;
            overflow: hidden;
            position: relative;
        }

        .menu-item-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform var(--transition-slow);
        }

        .menu-item:hover .menu-item-image img {
            transform: scale(1.05);
        }

        .menu-item-content {
            padding: var(--space-lg);
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .menu-item-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: var(--space-md);
        }

        .menu-item-name {
            font-size: var(--font-size-lg);
            font-weight: 700;
            color: var(--secondary-color);
            margin-bottom: var(--space-xs);
            line-height: var(--line-height-tight);
        }

        .menu-item-price {
            font-size: var(--font-size-lg);
            font-weight: 800;
            color: var(--primary-color);
            background-color: rgba(255, 107, 53, 0.1);
            padding: var(--space-sm) var(--space-md);
            border-radius: var(--radius-md);
            min-width: 80px;
            text-align: center;
            transition: all var(--transition-normal);
        }

        .menu-item:hover .menu-item-price {
            transform: scale(1.05);
            box-shadow: var(--shadow-sm);
        }

        .menu-item-description {
            color: var(--secondary-light);
            font-size: var(--font-size-base);
            line-height: var(--line-height-relaxed);
            margin-bottom: var(--space-lg);
            flex: 1;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .menu-item-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: var(--space-md);
            border-top: 1px solid var(--light-gray);
            margin-top: auto;
        }

        .menu-item-rating {
            display: flex;
            align-items: center;
            gap: var(--space-xs);
            font-weight: 600;
            color: var(--secondary-color);
        }

        .stars {
            color: var(--warning-color);
            font-size: var(--font-size-sm);
        }

        /* =============================================
           ADD TO CART BUTTON
        ============================================= */
        .add-to-cart-btn {
            background-color: var(--primary-color);
            color: var(--white);
            border: none;
            padding: var(--space-sm) var(--space-lg);
            border-radius: var(--radius-md);
            font-weight: 600;
            font-size: var(--font-size-base);
            cursor: pointer;
            transition: all var(--transition-normal);
            display: flex;
            align-items: center;
            gap: var(--space-sm);
        }

        .add-to-cart-btn:hover {
            background-color: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        .add-to-cart-btn i {
            font-size: var(--font-size-md);
            transition: transform var(--transition-normal);
        }

        .add-to-cart-btn:hover i {
            transform: scale(1.2);
        }

        /* =============================================
           FORM ELEMENTS
        ============================================= */
        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: var(--space-sm) var(--space-lg);
            border: none;
            border-radius: var(--radius-md);
            font-family: var(--font-primary);
            font-size: var(--font-size-base);
            font-weight: 500;
            cursor: pointer;
            transition: all var(--transition-normal);
            gap: var(--space-sm);
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: var(--white);
        }

        .btn-primary:hover {
            background-color: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        form {
            margin: 0;
            padding: 0;
        }

        input[type="hidden"] {
            display: none;
        }

        /* =============================================
           FOOTER
        ============================================= */
        .footer {
            background-color: var(--footer-bg);
            color: var(--white);
            padding: var(--space-xxl) 0 var(--space-xl);
            margin-top: var(--space-xxl);
        }

        .footer-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: var(--space-xl);
            margin-bottom: var(--space-xl);
        }

        .footer-section h3 {
            color: var(--white);
            font-size: var(--font-size-lg);
            margin-bottom: var(--space-lg);
            position: relative;
            padding-bottom: var(--space-sm);
        }

        .footer-section h3::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 40px;
            height: 3px;
            background-color: var(--primary-color);
            border-radius: var(--radius-sm);
        }

        .footer-links {
            list-style: none;
        }

        .footer-links li {
            margin-bottom: var(--space-sm);
        }

        .footer-links a {
            color: rgba(255, 255, 255, 0.8);
            display: flex;
            align-items: center;
            gap: var(--space-sm);
            transition: all var(--transition-fast);
        }

        .footer-links a:hover {
            color: var(--primary-light);
            transform: translateX(5px);
        }

        .contact-info {
            color: rgba(255, 255, 255, 0.8);
        }

        .contact-info li {
            margin-bottom: var(--space-sm);
            display: flex;
            align-items: center;
            gap: var(--space-sm);
        }

        .footer-bottom {
            text-align: center;
            padding-top: var(--space-xl);
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            color: rgba(255, 255, 255, 0.6);
            font-size: var(--font-size-sm);
        }

        /* =============================================
           ANIMATIONS & EFFECTS
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

        .fade-in {
            animation: fadeIn 0.6s ease-out forwards;
        }

        .menu-item {
            animation: fadeIn 0.6s ease-out forwards;
            opacity: 0;
        }

        .menu-item:nth-child(1) { animation-delay: 0.1s; }
        .menu-item:nth-child(2) { animation-delay: 0.2s; }
        .menu-item:nth-child(3) { animation-delay: 0.3s; }
        .menu-item:nth-child(4) { animation-delay: 0.4s; }
        .menu-item:nth-child(5) { animation-delay: 0.5s; }
        .menu-item:nth-child(6) { animation-delay: 0.6s; }
        .menu-item:nth-child(7) { animation-delay: 0.7s; }
        .menu-item:nth-child(8) { animation-delay: 0.8s; }
        .menu-item:nth-child(9) { animation-delay: 0.9s; }
        .menu-item:nth-child(10) { animation-delay: 1.0s; }

        /* =============================================
           RESPONSIVE DESIGN
        ============================================= */
        @media (max-width: 1024px) {
            :root {
                --font-size-xxl: 2.5rem;
                --font-size-xl: 1.75rem;
            }
            
            .menu-grid {
                grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
                gap: var(--space-lg);
            }
        }

        @media (max-width: 768px) {
            :root {
                --font-size-xxl: 2rem;
                --font-size-xl: 1.5rem;
                --font-size-lg: 1.25rem;
            }
            
            .container {
                padding: 0 var(--space-md);
            }
            
            .navbar {
                flex-direction: column;
                gap: var(--space-md);
                padding: var(--space-md) 0;
            }
            
            .nav-menu {
                width: 100%;
                justify-content: center;
                flex-wrap: wrap;
            }
            
            .restaurant-info {
                flex-direction: column;
                text-align: center;
                padding: var(--space-lg);
                gap: var(--space-lg);
            }
            
            .restaurant-image {
                width: 120px;
                height: 120px;
            }
            
            .restaurant-meta {
                justify-content: center;
            }
            
            .menu-grid {
                grid-template-columns: 1fr;
                gap: var(--space-lg);
            }
            
            .menu-item-header {
                flex-direction: column;
                gap: var(--space-sm);
            }
            
            .menu-item-price {
                align-self: flex-start;
            }
            
            .menu-item-footer {
                flex-direction: column;
                gap: var(--space-md);
                align-items: flex-start;
            }
            
            .add-to-cart-btn {
                width: 100%;
                justify-content: center;
            }
            
            .footer-content {
                grid-template-columns: 1fr;
                text-align: center;
                gap: var(--space-lg);
            }
            
            .footer-section h3::after {
                left: 50%;
                transform: translateX(-50%);
            }
            
            .footer-links a {
                justify-content: center;
            }
            
            .contact-info li {
                justify-content: center;
            }
        }

        @media (max-width: 480px) {
            :root {
                --font-size-xxl: 1.75rem;
                --font-size-xl: 1.25rem;
            }
            
            .page-header {
                margin-bottom: var(--space-xl);
            }
            
            .nav-link span {
                display: none;
            }
            
            .nav-link {
                padding: var(--space-sm);
            }
        }

        /* =============================================
           CUSTOM SCROLLBAR
        ============================================= */
        ::-webkit-scrollbar {
            width: 10px;
        }

        ::-webkit-scrollbar-track {
            background: var(--light-bg);
            border-radius: var(--radius-sm);
        }

        ::-webkit-scrollbar-thumb {
            background: var(--primary-light);
            border-radius: var(--radius-sm);
        }

        ::-webkit-scrollbar-thumb:hover {
            background: var(--primary-color);
        }

        /* =============================================
           SELECTION STYLING
        ============================================= */
        ::selection {
            background-color: rgba(255, 107, 53, 0.3);
            color: var(--secondary-color);
        }

        /* =============================================
           ACCESSIBILITY
        ============================================= */
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

        .focus-visible:focus-visible {
            outline: 2px solid var(--primary-color);
            outline-offset: 2px;
        }

        /* =============================================
           LOADING STATES
        ============================================= */
        .loading {
            background: linear-gradient(90deg, 
                var(--light-gray) 25%, 
                var(--medium-gray) 50%, 
                var(--light-gray) 75%);
            background-size: 200% 100%;
            animation: loading 1.5s infinite;
        }

        @keyframes loading {
            0% { background-position: -200% 0; }
            100% { background-position: 200% 0; }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <nav class="navbar container">
            <a href="#" class="logo">
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
                        <i class="fas fa-utensils nav-icon"></i>
                        <span>Menu</span>
                    </a>
                </li>
                <li>
                    <a href="cart.jsp" class="nav-link">
                        <i class="fas fa-shopping-cart nav-icon"></i>
                        <span>Cart</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="nav-link">
                        <i class="fas fa-user-circle nav-icon"></i>
                        <span>Profile</span>
                    </a>
                </li>
            </ul>
        </nav>
    </header>

    <!-- Main Content -->
    <main class="main-content container">
        <div class="page-header">
            <h1 class="page-title">Our Menu</h1>
        </div>

      
        <!-- Menu Items Grid -->
        <section class="menu-section">
            <div class="menu-grid">
                <% 
                List<Menu> allMenus = (List<Menu>) request.getAttribute("allMenus");
                if (allMenus != null && !allMenus.isEmpty()) {
                    for (Menu menu : allMenus) {
                %>
                <article class="menu-item">
                    <div class="menu-item-image">
                        <img src="<%=menu.getImageUrl()%>" 
                             alt="<%=menu.getMenuName()%>">
                    </div>
                    <div class="menu-item-content">
                        <div class="menu-item-header">
                            <h3 class="menu-item-name"><%=menu.getMenuName()%></h3>
                            <div class="menu-item-price">₹<%=menu.getPrice() %></div>
                        </div>
                        <p class="menu-item-description"><%=menu.getDescription()%></p>
                        <div class="menu-item-footer">
                            <div class="menu-item-rating">
                                <i class="fas fa-star"></i>
                                <span><%=menu.getRating()%></span>
                            </div>
                            <form action="cart" method="get">
                                <input type="hidden" name="itemId" value="<%= menu.getMenuId() %>">
                                <input type="hidden" name="restaurantId" value="<%= menu.getRestaurantId() %>">
                                <input type="hidden" name="quantity" value="1">
                                <input type="hidden" name="action" value="add">
                                <button type="submit" class="add-to-cart-btn">
                                    <i class="fas fa-shopping-cart"></i> Add to Cart
                                </button>
                            </form>
                        </div>
                    </div>
                </article>
                <%  
                    }
                } else {
                    out.println("<p class='text-center'>No menu items available</p>");
                }
                %>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h3>FoodMate</h3>
                    <p class="contact-info">Delivering delicious meals to your doorstep since 2024. Order from the best restaurants in town.</p>
                </div>
                
                <div class="footer-section">
                    <h3>Contact Info</h3>
                    <ul class="contact-info">
                        <li><i class="fas fa-phone"></i> +91 98765 43210</li>
                        <li><i class="fas fa-envelope"></i> support@foodmate.com</li>
                     </ul>
                </div>
                <div class="footer-section">
                    <h3>Follow Us</h3>
                    <ul class="footer-links">
                        <li><a href="#"><i class="fab fa-facebook"></i> Facebook</a></li>
                        <li><a href="#"><i class="fab fa-twitter"></i> Twitter</a></li>
                        <li><a href="#"><i class="fab fa-instagram"></i> Instagram</a></li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2024 FoodMate. All rights reserved.</p>
            </div>
        </div>
    </footer>
</body>
</html>