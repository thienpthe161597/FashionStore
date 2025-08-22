<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Category" %>
<%@ page import="entity.Sale" %>
<%@ page import="dao.ProductDAO" %>
<%@ page import="dao.CategoryDAO" %>
<%  
    List<Product> productList = (List<Product>) request.getAttribute("listProduct");
    List<Category> categoryList = (List<Category>) request.getAttribute("listCategory");
    List<Sale> saleList = (List<Sale>) request.getAttribute("listSale");
    ProductDAO productDao = new ProductDAO();
    CategoryDAO categoryDao = new CategoryDAO();
    
    
%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">

        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="${pageContext.request.contextPath}/assets2/img/favicon.ico" rel="icon">
        <title>Dashboard admin</title>
        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="${pageContext.request.contextPath}/assets2/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets2/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="${pageContext.request.contextPath}/assets2/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="${pageContext.request.contextPath}/assets2/css/style.css" rel="stylesheet">
    </head>

    <body>
        <%
            String loginMessage = (String) request.getAttribute("loginMessage");
            if (loginMessage != null) {
        %>
        <script type="text/javascript">
            window.onload = function () {
                alert('<%= loginMessage%>');
            };
        </script>
        <%
            }
        %>
        <div class="container-xxl position-relative bg-white d-flex p-0">
            <!-- Spinner Start -->
            <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->


            <!-- Sidebar Start -->
            <div class="sidebar pe-4 pb-3">
                <nav class="navbar bg-light navbar-light">

                    <div class="d-flex align-items-center ms-4 mb-4" style="margin-top: 50px">
                        <div class="position-relative">
                            <img class="rounded-circle" src="${pageContext.request.contextPath}/assets2/img/user.jpg" alt="" style="width: 40px; height: 40px;">
                            <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                        </div>
                        <div class="ms-3">
                            <h6 class="mb-0">${user.getUser_Name()}</h6>
                            <span>${user.getRole()}</span>
                        </div>
                    </div>
                    <div class="navbar-nav w-100">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown"><i class=" fas fa-shoe-prints me-2"></i>Fashion Store</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="shoes" class="dropdown-item" style="margin-left: 50px">List shoes</a>
                                <a href="shoes-sale" class="dropdown-item" style="margin-left: 50px">List sale shoes</a>
                                <a href="shoesimage" class="dropdown-item" style="margin-left: 50px">Image shoes</a>
                                <a href="shoesvariant" class="dropdown-item" style="margin-left: 50px">Variant shoes</a>
                            </div>
                        </div>
                        <a href="user-manage" class="nav-item nav-link"><i class="fa fa-user me-2"></i>User</a>
                        <a href="user-order" class="nav-item nav-link"><i class="fa fa-user me-2"></i>User Order</a>
                        <a href="brand" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Category</a>
                        <a href="logout" class="nav-item nav-link"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
                        <!--                    <a href="table.html" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Tables</a>
                                            <a href="chart.html" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Charts</a>-->
                        <!--                    <div class="nav-item dropdown">
                                                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Pages</a>
                                                <div class="dropdown-menu bg-transparent border-0">
                                                    <a href="signin.html" class="dropdown-item">Sign In</a>
                                                    <a href="signup.html" class="dropdown-item">Sign Up</a>
                                                    <a href="404.html" class="dropdown-item">404 Error</a>
                                                    <a href="blank.html" class="dropdown-item">Blank Page</a>
                                                </div>
                                            </div>-->
                    </div>
                </nav>
            </div>
            <!-- Add Shoe Modal -->
            <div class="modal fade" id="addShoeModal" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="shoes?action=add" method="post">
                            <div class="modal-header">
                                <h5 class="modal-title">Add Shoe</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">
                                <label>Category:</label>
                                <select name="category" id="add-category">
                                    <% 
                                    if (categoryList != null) {
                                        for (Category c : categoryList) { %>
                                    <option value="<%= c.getCategoryID() %>"><%= c.getCategoryName() %></option>
                                    <%  } 
                                } %>
                                </select>
                                <br><br>
                                <label>Sale:</label>
                                <select name="sale" id="add-sale">
                                    <option value="0">0%</option>
                                    <% 
                                    if (saleList != null) {
                                        for (Sale s : saleList) { %>
                                    <option value="<%= s.getSaleId() %>"><%= s.getSale() %> %</option>
                                    <%  } 
                                } %>
                                </select>
                                <br><br>
                                <label>Name:</label>
                                <input type="text" name="name" id="add-name" class="form-control" required><br>
                                <label>Description:</label>
                                <textarea name="description" id="add-description" class="form-control" rows="4" cols="50" required></textarea><br>
                                <label>Price:</label>
                                <input type="number" name="price" id="add-price" class="form-control" required><br>
                                <label>Gender:</label>
                                <select name="gender" id="add-gender">
                                    <option value="Men">Men</option>
                                    <option value="Women">Women</option>
                                    <option value="Unisex">Unisex</option>
                                </select>
                                <br><br>
                                <label>ImageURL:</label>
                                <textarea name="image" id="add-image" class="form-control" rows="4" cols="50" required></textarea><br>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Add</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Edit Shoe Modal -->
            <div class="modal fade" id="editShoeModal" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="shoes-sale" method="post">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="id" value="${product.id}">


                            <div class="modal-header">
                                <h5 class="modal-title">Edit Shoe</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">
                                <input type="hidden" name="id" id="edit-id">
                                <label>Category:</label>
                                <select name="category" id="edit-category">
                                    <% 
                                    if (categoryList != null) {
                                        for (Category c : categoryList) { %>
                                    <option value="<%= c.getCategoryID() %>"><%= c.getCategoryName() %></option>
                                    <%  } 
                                } %>
                                </select>
                                <br><br>
                                <label>Sale:</label>
                                <select name="sale" id="edit-sale">
                                    <option value="0">No Sale</option>
                                    <% 
                                    if (saleList != null) {
                                        for (Sale s : saleList) { %>
                                    <option value="<%= s.getSaleId() %>"><%= s.getSale() %> %</option>
                                    <%  } 
                                } %>
                                </select>
                                <br><br>
                                <label>Name:</label>
                                <input type="text" name="name" id="edit-name" class="form-control" required><br>
                                <label>Description:</label>
                                <textarea name="description" id="edit-description" class="form-control" rows="4" cols="50" required></textarea><br>
                                <label>Price:</label>
                                <input type="number" name="price" id="edit-price" class="form-control" required><br>
                                <label>Gender:</label>
                                <select name="gender" id="edit-gender">
                                    <option value="Men">Men</option>
                                    <option value="Women">Women</option>
                                    <option value="Unisex">Unisex</option>
                                </select>
                                <br><br>

                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Save Changes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    document.querySelectorAll(".edit-btn").forEach(button => {
                        button.addEventListener("click", function () {
                            document.getElementById("edit-id").value = this.dataset.id;
                            document.getElementById("edit-sale").value = this.dataset.sale;
                            document.getElementById("edit-category").value = this.dataset.category;
                            document.getElementById("edit-name").value = this.dataset.name;
                            document.getElementById("edit-description").value = this.dataset.description;
                            document.getElementById("edit-price").value = this.dataset.price;
                            document.getElementById("edit-gender").value = this.dataset.gender;
                        });
                    });
                });
            </script>
            <div class="container mt-4">
                <h2>Manage Shoes</h2>
                <% 
                    String message = (String) session.getAttribute("message");
                    if (message != null) { 
                %>
                <div class="alert alert-success">
                    <%= message %>
                </div>
                <% 
                    session.removeAttribute("message"); 
                } 
                %>
                <button class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addShoeModal">Add New Shoe</button>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>SaleID</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Gender</th>
                            <th>Description</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                        if (productList != null) {
                            for (Product p : productList) { %>
                        <tr>
                            <td><%= p.getProductID() %></td>
                            <td><%= p.getProductName() %></td>
                            <td><%= p.getSaleID() %></td>
                            <td><%= p.getCategoryID() %></td>
                            <td><%= p.getPrice() %></td>
                            <td><%= p.getGender() %></td>
                            <td><%= p.getDescription() %></td>

                            <td>
                                <button class="btn btn-warning btn-sm edit-btn" 
                                        data-id="<%= p.getProductID() %>" 
                                        data-name="<%= p.getProductName() %>"
                                        data-sale="<%= p.getSaleID() %>"
                                        data-category="<%= p.getCategoryID() %>"
                                        data-price="<%= p.getPrice() %>"
                                        data-gender="<%= p.getGender() %>"
                                        data-description="<%= p.getDescription() %>"
                                        data-bs-toggle="modal" 
                                        data-bs-target="#editShoeModal">
                                    Edit
                                </button>
                                <form action="shoes-sale" method="post">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="id" value="${product.id}">

                                    <input type="hidden" name="idtodel" value="<%= p.getProductID() %>">
                                    <button type="submit" class="btn btn-warning btn-sm edit-btn">
                                        Delete
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <%  } 
                } %>
                    </tbody>
                </table>
            </div>


            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/lib/chart/chart.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/lib/easing/easing.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/lib/waypoints/waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/lib/tempusdominus/js/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets2/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="${pageContext.request.contextPath}/assets2/js/main.js"></script>
    </body>

</html>