<footer class="footer-area">
  <!--== Start Footer Main ==-->
  <div class="footer-main">
    <div class="container pt--0 pb--0">
      <div class="row">
        <div class="col-md-6 col-lg-3">
          <!--== Start widget Item ==-->
          <!--== End widget Item ==-->
        </div>
        <div class="col-md-6 col-lg-3">
          <!--== Start widget Item ==-->
          <div class="widget-item widget-services-item">
            <h4 class="widget-title">Services</h4>
            <h4
              class="widget-collapsed-title collapsed"
              data-bs-toggle="collapse"
              data-bs-target="#widgetId-1"
            >
              Services
            </h4>
            <div id="widgetId-1" class="collapse widget-collapse-body">
              <div class="collapse-body">
                <div class="widget-menu-wrap">
                  <ul class="nav-menu">
                    <li><a href="ProductController">Shop</a></li>
                    <li><a href="shop-cart.jsp">Shopping cart</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <!--== End widget Item ==-->
        </div>
        <div class="col-md-6 col-lg-3">
          <!--== Start widget Item ==-->
          <div class="widget-item widget-account-item">
            <h4 class="widget-title">My Account</h4>
            <h4
              class="widget-collapsed-title collapsed"
              data-bs-toggle="collapse"
              data-bs-target="#widgetId-2"
            >
              My Account
            </h4>
            <div id="widgetId-2" class="collapse widget-collapse-body">
              <div class="collapse-body">
                <div class="widget-menu-wrap">
                  <ul class="nav-menu">
                      <c:if test="${user == null}">
                    <li><a href="login">Login</a></li>
                    </c:if>
                    <c:if test="${user != null}">
                    <li><a href="user">${user.getUser_Name()} Profile</a></li>
                    </c:if>
                    <c:if test="${user != null}">
                    <li><a href="user?orderAction=1">Order History</a></li>
                    </c:if>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <!--== End widget Item ==-->
        </div>
        <div class="col-md-6 col-lg-3">
          <!--== Start widget Item ==-->
          <div class="widget-item">
            <h4 class="widget-title">Contact Info</h4>
            <h4
              class="widget-collapsed-title collapsed"
              data-bs-toggle="collapse"
              data-bs-target="#widgetId-3"
            >
              Contact Info
            </h4>
            <div id="widgetId-3" class="collapse widget-collapse-body">
              <div class="collapse-body">
                <div class="widget-contact-wrap">
                  <ul>
                    <li><span>Address:</span> Hanoi</li>
                    <li>
                      <span>Phone//fax:</span>
                      <a href="tel://0123456789">0123456789</a>
                    </li>
                    <li>
                      <span>Email:</span>
                      <a href="mailto://demo@example.com">ShoeShop@Gmail.com</a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <!--== End widget Item ==-->
        </div>
      </div>
    </div>
  </div>
  <!--== End Footer Main ==-->

  <!--== Start Footer Bottom ==-->
  <div class="footer-bottom">
    <div class="container pt--0 pb--0">
      <div class="row">
        <div class="col-md-7 col-lg-6">
          <p class="copyright">
            <a
              >Shoes Shop</a
            >
          </p>
        </div>
        <div class="col-md-5 col-lg-6">
          <div class="payment">
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--== End Footer Bottom ==-->
</footer>
