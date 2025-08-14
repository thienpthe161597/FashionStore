<%@ include file="./header.jsp" %>
<!--== End Header Wrapper ==-->

<main class="main-content">
    <!--== Start Page Header Area Wrapper ==-->

    <!--== End Page Header Area Wrapper ==-->

    <!--== Start My Account Wrapper ==-->
    <section class="my-account-area">
        <div class="container pt--0 pb--0">
            <div class="row">
                <div class="col-lg-12">
                    <div class="myaccount-page-wrapper">
                        <div class="row">
                            <div class="col-lg-3 col-md-4">
                                <nav>
                                    <div
                                        class="myaccount-tab-menu nav nav-tabs"
                                        id="nav-tab"
                                        role="tablist"
                                        >
                                        <button
                                            class="nav-link active"
                                            id="dashboad-tab"
                                            data-bs-toggle="tab"
                                            data-bs-target="#dashboad"
                                            type="button"
                                            role="tab"
                                            aria-controls="dashboad"
                                            aria-selected="true"
                                            >
                                            Profile
                                        </button>
                                        <button
                                            class="nav-link"
                                            id="orders-tab"
                                            data-bs-toggle="tab"
                                            data-bs-target="#orders"
                                            type="button"
                                            role="tab"
                                            aria-controls="orders"
                                            aria-selected="false"
                                            >
                                            Orders
                                        </button>
                                        <!--                          <button
                                                                    class="nav-link"
                                                                    id="download-tab"
                                                                    data-bs-toggle="tab"
                                                                    data-bs-target="#download"
                                                                    type="button"
                                                                    role="tab"
                                                                    aria-controls="download"
                                                                    aria-selected="false"
                                                                  >
                                                                    Download
                                                                  </button>
                                                                  <button
                                                                    class="nav-link"
                                                                    id="payment-method-tab"
                                                                    data-bs-toggle="tab"
                                                                    data-bs-target="#payment-method"
                                                                    type="button"
                                                                    role="tab"
                                                                    aria-controls="payment-method"
                                                                    aria-selected="false"
                                                                  >
                                                                    Payment Method
                                                                  </button>
                                                                  <button
                                                                    class="nav-link"
                                                                    id="address-edit-tab"
                                                                    data-bs-toggle="tab"
                                                                    data-bs-target="#address-edit"
                                                                    type="button"
                                                                    role="tab"
                                                                    aria-controls="address-edit"
                                                                    aria-selected="false"
                                                                  >
                                                                    address
                                                                  </button>-->
                                        <button
                                            class="nav-link"
                                            id="account-info-tab"
                                            data-bs-toggle="tab"
                                            data-bs-target="#account-info"
                                            type="button"
                                            role="tab"
                                            aria-controls="account-info"
                                            aria-selected="false"
                                            >
                                            Update profile
                                        </button>
                                        <button
                                            class="nav-link"
                                            onclick="window.location.href = 'logout'"
                                            type="button"
                                            >
                                            Logout
                                        </button>
                                    </div>
                                </nav>
                            </div>
                            <div class="col-lg-9 col-md-8">
                                <div class="tab-content" id="nav-tabContent">
                                    <div
                                        class="tab-pane fade show active"
                                        id="dashboad"
                                        role="tabpanel"
                                        aria-labelledby="dashboad-tab"
                                        >
                                        <div class="myaccount-content">
                                            <h3>Dashboard</h3>
                                            <div class="welcome">
                                                <p>
                                                    Hello, <strong>${user.getUser_Name()}</strong>
                                                </p>
                                            </div>
                                            <c:if test="${user.getEmail()!= null}">
                                                <p>
                                                    Email: ${user.getEmail()}
                                                </p>
                                            </c:if>
                                            <c:if test="${user.getEmail()== null}">
                                                <p>
                                                    Email: You aren't update email
                                                </p>
                                            </c:if>

                                            <c:if test="${user.getAddress()!= null}">
                                                <p>
                                                    Address: ${user.getAddress()}
                                                </p>
                                            </c:if>
                                            <c:if test="${user.getAddress()== null}">
                                                <p>
                                                    Address: You aren't update address
                                                </p>
                                            </c:if>
                                            <c:if test="${user.getPhone()!= null}">
                                                <p>
                                                    Phone: ${user.getPhone()}
                                                </p>
                                            </c:if>
                                            <c:if test="${user.getPhone()== null}">
                                                <p>
                                                    Phone: You aren't update phone
                                                </p>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div
                                        class="tab-pane fade"
                                        id="orders"
                                        role="tabpanel"
                                        aria-labelledby="orders-tab"
                                        >
                                        <div class="myaccount-content">
                                            <h3>Orders</h3>
                                            <div
                                                class="myaccount-table table-responsive text-center"
                                                >
                                                <table class="table table-bordered">
                                                    <thead class="thead-light">
                                                        <tr>
                                                            <th>Order</th>
                                                            <th>Date</th>
                                                            <th>Status</th>
                                                            <th>Total</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>1</td>
                                                            <td>Aug 22, 2022</td>
                                                            <td>Pending</td>
                                                            <td>$3000</td>
                                                            <td>
                                                                <a
                                                                    href="shop-cart.jsp"
                                                                    class="check-btn sqr-btn"
                                                                    >View</a
                                                                >
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>2</td>
                                                            <td>July 22, 2022</td>
                                                            <td>Approved</td>
                                                            <td>$200</td>
                                                            <td>
                                                                <a
                                                                    href="shop-cart.jsp"
                                                                    class="check-btn sqr-btn"
                                                                    >View</a
                                                                >
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>3</td>
                                                            <td>June 12, 2022</td>
                                                            <td>On Hold</td>
                                                            <td>$990</td>
                                                            <td>
                                                                <a
                                                                    href="shop-cart.jsp"
                                                                    class="check-btn sqr-btn"
                                                                    >View</a
                                                                >
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div
                                        class="tab-pane fade"
                                        id="download"
                                        role="tabpanel"
                                        aria-labelledby="download-tab"
                                        >
                                        <div class="myaccount-content">
                                            <h3>Downloads</h3>
                                            <div
                                                class="myaccount-table table-responsive text-center"
                                                >
                                                <table class="table table-bordered">
                                                    <thead class="thead-light">
                                                        <tr>
                                                            <th>Product</th>
                                                            <th>Date</th>
                                                            <th>Expire</th>
                                                            <th>Download</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                Haven - Free Real Estate PSD Template
                                                            </td>
                                                            <td>Aug 22, 2022</td>
                                                            <td>Yes</td>
                                                            <td>
                                                                <a href="#/" class="check-btn sqr-btn"
                                                                   ><i class="fa fa-cloud-download"></i>
                                                                    Download File</a
                                                                >
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                HasTech - Profolio Business Template
                                                            </td>
                                                            <td>Sep 12, 2022</td>
                                                            <td>Never</td>
                                                            <td>
                                                                <a href="#/" class="check-btn sqr-btn"
                                                                   ><i class="fa fa-cloud-download"></i>
                                                                    Download File</a
                                                                >
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div
                                        class="tab-pane fade"
                                        id="payment-method"
                                        role="tabpanel"
                                        aria-labelledby="payment-method-tab"
                                        >
                                        <div class="myaccount-content">
                                            <h3>Payment Method</h3>
                                            <p class="saved-message">
                                                You Can't Saved Your Payment Method yet.
                                            </p>
                                        </div>
                                    </div>
                                    <div
                                        class="tab-pane fade"
                                        id="address-edit"
                                        role="tabpanel"
                                        aria-labelledby="address-edit-tab"
                                        >
                                        <div class="myaccount-content">
                                            <h3>Billing Address</h3>
                                            <address>
                                                <p><strong>Alex Tuntuni</strong></p>
                                                <p>
                                                    1355 Market St, Suite 900 <br />
                                                    San Francisco, CA 94103
                                                </p>
                                                <p>Mobile: (123) 456-7890</p>
                                            </address>
                                            <a href="#/" class="check-btn sqr-btn"
                                               ><i class="fa fa-edit"></i> Edit Address</a
                                            >
                                        </div>
                                    </div>
                                    <div
                                        class="tab-pane fade"
                                        id="account-info"
                                        role="tabpanel"
                                        aria-labelledby="account-info-tab"
                                        >
                                        <div class="myaccount-content">

                                            <div class="account-details-form">
                                                <form action="user" method="post" onsubmit="return validateForm()">
                                                    <input type="hidden" name="action" value="changeprofile">
                                                    <fieldset>
                                                        <legend>Update Profile</legend>

                                                        <!-- Username field -->
                                                        <div class="single-input-item">
                                                            <label for="display-name" class="required">Username</label>
                                                            <input type="text" id="display-name" name="username" />
                                                            <span id="username-error" style="color: red; display: none;">Username is required.</span>
                                                        </div>

                                                        <!-- Address field -->
                                                        <div class="row">
                                                            <div class="col-lg-6">
                                                                <div class="single-input-item">
                                                                    <label for="first-name" class="required">Address</label>
                                                                    <input type="text" id="first-name" name="address" />
                                                                    <span id="address-error" style="color: red; display: none;">Address is required.</span>
                                                                </div>
                                                            </div>
                                                            <!-- Phone field -->
                                                            <div class="col-lg-6">
                                                                <div class="single-input-item">
                                                                    <label for="last-name" class="required">Phone</label>
                                                                    <input type="text" id="last-name" name="phone" />
                                                                    <span id="phone-error" style="color: red; display: none;">Phone must be exactly 10 digits.</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </fieldset>

                                                    <div class="single-input-item">
                                                        <button class="check-btn sqr-btn">Save Changes</button>
                                                    </div>
                                                </form>

                                                <script>
                                                    function validateForm() {

                                                        var username = document.getElementById('display-name').value;
                                                        var address = document.getElementById('first-name').value;
                                                        var phone = document.getElementById('last-name').value;


                                                        var usernameError = document.getElementById('username-error');
                                                        var addressError = document.getElementById('address-error');
                                                        var phoneError = document.getElementById('phone-error');


                                                        var isValid = true;


                                                        if (username.trim() === "") {
                                                            usernameError.style.display = 'inline';
                                                            isValid = false;
                                                        } else {
                                                            usernameError.style.display = 'none';
                                                        }


                                                        if (address.trim() === "") {
                                                            addressError.style.display = 'inline';
                                                            isValid = false;
                                                        } else {
                                                            addressError.style.display = 'none';
                                                        }


                                                        var phoneRegex = /^[0-9]{10}$/;
                                                        if (!phoneRegex.test(phone)) {
                                                            phoneError.style.display = 'inline';
                                                            isValid = false;
                                                        } else {
                                                            phoneError.style.display = 'none';
                                                        }


                                                        return isValid;
                                                    }
                                                </script>

                                            </div>
                                        </div>
                                        <div class="myaccount-content">
                                            <div class="account-details-form">
                                                <form action="user" method="post" onsubmit="return validateForm()">
                                                    <input type="hidden" name="action" value="changepass">
                                                    <fieldset>
                                                        <legend>Password Change</legend>

                                                        <!-- Current Password field -->
                                                        <div class="single-input-item">
                                                            <label for="current-pwd" class="required">Current Password</label>
                                                            <input type="password" id="current-pwd" name="current-pwd" required=""/>
                                                        </div>

                                                        <!-- New Password field -->
                                                        <div class="row">
                                                            <div class="col-lg-6">
                                                                <div class="single-input-item">
                                                                    <label for="new-pwd" class="required">New Password</label>
                                                                    <input type="password" id="new-pwd" name="new-pwd" required=""/>
                                                                </div>
                                                            </div>

                                                            <!-- Confirm Password field -->
                                                            <div class="col-lg-6">
                                                                <div class="single-input-item">
                                                                    <label for="confirm-pwd" class="required">Confirm Password</label>
                                                                    <input type="password" id="confirm-pwd" name="confirm-pwd" required=""/>
                                                                    <span id="password-error" style="color: red; display: none;">Passwords do not match.</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                    <% 
    String errorMessage = (String) request.getAttribute("error");
    if (errorMessage != null) {
                                                    %>
                                                    <script type="text/javascript">
                                                        alert("<%= errorMessage %>");
                                                    </script>
                                                    <% 
                                                        }
                                                    %>
                                                    <!-- Submit button -->
                                                    <div class="single-input-item">
                                                        <button class="check-btn sqr-btn" type="submit">
                                                            Save Changes
                                                        </button>
                                                    </div>
                                                </form>

                                                <script>
                                                    function validateForm() {
                                                        var newPwd = document.getElementById('new-pwd').value;
                                                        var confirmPwd = document.getElementById('confirm-pwd').value;
                                                        var passwordError = document.getElementById('password-error');
                                                        if (newPwd !== confirmPwd) {
                                                            passwordError.style.display = 'inline';
                                                            return false;
                                                        } else {
                                                            passwordError.style.display = 'none';
                                                            return true;
                                                        }
                                                    }
                                                </script>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--== End My Account Wrapper ==-->
