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
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

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
                                                        <i class="fa fa-envelope"></i>
                                                        <a href="user">${user.getEmail()}</a>
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
                                            <form action="SearchProductController" method="get"class="header-searchbox">
                                                <input
                                                    type="search"
                                                    name="search"
                                                    class="form-control"
                                                    placeholder="Search"
                                                    value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>"
                                                    />
                                                <button class="btn-submit" type="submit">
                                                    <i class="pe-7s-search"></i>
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="header-middle-align-end">
                                        <div class="header-action-area">
                                            <div class="shopping-cart">
                                                <button
                                                    class="shopping-cart-btn"
                                                    type="button"
                                                    onclick="window.location.href='shop-cart.jsp'"
                                                    >
                                                    <i class="pe-7s-shopbag icon"></i>
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
                                            <li class="position-static">
                                                <a href="ProductController"><span>Shop</span></a>
                                            </li>
                                            <li>
                                                <a href="ProductController?gender=Men"><span>Men</span></a>
                                            </li> 
                                            <li>
                                                <a href="ProductController?gender=Women"><span>Women</span></a>
                                            </li> 
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
