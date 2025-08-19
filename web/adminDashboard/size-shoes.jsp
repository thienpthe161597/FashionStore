<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="${pageContext.request.contextPath}/assets2/img/favicon.ico" rel="icon">
    <title>Shoe Size Management</title>

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

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
    <div class="container-xxl position-relative bg-white d-flex p-0">

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
                        <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown"><i class="fas fa-shoe-prints me-2"></i>Shoes</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="shoes" class="dropdown-item" style="margin-left: 50px">List Shoes</a>
                            <a href="shoesimage" class="dropdown-item" style="margin-left: 50px">Shoe Images</a>
                            <a href="shoesvariant" class="dropdown-item" style="margin-left: 50px">Shoe Variants</a>
                            <a href="shoessize" class="dropdown-item" style="margin-left: 50px">Shoe Sizes</a>
                        </div>
                    </div>

                    <a href="brand" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Categories</a>
                    <a href="logout" class="nav-item nav-link"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
                </div>

            </nav>
        </div>
        <!-- Sidebar End -->

        <!-- Main Content -->
        <div class="content flex-grow-1 p-4">
            <h3 class="mb-4">Shoe Size Management</h3>

            <!-- Flash message -->
            <c:if test="${not empty sessionScope.msg}">
                <div class="alert alert-success">${sessionScope.msg}</div>
                <c:remove var="msg" scope="session"/>
            </c:if>
            <c:if test="${not empty sessionScope.err}">
                <div class="alert alert-danger">${sessionScope.err}</div>
                <c:remove var="err" scope="session"/>
            </c:if>

            <!-- Validation errors -->
            <c:if test="${not empty errors}">
                <div class="alert alert-danger">
                    <ul class="mb-0">
                        <c:forEach items="${errors}" var="e">
                            <li>${e}</li>
                        </c:forEach>
                    </ul>
                </div>
            </c:if>

            <!-- Add Button -->
            <button class="btn btn-success mb-3" data-bs-toggle="modal" data-bs-target="#modalAdd">Add Size</button>

            <!-- Data Table -->
            <div class="table-responsive">
                <table class="table table-bordered align-middle">
                    <thead class="table-light">
                        <tr>
                            <th style="width: 80px;">No.</th>
                            <th>Size</th>
                            <th style="width: 280px;">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listSize}" var="s" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td>${s.sizeValue}</td>
                                <td>
                                    <!-- Edit button -->
                                    <button type="button"
                                            class="btn btn-primary btn-sm me-2 edit-btn"
                                            data-id="${s.sizeId}"
                                            data-value="${s.sizeValue}"
                                            data-bs-toggle="modal"
                                            data-bs-target="#modalEdit">
                                        Edit
                                    </button>

                                    <!-- Delete -->
                                    <form action="${pageContext.request.contextPath}/shoessize" method="post" style="display:inline">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="id" value="${s.sizeId}">
                                        <button type="submit" class="btn btn-danger btn-sm"
                                                onclick="return confirm('Are you sure you want to delete this size?')">
                                            Delete
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Modal Add -->
        <div class="modal fade" id="modalAdd" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <form action="${pageContext.request.contextPath}/shoessize" method="post" class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add Size</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="action" value="add">
                        <label class="form-label">Size (e.g., 36 or 36.5)</label>
                        <input type="number"
                               class="form-control"
                               name="sizeValue"
                               step="0.5" min="1" max="60"
                               value="${lastSizeValue != null ? lastSizeValue : ''}"
                               required>
                        <div class="form-text">Only allow integers or .5 (e.g., 9, 9.5, 36, 36.5). Max 10 characters.</div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button class="btn btn-success" type="submit">Add</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Modal Edit -->
        <div class="modal fade" id="modalEdit" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <form action="${pageContext.request.contextPath}/shoessize" method="post" class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Size</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="action" value="edit">
                        <input type="hidden" name="id" id="sizeId">
                        <label class="form-label">Size (e.g., 36 or 36.5)</label>
                        <input type="number"
                               class="form-control"
                               name="sizeValue"
                               id="sizeValue"
                               step="0.5" min="1" max="60"
                               required>
                        <div class="form-text">Only allow integers or .5. Max 10 characters.</div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button class="btn btn-primary" type="submit">Save</button>
                    </div>
                </form>
            </div>
        </div>

    </div> <!-- container-xxl -->

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.querySelectorAll(".edit-btn").forEach(btn => {
                btn.addEventListener("click", function () {
                    document.getElementById("sizeId").value = this.getAttribute("data-id");
                    document.getElementById("sizeValue").value = this.getAttribute("data-value");
                });
            });
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