</main>

<!--== Start Footer Area Wrapper ==-->
<%@ include file="./footer.jsp" %>
<!--== End Footer Area Wrapper ==-->

<!--== Scroll Top Button ==-->
<div id="scroll-to-top" class="scroll-to-top">
    <span class="fa fa-angle-up"></span>
</div>

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
                        <img
                            src="assets/img/shop/product-single/1.webp"
                            width="570"
                            height="541"
                            alt="Alan-Shop"
                            />
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="content">
                        <h4 class="title">Space X Bag For Office</h4>
                        <div class="prices">
                            <del class="price-old">$85.00</del>
                            <span class="price">$70.00</span>
                        </div>
                        <p>
                            Contrary to popular belief, Lorem Ipsum is not simply random
                            text. It has roots in a piece of classical Latin literature
                            from 45 BC, making it over 2000 years old. Richard
                            McClintock, a Latin professor at Hampden-Sydney College in
                            Virginia,
                        </p>
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
                                <input
                                    type="text"
                                    id="quantity20"
                                    title="Quantity"
                                    value="1"
                                    />
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
<div
    class="aside-cart-wrapper offcanvas offcanvas-end"
    tabindex="-1"
    id="AsideOffcanvasCart"
    aria-labelledby="offcanvasRightLabel"
    >
    <div class="offcanvas-header">
        <h1 id="offcanvasRightLabel"></h1>
        <button
            class="btn-aside-cart-close"
            data-bs-dismiss="offcanvas"
            aria-label="Close"
            >
            Shopping Cart <i class="fa fa-chevron-right"></i>
        </button>
    </div>
    <div class="offcanvas-body">
        <ul class="aside-cart-product-list">
            <li class="product-list-item">
                <a href="#/" class="remove">×</a>
                <a href="single-product.jsp">
                    <img
                        src="assets/img/shop/product-mini/1.webp"
                        width="90"
                        height="110"
                        alt="Image-HasTech"
                        />
                    <span class="product-title">Leather Mens Slipper</span>
                </a>
                <span class="product-price">1 × £69.99</span>
            </li>
            <li class="product-list-item">
                <a href="#/" class="remove">×</a>
                <a href="single-product.jsp">
                    <img
                        src="assets/img/shop/product-mini/2.webp"
                        width="90"
                        height="110"
                        alt="Image-HasTech"
                        />
                    <span class="product-title">Quickiin Mens shoes</span>
                </a>
                <span class="product-price">1 × £20.00</span>
            </li>
        </ul>
        <p class="cart-total">
            <span>Subtotal:</span><span class="amount">£89.99</span>
        </p>
        <a class="btn-theme" data-margin-bottom="10" href="shop-cart.jsp"
           >View cart</a
        >
        <a class="btn-theme" href="shop-checkout.jsp">Checkout</a>
        <a class="d-block text-end lh-1" href="shop-checkout.jsp"
           ><img
                src="assets/img/photos/paypal.webp"
                width="133"
                height="26"
                alt="Has-image"
                /></a>
    </div>
