<%@ include file="./header.jsp" %>
<!--== End Header Wrapper ==-->

<main class="main-content">
    <!--== Start Page Header Area Wrapper ==-->
    <div class="page-header-area" data-bg-img="assets/img/photos/bg3.webp">
        <div class="container pt--0 pb--0">
            <div class="row">
                <div class="col-12">
                    <div class="page-header-content">
                        <h2 class="title" data-aos="fade-down" data-aos-duration="1000">Shopping Cart</h2>
                        <nav class="breadcrumb-area" data-aos="fade-down" data-aos-duration="1200">
                            <ul class="breadcrumb">
                                <li><a href="index.jsp">Home</a></li>
                                <li class="breadcrumb-sep">//</li>
                                <li>Shopping Cart</li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--== End Page Header Area Wrapper ==-->

    <!--== Start Blog Area Wrapper ==-->
    <section class="shopping-cart-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="shopping-cart-form table-responsive">
                        <form action="CartServlet" method="post">
                            <table class="table text-center">
                                <thead>
                                    <tr>
                                        <th class="product-remove">&nbsp;</th>
                                        <th class="product-thumb">&nbsp;</th>
                                        <th class="product-name">Product</th>
                                        <th class="product-price">Price</th>
                                        <th class="product-quantity">Quantity</th>
                                        <th class="product-subtotal">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                      // L?y gi? h�ng t? session
                                      List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
                                      double grandTotal = 0;
                                      if (cart != null) {
                                        for (CartItem item : cart) {
                                          double subtotal = item.getPrice() * item.getQuantity();
                                          grandTotal += subtotal;
                                    %>
                                    <tr class="cart-product-item">
                                        <td class="product-remove">
                                            <a href="CartServlet?action=remove&id=<%=item.getProductId()%>"><i class="fa fa-trash-o"></i></a>
                                        </td>
                                        <td class="product-thumb">
                                            <a href="single-product.jsp?id=<%=item.getProductId()%>">
                                                <img src="<%=item.getImage()%>" width="90" height="110" alt="<%=item.getName()%>">
                                            </a>
                                        </td>
                                        <td class="product-name">
                                            <h4 class="title"><a href="single-product.jsp?id=<%=item.getProductId()%>"><%=item.getName()%></a></h4>
                                        </td>
                                        <td class="product-price">
                                            <span class="price">�<%=item.getPrice()%></span>
                                        </td>
                                        <td class="product-quantity">
                                            <div class="pro-qty">
                                                <input type="number" name="quantity_<%=item.getProductId()%>" value="<%=item.getQuantity()%>" min="1">
                                            </div>
                                        </td>
                                        <td class="product-subtotal">
                                            <span class="price">�<%=subtotal%></span>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                      } else {
                                    %>
                                    <tr>
                                        <td colspan="6">Your cart is empty.</td>
                                    </tr>
                                    <% } %>
                                    <tr class="actions">
                                        <td class="border-0" colspan="6">
                                            <button type="submit" name="action" value="update" class="update-cart">Update Cart</button>
                                            <button type="submit" name="action" value="clear" class="clear-cart">Clear Cart</button>
                                            <a href="shop.jsp" class="btn-theme btn-flat">Continue Shopping</a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
            <div class="row row-gutter-50">
                <div class="col-md-6 col-lg-4">
                    <div id="CategoriesAccordion" class="shipping-form-calculate">
                        <div class="section-title-cart">
                            <h5 class="title">Calculate Shipping</h5>
                            <div class="desc">
                                <p>Estimate your shipping fee *</p>
                            </div>
                        </div>
                        <span data-bs-toggle="collapse" data-bs-target="#CategoriesTwo" aria-expanded="true" role="button">Calculate shipping</span>
                        <div id="CategoriesTwo" class="collapse show" data-bs-parent="#CategoriesAccordion">
                            <form action="#" method="post">
                                <div class="row row-gutter-50">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="visually-hidden" for="FormCountry">State</label>
                                            <select id="FormCountry" class="form-control">
                                                <option selected>Select a country…</option>
                                                <option>...</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="stateCounty" class="visually-hidden">State / County</label>
                                            <input type="text" id="stateCounty" class="form-control" placeholder="State / County">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="townCity" class="visually-hidden">Town / City</label>
                                            <input type="text" id="townCity" class="form-control" placeholder="Town / City">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="postcodeZip" class="visually-hidden">Postcode / ZIP</label>
                                            <input type="text" id="postcodeZip" class="form-control" placeholder="Postcode / ZIP">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <button type="submit" class="update-totals">Update totals</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="shipping-form-coupon">
                        <div class="section-title-cart">
                            <h5 class="title">Coupon Code</h5>
                            <div class="desc">
                                <p>Enter your coupon code if you have one.</p>
                            </div>
                        </div>
                        <form action="#" method="post">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="couponCode" class="visually-hidden">Coupon Code</label>
                                        <input type="text" id="couponCode" class="form-control" placeholder="Enter your coupon code..">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <button type="submit" class="coupon-btn">Apply coupon</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-12 col-lg-4">
                    <div class="shipping-form-cart-totals">
                        <div class="section-title-cart">
                            <h5 class="title">Cart totals</h5>
                        </div>
                        <div class="cart-total-table">
                            <table class="table">
                                <tbody>
                                    <tr class="cart-subtotal">
                                        <td>
                                            <p class="value">Subtotal</p>
                                        </td>
                                        <td>
                                            <p class="price">£128.00</p>
                                        </td>
                                    </tr>
                                    <tr class="shipping">
                                        <td>
                                            <p class="value">Shipping</p>
                                        </td>
                                        <td>
                                            <ul class="shipping-list">
                                                <li class="radio">
                                                    <input type="radio" name="shipping" id="radio1" checked>
                                                    <label for="radio1"><span></span> Flat Rate</label>
                                                </li>
                                                <li class="radio">
                                                    <input type="radio" name="shipping" id="radio2">
                                                    <label for="radio2"><span></span> Free Shipping</label>
                                                </li>
                                                <li class="radio">
                                                    <input type="radio" name="shipping" id="radio3">
                                                    <label for="radio3"><span></span> Local Pickup</label>
                                                </li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr class="order-total">
                                        <td>
                                            <p class="value">Total</p>
                                        </td>
                                        <td>
                                            <p class="price">£128.00</p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <a class="btn-theme btn-flat" href="shop-checkout.jsp">Proceed to checkout</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--== End Blog Area Wrapper ==-->
</main>

<!--== Start Footer Area Wrapper ==-->
<%@ include file="./footer.jsp" %>
<!--== End Footer Area Wrapper ==-->

<!--== Scroll Top Button ==-->
<div id="scroll-to-top" class="scroll-to-top"><span class="fa fa-angle-up"></span></div>

<!--== Start Quick View Menu ==-->
<aside class="product-quick-view-modal">
    <div class="product-quick-view-inner">
        <div class="product-quick-view-content">
            <button type="button" class="btn-close">
                <span class="close-icon"><i class="fa fa-close"></i></span>
            </button>
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="thumb">
                        <img src="assets/img/shop/product-single/1.webp" width="570" height="541" alt="Alan-Shop">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="content">
                        <h4 class="title">Space X Bag For Office</h4>
                        <div class="prices">
                            <del class="price-old">$85.00</del>
                            <span class="price">$70.00</span>
                        </div>
                        <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia,</p>
                        <div class="quick-view-select">
                            <div class="quick-view-select-item">
                                <label for="forSize" class="form-label">Size:</label>
                                <select class="form-select" id="forSize" required>
                                    <option selected value="">s</option>
                                    <option>m</option>
                                    <option>l</option>
                                    <option>xl</option>
                                </select>
                            </div>
                            <div class="quick-view-select-item">
                                <label for="forColor" class="form-label">Color:</label>
                                <select class="form-select" id="forColor" required>
                                    <option selected value="">red</option>
                                    <option>green</option>
                                    <option>blue</option>
                                    <option>yellow</option>
                                    <option>white</option>
                                </select>
                            </div>
                        </div>
                        <div class="action-top">
                            <div class="pro-qty">
                                <input type="text" id="quantity20" title="Quantity" value="1" />
                            </div>
                            <button class="btn btn-black">Add to cart</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="canvas-overlay"></div>
</aside>
<!--== End Quick View Menu ==-->

<!--== Start Aside Cart Menu ==-->
<div class="aside-cart-wrapper offcanvas offcanvas-end" tabindex="-1" id="AsideOffcanvasCart" aria-labelledby="offcanvasRightLabel">
    <div class="offcanvas-header">
        <h1 id="offcanvasRightLabel"></h1>
        <button class="btn-aside-cart-close" data-bs-dismiss="offcanvas" aria-label="Close">Shopping Cart <i class="fa fa-chevron-right"></i></button>
    </div>
    <div class="offcanvas-body">
        <ul class="aside-cart-product-list">
            <li class="product-list-item">
                <a href="#/" class="remove">×</a>
                <a href="single-product.jsp">
                    <img src="assets/img/shop/product-mini/1.webp" width="90" height="110" alt="Image-HasTech">
                    <span class="product-title">Leather Mens Slipper</span>
                </a>
                <span class="product-price">1 × £69.99</span>
            </li>
            <li class="product-list-item">
                <a href="#/" class="remove">×</a>
                <a href="single-product.jsp">
                    <img src="assets/img/shop/product-mini/2.webp" width="90" height="110" alt="Image-HasTech">
                    <span class="product-title">Quickiin Mens shoes</span>
                </a>
                <span class="product-price">1 × £20.00</span>
            </li>
        </ul>
        <p class="cart-total"><span>Subtotal:</span><span class="amount">£89.99</span></p>
        <a class="btn-theme" data-margin-bottom="10" href="shop-cart.jsp">View cart</a>
        <a class="btn-theme" href="shop-checkout.jsp">Checkout</a>
        <a class="d-block text-end lh-1" href="shop-checkout.jsp"><img src="assets/img/photos/paypal.webp" width="133" height="26" alt="Has-image"></a>
    </div>
</div>
<!--== End Aside Cart Menu ==-->

<!--== Start Aside Search Menu ==-->
<aside class="aside-search-box-wrapper offcanvas offcanvas-top" tabindex="-1" id="AsideOffcanvasSearch" aria-labelledby="offcanvasTopLabel">
    <div class="offcanvas-header">
        <h5 class="d-none" id="offcanvasTopLabel">Aside Search</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"><i class="pe-7s-close"></i></button>
    </div>
    <div class="offcanvas-body">
        <div class="container pt--0 pb--0">
            <div class="search-box-form-wrap">
                <div class="search-note">
                    <p>Start typing and press Enter to search</p>
                </div>
                <form action="#" method="post">
                    <div class="search-form position-relative">
                        <label for="search-input" class="visually-hidden">Search</label>
                        <input id="search-input" type="search" class="form-control" placeholder="Search entire store…">
                        <button class="search-button"><i class="fa fa-search"></i></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</aside>
<!--== End Aside Search Menu ==-->

<!--== Start Side Menu ==-->
<div class="off-canvas-wrapper offcanvas offcanvas-start" tabindex="-1" id="AsideOffcanvasMenu" aria-labelledby="offcanvasExampleLabel">
    <div class="offcanvas-header">
        <h1 id="offcanvasExampleLabel"></h1>
        <button class="btn-menu-close" data-bs-dismiss="offcanvas" aria-label="Close">menu <i class="fa fa-chevron-left"></i></button>
    </div>
    <div class="offcanvas-body">
        <div class="info-items">
            <ul>
                <li class="number"><a href="tel://0123456789"><i class="fa fa-phone"></i>+00 123 456 789</a></li>
                <li class="email"><a href="mailto://demo@example.com"><i class="fa fa-envelope"></i>demo@example.com</a></li>
                <li class="account"><a href="account-login.jsp"><i class="fa fa-user"></i>Account</a></li>
            </ul>
        </div>
        <!-- Mobile Menu Start -->
        <div class="mobile-menu-items">
            <ul class="nav-menu">
                <li><a href="#">Home</a>
                    <ul class="sub-menu">
                        <li><a href="index.jsp">Home One</a></li>
                        <li><a href="index-two.jsp">Home Two</a></li>
                    </ul>
                </li>
                <li><a href="about-us.jsp">About</a></li>
                <li><a href="#">Pages</a>
                    <ul class="sub-menu">
                        <li><a href="account.jsp">Account</a></li>
                        <li><a href="account-login.jsp">Login</a></li>
                        <li><a href="account-register.jsp">Register</a></li>
                        <li><a href="page-not-found.jsp">Page Not Found</a></li>
                    </ul>
                </li>
                <li><a href="#">Shop</a>
                    <ul class="sub-menu">
                        <li><a href="#">Shop Layout</a>
                            <ul class="sub-menu">
                                <li><a href="shop-three-columns.jsp">Shop 3 Column</a></li>
                                <li><a href="shop-four-columns.jsp">Shop 4 Column</a></li>
                                <li><a href="shop.jsp">Shop Left Sidebar</a></li>
                                <li><a href="shop-right-sidebar.jsp">Shop Right Sidebar</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Single Product</a>
                            <ul class="sub-menu">
                                <li><a href="single-normal-product.jsp">Single Product Normal</a></li>
                                <li><a href="single-product.jsp">Single Product Variable</a></li>
                                <li><a href="single-group-product.jsp">Single Product Group</a></li>
                                <li><a href="single-affiliate-product.jsp">Single Product Affiliate</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Others Pages</a>
                            <ul class="sub-menu">
                                <li><a href="shop-cart.jsp">Shopping Cart</a></li>
                                <li><a href="shop-checkout.jsp">Checkout</a></li>
                                <li><a href="shop-wishlist.jsp">Wishlist</a></li>
                                <li><a href="shop-compare.jsp">Compare</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li><a href="#">Blog</a>
                    <ul class="sub-menu">
                        <li><a href="#">Blog Layout</a>
                            <ul class="sub-menu">
                                <li><a href="blog.jsp">Blog Grid</a></li>
                                <li><a href="blog-left-sidebar.jsp">Blog Left Sidebar</a></li>
                                <li><a href="blog-right-sidebar.jsp">Blog Right Sidebar</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Single Blog</a>
                            <ul class="sub-menu">
                                <li><a href="blog-details-no-sidebar.jsp">Blog Details</a></li>
                                <li><a href="blog-details-left-sidebar.jsp">Blog Details Left Sidebar</a></li>
                                <li><a href="blog-details.jsp">Blog Details Right Sidebar</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li><a href="contact.jsp">Contact</a></li>
            </ul>
        </div>
        <!-- Mobile Menu End -->
    </div>
</div>
<!--== End Side Menu ==-->
</div>

<!--=======================Javascript============================-->

<!--=== jQuery Modernizr Min Js ===-->
<script src="assets/js/modernizr.js"></script>
<!--=== jQuery Min Js ===-->
<script src="assets/js/jquery-main.js"></script>
<!--=== jQuery Migration Min Js ===-->
<script src="assets/js/jquery-migrate.js"></script>
<!--=== jQuery Popper Min Js ===-->
<script src="assets/js/popper.min.js"></script>
<!--=== jQuery Bootstrap Min Js ===-->
<script src="assets/js/bootstrap.min.js"></script>
<!--=== jQuery Ui Min Js ===-->
<script src="assets/js/jquery-ui.min.js"></script>
<!--=== jQuery Swiper Min Js ===-->
<script src="assets/js/swiper.min.js"></script>
<!--=== jQuery Fancybox Min Js ===-->
<script src="assets/js/fancybox.min.js"></script>
<!--=== jQuery Waypoint Js ===-->
<script src="assets/js/waypoint.js"></script>
<!--=== jQuery Parallax Min Js ===-->
<script src="assets/js/parallax.min.js"></script>
<!--=== jQuery Aos Min Js ===-->
<script src="assets/js/aos.min.js"></script>

<!--=== jQuery Custom Js ===-->
<script src="assets/js/custom.js"></script>

</body>


<!-- Mirrored from htmldemo.net/shome/shome/shop-cart.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 02 Feb 2025 02:23:59 GMT -->
</html>