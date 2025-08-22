<%@ include file="./header.jsp" %>
  <!--== End Header Wrapper ==-->
  
  <main class="main-content">
   
    <!--== Start Blog Area Wrapper ==-->
    <section class="blog-details-area">
      <div class="container">
        <div class="row justify-content-between">
          <div class="col-xl-12" data-aos="fade-right">
            <div class="blog-details-content-wrap">
              <div class="blog-details-item">
                
<!--                <div class="blog-meta-post">
                  <ul>
                    <li class="post-date"><i class="fa fa-calendar"></i><a href="blog.jsp">22,Jun 2022</a></li>
                    <li class="author-info"><i class="fa fa-user"></i><a href="blog.jsp">Hector Lovett</a></li>
                  </ul>
                </div>-->
                <h3 class="main-title">${blog.getTitle()}</h3>
                
                <div class="details-wrapper details-wrapper-style2">
                  <p><img class="p-image-right" src="${blogImg.getImage_URL()}" width="370" height="400" alt="Image-HasTech">
                      <span>${blog.getContent()}</span></p>
                  
                </div>
                <div class="blog-details-footer"> 
                  
                  <div class="social-icons">
                    <span>Share:</span>
                    <a href="#/"><i class="fa fa-facebook"></i></a>
                    <a href="#/"><i class="fa fa-dribbble"></i></a>
                    <a href="#/"><i class="fa fa-pinterest-p"></i></a>
                    <a href="#/"><i class="fa fa-twitter"></i></a>
                  </div>
                </div>
               
              </div>

<!--              == Start Comment View Item ==
              <div class="comment-view-area">
                <h4 class="title-main">Comments</h4>
                <div class="comment-view-content">
                  <div class="single-comment">
                    <div class="author-pic">
                      <a href="blog.jsp"><img src="assets/img/blog/author1.webp" width="101" height="118" alt="Image-HasTech"></a>
                    </div>
                    <div class="author-info">
                      <h4 class="title">
                        <a href="blog.jsp">Marie Jensen</a>
                        <span> - </span>
                        <a class="comment-date" href="blog.jsp">22 August, 2022</a>
                      </h4>
                      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temp labore et dol magna aliqua. Ut enim ad minim veniam.</p>
                      <div class="author-info-footer">
                        <a class="comment-reply" href="#/">Reply</a>
                      </div>
                    </div>
                  </div>
                  <div class="single-comment reply-comment">
                    <div class="author-pic">
                      <a href="blog.jsp"><img src="assets/img/blog/author2.webp" width="101" height="118" alt="Image-HasTech"></a>
                    </div>
                    <div class="author-info">
                      <h4 class="title">
                        <a href="blog.jsp">Rachel Leonard</a>
                        <span> - </span>
                        <a class="comment-date" href="blog.jsp">22 August, 2022</a>
                      </h4>
                      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sedd labore et dol magna aliqua. Ut enim ad.</p>
                      <div class="author-info-footer">
                        <a class="comment-reply" href="#/">Reply</a>
                      </div>
                    </div>
                  </div>
                  <div class="single-comment">
                    <div class="author-pic">
                      <a href="blog.jsp"><img src="assets/img/blog/author3.webp" width="101" height="118" alt="Image-HasTech"></a>
                    </div>
                    <div class="author-info">
                      <h4 class="title">
                        <a href="blog.jsp">Amilia Luna</a>
                        <span> - </span>
                        <a class="comment-date" href="blog.jsp">22 August, 2022</a>
                      </h4>
                      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temp labore et dol magna aliqua. Ut enim ad minim veniam.</p>
                      <div class="author-info-footer">
                        <a class="comment-reply" href="#/">Reply</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              == End Comment View Item ==

              == Start Comment Item ==
              <div class="comment-form-area">
                <h4 class="title-main">Leave a Comments</h4>
                <div class="comment-form-content">
                  <form action="#">
                    <div class="row ">
                      <div class="col-md-6">
                        <div class="form-group">
                          <input class="form-control" type="text" placeholder="Name *">
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group">
                          <input class="form-control" type="email" placeholder="Email *">
                        </div>
                      </div>
                      <div class="col-md-12">
                        <div class="form-group">
                          <input class="form-control" type="text" placeholder="Subject (Optinal)">
                        </div>
                      </div>
                      <div class="col-md-12">
                        <div class="form-group mb--0">
                          <textarea class="form-control" placeholder="Message"></textarea>
                        </div>
                      </div>
                      <div class="col-md-12">
                        <div class="form-group mb--0">
                          <button type="submit" class="btn-theme">Send a Comment</button>
                        </div>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
              == End Comment Item ==-->
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


  <!--== Start Side Menu ==-->
  
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


<!-- Mirrored from htmldemo.net/shome/shome/blog-details.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 02 Feb 2025 02:24:05 GMT -->
</html>