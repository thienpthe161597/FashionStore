<%@ include file="./header.jsp" %>
  <!--== End Header Wrapper ==-->
  
  <main class="main-content">
    <!--== Start Page Header Area Wrapper ==-->
    <div class="page-header-area" data-bg-img="assets/img/photos/bg3.webp">
      <div class="container pt--0 pb--0">
        <div class="row">
          <div class="col-12">
            <div class="page-header-content">
              <h2 class="title" data-aos="fade-down" data-aos-duration="1000">Checkout</h2>
              <nav class="breadcrumb-area" data-aos="fade-down" data-aos-duration="1200">
                <ul class="breadcrumb">
                  <li><a href="index.jsp">Home</a></li>
                  <li class="breadcrumb-sep">//</li>
                  <li>Checkout</li>
                </ul>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--== End Page Header Area Wrapper ==-->

    <!--== Start Shopping Checkout Area Wrapper ==-->
    <section class="shopping-checkout-wrap">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <div class="checkout-page-login-wrap">
              <!--== Start Checkout Login Accordion ==-->
              <div class="login-accordion" id="LoginAccordion">
                <div class="card">
                  <h3>
                    <i class="fa fa-info-circle"></i>
                    Returning customer?
                    <a href="#/" data-bs-toggle="collapse" data-bs-target="#loginaccordion">Click here to login</a>
                  </h3>
                  <div id="loginaccordion" class="collapse" data-bs-parent="#LoginAccordion">
                    <div class="card-body">
                      <div class="login-wrap">
                        <p>If you have shopped with us before, please enter your details below. If you are a new customer, please proceed to the Billing & Shipping section.</p>
                        <form action="#" method="post">
                          <div class="row">
                            <div class="col-md-6">
                              <div class="form-group">
                                <label for="logEmail">Username or email <span class="required">*</span></label>
                                <input id="logEmail" class="form-control" type="email">
                              </div>
                            </div>
                            <div class="col-md-6">
                              <div class="form-group left-m">
                                <label for="logPass">Password <span class="required">*</span></label>
                                <input id="logPass" class="form-control" type="password">
                              </div>
                            </div>
                            <div class="col-md-6">
                              <div class="form-group mt-30">
                                <button class="btn-login">Login</button>
                                <div class="rememberme-account">
                                  <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input visually-hidden" id="remembermePass">
                                    <label class="custom-control-label" for="remembermePass">Remember me</label>
                                  </div>
                                </div>
                                <a class="lost-password" href="#">Lost your password?</a>
                              </div>
                            </div>
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!--== End Checkout Login Accordion ==-->
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <div class="checkout-page-coupon-wrap">
              <!--== Start Checkout Coupon Accordion ==-->
              <div class="coupon-accordion" id="CouponAccordion">
                <div class="card">
                  <h3>
                    <i class="fa fa-info-circle"></i>
                    Have a Coupon?
                    <a href="#/" data-bs-toggle="collapse" data-bs-target="#couponaccordion">Click here to enter your code</a>
                  </h3>
                  <div id="couponaccordion" class="collapse" data-bs-parent="#CouponAccordion">
                    <div class="card-body">
                      <div class="apply-coupon-wrap mb-60">
                        <p>If you have a coupon code, please apply it below.</p>
                        <form action="#" method="post">
                          <div class="row">
                            <div class="col-md-6">
                              <div class="form-group">
                                <input class="form-control" type="text" placeholder="Coupon code">
                              </div>
                            </div>
                            <div class="col-md-6">
                              <button class="btn-coupon">Apply coupon</button>
                            </div>
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!--== End Checkout Coupon Accordion ==-->
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-6">
            <!--== Start Billing Accordion ==-->
            <div class="checkout-billing-details-wrap">
              <h2 class="title">Billing details</h2>
              <div class="billing-form-wrap">
                <form action="#" method="post">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="f_name">First name <abbr class="required" title="required">*</abbr></label>
                        <input id="f_name" type="text"  class="form-control">
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="l_name">Last name <abbr class="required" title="required">*</abbr></label>
                        <input id="l_name" type="text"  class="form-control">
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <label for="com_name">Company name (optional)</label>
                        <input id="com_name" type="text"  class="form-control">
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <label for="country">Country <abbr class="required" title="required">*</abbr></label>
                        <select id="country" class="form-control">
                          <option>Bangladesh</option>
                          <option>Afghanistan</option>
                          <option>Albania</option>
                          <option>Algeria</option>
                          <option>Armenia</option>
                          <option>India</option>
                          <option>Pakistan</option>
                          <option>England</option>
                          <option>London</option>
                          <option>London</option>
                          <option>China</option>
                        </select>
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <label for="street-address">Street address <abbr class="required" title="required">*</abbr></label>
                        <input id="street-address" type="text"  class="form-control" placeholder="House number and street name">
                      </div>
                      <div class="form-group">
                        <label for="street-address2" class="visually-hidden">Street address 2 <abbr class="required" title="required">*</abbr></label>
                        <input id="street-address2" type="text"  class="form-control" placeholder="Apartment, suite, unit etc. (optional)">
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <label for="town">Town / City <abbr class="required" title="required">*</abbr></label>
                        <input id="town" type="text"  class="form-control">
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <label for="district">District <abbr class="required" title="required">*</abbr></label>
                        <select id="district" class="form-control">
                          <option>Afghanistan</option>
                          <option>Albania</option>
                          <option>Algeria</option>
                          <option>Armenia</option>
                          <option>India</option>
                          <option>Pakistan</option>
                          <option>England</option>
                          <option>London</option>
                          <option>London</option>
                          <option>China</option>
                        </select>
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <label for="pz-code">Postcode / ZIP (optional)</label>
                        <input id="pz-code" type="text"  class="form-control">
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <label for="phone">Phone (optional)</label>
                        <input id="phone" type="text"  class="form-control">
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group" data-margin-bottom="30">
                        <label for="email">Email address <abbr class="required" title="required">*</abbr></label>
                        <input id="email" type="text"  class="form-control">
                      </div>
                    </div>
                    <div id="CheckoutBillingAccordion" class="col-md-12">
                      <div class="checkout-box" data-margin-bottom="25" data-bs-toggle="collapse" data-bs-target="#CheckoutOne" aria-expanded="false" role="toolbar">
                        <div class="custom-control custom-checkbox">
                          <input type="checkbox" class="custom-control-input visually-hidden" id="CreateAccount">
                          <label class="custom-control-label" for="CreateAccount">Create an account?</label>
                        </div>
                      </div>
                      <div id="CheckoutOne" class="collapse" data-margin-top="30" data-bs-parent="#CheckoutBillingAccordion">
                        <div class="form-group">
                          <label for="password">Create account password <abbr class="required" title="required">*</abbr></label>
                          <input id="password" type="password"  class="form-control" placeholder="Password">
                        </div>
                      </div>
                    </div>
                    <div id="CheckoutBillingAccordion2" class="col-md-12">
                      <div class="checkout-box" data-margin-bottom="25" data-bs-toggle="collapse" data-bs-target="#CheckoutTwo" aria-expanded="false" role="toolbar">
                        <div class="custom-control custom-checkbox">
                          <input type="checkbox" class="custom-control-input visually-hidden" id="ship-to-different-address">
                          <label class="custom-control-label" for="ship-to-different-address">Ship to a different address?</label>
                        </div>
                      </div>
                      <div id="CheckoutTwo" class="collapse" data-margin-top="30"  data-bs-parent="#CheckoutBillingAccordion2">
                        <div class="row">
                          <div class="col-md-6">
                            <div class="form-group">
                              <label for="f_name2">First name <abbr class="required" title="required">*</abbr></label>
                              <input id="f_name2" type="text"  class="form-control">
                            </div>
                          </div>
                          <div class="col-md-6">
                            <div class="form-group">
                              <label for="l_name2">Last name <abbr class="required" title="required">*</abbr></label>
                              <input id="l_name2" type="text"  class="form-control">
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="com_name2">Company name (optional)</label>
                              <input id="com_name2" type="text"  class="form-control">
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="country2">Country <abbr class="required" title="required">*</abbr></label>
                              <select id="country2" class="form-control">
                                <option>Bangladesh</option>
                                <option>Afghanistan</option>
                                <option>Albania</option>
                                <option>Algeria</option>
                                <option>Armenia</option>
                                <option>India</option>
                                <option>Pakistan</option>
                                <option>England</option>
                                <option>London</option>
                                <option>London</option>
                                <option>China</option>
                              </select>
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="street-address2-3">Street address <abbr class="required" title="required">*</abbr></label>
                              <input id="street-address2-3" type="text"  class="form-control" placeholder="House number and street name">
                            </div>
                            <div class="form-group">
                              <label for="street-address2-2" class="visually-hidden">Street address 2 <abbr class="required" title="required">*</abbr></label>
                              <input id="street-address2-2" type="text"  class="form-control" placeholder="Apartment, suite, unit etc. (optional)">
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="town3">Town / City <abbr class="required" title="required">*</abbr></label>
                              <input id="town3" type="text"  class="form-control">
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="district2">District <abbr class="required" title="required">*</abbr></label>
                              <select id="district2" class="form-control">
                                <option>Afghanistan</option>
                                <option>Albania</option>
                                <option>Algeria</option>
                                <option>Armenia</option>
                                <option>India</option>
                                <option>Pakistan</option>
                                <option>England</option>
                                <option>London</option>
                                <option>London</option>
                                <option>China</option>
                              </select>
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="pz-code2">Postcode / ZIP (optional)</label>
                              <input id="pz-code2" type="text"  class="form-control">
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group mb--0">
                        <label for="order-notes">Order notes (optional)</label>
                        <textarea id="order-notes" class="form-control" placeholder="Notes about your order, e.g. special notes for delivery."></textarea>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
            </div>
            <!--== End Billing Accordion ==-->
          </div>
          <div class="col-lg-6">
            <!--== Start Order Details Accordion ==-->
            <div class="checkout-order-details-wrap">
              <div class="order-details-table-wrap table-responsive">
                <h2 class="title mb-25">Your order</h2>
                <table class="table">
                  <thead>
                    <tr>
                      <th class="product-name">Product</th>
                      <th class="product-total">Total</th>
                    </tr>
                  </thead>
                  <tbody class="table-body">
                    <tr class="cart-item">
                      <td class="product-name">Satin gown <span class="product-quantity">× 1</span></td>
                      <td class="product-total">£69.99</td>
                    </tr>
                    <tr class="cart-item">
                      <td class="product-name">Printed cotton t-shirt <span class="product-quantity">× 1</span></td>
                      <td class="product-total">£20.00</td>
                    </tr>
                  </tbody>
                  <tfoot class="table-foot">
                    <tr class="cart-subtotal">
                      <th>Subtotal</th>
                      <td>£89.99</td>
                    </tr>
                    <tr class="shipping">
                      <th>Shipping</th>
                      <td>Flat rate: £2.00</td>
                    </tr>
                    <tr class="order-total">
                      <th>Total </th>
                      <td>£91.99</td>
                    </tr>
                  </tfoot>
                </table>
                <div class="shop-payment-method">
                  <div id="PaymentMethodAccordion">
                    <div class="card">
                      <div class="card-header" id="check_payments">
                        <h5 class="title" data-bs-toggle="collapse" data-bs-target="#itemOne" aria-controls="itemOne" aria-expanded="true">Direct bank transfer</h5>
                      </div>
                      <div id="itemOne" class="collapse show" aria-labelledby="check_payments" data-bs-parent="#PaymentMethodAccordion">
                        <div class="card-body">
                          <p>Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order will not be shipped until the funds have cleared in our account.</p>
                        </div>
                      </div>
                    </div>
                    <div class="card">
                      <div class="card-header" id="check_payments2">
                        <h5 class="title" data-bs-toggle="collapse" data-bs-target="#itemTwo" aria-controls="itemTwo" aria-expanded="false">Check payments</h5>
                      </div>
                      <div id="itemTwo" class="collapse" aria-labelledby="check_payments2" data-bs-parent="#PaymentMethodAccordion">
                        <div class="card-body">
                          <p>Please send a check to Store Name, Store Street, Store Town, Store State / County, Store Postcode.</p>
                        </div>
                      </div>
                    </div>
                    <div class="card">
                      <div class="card-header" id="check_payments3">
                        <h5 class="title" data-bs-toggle="collapse" data-bs-target="#itemThree" aria-controls="itemTwo" aria-expanded="false">Cash on delivery</h5>
                      </div>
                      <div id="itemThree" class="collapse" aria-labelledby="check_payments3" data-bs-parent="#PaymentMethodAccordion">
                        <div class="card-body">
                          <p>Pay with cash upon delivery.</p>
                        </div>
                      </div>
                    </div>
                    <div class="card">
                      <div class="card-header" id="check_payments4">
                        <h5 class="title" data-bs-toggle="collapse" data-bs-target="#itemFour" aria-controls="itemTwo" aria-expanded="false">PayPal Express Checkout <img src="assets/img/photos/paypal2.webp" width="40" height="26" alt="Image-HasTech"></h5>
                      </div>
                      <div id="itemFour" class="collapse" aria-labelledby="check_payments4" data-bs-parent="#PaymentMethodAccordion">
                        <div class="card-body">
                          <p>Pay via PayPal; you can pay with your credit card if you don’t have a PayPal account.</p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <p class="p-text">Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our <a href="#/">privacy policy.</a></p>
                  <div class="agree-policy">
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" id="privacy" class="custom-control-input visually-hidden">
                      <label for="privacy" class="custom-control-label">I have read and agree to the website terms and conditions <span class="required">*</span></label>
                    </div>
                  </div>
                  <a href="account-login.jsp" class="btn-theme">Place order</a>
                </div>
              </div>
            </div>
            <!--== End Order Details Accordion ==-->
          </div>
        </div>
      </div>
    </section>
    <!--== End Shopping Checkout Area Wrapper ==-->
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


<!-- Mirrored from htmldemo.net/shome/shome/shop-checkout.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 02 Feb 2025 02:24:00 GMT -->
</html>