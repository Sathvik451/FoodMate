<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FoodMate | Checkout</title>
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

        /* Back Link */
        .back-link {
            display: inline-flex;
            align-items: center;
            gap: var(--space-sm);
            color: var(--gray-600);
            font-weight: 500;
            padding: var(--space-sm) var(--space-md);
            border-radius: var(--radius-md);
            transition: all var(--transition-normal);
            margin-bottom: var(--space-xl);
            background: var(--white);
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--border-color);
        }

        .back-link:hover {
            background: var(--primary);
            color: var(--white);
            transform: translateX(-4px);
            box-shadow: var(--shadow-md);
        }

        /* =============================================
           CHECKOUT COMPONENTS - COMPACT
        ============================================= */
        .checkout-section {
            display: grid;
            grid-template-columns: 1fr;
            gap: var(--space-lg); /* Reduced from xl to lg */
            align-items: start;
        }

        /* Checkout Cards - Compact */
        .checkout-card {
            background: var(--card-bg);
            border-radius: var(--radius-lg); /* Reduced from xl to lg */
            box-shadow: var(--shadow-md); /* Reduced from lg to md */
            overflow: hidden;
            animation: slideIn 0.5s ease;
        }

        .checkout-header {
            padding: var(--space-lg); /* Reduced from xl to lg */
            border-bottom: 1px solid var(--border-color);
            background: linear-gradient(135deg, rgba(255, 107, 53, 0.05), rgba(0, 184, 148, 0.05));
        }

        .checkout-header h2 {
            display: flex;
            align-items: center;
            gap: var(--space-sm);
            color: var(--gray-700);
        }

        .checkout-content {
            padding: var(--space-lg); /* Reduced from xl to lg */
        }

        /* =============================================
           ADDRESS SECTION - COMPACT
        ============================================= */
        .address-cards {
            display: flex;
            flex-direction: column;
            gap: var(--space-sm); /* Reduced from md to sm */
        }

        .address-card {
            display: flex;
            align-items: flex-start;
            gap: var(--space-sm); /* Reduced from md to sm */
            padding: var(--space-md); /* Reduced from lg to md */
            background: var(--light);
            border: 2px solid transparent;
            border-radius: var(--radius-md); /* Reduced from lg to md */
            cursor: pointer;
            transition: all var(--transition-normal);
            position: relative;
        }

        .address-card:hover {
            border-color: var(--primary-light);
            box-shadow: var(--shadow-md);
            transform: translateY(-2px);
        }

        .address-card.selected {
            border-color: var(--primary);
            background-color: rgba(255, 107, 53, 0.05);
        }

        .address-radio {
            width: 24px;
            height: 24px;
            border: 2px solid var(--gray-400);
            border-radius: 50%;
            margin-top: 2px;
            position: relative;
            flex-shrink: 0;
            transition: all var(--transition-normal);
        }

        .address-card.selected .address-radio {
            border-color: var(--primary);
            background: var(--primary);
        }

        .address-card.selected .address-radio::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 10px;
            height: 10px;
            background: var(--white);
            border-radius: 50%;
        }

        .address-content {
            flex: 1;
        }

        .address-content h4 {
            display: flex;
            align-items: center;
            gap: var(--space-xs);
            font-size: 1rem; /* Reduced from 1.125rem to 1rem */
            font-weight: 600;
            margin-bottom: var(--space-xs);
            color: var(--gray-700);
        }

        .address-tag {
            background: var(--primary);
            color: var(--white);
            font-size: 0.75rem;
            padding: 2px 10px;
            border-radius: var(--radius-round);
            font-weight: 600;
        }

        .address-content p {
            color: var(--gray-600);
            font-size: 0.9rem; /* Reduced from 0.95rem to 0.9rem */
            margin-bottom: 0;
            line-height: 1.4; /* Reduced from 1.5 to 1.4 */
        }

        .add-new-address {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: var(--space-xs);
            padding: var(--space-lg); /* Reduced from xl to lg */
            background: var(--white);
            border: 2px dashed var(--gray-300);
            border-radius: var(--radius-md); /* Reduced from lg to md */
            color: var(--gray-600);
            font-weight: 600;
            cursor: pointer;
            transition: all var(--transition-normal);
            font-size: 0.95rem;
        }

        .add-new-address:hover {
            border-color: var(--primary);
            color: var(--primary);
            background: rgba(255, 107, 53, 0.05);
            transform: translateY(-2px);
        }

        /* =============================================
           NEW ADDRESS FORM - COMPACT
        ============================================= */
        .new-address-form {
            margin-top: var(--space-md); /* Reduced from lg to md */
            padding: var(--space-lg); /* Reduced from xl to lg */
            background: var(--light);
            border-radius: var(--radius-lg); /* Reduced from xl to lg */
            box-shadow: var(--shadow-sm); /* Reduced from md to sm */
            animation: slideDown 0.3s ease;
            border: 1px solid var(--border-color);
        }

        .new-address-form h4 {
            margin-bottom: var(--space-md); /* Reduced from lg to md */
            color: var(--gray-700);
            display: flex;
            align-items: center;
            gap: var(--space-xs);
            font-size: 1.1rem;
        }

        .form-group {
            margin-bottom: var(--space-md); /* Reduced from lg to md */
        }

        .form-label {
            display: block;
            font-size: 0.95rem;
            font-weight: 600;
            color: var(--gray-700);
            margin-bottom: var(--space-sm);
        }

        .form-label .required {
            color: var(--danger);
        }

        .form-input {
            width: 100%;
            padding: var(--space-sm); /* Reduced from md to sm */
            background: var(--white);
            border: 2px solid var(--gray-300);
            border-radius: var(--radius-md);
            font-family: var(--font-sans);
            font-size: 0.95rem; /* Added font size reduction */
            color: var(--gray-700);
            transition: all var(--transition-normal);
        }

        .form-input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(255, 107, 53, 0.1);
        }

        .form-input::placeholder {
            color: var(--gray-400);
        }

        textarea.form-input {
            min-height: 100px; /* Reduced from 120px to 100px */
            resize: vertical;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: var(--space-md);
        }

        .form-actions {
            display: flex;
            gap: var(--space-sm); /* Reduced from md to sm */
            margin-top: var(--space-lg); /* Reduced from xl to lg */
        }

        /* =============================================
           PAYMENT SECTION - COMPACT
        ============================================= */
        .payment-methods {
            display: flex;
            flex-direction: column;
            gap: var(--space-xs); /* Reduced from sm to xs */
        }

        .payment-method {
            display: flex;
            align-items: center;
            gap: var(--space-sm); /* Reduced from md to sm */
            padding: var(--space-md); /* Reduced from lg to md */
            background: var(--light);
            border: 2px solid transparent;
            border-radius: var(--radius-md); /* Reduced from lg to md */
            cursor: pointer;
            transition: all var(--transition-normal);
        }

        .payment-method:hover {
            border-color: var(--primary-light);
            box-shadow: var(--shadow-md);
            transform: translateY(-2px);
        }

        .payment-method.selected {
            border-color: var(--primary);
            background-color: rgba(255, 107, 53, 0.05);
        }

        .payment-radio {
            width: 24px;
            height: 24px;
            border: 2px solid var(--gray-400);
            border-radius: 50%;
            position: relative;
            flex-shrink: 0;
            transition: all var(--transition-normal);
        }

        .payment-method.selected .payment-radio {
            border-color: var(--primary);
            background: var(--primary);
        }

        .payment-method.selected .payment-radio::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 10px;
            height: 10px;
            background: var(--white);
            border-radius: 50%;
        }

        .payment-icon {
            width: 50px; /* Reduced from 60px to 50px */
            height: 35px; /* Reduced from 45px to 35px */
            background: var(--white);
            border-radius: var(--radius-sm); /* Reduced from md to sm */
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.25rem; /* Reduced from 1.5rem to 1.25rem */
            box-shadow: var(--shadow-sm);
            flex-shrink: 0;
        }

        .payment-info {
            flex: 1;
        }

        .payment-info h4 {
            font-size: 1rem; /* Reduced from 1.125rem to 1rem */
            font-weight: 600;
            margin-bottom: var(--space-xs);
            color: var(--gray-700);
        }

        .payment-info p {
            font-size: 0.9rem; /* Reduced from 0.95rem to 0.9rem */
            color: var(--gray-600);
            margin-bottom: 0;
        }

        /* Payment Forms - Compact */
        .payment-form {
            margin-top: var(--space-md); /* Reduced from lg to md */
            padding: var(--space-lg); /* Reduced from xl to lg */
            background: var(--light);
            border-radius: var(--radius-lg); /* Reduced from xl to lg */
            box-shadow: var(--shadow-sm); /* Reduced from md to sm */
            animation: slideDown 0.3s ease;
            display: none;
            border: 1px solid var(--border-color);
        }

        .payment-form.active {
            display: block;
        }

        /* Info Box - Compact */
        .info-box {
            display: flex;
            align-items: center;
            gap: var(--space-sm); /* Reduced from md to sm */
            padding: var(--space-md); /* Reduced from lg to md */
            background: rgba(0, 184, 148, 0.1);
            border-radius: var(--radius-md); /* Reduced from lg to md */
            color: var(--accent);
            border: 1px solid rgba(0, 184, 148, 0.2);
        }

        .info-box i {
            font-size: 1.5rem; /* Reduced from 1.75rem to 1.5rem */
            flex-shrink: 0;
        }

        .info-content h4 {
            font-size: 1rem; /* Reduced from 1.125rem to 1rem */
            margin-bottom: var(--space-xs);
            color: var(--accent);
        }

        .info-content p {
            font-size: 0.9rem; /* Reduced from 0.95rem to 0.9rem */
            color: var(--gray-600);
            margin-bottom: 0;
        }

        /* UPI Options - Compact */
        .upi-options {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: var(--space-xs); /* Reduced from md to xs */
            margin-top: var(--space-md); /* Reduced from lg to md */
        }

        .upi-option {
            padding: var(--space-md); /* Reduced from lg to md */
            background: var(--white);
            border: 2px solid var(--gray-300);
            border-radius: var(--radius-md); /* Reduced from lg to md */
            text-align: center;
            cursor: pointer;
            transition: all var(--transition-normal);
        }

        .upi-option:hover {
            border-color: var(--primary);
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        .upi-option img {
            height: 30px; /* Reduced from 35px to 30px */
            margin-bottom: var(--space-xs); /* Reduced from sm to xs */
            object-fit: contain;
        }

        .upi-option p {
            font-size: 0.85rem; /* Reduced from 0.9rem to 0.85rem */
            font-weight: 600;
            color: var(--gray-700);
            margin-bottom: 0;
        }

        /* =============================================
           ORDER ACTIONS - COMPACT
        ============================================= */
        .order-actions {
            margin-top: var(--space-lg); /* Reduced from xl to lg */
            padding: var(--space-lg); /* Reduced from xl to lg */
            background: var(--card-bg);
            border-radius: var(--radius-lg); /* Reduced from xl to lg */
            box-shadow: var(--shadow-md); /* Reduced from lg to md */
            border: 1px solid var(--border-color);
            text-align: center;
        }

        /* Buttons */
        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: var(--space-sm);
            padding: var(--space-md) var(--space-xl);
            border: none;
            border-radius: var(--radius-lg);
            font-family: var(--font-sans);
            font-size: 1.125rem;
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
            padding: var(--space-md); /* Reduced from lg to md */
            font-size: 1.1rem; /* Reduced from 1.25rem to 1.1rem */
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-xl);
            background: linear-gradient(135deg, var(--primary-dark), var(--primary));
        }

        .btn-secondary {
            background: transparent;
            border: 2px solid var(--gray-300);
            color: var(--gray-600);
        }

        .btn-secondary:hover {
            border-color: var(--primary);
            color: var(--primary);
        }

        .btn-sm {
            padding: var(--space-sm) var(--space-lg);
            font-size: 1rem;
            width: auto;
        }

        /* Security Info - Compact */
        .security-info {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: var(--space-sm); /* Reduced from md to sm */
            margin-top: var(--space-md); /* Reduced from lg to md */
            padding: var(--space-sm); /* Reduced from md to sm */
            background: var(--light);
            border-radius: var(--radius-md); /* Reduced from lg to md */
            border: 1px solid var(--border-color);
        }

        .security-info i {
            color: var(--accent);
            font-size: 1.5rem;
            flex-shrink: 0;
        }

        .security-info p {
            font-size: 0.95rem; /* Reduced from 1rem to 0.95rem */
            color: var(--gray-600);
            margin-bottom: 0;
            font-weight: 500;
        }

        /* =============================================
           MODAL
        ============================================= */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.7);
            z-index: var(--z-modal);
            align-items: center;
            justify-content: center;
            padding: var(--space-lg);
            animation: fadeIn 0.3s ease;
        }

        .modal.active {
            display: flex;
        }

        .modal-content {
            background: var(--white);
            padding: var(--space-xxl);
            border-radius: var(--radius-xl);
            text-align: center;
            max-width: 400px;
            width: 100%;
            animation: modalSlideUp 0.3s ease;
            box-shadow: var(--shadow-xl);
        }

        /* Spinner */
        .spinner {
            width: 70px;
            height: 70px;
            border: 4px solid var(--gray-200);
            border-top-color: var(--primary);
            border-radius: 50%;
            animation: spin 1s linear infinite;
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

        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes modalSlideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        .checkout-card {
            animation: slideIn 0.3s ease forwards;
            opacity: 0;
        }

        .checkout-card:nth-child(1) { animation-delay: 0.1s; }
        .checkout-card:nth-child(2) { animation-delay: 0.2s; }

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
           RESPONSIVE DESIGN - UPDATED FOR COMPACT
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

            h1 {
                font-size: 2rem;
            }

            h2 {
                font-size: 1.5rem;
            }

            .checkout-content {
                padding: var(--space-md); /* Reduced from lg to md */
            }

            .checkout-header {
                padding: var(--space-md); /* Reduced from lg to md */
            }

            .form-row {
                grid-template-columns: 1fr;
            }

            .upi-options {
                grid-template-columns: 1fr;
            }

            .form-actions {
                flex-direction: column;
            }

            .address-card,
            .payment-method {
                padding: var(--space-sm); /* Further reduced for mobile */
            }

            .payment-icon {
                width: 45px; /* Further reduced for mobile */
                height: 32px; /* Further reduced for mobile */
                font-size: 1.125rem; /* Further reduced for mobile */
            }

            .order-actions {
                padding: var(--space-md); /* Reduced from lg to md */
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 0 var(--space-md);
            }

            .main-content {
                padding: var(--space-lg) 0; /* Reduced from xl to lg */
            }

            .checkout-header {
                padding: var(--space-sm); /* Further reduced for small screens */
            }

            .order-actions {
                padding: var(--space-md); /* Further reduced for small screens */
            }

            .btn {
                padding: var(--space-md) var(--space-lg);
            }

            .btn-primary {
                font-size: 1rem; /* Further reduced for small screens */
                padding: var(--space-sm) var(--space-md); /* Further reduced */
            }

            .security-info {
                flex-direction: column;
                text-align: center;
                padding: var(--space-xs); /* Further reduced */
            }

            .modal-content {
                padding: var(--space-xl);
            }

            .upi-options {
                grid-template-columns: repeat(2, 1fr); /* Better fit for mobile */
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
                    <a href="cart" class="nav-link">
                        <i class="fas fa-shopping-cart nav-icon"></i>
                        <span>Cart</span>
                        <%
                        // Cart badge logic would go here
                        // You can add your JSP code for cart count
                        %>
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
            <h1>Secure Checkout</h1>
            </div>

       

        <div class="checkout-section">
            <!-- Delivery Address -->
            <div class="checkout-card">
                <div class="checkout-header">
                    <h2><i class="fas fa-map-marker-alt"></i> Delivery Address</h2>
                </div>
                <div class="checkout-content">
                    <div class="address-cards" id="addressCards">
                        <div class="address-card selected" data-address="home">
                            <div class="address-radio"></div>
                            <div class="address-content">
                                <h4>
                                    Home
                                </h4>
                                <p>123 Main Street, Koramangala, Bangalore, Karnataka - 560034</p>
                            </div>
                        </div>
                        <div class="address-card" data-address="work">
                            <div class="address-radio"></div>
                            <div class="address-content">
                                <h4>Work</h4>
                                <p>456 Tech Park, Whitefield, Bangalore, Karnataka - 560066</p>
                            </div>
                        </div>
                        <div class="add-new-address" id="addNewAddress">
                            <i class="fas fa-plus"></i>
                            Add New Address
                        </div>
                    </div>

                    <!-- New Address Form -->
                    <div class="new-address-form" id="newAddressForm" style="display: none;">
                        <h4><i class="fas fa-map-marker-alt"></i> Add New Address</h4>
                        <div class="form-group">
                            <label class="form-label">Address Type</label>
                            <select class="form-input" id="addressType">
                                <option value="home">Home</option>
                                <option value="work">Work</option>
                                <option value="other">Other</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Full Address <span class="required">*</span></label>
                            <textarea class="form-input" id="fullAddress" rows="3" placeholder="Enter your complete address..." required></textarea>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label class="form-label">City <span class="required">*</span></label>
                                <input type="text" class="form-input" id="city" placeholder="City" required>
                            </div>
                            <div class="form-group">
                                <label class="form-label">PIN Code <span class="required">*</span></label>
                                <input type="text" class="form-input" id="pincode" placeholder="560034" required>
                            </div>
                        </div>
                        <div class="form-actions">
                            <button class="btn btn-primary btn-sm" id="saveAddress">
                                <i class="fas fa-save"></i>
                                Save Address
                            </button>
                            <button class="btn btn-secondary btn-sm" id="cancelAddress">
                                <i class="fas fa-times"></i>
                                Cancel
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Payment Method -->
            <div class="checkout-card">
                <div class="checkout-header">
                    <h2><i class="fas fa-credit-card"></i> Payment Method</h2>
                </div>
                <div class="checkout-content">
                    <div class="payment-methods" id="paymentMethods">
                        <!-- Card Payment -->
                        <div class="payment-method" data-method="card">
                            <div class="payment-radio"></div>
                            <div class="payment-icon">💳</div>
                            <div class="payment-info">
                                <h4>Credit / Debit Card</h4>
                                <p>Visa, Mastercard, RuPay accepted</p>
                            </div>
                        </div>

                        <!-- UPI Payment -->
                        <div class="payment-method selected" data-method="upi">
                            <div class="payment-radio"></div>
                            <div class="payment-icon">📱</div>
                            <div class="payment-info">
                                <h4>UPI</h4>
                                <p>Google Pay, PhonePe, Paytm, BHIM</p>
                            </div>
                        </div>

                        <!-- Cash on Delivery -->
                        <div class="payment-method" data-method="cod">
                            <div class="payment-radio"></div>
                            <div class="payment-icon">💵</div>
                            <div class="payment-info">
                                <h4>Cash on Delivery</h4>
                                <p>Pay when your order arrives</p>
                            </div>
                        </div>
                    </div>

                    <!-- Card Payment Form -->
                    <div class="payment-form" id="cardForm">
                        <div class="form-group">
                            <label class="form-label">Card Number <span class="required">*</span></label>
                            <input type="text" class="form-input" id="cardNumber" placeholder="1234 5678 9012 3456" maxlength="19" required>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label class="form-label">Expiry Date <span class="required">*</span></label>
                                <input type="text" class="form-input" id="cardExpiry" placeholder="MM/YY" maxlength="5" required>
                            </div>
                            <div class="form-group">
                                <label class="form-label">CVV <span class="required">*</span></label>
                                <input type="password" class="form-input" id="cardCvv" placeholder="***" maxlength="3" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Cardholder Name <span class="required">*</span></label>
                            <input type="text" class="form-input" id="cardName" placeholder="John Doe" required>
                        </div>
                    </div>

                    <!-- UPI Payment Form -->
                    <div class="payment-form active" id="upiForm">
                        <div class="form-group">
                            <label class="form-label">Enter UPI ID <span class="required">*</span></label>
                            <input type="text" class="form-input" id="upiId" placeholder="yourname@upi" required>
                        </div>
                        <div class="upi-options">
                            <div class="upi-option" data-app="gpay">
                                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Google_Pay_Logo.svg/512px-Google_Pay_Logo.svg.png" alt="Google Pay">
                                <p>Google Pay</p>
                            </div>
                            <div class="upi-option" data-app="phonepe">
                                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/PhonePe_Logo.svg/512px-PhonePe_Logo.svg.png" alt="PhonePe">
                                <p>PhonePe</p>
                            </div>
                            <div class="upi-option" data-app="paytm">
                                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Paytm_Logo_%28standalone%29.svg/512px-Paytm_Logo_%28standalone%29.svg.png" alt="Paytm">
                                <p>Paytm</p>
                            </div>
                        </div>
                    </div>

                    <!-- COD Info -->
                    <div class="payment-form" id="codForm">
                        <div class="info-box">
                            <i class="fas fa-info-circle"></i>
                            <div class="info-content">
                                <h4>Pay when your order arrives</h4>
                                <p>Please keep exact change ready for the delivery</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Order Actions -->
            <div class="order-actions">
                <button class="btn btn-primary" id="placeOrderBtn">
                    <i class="fas fa-check-circle"></i>
                    Place Order
                </button>
                
                <div class="security-info">
                    <i class="fas fa-shield-alt"></i>
                    <p>100% Secure Payment. Your data is protected.</p>
                </div>
            </div>
        </div>
    </main>

    <!-- Processing Modal -->
    <div class="modal" id="processingModal">
        <div class="modal-content">
            <div class="spinner"></div>
            <h3>Processing Order...</h3>
            <p class="text-secondary">Please wait while we confirm your order</p>
        </div>
    </div>

    <script>
        // Initialize variables
        let selectedPaymentMethod = 'upi';
        let selectedAddress = 'home';
        
        // Initialize on page load
        document.addEventListener('DOMContentLoaded', function() {
            // Address selection
            document.querySelectorAll('.address-card').forEach(card => {
                card.addEventListener('click', function() {
                    document.querySelectorAll('.address-card').forEach(c => c.classList.remove('selected'));
                    this.classList.add('selected');
                    selectedAddress = this.dataset.address;
                });
            });
            
            // Add new address
            document.getElementById('addNewAddress').addEventListener('click', function() {
                document.getElementById('newAddressForm').style.display = 'block';
            });
            
            document.getElementById('cancelAddress').addEventListener('click', function() {
                document.getElementById('newAddressForm').style.display = 'none';
            });
            
            document.getElementById('saveAddress').addEventListener('click', function() {
                const type = document.getElementById('addressType').value;
                const address = document.getElementById('fullAddress').value;
                const city = document.getElementById('city').value;
                const pincode = document.getElementById('pincode').value;
                
                if (!address || !city || !pincode) {
                    alert('Please fill all required fields');
                    return;
                }
                
                // Create new address card
                const addressCards = document.getElementById('addressCards');
                const newCard = document.createElement('div');
                newCard.className = 'address-card selected';
                newCard.dataset.address = type + Date.now();
                newCard.innerHTML = `
                    <div class="address-radio"></div>
                    <div class="address-content">
                        <h4>${type.charAt(0).toUpperCase() + type.slice(1)}</h4>
                        <p>${address}, ${city} - ${pincode}</p>
                    </div>
                `;
                
                // Add click event
                newCard.addEventListener('click', function() {
                    document.querySelectorAll('.address-card').forEach(c => c.classList.remove('selected'));
                    this.classList.add('selected');
                    selectedAddress = this.dataset.address;
                });
                
                // Insert before add new button
                addressCards.insertBefore(newCard, document.getElementById('addNewAddress'));
                
                // Reset and hide form
                document.getElementById('fullAddress').value = '';
                document.getElementById('city').value = '';
                document.getElementById('pincode').value = '';
                document.getElementById('newAddressForm').style.display = 'none';
            });
            
            // Payment method selection
            document.querySelectorAll('.payment-method').forEach(method => {
                method.addEventListener('click', function() {
                    document.querySelectorAll('.payment-method').forEach(m => m.classList.remove('selected'));
                    this.classList.add('selected');
                    selectedPaymentMethod = this.dataset.method;
                    
                    // Show/hide payment forms
                    document.querySelectorAll('.payment-form').forEach(form => form.classList.remove('active'));
                    document.getElementById(selectedPaymentMethod + 'Form').classList.add('active');
                });
            });
            
            // Card number formatting
            document.getElementById('cardNumber')?.addEventListener('input', function(e) {
                let value = e.target.value.replace(/\s/g, '').replace(/\D/g, '');
                let formatted = value.match(/.{1,4}/g)?.join(' ') || '';
                e.target.value = formatted;
            });
            
            // Expiry date formatting
            document.getElementById('cardExpiry')?.addEventListener('input', function(e) {
                let value = e.target.value.replace(/\D/g, '');
                if (value.length >= 2) {
                    value = value.slice(0, 2) + '/' + value.slice(2);
                }
                e.target.value = value;
            });
            
            // UPI option selection
            document.querySelectorAll('.upi-option').forEach(option => {
                option.addEventListener('click', function() {
                    const app = this.dataset.app;
                    let upiId = '';
                    
                    switch(app) {
                        case 'gpay':
                            upiId = 'example@okaxis';
                            break;
                        case 'phonepe':
                            upiId = 'example@ybl';
                            break;
                        case 'paytm':
                            upiId = 'example@paytm';
                            break;
                    }
                    
                    document.getElementById('upiId').value = upiId;
                    
                    // Visual feedback
                    document.querySelectorAll('.upi-option').forEach(opt => opt.style.borderColor = '');
                    this.style.borderColor = 'var(--primary)';
                });
            });
            
            // Place order
            document.getElementById('placeOrderBtn').addEventListener('click', function() {
                // Validate based on payment method
                if (selectedPaymentMethod === 'card') {
                    const cardNumber = document.getElementById('cardNumber').value.replace(/\s/g, '');
                    const expiry = document.getElementById('cardExpiry').value;
                    const cvv = document.getElementById('cardCvv').value;
                    const name = document.getElementById('cardName').value;
                    
                    if (!cardNumber || cardNumber.length < 16 || !expiry || !cvv || !name) {
                        alert('Please fill all card details');
                        return;
                    }
                } else if (selectedPaymentMethod === 'upi') {
                    const upiId = document.getElementById('upiId').value;
                    if (!upiId || !upiId.includes('@')) {
                        alert('Please enter a valid UPI ID');
                        return;
                    }
                }
                
                // Show processing modal
                document.getElementById('processingModal').classList.add('active');
                
                // Simulate processing delay
                setTimeout(() => {
                    // In real application, this would submit the form
                    // For demo, redirect to confirmation page
                    window.location.href = 'OrderConformation.html';
                }, 2000);
            });
        });
    </script>
</body>
</html>