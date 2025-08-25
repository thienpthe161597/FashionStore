<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shoes Dashboard - Fashion Store</title>

    <!-- Favicon -->
    <link href="${pageContext.request.contextPath}/assets2/img/favicon.ico" rel="icon">

    <!-- Google Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        :root{ --brand:#0d6efd; --bg:#f5f7fb; }
        html,body{ height:100%; }
        body{ font-family:'Heebo',sans-serif; background-color:var(--bg); }
        .container-xxl{ min-height:100%; }

        /* Sidebar */
        .sidebar{ width:260px; min-height:100vh; background:#fff; box-shadow:0 0 20px rgba(0,0,0,0.06); position:sticky; top:0; }
        .sidebar .nav-link{ color:#333; font-weight:500; border-radius:10px; margin:2px 8px; }
        .sidebar .nav-link.active,.sidebar .nav-link:hover{ color:var(--brand); background:#eef5ff; }

        /* Content */
        .content{ flex:1; padding:24px; }
        .card{ border:none; border-radius:14px; box-shadow:0 8px 24px rgba(15,23,42,0.06); }

        /* Table (header sticky) */
        .table thead th{ background:var(--brand); color:#fff; font-size:.85rem; text-transform:uppercase; letter-spacing:.04em; position:sticky; top:0; z-index:1; }
        .table tbody tr:hover{ background:#f8fbff; }
        .table td{ vertical-align:middle; }

        /* Badges */
        .badge-soft{ background:#eef5ff; color:#0a58ca; border:1px solid #d7e8ff; }
        .badge-gender{ background:#f1f1f1; border:1px solid #e6e6e6; color:#333; }

        /* Pagination */
        .pagination{ justify-content:center; margin-top:20px; }
        .pagination .page-link{ border-radius:50%; color:var(--brand); border:none; }
        .pagination .page-item.active .page-link{ background:var(--brand); color:#fff; }

        /* Search area */
        .search-filter-container{ background:#f8f9fa; padding:20px; border-radius:8px; margin-bottom:20px; box-shadow:0 2px 8px rgba(0,0,0,0.05); }

        /* Empty state */
        .empty{ text-align:center; padding:48px 16px; color:#6b7280; }
        .empty i{ font-size:40px; color:#9ca3af; }

        /* Modal */
        .modal-content{ border-radius:12px; }
        .form-label{ font-weight:600; }
        .form-control:focus,.form-select:focus{ border-color:var(--brand); box-shadow:0 0 0 .25rem rgba(13,110,253,.25); }

        /* Action buttons */
        .btn-icon{ display:inline-flex; align-items:center; gap:6px; }

        /* Gallery */
        .thumbnail-container{ display:flex; flex-wrap:wrap; gap:10px; justify-content:center; margin-top:10px; }
        .thumbnail{ width:60px; height:60px; object-fit:cover; border:1px solid #ddd; border-radius:4px; cursor:pointer; transition:transform .2s, box-shadow .2s; }
        .thumbnail:hover{ transform:scale(1.1); box-shadow:0 4px 8px rgba(0,0,0,0.1); }
        .main-image{ width:100%; height:250px; object-fit:cover; border-bottom:1px solid #ddd; border-radius:4px 4px 0 0; }
        .card{ border:none; box-shadow:0 4px 12px rgba(0,0,0,0.1); transition:box-shadow .3s; border-radius:8px; overflow:hidden; }
        .card:hover{ box-shadow:0 6px 16px rgba(0,0,0,0.15); }
        .card-body{ padding:15px; text-align:center; }
        .card-title{ font-size:1.1rem; margin-bottom:8px; color:#333; }
        .btn-group .btn{ margin:5px; }
    </style>
</head>

<body>
<%
    String loginMessage = (String) request.getAttribute("loginMessage");
    if (loginMessage != null) {
%>
<script>
    window.onload = function(){ alert('<%= loginMessage %>'); };
</script>
<% } %>

<div class="container-xxl position-relative bg-white d-flex p-0">
    <!-- Spinner -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width:3rem;height:3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>

    <!-- Sidebar -->
    <div class="sidebar pe-4 pb-3">
        <nav class="navbar bg-light navbar-light">
            <div class="d-flex align-items-center ms-4 mb-4" style="margin-top:50px">
                <div class="position-relative">
                    <img class="rounded-circle" src="${pageContext.request.contextPath}/assets2/img/user.jpg" alt="" style="width:40px;height:40px;">
                    <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                </div>
                <div class="ms-3">
                    <h6 class="mb-0">${user.getUser_Name()}</h6>
                    <span>${user.getRole()}</span>
                </div>
            </div>

            <div class="navbar-nav w-100">
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <i class="fas fa-shoe-prints me-2"></i>Fashion Store
                    </a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="shoes" class="dropdown-item ps-5">List Shoes</a>
                    </div>
                </div>

                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <i class="fa fa-th me-2"></i>Category
                    </a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="brand" class="dropdown-item ps-5">category</a>
                        <a href="shoesimage" class="dropdown-item ps-5">Image Shoes</a>
                        <a href="shoesvariant" class="dropdown-item ps-5">Variant Shoes</a>
                        <a href="shoessize" class="dropdown-item ps-5">Shoe Sizes</a>
                    </div>
                </div>

                <c:if test="${user.getRole() eq 'Admin'}">
                    <a href="userlist" class="nav-item nav-link"><i class="fa fa-th me-2"></i>User List</a>
                </c:if>

                <a href="customer-list" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Customer List</a>
                <a href="order" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Order List</a>
                <a href="logout" class="nav-item nav-link"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
            </div>
        </nav>
    </div>
    <!-- End Sidebar -->

    <!-- Content -->
    <div class="content">
        <!-- Search/Filter/Sort -->
        <div class="container-fluid pt-4 px-4">
            <div class="search-filter-container">
                <form action="shoesimage" method="get" class="row g-3" id="filterForm">
                    <!-- Search by name -->
                    <div class="col-md-3">
                        <label for="productName" class="form-label">Product Name</label>
                        <input type="text" class="form-control" id="productName" name="productName"
                               placeholder="Search by name" value="${fn:escapeXml(param.productName)}">
                    </div>

                    <!-- Filter by color -->
                    <div class="col-md-3">
                        <label for="color" class="form-label">Color</label>
                        <input type="text" class="form-control" id="color" name="color"
                               placeholder="Filter by color" value="${fn:escapeXml(param.color)}">
                    </div>

                    <!-- Sort -->
                    <div class="col-md-3">
                        <label for="sort" class="form-label">Sort</label>
                        <select id="sort" name="sort" class="form-select">
                            <option value="">Default</option>
                            <option value="name_asc"     ${param.sort == 'name_asc'     ? 'selected' : ''}>Name ↑</option>
                            <option value="name_desc"    ${param.sort == 'name_desc'    ? 'selected' : ''}>Name ↓</option>
                            <option value="color_asc"    ${param.sort == 'color_asc'    ? 'selected' : ''}>Color ↑</option>
                            <option value="color_desc"   ${param.sort == 'color_desc'   ? 'selected' : ''}>Color ↓</option>
                            <option value="created_desc" ${param.sort == 'created_desc' ? 'selected' : ''}>Newest</option>
                        </select>
                    </div>

                    <!-- Items per page -->
                    <div class="col-md-3">
                        <label for="pageSize" class="form-label">Items per page</label>
                        <c:set var="resolvedPageSize" value="${empty param.pageSize ? (empty pageSize ? 12 : pageSize) : param.pageSize}" />
                        <select id="pageSize" name="pageSize" class="form-select">
                            <option value="6"  ${resolvedPageSize == 6  ? 'selected' : ''}>6</option>
                            <option value="12" ${resolvedPageSize == 12 ? 'selected' : ''}>12</option>
                            <option value="24" ${resolvedPageSize == 24 ? 'selected' : ''}>24</option>
                            <option value="36" ${resolvedPageSize == 36 ? 'selected' : ''}>36</option>
                        </select>
                    </div>

                    <div class="col-md-12 d-flex justify-content-end gap-2">
                        <a href="shoesimage?pageSize=${resolvedPageSize}" class="btn btn-secondary">Reset</a>
                        <button type="submit" class="btn btn-primary">Apply</button>
                    </div>

                    <!-- Về trang 1 khi apply -->
                    <input type="hidden" name="page" value="1">
                </form>

                <!-- Summary -->
                <c:if test="${not empty totalItems}">
                    <div class="mt-2 text-muted">
                        <c:set var="pageSz" value="${empty pageSize ? resolvedPageSize : pageSize}" />
                        <c:set var="startIndex" value="${(currentPage-1) * pageSz + 1}" />
                        <c:set var="endIndex"   value="${currentPage * pageSz}" />
                        <c:if test="${endIndex gt totalItems}">
                            <c:set var="endIndex" value="${totalItems}" />
                        </c:if>
                        <small>
                            Showing <strong>${startIndex}</strong>–<strong>${endIndex}</strong> of
                            <strong>${totalItems}</strong> items
                        </small>
                    </div>
                </c:if>
            </div>
        </div>

        <!-- Grid -->
        <div class="container-fluid px-4">
            <c:choose>
                <c:when test="${empty listVariant}">
                    <div class="empty">
                        <i class="bi bi-card-image d-block mb-3"></i>
                        No data found. Try adjusting your filters.
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="row g-4">
                        <c:forEach items="${listVariant}" var="listVariant">
                            <div class="col-md-4">
                                <div class="card">
                                    <!-- Main image -->
                                    <c:set var="hasMainImage" value="false" />
                                    <c:forEach items="${listImage}" var="listImage">
                                        <c:if test="${listVariant.getPv_id() == listImage.getPv_id() && hasMainImage == false}">
                                            <img src="${listImage.getImage_url()}" id="mainImg-${listVariant.getPv_id()}" class="main-image" alt="Main Image">
                                            <c:set var="hasMainImage" value="true" />
                                        </c:if>
                                    </c:forEach>

                                    <!-- Thumbnails -->
                                    <div class="thumbnail-container">
                                        <c:forEach items="${listImage}" var="listImage">
                                            <c:if test="${listVariant.getPv_id() == listImage.getPv_id()}">
                                                <c:if test="${listImage.getImage_url() ne 'assets/img/404.jpg'}">
                                                    <img class="thumbnail" src="${listImage.getImage_url()}"
                                                         onclick="changeImage('${fn:escapeXml(listImage.getImage_url())}', '${listVariant.getPv_id()}')">
                                                </c:if>
                                            </c:if>
                                        </c:forEach>
                                    </div>

                                    <!-- Info + Actions -->
                                    <div class="card-body">
                                        <c:forEach items="${listPro}" var="listPro">
                                            <c:if test="${listVariant.getProduct_id() == listPro.getProductID()}">
                                                <h5 class="card-title">Name: ${listPro.getProductName()}</h5>
                                            </c:if>
                                        </c:forEach>
                                        <h5 class="card-title">Color: ${listVariant.getColor()}</h5>

                                        <c:set var="hasValidImage" value="false" />
                                        <c:forEach items="${listImage}" var="listImage">
                                            <c:if test="${listVariant.getPv_id() == listImage.getPv_id()}">
                                                <c:if test="${listImage.getImage_url() ne 'assets/img/404.jpg'}">
                                                    <c:set var="hasValidImage" value="true" />
                                                </c:if>
                                            </c:if>
                                        </c:forEach>

                                        <div class="btn-group">
                                            <c:if test="${hasValidImage}">
                                                <form action="shoesimage" method="post" style="display:inline;">
                                                    <input type="hidden" name="pvid" value="${listVariant.getPv_id()}">
                                                    <input type="hidden" name="action" value="delete">
                                                    <input type="submit" value="Delete All Images" class="btn btn-danger">
                                                </form>
                                                <button data-pvid="${listVariant.getPv_id()}" type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#editModal">
                                                    Edit Images
                                                </button>
                                            </c:if>

                                            <c:if test="${not hasValidImage}">
                                                <button data-pvid="${listVariant.getPv_id()}" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                    Add Images
                                                </button>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <!-- Pagination -->
                    <c:if test="${totalPages gt 1}">
                        <c:set var="pageSz" value="${empty pageSize ? resolvedPageSize : pageSize}" />
                        <c:url var="baseUrl" value="shoesimage">
                            <c:param name="productName" value="${param.productName}" />
                            <c:param name="color"       value="${param.color}" />
                            <c:param name="sort"        value="${param.sort}" />
                            <c:param name="pageSize"    value="${pageSz}" />
                        </c:url>

                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <!-- First -->
                                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                    <a class="page-link" href="${baseUrl}&page=1" aria-label="First">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>

                                <!-- Prev -->
                                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                    <a class="page-link" href="${baseUrl}&page=${currentPage-1}">Previous</a>
                                </li>

                                <!-- Window ±2 -->
                                <c:set var="start" value="${currentPage-2 < 1 ? 1 : currentPage-2}" />
                                <c:set var="end"   value="${currentPage+2 > totalPages ? totalPages : currentPage+2}" />
                                <c:forEach begin="${start}" end="${end}" var="i">
                                    <li class="page-item ${currentPage == i ? 'active' : ''}">
                                        <a class="page-link" href="${baseUrl}&page=${i}">${i}</a>
                                    </li>
                                </c:forEach>

                                <!-- Next -->
                                <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                    <a class="page-link" href="${baseUrl}&page=${currentPage+1}">Next</a>
                                </li>

                                <!-- Last -->
                                <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                    <a class="page-link" href="${baseUrl}&page=${totalPages}" aria-label="Last">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </c:if>
                </c:otherwise>
            </c:choose>
        </div>
        <!-- End Grid -->
    </div>
    <!-- End Content -->

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>

<!-- Add Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add Images</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="shoesimage" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="mb-3">
                        <input type="hidden" id="pvidInput" name="pvid">
                        <input type="hidden" class="form-control" name="action" value="addimage">
                        <label for="imageA" class="form-label">Select Images:</label>
                        <input type="file" class="form-control" id="imageA" name="imageA" multiple>
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

<!-- Edit Modal -->
<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Edit Images</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="shoesimage" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="mb-3">
                        <input type="hidden" id="editPvidInput" name="pvid">
                        <input type="hidden" class="form-control" name="action" value="updateimage">
                        <label for="imageUpdate" class="form-label">Upload New Images (Replaces or Adds):</label>
                        <input type="file" class="form-control" id="imageUpdate" name="imageUpdate" multiple>
                        <!-- Có thể mở rộng: danh sách ảnh hiện có + checkbox để xoá từng ảnh -->
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <input type="submit" class="btn btn-primary" value="Update">
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Scripts -->
<script>
    function changeImage(src, variantId){
        document.getElementById("mainImg-" + variantId).src = src;
    }

    document.addEventListener("DOMContentLoaded", function () {
        // Modal Add
        let addModal = document.getElementById("exampleModal");
        addModal.addEventListener("show.bs.modal", function (event) {
            let button = event.relatedTarget;
            let pvid = button.getAttribute("data-pvid");
            document.getElementById("pvidInput").value = pvid;
        });

        // Modal Edit
        let editModal = document.getElementById("editModal");
        editModal.addEventListener("show.bs.modal", function (event) {
            let button = event.relatedTarget;
            let pvid = button.getAttribute("data-pvid");
            document.getElementById("editPvidInput").value = pvid;
        });

        // Auto submit khi đổi sort/pageSize
        const form = document.getElementById('filterForm');
        const pageHidden = form.querySelector('input[name="page"]');
        const sort = document.getElementById('sort');
        const pageSize = document.getElementById('pageSize');
        sort.addEventListener('change', () => { pageHidden.value = 1; form.submit(); });
        pageSize.addEventListener('change', () => { pageHidden.value = 1; form.submit(); });
    });
</script>

<!-- JS Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets2/lib/chart/chart.min.js"></script>
<script src="${pageContext.request.contextPath}/assets2/lib/easing/easing.min.js"></script>
<script src="${pageContext.request.contextPath}/assets2/lib/waypoints/waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/assets2/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/assets2/lib/tempusdominus/js/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/assets2/lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="${pageContext.request.contextPath}/assets2/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets2/js/main.js"></script>
</body>
</html>
