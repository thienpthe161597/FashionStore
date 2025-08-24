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
    <title>Dashboard Admin - Fashion Store</title>

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${pageContext.request.contextPath}/assets2/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets2/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath}/assets2/css/style.css" rel="stylesheet">

    <!-- Custom Styles for Professional Look -->
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Heebo', sans-serif;
        }
        .sidebar {
            background-color: #ffffff;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }
        .sidebar .navbar-nav .nav-link {
            color: #333;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        .sidebar .navbar-nav .nav-link:hover,
        .sidebar .navbar-nav .nav-link.active {
            color: #0d6efd;
            background-color: #f0f6ff;
        }
        .content {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);
        }
        .card {
            border: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .table {
            border-radius: 8px;
            overflow: hidden;
        }
        .table thead th {
            background-color: #0d6efd;
            color: white;
            text-transform: uppercase;
            font-size: 0.85rem;
        }
        .table tbody tr:hover {
            background-color: #f8f9fa;
        }
        .btn-primary {
            background-color: #0d6efd;
            border: none;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #0a58ca;
        }
        .btn-danger {
            transition: all 0.3s ease;
        }
        .btn-danger:hover {
            background-color: #bb2d3b;
        }
        .pagination .page-link {
            color: #0d6efd;
            border: none;
            margin: 0 5px;
            border-radius: 50%;
            transition: all 0.3s ease;
        }
        .pagination .page-item.active .page-link {
            background-color: #0d6efd;
            color: white;
        }
        .pagination .page-link:hover {
            background-color: #0d6efd;
            color: white;
        }
        .modal-content {
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
        }
        .modal-header {
            background-color: #f8f9fa;
            border-bottom: none;
        }
        .form-label {
            font-weight: 500;
            color: #333;
        }
        .form-control {
            border-radius: 5px;
            border: 1px solid #ced4da;
            transition: all 0.3s ease;
        }
        .form-control:focus {
            border-color: #0d6efd;
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
        }
        .search-container {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .search-container .form-control {
            flex: 1;
        }
    </style>
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
                        <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown"><i class="fas fa-shoe-prints me-2"></i>Fashion Store</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="shoes" class="dropdown-item" style="margin-left: 50px">List shoes</a>
                            <a href="shoesimage" class="dropdown-item" style="margin-left: 50px">Image shoes</a>
                            <a href="shoesvariant" class="dropdown-item" style="margin-left: 50px">Variant shoes</a>
                        </div>
                    </div>
                    <a href="brand" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Category</a>
                    <c:if test="${user.getRole() eq 'Admin'}">
                        <a href="useru" class="nav-item nav-link"><i class="fa fa-th me-2"></i>User List</a>
                    </c:if>
                    <a href="order" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Order List</a>
                    <a href="logout" class="nav-item nav-link"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->

        <!-- Content Start -->
        <div class="content flex-grow-1 p-4">
            <!-- Recent Sales Start -->
            <div class="card">
                <div class="card-body">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h5 class="card-title mb-0">Shoes List</h5>
                        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modaladd">
                            <i class="fas fa-plus me-2"></i>Add New Shoes
                        </button>
                    </div>

                    <div class="row mb-4">
                        <div class="col-md-6">
                            <form action="shoes" method="post" class="search-container">
                                <input type="hidden" name="action" value="searchname">
                                <label for="nameSearch" class="form-label me-2">Search by Name:</label>
                                <input name="nameSearch" type="text" class="form-control" placeholder="Enter name..." required>
                                <button type="submit" class="btn btn-primary ms-2"><i class="fas fa-search"></i></button>
                            </form>
                        </div>
                        <div class="col-md-6">
                            <form action="shoes" method="post" class="search-container">
                                <input type="hidden" name="action" value="filter">
                                <label for="brandCheck" class="form-label me-2">Filter by Brand:</label>
                                <select name="brandCheck" class="form-select">
                                    <c:forEach items="${listCategory}" var="listCategory">
                                        <option value="${listCategory.getCategoryID()}">${listCategory.getCategoryName()}</option>
                                    </c:forEach>
                                </select>
                                <button type="submit" class="btn btn-primary ms-2"><i class="fas fa-filter"></i></button>
                            </form>
                        </div>
                    </div>

                    <c:if test="${message != null}">
                        <div class="alert alert-success" role="alert">${message}</div>
                    </c:if>

                    <div class="table-responsive">
                        <table class="table table-hover table-bordered">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Category</th>
                                    <th>Price</th>
                                    <th>Gender</th>
                                    <th>Description</th>
                                    <th>Actions</th>
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
                                            <button type="button" class="btn btn-primary btn-sm btn-edit me-2"
                                                    data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                                                    data-id="${listProduct.getProductID()}"
                                                    data-name="${listProduct.getProductName()}"
                                                    data-category="${listProduct.getCategoryID()}"
                                                    data-price="${listProduct.getPrice()}"
                                                    data-gender="${listProduct.getGender()}"
                                                    data-description="${listProduct.getDescription()}">
                                                <i class="fas fa-edit"></i> Edit
                                            </button>
                                            <form action="shoes" method="post" style="display: inline;" onsubmit="return confirmDelete()">
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="idtodel" value="${listProduct.getProductID()}">
                                                <button type="submit" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i> Delete</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <!-- Pagination -->
                    <nav aria-label="Page navigation" class="d-flex justify-content-center mt-4">
                        <ul class="pagination">
                            <c:if test="${nameSearch == null && brandCheck == null}">
                                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                    <a class="page-link" href="shoes?page=${currentPage - 1}" aria-label="Previous">&laquo;</a>
                                </li>
                                <c:forEach var="i" begin="1" end="${totalPages}">
                                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                                        <a class="page-link" href="shoes?page=${i}">${i}</a>
                                    </li>
                                </c:forEach>
                                <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                    <a class="page-link" href="shoes?page=${currentPage + 1}" aria-label="Next">&raquo;</a>
                                </li>
                            </c:if>

                            <c:if test="${nameSearch != null && brandCheck == null}">
                                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                    <form method="POST" action="shoes" style="display: inline;">
                                        <input type="hidden" name="action" value="searchname">
                                        <input type="hidden" name="nameSearch" value="${nameSearch}">
                                        <input type="hidden" name="page" value="${currentPage - 1}">
                                        <button type="submit" class="page-link">&laquo;</button>
                                    </form>
                                </li>
                                <c:forEach var="i" begin="1" end="${totalPages}">
                                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                                        <form method="POST" action="shoes" style="display: inline;">
                                            <input type="hidden" name="action" value="searchname">
                                            <input type="hidden" name="nameSearch" value="${nameSearch}">
                                            <input type="hidden" name="page" value="${i}">
                                            <button type="submit" class="page-link">${i}</button>
                                        </form>
                                    </li>
                                </c:forEach>
                                <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                    <form method="POST" action="shoes" style="display: inline;">
                                        <input type="hidden" name="action" value="searchname">
                                        <input type="hidden" name="nameSearch" value="${nameSearch}">
                                        <input type="hidden" name="page" value="${currentPage + 1}">
                                        <button type="submit" class="page-link">&raquo;</button>
                                    </form>
                                </li>
                            </c:if>

                            <c:if test="${nameSearch == null && brandCheck != null}">
                                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                    <form method="POST" action="shoes" style="display: inline;">
                                        <input type="hidden" name="action" value="filter">
                                        <input type="hidden" name="brandCheck" value="${brandCheck}">
                                        <input type="hidden" name="page" value="${currentPage - 1}">
                                        <button type="submit" class="page-link">&laquo;</button>
                                    </form>
                                </li>
                                <c:forEach var="i" begin="1" end="${totalPages}">
                                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                                        <form method="POST" action="shoes" style="display: inline;">
                                            <input type="hidden" name="action" value="filter">
                                            <input type="hidden" name="brandCheck" value="${brandCheck}">
                                            <input type="hidden" name="page" value="${i}">
                                            <button type="submit" class="page-link">${i}</button>
                                        </form>
                                    </li>
                                </c:forEach>
                                <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                    <form method="POST" action="shoes" style="display: inline;">
                                        <input type="hidden" name="action" value="filter">
                                        <input type="hidden" name="brandCheck" value="${brandCheck}">
                                        <input type="hidden" name="page" value="${currentPage + 1}">
                                        <button type="submit" class="page-link">&raquo;</button>
                                    </form>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Content End -->

        <!-- Add Modal -->
        <div class="modal fade" id="modaladd" tabindex="-1" aria-labelledby="modaladdLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modaladdLabel">Add New Shoes</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="shoes" method="post">
                        <div class="modal-body">
                            <input type="hidden" name="action" value="add">
                            <div class="mb-3">
                                <label for="shoesname" class="form-label">Name</label>
                                <input type="text" class="form-control" id="shoesname" name="shoesname" required>
                            </div>
                            <div class="mb-3">
                                <label for="shoescategory" class="form-label">Category</label>
                                <select id="shoescategory" name="shoescategory" class="form-select" required>
                                    <c:forEach items="${listCategory}" var="listCategory">
                                        <option value="${listCategory.getCategoryID()}">${listCategory.getCategoryName()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="shoesprice" class="form-label">Price</label>
                                <input type="number" class="form-control" id="shoesprice" name="shoesprice" required>
                            </div>
                            <div class="mb-3">
                                <label for="shoesgender" class="form-label">Gender</label>
                                <select id="shoesgender" name="shoesgender" class="form-select" required>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="shoesdescription" class="form-label">Description</label>
                                <textarea class="form-control" id="shoesdescription" name="shoesdescription" rows="3" required minlength="10"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Add Shoes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Edit Modal -->
        <div class="modal fade" id="staticBackdrop" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Edit Shoes</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="shoes" method="post">
                        <div class="modal-body">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" id="editProductId" name="id">
                            <div class="mb-3">
                                <label for="editName" class="form-label">Name</label>
                                <input type="text" class="form-control" id="editName" name="shoesname" required>
                            </div>
                            <div class="mb-3">
                                <label for="editCategory" class="form-label">Category</label>
                                <select id="editCategory" name="shoescategory" class="form-select" required>
                                    <c:forEach items="${listCategory}" var="listCategory">
                                        <option value="${listCategory.getCategoryID()}">${listCategory.getCategoryName()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="editPrice" class="form-label">Price</label>
                                <input type="number" class="form-control" id="editPrice" name="shoesprice" required>
                            </div>
                            <div class="mb-3">
                                <label for="editGender" class="form-label">Gender</label>
                                <select id="editGender" name="shoesgender" class="form-select" required>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="editDescription" class="form-label">Description</label>
                                <textarea class="form-control" id="editDescription" name="shoesdescription" rows="3" required minlength="10"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets2/lib/chart/chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets2/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets2/lib/waypoints/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets2/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets2/lib/tempusdominus/js/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets2/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets2/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/assets2/js/main.js"></script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let editButtons = document.querySelectorAll(".btn-edit");
            editButtons.forEach(button => {
                button.addEventListener("click", function () {
                    let productId = this.getAttribute("data-id");
                    let productName = this.getAttribute("data-name");
                    let productCategory = this.getAttribute("data-category");
                    let productPrice = this.getAttribute("data-price");
                    let productGender = this.getAttribute("data-gender");
                    let productDescription = this.getAttribute("data-description");

                    document.getElementById("editProductId").value = productId;
                    document.getElementById("editName").value = productName;
                    document.getElementById("editCategory").value = productCategory;
                    document.getElementById("editPrice").value = productPrice;
                    document.getElementById("editGender").value = productGender;
                    document.getElementById("editDescription").value = productDescription;
                });
            });
        });

        function confirmDelete() {
            return confirm("Are you sure you want to delete this shoe?");
        }
    </script>
</body>

</html>