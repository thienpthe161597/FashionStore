<%@ include file="./header.jsp" %>
<%@ page import="dao.ProductDAO,dao.UserDAO, dao.FeedbackDAO, entity.User, entity.Feedback, entity.Product, java.util.List" %>
<%
    int pageSize = 8;  // Number of feedback per page
    int feedbackPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
    int productId = Integer.parseInt(request.getParameter("id"));
    ProductDAO productDAO = new ProductDAO();
    FeedbackDAO feedbackDAO = new FeedbackDAO();
    UserDAO userDAO = new UserDAO();
    User user = (User) session.getAttribute("user");
    List<Feedback> feedbackList = feedbackDAO.getFeedbackByProductId(productId, feedbackPage, pageSize);
    int totalFeedback = feedbackDAO.getTotalFeedbacks(productId);
    int totalPages = (int) Math.ceil((double) totalFeedback / pageSize);
    
    
    Product product = productDAO.getProductById(productId);
    List<String> colors = productDAO.getProductColors(productId);
    
    // Ensure there's a default color
    String defaultColor = (colors != null && !colors.isEmpty()) ? colors.get(0) : "";
    String selectedColor = (request.getParameter("selectedColor") != null) ? request.getParameter("selectedColor") : defaultColor;

    List<String> colorImages = productDAO.getImagesByColor(productId, selectedColor);
    List<String> sizes = productDAO.getProductSizes(productId, selectedColor);
    List<String> mainImages = productDAO.getProductMainImages(productId);
    String productColorMainImage = productDAO.getProductColorMainImage(productId, selectedColor);
%>
  <!--== End Header Wrapper ==-->
  
<!--== CSS for Styling ==-->
<style>
/* Product Gallery */
.product-gallery {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 15px;
}

/* Main Image */
.main-image-container {
    width: 500px;
    height: 450px;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #f8f8f8;
}

.main-image-container img {
    width: 100%;
    height: 100%;
    object-fit: contain;  /* Ensures the entire image fits inside the border */
}

/* Thumbnail container: Enables horizontal scrolling */
.thumbnail-container {
    display: flex;
    gap: 10px;              /* Space between thumbnails */
    overflow-x: auto;       /* Enable horizontal scrolling */
    white-space: nowrap;    /* Prevents thumbnails from wrapping to a new row */
    padding-bottom: 5px;    /* Space below to prevent scrollbar overlap */
    max-width: 100%;        /* Prevents excessive stretching */
}

/* Hide scrollbar but keep functionality */
.thumbnail-container::-webkit-scrollbar {
    height: 8px; /* Adjust scrollbar thickness */
}

.thumbnail-container::-webkit-scrollbar-thumb {
    background: #bbb; /* Light gray scrollbar */
    border-radius: 4px;
}

.thumbnail-container::-webkit-scrollbar-track {
    background: transparent; /* Hide the track */
}

/* Style individual thumbnail images */
.thumbnail-container img {
    width: 100px;  /* Fixed size for uniformity */
    height: 100px;
    object-fit: cover; /* Ensures image fills the box without distortion */
    border-radius: 8px; /* Smooth rounded corners */
    cursor: pointer;
    transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
}

/* Hover effect */
.thumbnail-container img:hover {
    transform: scale(1.1); /* Slight zoom effect */
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
}

.review-pagination {
    margin-top: 20px;
    text-align: center;
}

.review-pagination a {
    padding: 8px 12px;
    margin: 0 5px;
    border: 1px solid #ccc;
    text-decoration: none;
    color: #333;
    border-radius: 5px;
}

.review-pagination a.active {
    background-color: #007bff;
    color: white;
    font-weight: bold;
}

.review-pagination a:hover {
    background-color: #0056b3;
    color: white;
}


