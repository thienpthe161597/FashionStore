<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8" %>

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta
            name="description"
            content="Shome - Shoes eCommerce Website Template"
            />
        <meta
            name="keywords"
            content="footwear, shoes, modern, shop, store, ecommerce, responsive, e-commerce"
            />
        <meta name="author" content="codecarnival" />

        <title>About Us :: Shome - Shoes eCommerce Website Template</title>

        <!--== Favicon ==-->
        <link
            rel="shortcut icon"
            href="assets/img/favicon.ico"
            type="image/x-icon"
            />

        <!--== Google Fonts ==-->
        <link rel="preconnect" href="https://fonts.googleapis.com/" />
        <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,600;0,700;0,800;1,400;1,500&amp;display=swap"
            rel="stylesheet"
            />

        <!--== Bootstrap CSS ==-->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <!--== Font Awesome Min Icon CSS ==-->
        <link href="assets/css/font-awesome.min.css" rel="stylesheet" />
        <!--== Pe7 Stroke Icon CSS ==-->
        <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
        <!--== Swiper CSS ==-->
        <link href="assets/css/swiper.min.css" rel="stylesheet" />
        <!--== Fancybox Min CSS ==-->
        <link href="assets/css/fancybox.min.css" rel="stylesheet" />
        <!--== Aos Min CSS ==-->
        <link href="assets/css/aos.min.css" rel="stylesheet" />

        <!--== Main Style CSS ==-->
        <link href="assets/css/style.css" rel="stylesheet" />

        <!--[if lt IE 9]>
          <script
            <script
            src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"
          ></script>
        <![endif]-->
    </head>

    <body>
        <!--wrapper start-->
        <div class="wrapper">
            <!--== Start Header Wrapper ==-->
            <header class="main-header-wrapper position-relative">
                <div class="header-top">
                    <div class="container pt--0 pb--0">
                        <div class="row">
                            <div class="col-12">
                                <div class="header-top-align">
                                    <div class="header-top-align-start">
                                        <div class="desc">
                                            <p>
                                                World Wide Completely Free Returns and Free Shipping
                                            </p>
                                        </div>
                                    </div>
                                    <div class="header-top-align-end">
                                        <c:if test="${user == null}">
                                        <div class="header-info-items">
                                            <div class="info-items">
                                                <ul>
                                                    <li class="account">
                                                        <i class="fa fa-user"></i
                                                        ><a href="login">Account</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        </c:if>
                                        <c:if test="${user != null}">
                                        <div class="header-info-items">
                                            <div class="info-items">
                                                <ul>
                                                    <li class="email">
                                                        <i class="fa fa-envelope"></i
                                                        ><a 
                                                            >${user.getEmail()}</a
                                                        >
                                                    </li>
                                                    <li class="account">
                                                        <i class="fa fa-user"></i
                                                        ><a href="user">${user.getUser_Name()}</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="header-middle">
                    <div class="container pt--0 pb--0">
                        <div class="row align-items-center">
                            <div class="col-12">
                                <div class="header-middle-align">
                                    <div class="header-middle-align-start">
                                        <div class="header-logo-area">
                                            <a href="home">
                                                <img
                                                    class="logo-main"
                                                    src="assets/img/logo.webp"
                                                    width="131"
                                                    height="34"
                                                    alt="Logo"
                                                    />
                                                <img
                                                    class="logo-light"
                                                    src="assets/img/logo-light.webp"
                                                    width="131"
                                                    height="34"
                                                    alt="Logo"
                                                    />
                                            </a>
                                        </div>
                                    </div>
                                    <div class="header-middle-align-center">
                                        <div class="header-search-area">
                                            <form class="header-searchbox">
                                                <input
                                                    type="search"
                                                    class="form-control"
                                                    placeholder="Search"
                                                    />
                                                <button class="btn-submit" type="submit">
                                                    <i class="pe-7s-search"></i>
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="header-middle-align-end">
                                        <div class="header-action-area">
                                            <div class="shopping-search">
                                                <button
                                                    class="shopping-search-btn"
                                                    type="button"
                                                    data-bs-toggle="offcanvas"
                                                    data-bs-target="#AsideOffcanvasSearch"
                                                    aria-controls="AsideOffcanvasSearch"
                                                    >
                                                    <i class="pe-7s-search icon"></i>
                                                </button>
                                            </div>
                                            <div class="shopping-wishlist">
                                                <a
                                                    class="shopping-wishlist-btn"
                                                    href="shop-wishlist.jsp"
                                                    >
                                                    <i class="pe-7s-like icon"></i>
                                                </a>
                                            </div>
                                            <div class="shopping-cart">
                                                <button
                                                    class="shopping-cart-btn"
                                                    type="button"
                                                    data-bs-toggle="offcanvas"
                                                    data-bs-target="#AsideOffcanvasCart"
                                                    aria-controls="offcanvasRightLabel"
                                                    >
                                                    <i class="pe-7s-shopbag icon"></i>
                                                    <sup class="shop-count">02</sup>
                                                </button>
                                            </div>
                                            <button
                                                class="btn-menu"
                                                type="button"
                                                data-bs-toggle="offcanvas"
                                                data-bs-target="#AsideOffcanvasMenu"
                                                aria-controls="AsideOffcanvasMenu"
                                                >
                                                <i class="pe-7s-menu"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="header-area header-default">
                    <div class="container">
                        <div class="row no-gutter align-items-center position-relative">
                            <div class="col-12">
                                <div class="header-align">
                                    <div class="header-navigation-area position-relative">
                                        <ul class="main-menu nav">
                                            <li >
                                                <a href="home"><span>Home</span></a>
