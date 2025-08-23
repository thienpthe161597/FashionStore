<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="entity.Product" %>
<%@ page import="dao.ProductDAO" %>

<%  
    ProductDAO productDAO = new ProductDAO();
    List<Product> productList = (List<Product>) request.getAttribute("productList");
    int currentPage = (request.getAttribute("currentPage") != null) ? (int) request.getAttribute("currentPage") : 1;
    int totalPages = (request.getAttribute("totalPages") != null) ? (int) request.getAttribute("totalPages") : 1;
    String keyword = request.getAttribute("search") != null ? (String) request.getAttribute("search") : "";
%>

<%@ include file="./header.jsp" %>

<style> 
    .product-thumb {
    width: 100%;
    height: 250px; /* Fixed image size */
    overflow: hidden;
}

.product-thumb img {
    width: 100%;
    height: 100%;
    object-fit: cover; /* Prevents distortion */
    transition: transform 0.3s ease-in-out;
}

.product-thumb:hover img {
    transform: scale(1.05);
}

/* Fix title text overflowing issue */
.title {
    font-size: 1rem;
    font-weight: 600;
    color: #333;
    height: 48px; /* Ensures consistent height */
    line-height: 1.4;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2; /* Limits title to 2 lines */
    -webkit-box-orient: vertical;
    word-wrap: break-word;
}

/* Ensures uniform price alignment */
.prices {
    min-height: 30px;
}

</style>

<main class="main-content">
    <section class="product-area product-default-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2>Search Results for "<%= keyword %>"</h2>
                    <p class="pagination-line"><%= productList.size() %> Products Found</p>
                </div>
                
                <div class="col-12">
    <div class="tab-content">
        <div class="tab-pane fade show active" id="nav-grid">
            <div class="row">
                <% if (productList != null && !productList.isEmpty()) { %>
                    <% for (Product product : productList) { %>
                        <div class="col-sm-6 col-lg-4 mb-4">
                            <div class="product-item card border-0 shadow-sm h-100 d-flex flex-column">
                                <!-- Product Image -->
                                <div class="product-thumb w-100">
                                    <a href="single-product.jsp?id=<%= product.getProductID() %>">
                                        <img src="<%= product.getImage() %>" class="img-fluid product-img" alt="Product Image">
                                    </a>
                                </div>
                                <!-- Product Info -->
                                <div class="product-info text-center p-3 flex-grow-1 d-flex flex-column">
                                    <h4 class="title">
                                        <a href="single-product.jsp?id=<%= product.getProductID() %>" class="text-dark text-decoration-none d-block">
                                            <%= product.getProductName() %>
                                        </a>
                                    </h4>
                                    <div class="prices mt-auto">
                                        <% if (product.getSaleID() != 0) { 
                                            double originalPrice = product.getPrice();
                                            double discountPercent = productDAO.getSaleDiscount(product.getSaleID()); // Fetch the discount percentage
                                            double salePrice = originalPrice * ((100 - discountPercent) / 100);
                                        %>
                                            <span class="old-price text-muted text-decoration-line-through">$<%= originalPrice %></span>
                                            <span class="price text-danger fw-bold fs-5">$<%= String.format("%.2f", salePrice) %></span>
                                        <% } else { %>
                                            <span class="price text-danger fw-bold fs-5">$<%= product.getPrice() %></span>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <% } %>
                <% } else { %>
                    <div class="col-12 text-center">
                        <p class="text-muted">No products found for "<%= keyword %>".</p>
                    </div>
                <% } %>
            </div>
        </div>
    </div>
</div>


                <!-- Pagination -->
                <div class="col-12">
                    <div class="pagination">
                        <% String baseUrl = "SearchProductController?search=" + keyword; %>

                        <% if (currentPage > 1) { %>
                            <a href="<%= baseUrl %>&page=<%= currentPage - 1 %>">Previous</a>
                        <% } %>

                        <% for (int i = 1; i <= totalPages; i++) { %>
                            <a href="<%= baseUrl %>&page=<%= i %>" class="<%= (i == currentPage) ? "active" : "" %>"><%= i %></a>
                        <% } %>

                        <% if (currentPage < totalPages) { %>
                            <a href="<%= baseUrl %>&page=<%= currentPage + 1 %>">Next</a>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<%@ include file="./footer.jsp" %>


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
          <a href="#/" class="remove">Ã</a>
          <a href="single-product.jsp">
            <img src="assets/img/shop/product-mini/1.webp" width="90" height="110" alt="Image-HasTech">
            <span class="product-title">Leather Mens Slipper</span>
          </a>
          <span class="product-price">1 Ã Â£69.99</span>
        </li>
        <li class="product-list-item">
          <a href="#/" class="remove">Ã</a>
          <a href="single-product.jsp">
            <img src="assets/img/shop/product-mini/2.webp" width="90" height="110" alt="Image-HasTech">
            <span class="product-title">Quickiin Mens shoes</span>
          </a>
          <span class="product-price">1 Ã Â£20.00</span>
        </li>
      </ul>
      <p class="cart-total"><span>Subtotal:</span><span class="amount">Â£89.99</span></p>
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
              <input id="search-input" type="search" class="form-control" placeholder="Search entire storeâ¦">
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


<!-- Mirrored from htmldemo.net/shome/shome/shop-three-columns.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 02 Feb 2025 02:23:55 GMT -->
</html>