</style>
  
  <main class="main-content">

    <!--== Start Product Single Area Wrapper ==-->
    <section class="product-area product-single-area">
      <div class="container">
        <div class="row">
                <div class="col-12">
                    <div class="product-single-item">
                        <div class="row">
                            <div class="col-xl-6">
                                <!--== Product Thumbnail Area ==-->
                                <div class="product-gallery">
                                    <!--== Main Image ==-->
                                    <div class="main-image-container">
                                        <a class="lightbox-image" data-fancybox="gallery">
                                            <img id="mainImage" src="<%= colorImages.get(0) %>" alt="Product Image">
                                        </a>
                                    </div>

                                    <!--== Thumbnails ==-->
                                    <div class="thumbnail-container">
                                        <% for (String img : colorImages) { %>
                                            <img src="<%= img %>" class="thumbnail" onclick="changeMainImage('<%= img %>')">
                                        <% } %>
                                    </div>
                                </div>
                                <!--== End Product Thumbnail Area ==-->
                            </div>

                            <div class="col-xl-6">
                                <!--== Product Info ==-->
                                <div class="product-single-info">
                                    <h3 class="main-title"><%= product.getProductName() %></h3>
                                    <div class="prices">
                                        <% if (product.getSaleID() != 0) { 
                                            double originalPrice = product.getPrice();
                                            double discountPercent = productDAO.getSaleDiscount(product.getSaleID()); // Fetch the discount percentage
                                            double salePrice = originalPrice * ((100 - discountPercent) / 100);
                                        %>
                                            <span class="price text-danger fw-bold">-<%= (int) discountPercent %>%</span>
                                            <span class="old-price text-muted text-decoration-line-through">$<%= originalPrice %></span>
                                            <span class="price text-danger fw-bold">$<%= String.format("%.2f", salePrice) %></span>
                                        <% } else { %>
                                            <span class="price text-danger fw-bold">$<%= product.getPrice() %></span>
                                        <% } %>
                                    </div>
                                    <p><%= product.getDescription() %></p>
                                    
                                    <div class ="product-color">
                                        <h6 class="title">Gender: <%= product.getGender() %></h6>
                                    </div>

                                    <!-- Color Selection -->
                                    <div class="product-color">
                                        <h6 class="title">Color</h6>
                                        <ul class="color-list">
                                            <% for (String img : mainImages) { 
                                            String imgColor = productDAO.getColorByImage(img);
                                            boolean isActive = imgColor.equals(selectedColor);
                                            %>
                                            <li class="<%= isActive ? "active" : "" %>">
                                                    <a href="single-product.jsp?id=<%= productId %>&selectedColor=<%= imgColor %>">
                                                        <img src="<%= img %>" alt="<%= imgColor %>">
                                                    </a>
                                                </li>
                                            <% } %>
                                        </ul>
                                    </div>

                                    <!-- Size Selection -->
                                    <form action = "AddToCartController" method="get">
                                    <div class="product-size">
                                        <h6 class="title">Size</h6>
                                        <select class="size-dropdown" name="size">
                                            <% for (String size : sizes) { %>
                                                <option value="<%= size %>"><%= size %></option>
                                            <% } %>
                                        </select>
                                    </div>

                                    <!-- Add to Cart -->
                                    
                                    <div class="product-quick-action">
                                        <div class="qty-wrap">
                                            <div class="pro-qty">
                                                <input type="number" name="quantity" value="1" min="1">
                                            </div>
                                            <input type="hidden" name="id" value="<%= productId %>">
                                            <input type="hidden" name="color" value="<%= selectedColor %>">
                                        </div>
                                        <button type="submit" class="btn-theme">Add to Cart</button>
                                    </div>
                                    </form>
                                </div>
                                <!--== End Product Info ==-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                                    
                                    <!--== JavaScript to Change Main Image ==-->
<script>
function changeMainImage(newSrc) {
    document.getElementById("mainImage").src = newSrc;
}

document.addEventListener("DOMContentLoaded", function () {
        const reviewBtn = document.querySelector(".review-write-btn");
        const reviewForm = document.querySelector(".reviews-form-area");

        reviewBtn.addEventListener("click", function () {
            // Toggle the form visibility
            if (reviewForm.style.display === "none" || reviewForm.style.display === "") {
                reviewForm.style.display = "block";
            } else {
                reviewForm.style.display = "none";
            }
        });
    });