</div>
<!--== End Aside Cart Menu ==-->

<!--== Start Aside Search Menu ==-->
<aside
    class="aside-search-box-wrapper offcanvas offcanvas-top"
    tabindex="-1"
    id="AsideOffcanvasSearch"
    aria-labelledby="offcanvasTopLabel"
    >
    <div class="offcanvas-header">
        <h5 class="d-none" id="offcanvasTopLabel">Aside Search</h5>
        <button
            type="button"
            class="btn-close"
            data-bs-dismiss="offcanvas"
            aria-label="Close"
            >
            <i class="pe-7s-close"></i>
        </button>
    </div>
    <div class="offcanvas-body">
        <div class="container pt--0 pb--0">
            <div class="search-box-form-wrap">
                <div class="search-note">
                    <p>Start typing and press Enter to search</p>
                </div>
                <form action="#" method="post">
                    <div class="search-form position-relative">
                        <label for="search-input" class="visually-hidden"
                               >Search</label
                        >
                        <input
                            id="search-input"
                            type="search"
                            class="form-control"
                            placeholder="Search entire store…"
                            />
                        <button class="search-button">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</aside>
<!--== End Aside Search Menu ==-->

<!--== Start Side Menu ==-->
<div
    class="off-canvas-wrapper offcanvas offcanvas-start"
    tabindex="-1"
    id="AsideOffcanvasMenu"
    aria-labelledby="offcanvasExampleLabel"
    >
    <div class="offcanvas-header">
        <h1 id="offcanvasExampleLabel"></h1>
        <button
            class="btn-menu-close"
            data-bs-dismiss="offcanvas"
            aria-label="Close"
            >
            menu <i class="fa fa-chevron-left"></i>
        </button>
    </div>
    <div class="offcanvas-body">
        <div class="info-items">
            <ul>
                <li class="number">
                    <a href="tel://0123456789"
                       ><i class="fa fa-phone"></i>+00 123 456 789</a
                    >
                </li>
                <li class="email">
                    <a href="mailto://demo@example.com"
                       ><i class="fa fa-envelope"></i>demo@example.com</a
                    >
                </li>
                <li class="account">
                    <a href="account-login.jsp"
                       ><i class="fa fa-user"></i>Account</a
                    >
                </li>
            </ul>
        </div>
        <!-- Mobile Menu Start -->
        <div class="mobile-menu-items">
            <ul class="nav-menu">
                <li>
                    <a href="#">Home</a>
                    <ul class="sub-menu">
                        <li><a href="index.jsp">Home One</a></li>
                        <li><a href="index-two.jsp">Home Two</a></li>
                    </ul>
                </li>
                <li><a href="about-us.jsp">About</a></li>
                <li>
                    <a href="#">Pages</a>
                    <ul class="sub-menu">
                        <li><a href="account.jsp">Account</a></li>
                        <li><a href="account-login.jsp">Login</a></li>
                        <li><a href="account-register.jsp">Register</a></li>
                        <li><a href="page-not-found.jsp">Page Not Found</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">Shop</a>
                    <ul class="sub-menu">
                        <li>
                            <a href="#">Shop Layout</a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="shop-three-columns.jsp">Shop 3 Column</a>
                                </li>
                                <li>
                                    <a href="shop-four-columns.jsp">Shop 4 Column</a>
                                </li>
                                <li><a href="shop.jsp">Shop Left Sidebar</a></li>
                                <li>
                                    <a href="shop-right-sidebar.jsp">Shop Right Sidebar</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">Single Product</a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="single-normal-product.jsp"
                                       >Single Product Normal</a
                                    >
                                </li>
                                <li>
                                    <a href="single-product.jsp"
                                       >Single Product Variable</a
                                    >
                                </li>
                                <li>
                                    <a href="single-group-product.jsp"
                                       >Single Product Group</a
                                    >
                                </li>
                                <li>
                                    <a href="single-affiliate-product.jsp"
                                       >Single Product Affiliate</a
                                    >
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">Others Pages</a>
                            <ul class="sub-menu">
                                <li><a href="shop-cart.jsp">Shopping Cart</a></li>
                                <li><a href="shop-checkout.jsp">Checkout</a></li>
                                <li><a href="shop-wishlist.jsp">Wishlist</a></li>
                                <li><a href="shop-compare.jsp">Compare</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">Blog</a>
                    <ul class="sub-menu">
                        <li>
                            <a href="#">Blog Layout</a>
                            <ul class="sub-menu">
                                <li><a href="blog.jsp">Blog Grid</a></li>
                                <li>
                                    <a href="blog-left-sidebar.jsp">Blog Left Sidebar</a>
                                </li>
                                <li>
                                    <a href="blog-right-sidebar.jsp">Blog Right Sidebar</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">Single Blog</a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="blog-details-no-sidebar.jsp">Blog Details</a>
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

<!-- Mirrored from htmldemo.net/shome/shome/account.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 02 Feb 2025 02:23:50 GMT -->
</html>
