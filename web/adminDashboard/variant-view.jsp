<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Variant Dashboard - Fashion Store</title>

    <!-- Google Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets2/img/favicon.ico" rel="icon">


    <!-- Custom CSS -->
    <style>
        body { font-family: 'Heebo', sans-serif; background-color: #f8f9fa; }
        .sidebar { background-color: #fff; box-shadow: 0 0 20px rgba(0,0,0,0.1); }
        .sidebar .nav-link { color: #333; font-weight: 500; }
        .sidebar .nav-link.active, .sidebar .nav-link:hover { color: #0d6efd; background-color: #f0f6ff; }
        .content { background-color: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 0 20px rgba(0,0,0,0.05); }
        .card { border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); border: none; }
        .table thead th { background-color: #0d6efd; color: #fff; font-size: 0.85rem; text-transform: uppercase; }
        .table tbody tr:hover { background-color: #f8f9fa; }
        .btn-primary { background-color: #0d6efd; border: none; }
        .btn-primary:hover { background-color: #0a58ca; }
        .btn-danger:hover { background-color: #bb2d3b; }
        .pagination .page-link { border-radius: 50%; color: #0d6efd; }
        .pagination .page-item.active .page-link { background-color: #0d6efd; color: #fff; }
        .modal-content { border-radius: 8px; }
        .form-label { font-weight: 500; }
        .form-control:focus { border-color: #0d6efd; box-shadow: 0 0 0 0.25rem rgba(13,110,253,0.25); }
        .search-container { display: flex; gap: 10px; align-items: center; }
        .search-container .form-control { flex: 1; }
    </style>
</head>

<body>
<div class="container-xxl d-flex p-0">
   <!-- Sidebar Start -->
<div class="sidebar pe-4 pb-3">
    <nav class="navbar bg-light navbar-light">
        <!-- User Info -->
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
            <!-- Fashion Store Dropdown -->
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                    <i class="fas fa-shoe-prints me-2"></i>Fashion Store
                </a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a href="shoes" class="dropdown-item ps-5">List Shoes</a>
                </div>
            </div>

            <!-- Category Dropdown -->
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                    <i class="fa fa-th me-2"></i>Category
                </a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a href="brand" class="dropdown-item ps-5">Brand</a>
                    <a href="shoesimage" class="dropdown-item ps-5">Image Shoes</a>
                    <a href="shoesvariant" class="dropdown-item ps-5">Variant Shoes</a>
                    <a href="shoessize" class="dropdown-item ps-5">Shoe Sizes</a>
                </div>
            </div>

            <!-- Admin Only -->
            <c:if test="${user.getRole() eq 'Admin'}">
                <a href="userlist" class="nav-item nav-link"><i class="fa fa-th me-2"></i>User List</a>
            </c:if>

            <!-- Customer List -->
            <a href="customer-list" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Customer List</a>

            <!-- Orders -->
            <a href="order" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Order List</a>

            <!-- Logout -->
            <a href="logout" class="nav-item nav-link"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
        </div>
    </nav>
</div>

    <!-- Content -->
    <div class="content flex-grow-1 p-4">
        <div class="card">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h5 class="card-title mb-0">Shoes Variants</h5>
                    <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modaladd">
                        <i class="fas fa-plus me-2"></i>Add Variant
                    </button>
                </div>

                <!-- Search -->
                <div class="row mb-4">
                    <div class="col-md-6">
                        <form action="shoesvariant" method="get" class="search-container">
                            <input type="text" name="search" class="form-control" placeholder="Search by name, color, size..." value="${param.search}">
                            <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i></button>
                        </form>
                    </div>
                </div>

                <!-- Table -->
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Product Name</th>
                                <th>Color</th>
                                <th>Size</th>
                                <th>Quantity</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listProductVariant}" var="variant">
                            <tr>
                                <c:forEach items="${listProduct}" var="product">
                                    <c:if test="${product.getProductID() == variant.getProduct_id()}">
                                        <td>${product.getProductName()}</td>
                                    </c:if>
                                </c:forEach>
                                <td>${variant.getColor()}</td>
                                <td>${variant.getSizeValue()}</td>
                                <td>${variant.getQuantity()}</td>
                                <td>
                                    <button class="btn btn-primary btn-sm btn-edit me-2"
                                            data-bs-toggle="modal" data-bs-target="#modaledit"
                                            data-id="${variant.getPv_id()}"
                                            data-color="${variant.getColor()}"
                                            data-size="${variant.getSizeValue()}"
                                            data-quantity="${variant.getQuantity()}"
                                            data-productid="${variant.getProduct_id()}">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <form action="shoesvariant" method="post" style="display:inline;" onsubmit="return confirm('Are you sure?')">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="id" value="${variant.getPv_id()}">
                                        <button type="submit" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></button>
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
                        <c:forEach var="i" begin="1" end="${totalPages}">
                            <li class="page-item ${i == currentPage ? 'active' : ''}">
                                <a class="page-link" href="shoesvariant?page=${i}">${i}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

    <!-- Add Modal -->
    <div class="modal fade" id="modaladd" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <form action="shoesvariant" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title">Add Variant</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="action" value="add">
                        <div class="mb-3">
                            <label class="form-label">Color</label>
                            <input type="text" class="form-control" name="color" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Size</label>
                            <input type="number" class="form-control" name="size" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Quantity</label>
                            <input type="number" class="form-control" name="quantity" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Product</label>
                            <select class="form-select" name="shoesvariantname">
                                <c:forEach items="${listProduct}" var="product">
                                    <option value="${product.getProductID()}">${product.getProductName()}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button class="btn btn-primary" type="submit">Add Variant</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Edit Modal -->
    <div class="modal fade" id="modaledit" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <form action="shoesvariant" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Variant</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="action" value="edit">
                        <input type="hidden" id="editId" name="id">
                        <div class="mb-3">
                            <label class="form-label">Color</label>
                            <input type="text" class="form-control" id="editColor" name="color" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Size</label>
                            <input type="number" class="form-control" id="editSize" name="size" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Quantity</label>
                            <input type="number" class="form-control" id="editQuantity" name="quantity" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Product</label>
                            <select class="form-select" id="editProduct" name="shoesvariantname">
                                <c:forEach items="${listProduct}" var="product">
                                    <option value="${product.getProductID()}">${product.getProductName()}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button class="btn btn-primary" type="submit">Save Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Edit Modal populate
    document.querySelectorAll('.btn-edit').forEach(btn => {
        btn.addEventListener('click', function() {
            document.getElementById('editId').value = this.dataset.id;
            document.getElementById('editColor').value = this.dataset.color;
            document.getElementById('editSize').value = this.dataset.size;
            document.getElementById('editQuantity').value = this.dataset.quantity;
            document.getElementById('editProduct').value = this.dataset.productid;
        });
    });
</script>
</body>
</html>