<!--                                                <ul class="submenu-nav">
                                                    <li>
                                                        <a href="index.jsp"><span>Home One</span></a>
                                                    </li>
                                                    <li>
                                                        <a href="index-two.jsp"><span>Home Two</span></a>
                                                    </li>
                                                </ul>-->
                                            </li>
                                            <li>
                                                <a href="about-us.jsp"><span>About</span></a>
                                            </li>
<!--                                            <li class="has-submenu">
                                                <a href="#/"><span>Pages</span></a>
                                                <ul class="submenu-nav">
                                                    <li>
                                                        <a href="account.jsp"><span>Account</span></a>
                                                    </li>
                                                    <li>
                                                        <a href="account-login.jsp"><span>Login</span></a>
                                                    </li>
                                                    <li>
                                                        <a href="account-register.jsp"
                                                           ><span>Register</span></a
                                                        >
                                                    </li>
                                                    <li>
                                                        <a href="page-not-found.jsp"
                                                           ><span>Page Not Found</span></a
                                                        >
                                                    </li>
                                                </ul>
                                            </li>-->
                                            <li class="position-static">
                                                <a href="shop-three-columns.jsp"><span>Shop</span></a>
<!--                                                <ul class="submenu-nav submenu-nav-mega column-3">
                                                    <li class="mega-menu-item">
                                                        <a href="#/" class="mega-title"
                                                           ><span>Shop Layout</span></a
                                                        >
                                                        <ul>
                                                            <li>
                                                                <a href="shop-three-columns.jsp"
                                                                   ><span>Shop 3 Column</span></a
                                                                >
                                                            </li>
                                                            <li>
                                                                <a href="shop-four-columns.jsp"
                                                                   ><span>Shop 4 Column</span></a
                                                                >
                                                            </li>
                                                            <li>
                                                                <a href="shop.jsp"
                                                                   ><span>Shop Left Sidebar</span></a
                                                                >
                                                            </li>
                                                            <li>
                                                                <a href="shop-right-sidebar.jsp"
                                                                   ><span>Shop Right Sidebar</span></a
                                                                >
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li class="mega-menu-item">
                                                        <a href="#/" class="mega-title"
                                                           ><span>Single Product</span></a
                                                        >
                                                        <ul>
                                                            <li>
                                                                <a href="single-normal-product.jsp"
                                                                   ><span>Single Product Normal</span></a
                                                                >
                                                            </li>
                                                            <li>
                                                                <a href="single-product.jsp"
                                                                   ><span>Single Product Variable</span></a
                                                                >
                                                            </li>
                                                            <li>
                                                                <a href="single-group-product.jsp"
                                                                   ><span>Single Product Group</span></a
                                                                >
                                                            </li>
                                                            <li>
                                                                <a href="single-affiliate-product.jsp"
                                                                   ><span>Single Product Affiliate</span></a
                                                                >
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li class="mega-menu-item">
                                                        <a href="#/" class="mega-title"
                                                           ><span>Others Pages</span></a
                                                        >
                                                        <ul>
                                                            <li>
                                                                <a href="shop-cart.jsp"
                                                                   ><span>Shopping Cart</span></a
                                                                >
                                                            </li>
                                                            <li>
                                                                <a href="shop-checkout.jsp"
                                                                   ><span>Checkout</span></a
                                                                >
                                                            </li>
                                                            <li>
                                                                <a href="shop-wishlist.jsp"
                                                                   ><span>Wishlist</span></a
                                                                >
                                                            </li>
                                                            <li>
                                                                <a href="shop-compare.jsp"
                                                                   ><span>Compare</span></a
                                                                >
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>-->
                                            </li>
                                            <li class="position-static">
                                                <a href="blog">Blog</a>
<!--                                                <ul class="submenu-nav submenu-nav-mega">
                                                    <li class="mega-menu-item">
                                                        <a href="#/" class="mega-title">Blog Layout</a>
                                                        <ul>
                                                            <li><a href="blog.jsp">Blog Grid</a></li>
                                                            <li>
                                                                <a href="blog-left-sidebar.jsp"
                                                                   >Blog Left Sidebar</a
                                                                >
                                                            </li>
                                                            <li>
                                                                <a href="blog-right-sidebar.jsp"
                                                                   >Blog Right Sidebar</a
                                                                >
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li class="mega-menu-item">
                                                        <a href="#/" class="mega-title">Single Blog</a>
                                                        <ul>
                                                            <li>
                                                                <a href="blog-details-no-sidebar.jsp"
                                                                   >Blog Details</a
                                                                >
                                                            </li>
                                                            <li>
                                                                <a href="blog-details-left-sidebar.jsp"
                                                                   >Blog Details Left Sidebar</a
                                                                >
                                                            </li>
                                                            <li>
                                                                <a href="blog-details.jsp"
                                                                   >Blog Details Right Sidebar</a
                                                                >
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>-->
                                            </li>
                                            <li>
                                                <a href="contact.jsp"><span>Contact</span></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
