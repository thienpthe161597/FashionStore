<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                alert('<%= loginMessage %>');
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
                                <a href="dashBoard" class="dropdown-item" style="margin-left: 50px">DashBoard</a>
                                <a href="shoes" class="dropdown-item" style="margin-left: 50px">List shoes</a>
                                <a href="shoes-sale" class="dropdown-item" style="margin-left: 50px">List sale shoes</a>
                                <a href="shoesimage" class="dropdown-item" style="margin-left: 50px">Image shoes</a>
                                <a href="shoesvariant" class="dropdown-item" style="margin-left: 50px">Variant shoes</a>
                            </div>
                        </div>
                        <a href="brand" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Category</a>
                        <c:if test="${user.getRole() eq 'Admin'}">
                            <a href="useru" class="nav-item nav-link "><i class="fa fa-th me-2"></i>User List</a>
                        </c:if>
                        <a href="order" class="nav-item nav-link "><i class="fa fa-th me-2"></i>Oder List</a>
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
            <!-- Sidebar End -->
            <div class="modal fade" id="modaladd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Add new shoes</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div> 
                        <form action="shoes" method="post">
                            <div class="modal-body">
                                <div class="mb-3">
                                    <input type="hidden" class="form-control" name="action" value="add">
                                    <label for="exampleInputEmail1" class="form-label">Name</label>
                                    <input type="text" class="form-control" name="shoesname" required>
                                    <label for="exampleInputEmail1" class="form-label">Category</label>
                                    <select name="shoescategory" class="form-select" aria-label="Default select example"><c:forEach items="${listCategory}" var="listCategory">
                                            <option value="${listCategory.getCategoryID()}">${listCategory.getCategoryName()}</option></c:forEach>
                                        </select>
                                        <label for="exampleInputEmail1" class="form-label">Price</label>
                                        <input type="number" class="form-control" name="shoesprice" required>
                                        <label for="exampleInputEmail1" class="form-label">Gender</label>
                                        <select name="shoesgender" class="form-select" aria-label="Default select example">
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                        </select>
                                        <label for="exampleInputEmail1" class="form-label" >Description</label>
                                        <input type="text" class="form-control" name="shoesdescription" required minlength="10">
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <input type="submit" class="btn btn-primary" value="Add">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- Content Start -->
                <!-- Modal -->
                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Edit Shoes</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="shoes" method="post">
                                    <input type="hidden" name="action" value="update">
                                    <input type="hidden" id="editProductId" name="id">

                                    <div class="mb-3">
                                        <label class="form-label">Name</label>
                                        <input type="text" class="form-control" id="editName" name="shoesname" >
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Category</label>
                                        <select class="form-select" id="editCategory" name="shoescategory">
                                        <c:forEach items="${listCategory}" var="listCategory">
                                            <option value="${listCategory.getCategoryID()}">${listCategory.getCategoryName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Price</label>
                                    <input type="number" class="form-control" id="editPrice" name="shoesprice">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Gender</label>
                                    <select class="form-select" id="editGender" name="shoesgender">
                                        <option value="Men">Men</option>
                                        <option value="Women">Women</option>
                                        <option value="Unisex">Unisex</option>


                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Description</label>
                                    <input type="text" class="form-control" id="editDescription" name="shoesdescription" required minlength="10">
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <input type="submit" class="btn btn-primary" value="Save Changes">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    // L?y t?t c? nút "Edit shoes"
                    let editButtons = document.querySelectorAll(".btn-edit");

                    editButtons.forEach(button => {
                        button.addEventListener("click", function () {
                            // L?y d? li?u t? button
                            let productId = this.getAttribute("data-id");
                            let productName = this.getAttribute("data-name");
                            let productCategory = this.getAttribute("data-category");
                            let productPrice = this.getAttribute("data-price");
                            let productGender = this.getAttribute("data-gender");
                            let productDescription = this.getAttribute("data-description");

                            // Gán d? li?u vào modal
                            document.getElementById("editProductId").value = productId;
                            document.getElementById("editName").value = productName;
                            document.getElementById("editCategory").value = productCategory;
                            document.getElementById("editPrice").value = productPrice;
                            document.getElementById("editGender").value = productGender;
                            document.getElementById("editDescription").value = productDescription;
                        });
                    });
                });

            </script>
            <div class="content">
                <!-- Recent Sales Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light text-center rounded p-4"  style="margin-right: 80px; margin-top: 30px">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">List shoes</h6>
                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modaladd">
                                Add new shoes
                            </button>
                        </div>
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-md-6">
                                    <div class="search-container">
                                        <form action="shoes" method="post" style="display: flex; align-items: center;">
                                            <input type="hidden" name="action" value="searchname">
                                            <label for="nameSearch" style="margin-right: 10px;">Search By Name:</label>
                                            <input name="nameSearch" type="text" class="form-control search-input" placeholder="Input name..." style="flex: 1;">
                                            <button type="submit" class="btn btn-primary btn-edit" style="margin-left: 10px;">
                                                Search
                                            </button>
                                        </form>
                                    </div>
                                    <div class="search-container" style="margin-top: 10px">
                                        <form action="shoes" method="post" style="display: flex; align-items: center; gap: 10px;">
                                            <input type="hidden" name="action" value="filter">
                                            <label for="nameSearch">Filter By Brand</label>
                                            <select name="brandCheck" class="form-select" aria-label="Default select example" style="flex: 1;">
                                                <c:forEach items="${listCategory}" var="listCategory">
                                                    <option value="${listCategory.getCategoryID()}">${listCategory.getCategoryName()}</option>
                                                </c:forEach>
                                            </select>
                                            <button type="submit" class="btn btn-primary btn-edit">
                                                Filter
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div><div style="margin-top: 30px"></div>
                        <c:if test="${message != null}">
                            <p style="color: green">${message}</p>
                        </c:if>
                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0">
                                <thead>
                                    <tr class="text-dark">
                                        <th scope="col">Name</th>
                                        <th scope="col">Category</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Gender</th>
                                        <th scope="col">Description</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listProduct}" var="listProduct">
                                        <tr>
                                            <td>${listProduct.getProductName()}</td>
                                            <c:forEach items="${listCategory}" var="listCategory">
                                                <c:if test="${listCategory.getCategoryID() == listProduct.getCategoryID()}">
                                                    <td>${listCategory.getCategoryName()}</td>
                                                </c:if>
                                            </c:forEach>
                                            <td>${listProduct.getPrice()}</td>
                                            <td>${listProduct.getGender()}</td>
                                            <td>${listProduct.getDescription()}</td>
                                            <td>
                                                <button type="button" class="btn btn-primary btn-edit"
                                                        data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                                                        data-name="${listProduct.getProductName()}"
                                                        data-category="${listProduct.getCategoryID()}"
                                                        data-price="${listProduct.getPrice()}"
                                                        data-gender="${listProduct.getGender()}"
                                                        data-description="${listProduct.getDescription()}"
                                                        data-id="${listProduct.getProductID()}">
                                                    Edit shoes
                                                </button>

                                                <form action="shoes" method="post" onsubmit="return confirmDelete()">
                                                    <input type="hidden" name="action" value="delete">
                                                    <input type="hidden" name="idtodel" value="${listProduct.getProductID()}">
                                                    <input type="submit" class="btn btn-danger" value="Delete">
                                                </form>
                                                <script>
                                                    function confirmDelete() {
                                                        var confirmAction = confirm("Are you sure you want to delete?");
                                                        if (confirmAction) {
                                                            return true;
                                                        }
                                                        return false;
                                                    }
                                                </script>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <c:if test="${nameSearch == null && brandCheck == null}">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination" style="margin-left: 300px; margin-top: 30px">
                                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                    <a class="page-link" href="shoes?page=${currentPage - 1}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <c:forEach var="i" begin="1" end="${totalPages}">
                                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                                        <a class="page-link" href="shoes?page=${i}">${i}</a>
                                    </li>
                                </c:forEach>
                                <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                    <a class="page-link" href="shoes?page=${currentPage + 1}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </c:if>

                    <c:if test="${nameSearch != null && brandCheck == null}">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination" style="margin-left: 300px; margin-top: 30px">
                                <!-- Nút Previous -->
                                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                    <form method="POST" action="shoes">
                                        <input type="hidden" name="action" value="searchname">
                                        <input type="hidden" name="nameSearch" value="${nameSearch}">
                                        <input type="hidden" name="page" value="${currentPage - 1}">
                                        <button type="submit" class="page-link">&laquo;</button>
                                    </form>
                                </li>
                                <c:forEach var="i" begin="1" end="${totalPages}">
                                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                                        <form method="POST" action="shoes">
                                            <input type="hidden" name="action" value="searchname">
                                            <input type="hidden" name="nameSearch" value="${nameSearch}">
                                            <input type="hidden" name="page" value="${i}">
                                            <button type="submit" class="page-link">${i}</button>
                                        </form>
                                    </li>
                                </c:forEach>
                                <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                    <form method="POST" action="shoes">
                                        <input type="hidden" name="action" value="searchname">
                                        <input type="hidden" name="nameSearch" value="${nameSearch}">
                                        <input type="hidden" name="page" value="${currentPage + 1}">
                                        <button type="submit" class="page-link">&raquo;</button>
                                    </form>
                                </li>
                            </ul>
                        </nav>
                    </c:if>    

                    <c:if test="${nameSearch == null && brandCheck != null}">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination" style="margin-left: 300px; margin-top: 30px">
                                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                    <form method="POST" action="shoes">
                                        <input type="hidden" name="action" value="filter">
                                        <input type="hidden" name="brandCheck" value="${brandCheck}">
                                        <input type="hidden" name="page" value="${currentPage - 1}">
                                        <button type="submit" class="page-link">&laquo;</button>
                                    </form>
                                </li>
                                <c:forEach var="i" begin="1" end="${totalPages}">
                                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                                        <form method="POST" action="shoes">
                                            <input type="hidden" name="action" value="filter">
                                            <input type="hidden" name="brandCheck" value="${brandCheck}">
                                            <input type="hidden" name="page" value="${i}">
                                            <button type="submit" class="page-link">${i}</button>
                                        </form>
                                    </li>
                                </c:forEach>
                                <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                    <form method="POST" action="shoes">
                                        <input type="hidden" name="action" value="filter">
                                        <input type="hidden" name="brandCheck" value="${brandCheck}">
                                        <input type="hidden" name="page" value="${currentPage + 1}">
                                        <button type="submit" class="page-link">&raquo;</button>
                                    </form>
                                </li>
                            </ul>
                        </nav>
                    </c:if>    
                </div>

            </div>
            <!-- Content End -->


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