</script>

        <div class="row">
          <div class="col-12">
            <div class="product-review-tabs-content">
                <ul class="nav product-tab-nav" id="ReviewTab" role="tablist">
                    <li role="presentation">
                        <a id="reviews-tab" href="#reviews">Reviews <span>(<%= totalFeedback %>)</span></a>
                    </li>
                </ul>
              <div class="tab-content product-tab-content" id="ReviewTabContent">
                <div class="tab-pane fade show active" id="reviews">
                  <div class="product-review-content">
                    <div class="review-content-header">
                        <h3>Customer Reviews</h3>
                        <div class="review-info">
                            <ul class="review-rating">
                                <% 
                                    double avgRating = feedbackDAO.getAverageRating(productId);
                                    int fullStars = (int) avgRating;
                                    boolean halfStar = (avgRating - fullStars) >= 0.5;
                                %>

                                <% for (int i = 0; i < fullStars; i++) { %>
                                    <li class="fa fa-star"></li>  <%-- Full Star --%>
                                <% } %>

                                <% if (halfStar) { %>
                                    <li class="fa fa-star-half-o"></li>  <%-- Half Star --%>
                                <% } %>

                                <% for (int i = fullStars + (halfStar ? 1 : 0); i < 5; i++) { %>
                                    <li class="fa fa-star-o"></li>  <%-- Empty Star --%>
                                <% } %>
                            </ul>

                            <span class="review-caption">
                                Based on <%= totalFeedback %> reviews - Average Rating: <%= String.format("%.1f", avgRating) %> Star
                            </span>

                            <% 
                                boolean hasReviewed = user != null && feedbackDAO.hasUserReviewed(user.getUser_ID(), productId);
                                if (user != null) { 
                            %>
                                <span class="review-write-btn"><%= hasReviewed ? "Edit your review" : "Write a review" %></span>
                            <% } else { %>
                                <a class="title" href="account-login.jsp">Login to write review</a>
                            <% } %>
                        </div>
                    </div>

                    <!--== Start Reviews Form Item ==-->
                    <% if (user != null) { %>
                    <div class="reviews-form-area">
                        <div class="reviews-form-content">
                            <form action="FeedbackController" method="POST">
                                <input type="hidden" name="productId" value="<%= productId %>">

                                <% 
                                    int userRating = hasReviewed ? feedbackDAO.getUserRating(user.getUser_ID(), productId) : 0;
                                    String userComment = hasReviewed ? feedbackDAO.getUserComment(user.getUser_ID(), productId) : "";
                                %>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <span class="title">Rating</span>
                                            <select name="rating" class="form-control">
                                                <% for (int i = 1; i <= 5; i++) { %>
                                                    <option value="<%= i %>" <%= (i == userRating) ? "selected" : "" %>><%= i %> Star</option>
                                                <% } %>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="for_comment">Your Review</label>
                                            <textarea id="for_comment" class="form-control" name="comment" placeholder="Write your comments here"><%= userComment %></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-submit-btn">
                                            <button type="submit" class="btn-submit"><%= hasReviewed ? "Update Review" : "Post Comment" %></button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <% } %>
                    <!--== End Reviews Form Item ==-->

                    <div class="reviews-content-body">
                        <% if (feedbackList != null && !feedbackList.isEmpty()) { %>
                            <% for (Feedback feedback : feedbackList) { %>
                                <div class="review-item">
                                    <ul class="review-rating">
                                        <% for (int i = 1; i <= 5; i++) { %>
                                            <li class="fa <%= (i <= feedback.getRating()) ? "fa-star" : "fa-star-o" %>"></li>
                                        <% } %>
                                    </ul>
                                    <h5 class="sub-title">
                                        <span>User <%= userDAO.getUserNameById(feedback.getUserId()) %></span> 
                                        on <span><%= feedback.getDate() %></span>
                                    </h5>
                                    <p><%= feedback.getComment().replace("<", "&lt;").replace(">", "&gt;") %></p> <%-- Prevents XSS --%>
                                </div>
                            <% } %>
                        <% } else { %>
                            <p>No reviews yet. Be the first to review!</p>
                        <% } %>
                    </div>

                    <!--== Start Reviews Pagination Item ==-->
                    <% if (totalPages > 1) { %>
                    <div class="review-pagination">
                        <% if (feedbackPage > 1) { %>
                            <a href="?id=<%= productId %>&page=<%= feedbackPage - 1 %>#reviews" class="pagination-prev">? Previous</a>
                        <% } %>

                        <% for (int i = 1; i <= totalPages; i++) { %>
                            <a href="?id=<%= productId %>&page=<%= i %>#reviews" class="pagination-pag <%= (i == feedbackPage) ? "active" : "" %>"><%= i %></a>
                        <% } %>

                        <% if (feedbackPage < totalPages) { %>
                            <a href="?id=<%= productId %>&page=<%= feedbackPage + 1 %>#reviews" class="pagination-next">Next ?</a>
                        <% } %>
                    </div>
                    <% } %>
                    <!--== End Reviews Pagination Item ==-->
                </div>

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--== End Product Single Area Wrapper ==-->

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
              <input id="search-input" type="search" class="form-control" placeholder="Search entire store?">
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



<!-- Mirrored from htmldemo.net/shome/shome/single-product.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 02 Feb 2025 02:23:58 GMT -->
</html>