<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shoes Dashboard - Fashion Store</title>

        <!-- Google Fonts & Icons -->
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets2/img/favicon.ico" rel="icon">

        <!-- Custom CSS -->
        <style>
            :root{
                --brand:#0d6efd;
                --bg:#f5f7fb;
            }
            html,body{
                height:100%;
            }
            body{
                font-family:'Heebo',sans-serif;
                background-color:var(--bg);
            }
            .container-xxl{
                min-height:100%;
            }
            /* Sidebar */
            .sidebar{
                width:260px;
                min-height:100vh;
                background:#fff;
                box-shadow:0 0 20px rgba(0,0,0,0.06);
                position:sticky;
                top:0;
            }
            .sidebar .nav-link{
                color:#333;
                font-weight:500;
                border-radius:10px;
                margin:2px 8px;
            }
            .sidebar .nav-link.active,.sidebar .nav-link:hover{
                color:var(--brand);
                background:#eef5ff;
            }
            /* Content card */
            .content{
                flex:1;
                padding:24px;
            }
            .card{
                border:none;
                border-radius:14px;
                box-shadow:0 8px 24px rgba(15,23,42,0.06);
            }
            /* Table (header sticky) */
            .table thead th{
                background:var(--brand);
                color:#fff;
                font-size:.85rem;
                text-transform:uppercase;
                letter-spacing:.04em;
                position:sticky;
                top:0;
                z-index:1;
            }
            .table tbody tr:hover{
                background:#f8fbff;
            }
            .table td{
                vertical-align:middle;
            }
            /* Badges */
            .badge-soft{
                background:#eef5ff;
                color:#0a58ca;
                border:1px solid #d7e8ff;
            }
            .badge-gender{
                background:#f1f1f1;
                border:1px solid #e6e6e6;
                color:#333;
            }
            /* Pagination */
            .pagination .page-link{
                border-radius:50%;
                color:var(--brand);
                border:none
            }
            .pagination .page-item.active .page-link{
                background:var(--brand);
                color:#fff;
            }
            /* Search area */
            .search-container{
                display:flex;
                gap:10px;
                align-items:center
            }
            .search-container .form-control{
                flex:1
            }
            /* Empty state */
            .empty{
                text-align:center;
                padding:48px 16px;
                color:#6b7280
            }
            .empty i{
                font-size:40px;
                color:#9ca3af
            }
            /* Modal */
            .modal-content{
                border-radius:12px;
            }
            .form-label{
                font-weight:600;
            }
            .form-control:focus,.form-select:focus{
                border-color:var(--brand);
                box-shadow:0 0 0 .25rem rgba(13,110,253,.25);
            }
            /* Action buttons */
            .btn-icon{
                display:inline-flex;
                align-items:center;
                gap:6px
            }

            /* ====== S?a ?? b?ng luôn v?a ngang, KHÔNG cu?n ngang ====== */
            /* Wrapper ch? cu?n d?c, ch?n cu?n ngang */
            .table-wrap{
                max-height: 65vh;     /* gi? cu?n d?c n?u nhi?u dòng */
                overflow-y: auto;
                overflow-x: hidden;   /* NG?N cu?n ngang */
            }
            /* Ép b?ng fit ngang màn hình, c?t chia theo không gian s?n có */
            .table-fit{
                width: 100%;
                table-layout: fixed;  /* không n? theo n?i dung, giúp luôn v?a ngang */
            }
            /* Cho phép n?i dung ô xu?ng dòng/ng?t t? ?? không tràn ngang */
            .table-fit th,
            .table-fit td{
                white-space: normal !important;
                overflow-wrap: anywhere;
                word-break: break-word;
            }
            /* N?u tr??c ?ây mô t? b? clamp 1 dòng + ... => m? ?? xu?ng dòng ??y ?? */
            .desc-clamp{
                max-width: none;
                white-space: normal !important;
                overflow: visible;
                text-overflow: clip;
            }
        </style>
    </head>

    <body>
        <div class="container-xxl d-flex p-0">
            <!-- Sidebar -->
            <div class="sidebar pe-4 pb-3">
                <nav class="navbar bg-light navbar-light">
                    <div class="d-flex align-items-center ms-4 mb-4" style="margin-top:50px;">
                        <div class="position-relative">
                            <img class="rounded-circle" src="${pageContext.request.contextPath}/assets2/img/user.jpg" alt="" style="width:44px;height:44px;">
                            <span class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></span>
                        </div>
                        <div class="ms-3">
                            <h6 class="mb-0">${user.getUser_Name()}</h6>
                            <small class="text-muted">${user.getRole()}</small>
                        </div>
                    </div>

                    <div class="navbar-nav w-100">
                        <!-- Fashion Store -->
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <i class="fas fa-shoe-prints me-2"></i>Fashion Store
                            </a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="shoes" class="dropdown-item ps-5">List Shoes</a>
                            </div>
                        </div>

                        <!-- Category -->
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

                        <!-- Admin only -->
                        <c:if test="${user.getRole() eq 'Admin'}">
                            <a href="useru" class="nav-item nav-link"><i class="fa fa-users me-2"></i>User List</a>
                        </c:if>
                        <a href="customer-list" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Customer List</a>

                        <a href="order" class="nav-item nav-link"><i class="fa fa-bag-shopping me-2"></i>Order List</a>
                        <a href="logout" class="nav-item nav-link"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
                    </div>
                </nav>
            </div>

            <!-- Content -->
            <div class="content">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-wrap justify-content-between align-items-center mb-4 gap-2">
                            <h5 class="card-title mb-0">Shoes List</h5>
                            <button class="btn btn-success btn-icon" data-bs-toggle="modal" data-bs-target="#modaladd">
                                <i class="fas fa-plus"></i> Add Shoes
                            </button>
                        </div>

                        <!-- Search & Filter -->
                        <div class="row g-3 mb-4">
                            <div class="col-md-6">
                                <form action="shoes" method="post" class="search-container">
                                    <input type="hidden" name="action" value="searchname">
                                    <input type="text" class="form-control" name="nameSearch" placeholder="Search by name..." value="${fn:escapeXml(nameSearch)}">
                                    <button class="btn btn-primary" title="Search"><i class="fas fa-search"></i></button>
                                </form>
                            </div>
                            <div class="col-md-6">
                                <form action="shoes" method="post" class="search-container">
                                    <input type="hidden" name="action" value="filter">
                                    <select class="form-select" name="brandCheck">
                                        <c:forEach items="${listCategory}" var="cat">
                                            <option value="${cat.getCategoryID()}" <c:if test="${cat.getCategoryID() == brandCheck}">selected</c:if>>
                                                ${cat.getCategoryName()}
                                            </option>
                                        </c:forEach>
                                    </select>
                                    <button class="btn btn-primary" title="Filter"><i class="fas fa-filter"></i></button>
                                    <a href="shoes" class="btn btn-outline-secondary" title="Reset"><i class="bi bi-arrow-counterclockwise"></i></a>
                                </form>
                            </div>
                        </div>

                        <!-- Table (KHÔNG cu?n ngang) -->
                        <div class="table-wrap">
                            <table class="table table-hover table-bordered align-middle table-fit">
                                <thead class="position-sticky top-0">
                                    <tr>
                                        <th style="min-width:200px;">Name</th>
                                        <th style="min-width:140px;">Category</th>
                                        <th style="min-width:120px;">Price</th>
                                        <th style="min-width:120px;">Gender</th>
                                        <th>Description</th>
                                        <th style="min-width:140px;">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${not empty listProduct}">
                                            <c:forEach items="${listProduct}" var="product">
                                                <tr>
                                                    <td class="fw-semibold">${product.getProductName()}</td>

                                                    <!-- Category badge -->
                                                    <td>
                                                        <c:set var="catName" value="-" />
                                                        <c:forEach items="${listCategory}" var="cat">
                                                            <c:if test="${cat.getCategoryID() == product.getCategoryID()}">
                                                                <c:set var="catName" value="${cat.getCategoryName()}" />
                                                            </c:if>
                                                        </c:forEach>
                                                        <span class="badge badge-soft">${catName}</span>
                                                    </td>

                                                    <!-- Price formatted -->
                                                    <td>
                                                        <fmt:formatNumber value="${product.getPrice()}" type="currency" currencySymbol="$" maxFractionDigits="2"/>
                                                    </td>

                                                    <!-- Gender badge -->
                                                    <td>
                                                        <span class="badge badge-gender">
                                                            <i class="bi bi-gender-ambiguous me-1"></i>${product.getGender()}
                                                        </span>
                                                    </td>

                                                    <!-- Description (cho phép xu?ng dòng, v?n có tooltip) -->
                                                    <td>
                                                        <span class="desc-clamp" data-bs-toggle="tooltip" data-bs-title="${fn:escapeXml(product.getDescription())}">
                                                            ${product.getDescription()}
                                                        </span>
                                                    </td>

                                                    <!-- Actions -->
                                                    <td>
                                                        <button
                                                            class="btn btn-primary btn-sm btn-icon btn-edit me-2"
                                                            data-bs-toggle="modal" data-bs-target="#modaledit"
                                                            data-id="${product.getProductID()}"
                                                            data-name="${fn:escapeXml(product.getProductName())}"
                                                            data-category="${product.getCategoryID()}"
                                                            data-price="${product.getPrice()}"
                                                            data-gender="${product.getGender()}"
                                                            data-description="${fn:escapeXml(product.getDescription())}">
                                                            <i class="fas fa-edit"></i> Edit
                                                        </button>

                                                        <form action="shoes" method="post" class="d-inline"
                                                              onsubmit="return confirm('Are you sure to delete this item?');">
                                                            <input type="hidden" name="action" value="delete">
                                                            <input type="hidden" name="idtodel" value="${product.getProductID()}">
                                                            <button type="submit" class="btn btn-danger btn-sm btn-icon">
                                                                <i class="fas fa-trash"></i> Delete
                                                            </button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="6">
                                                    <div class="empty">
                                                        <i class="bi bi-card-list mb-2"></i>
                                                        <div class="mt-2">No shoes found. Try another search or add a new one.</div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>
                        </div>

                        <!-- Pagination (preserve filters) -->
                        <nav class="d-flex justify-content-center mt-4">
                            <ul class="pagination">
                                <c:forEach var="i" begin="1" end="${totalPages}">
                                    <c:url var="pageUrl" value="shoes">
                                        <c:param name="page" value="${i}" />
                                        <c:if test="${not empty nameSearch}">
                                            <c:param name="nameSearch" value="${nameSearch}" />
                                        </c:if>
                                        <c:if test="${not empty brandCheck}">
                                            <c:param name="brandCheck" value="${brandCheck}" />
                                        </c:if>
                                    </c:url>
                                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                                        <a class="page-link" href="${pageUrl}">${i}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>

            <!-- Add Modal -->
            <div class="modal fade" id="modaladd" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <form action="shoes" method="post">
                            <div class="modal-header">
                                <h5 class="modal-title">Add Shoes</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <input type="hidden" name="action" value="add">

                                <div class="mb-3">
                                    <label class="form-label">Name</label>
                                    <input type="text" class="form-control" name="shoesname" required minlength="2" maxlength="120">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Category</label>
                                    <select class="form-select" name="shoescategory" required>
                                        <c:forEach items="${listCategory}" var="cat">
                                            <option value="${cat.getCategoryID()}">${cat.getCategoryName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Price</label>
                                    <input type="number" step="0.01" min="0" class="form-control" name="shoesprice" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Gender</label>
                                    <select class="form-select" name="shoesgender" required>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                        <option value="Unisex">Unisex</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Description</label>
                                    <textarea class="form-control" name="shoesdescription" rows="3" required minlength="10" maxlength="500"></textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                                <button class="btn btn-primary" type="submit">Add Shoes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Edit Modal -->
            <div class="modal fade" id="modaledit" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <form action="shoes" method="post">
                            <div class="modal-header">
                                <h5 class="modal-title">Edit Shoes</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" id="editId" name="id">

                                <div class="mb-3">
                                    <label class="form-label">Name</label>
                                    <input type="text" class="form-control" id="editName" name="shoesname" required minlength="2" maxlength="120">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Category</label>
                                    <select class="form-select" id="editCategory" name="shoescategory" required></select>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Price</label>
                                    <input type="number" step="0.01" min="0" class="form-control" id="editPrice" name="shoesprice" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Gender</label>
                                    <select class="form-select" id="editGender" name="shoesgender" required>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                        <option value="Unisex">Unisex</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Description</label>
                                    <textarea class="form-control" id="editDescription" name="shoesdescription" rows="3" required minlength="10" maxlength="500"></textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                                <button class="btn btn-primary" type="submit">Save Changes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Scripts -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <!-- T?o m?ng listCategory h?p l? cho JS -->
        <script>
                                                                  const listCategory = [
            <c:forEach items="${listCategory}" var="cat" varStatus="st">
                                                                  { id: ${cat.getCategoryID()}, name: "${fn:escapeXml(cat.getCategoryName())}" }<c:if test="${!st.last}">,</c:if>
            </c:forEach>
                                                                  ];
        </script>

        <script>
            // Enable tooltips
            const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
            tooltipTriggerList.forEach(el => new bootstrap.Tooltip(el));

            // Fill edit modal
            document.querySelectorAll('.btn-edit').forEach(btn => {
                btn.addEventListener('click', function () {
                    const id = this.dataset.id;
                    const name = this.dataset.name;
                    const price = this.dataset.price;
                    const gender = this.dataset.gender;
                    const description = this.dataset.description;
                    const category = this.dataset.category;

                    document.getElementById('editId').value = id;
                    document.getElementById('editName').value = name;
                    document.getElementById('editPrice').value = price;
                    document.getElementById('editGender').value = gender;
                    document.getElementById('editDescription').value = description;

                    const editCat = document.getElementById('editCategory');
                    editCat.innerHTML = '';
                    listCategory.forEach(c => {
                        const opt = document.createElement('option');
                        opt.value = c.id;
                        opt.textContent = c.name;
                        if (String(c.id) === String(category))
                            opt.selected = true;
                        editCat.appendChild(opt);
                    });
                });
            });
        </script>
    </body>
</html>
