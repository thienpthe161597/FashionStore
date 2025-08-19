<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>User List</title>

    <!-- Favicon -->
    <link href="${pageContext.request.contextPath}/assets2/img/favicon.ico" rel="icon">

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
                    <img class="rounded-circle" src="${pageContext.request.contextPath}/assets2/img/user.jpg" 
                         alt="" style="width: 40px; height: 40px;">
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
                        <a href="shoes" class="dropdown-item" style="margin-left: 50px">List shoes</a>
                        <a href="shoesimage" class="dropdown-item" style="margin-left: 50px">Image shoes</a>
                        <a href="shoesvariant" class="dropdown-item" style="margin-left: 50px">Variant shoes</a>
                    </div>
                </div>
                <a href="brand" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Category</a>
                <c:if test="${user.getRole() eq 'Admin'}">
                    <a href="userlist" class="nav-item nav-link active"><i class="fa fa-users me-2"></i>User List</a>
                </c:if>
                <a href="order" class="nav-item nav-link"><i class="fa fa-shopping-cart me-2"></i>Order List</a>
                <a href="logout" class="nav-item nav-link"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
            </div>
        </nav>
    </div>
    <!-- Sidebar End -->

    <!-- Content Start -->
    <head>
    <title>User Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="mb-3">User List</h2>

    <!-- Add user button -->
    <button type="button" class="btn btn-success mb-3" data-bs-toggle="modal" data-bs-target="#addUserModal">
        Add User
    </button>

    <!-- Table -->
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>User Name</th>
            <th>Email</th>
            <th>Address</th>
            <th>Phone number</th>
            <th>Role</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.getUser_ID()}</td>
                <td>${user.getUser_Name()}</td>
                <td>${user.getEmail()}</td>
                <td>${user.getAddress()}</td>
                <td>${user.getPhone()}</td>
                <td>${user.getRole()}</td>
                <td>
                    <button type="button" class="btn btn-primary btn-edit"
                            data-bs-toggle="modal" data-bs-target="#editUserModal"
                            data-id="${user.getUser_ID()}"
                            data-name="${user.getUser_Name()}"
                            data-email="${user.getEmail()}"
                            data-password="${user.getPassword()}"
                            data-role="${user.getRole()}">
                        Edit
                    </button>
                    <form action="user" method="post" class="d-inline">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="idtodel" value="${user.getUser_ID()}">
                        <input type="submit" class="btn btn-danger" value="Delete">
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Add User Modal -->
<div class="modal fade" id="addUserModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <form action="userlist" method="post" class="modal-content" autocomplete="off">
            <input type="hidden" name="action" value="add">
            <div class="modal-header">
                <h5 class="modal-title">Add User</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <label class="form-label">User Name</label>
                    <input type="text" name="username" class="form-control" autocomplete="off">
                </div>
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" autocomplete="off">
                </div>
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" autocomplete="new-password">
                </div>
                <div class="mb-3">
                    <label class="form-label">Role</label>
                    <input type="text" name="role" class="form-control" autocomplete="off">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <input type="submit" class="btn btn-success" value="Add">
            </div>
        </form>
    </div>
</div>


<!-- Edit User Modal -->
<div class="modal fade" id="editUserModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <form action="user" method="post" class="modal-content">
            <input type="hidden" name="action" value="update">
            <input type="hidden" id="editUserId" name="id">

            <div class="modal-header">
                <h5 class="modal-title">Edit User</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <label class="form-label">User Name</label>
                    <input type="text" id="editName" name="username" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" id="editEmail" name="email" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" id="editPassword" name="password" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label">Role</label>
                    <input type="text" id="editRole" name="role" class="form-control">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <input type="submit" class="btn btn-primary" value="Update">
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll(".btn-edit").forEach(btn => {
            btn.addEventListener("click", function () {
                document.getElementById("editUserId").value = this.dataset.id;
                document.getElementById("editName").value = this.dataset.name;
                document.getElementById("editEmail").value = this.dataset.email;
                document.getElementById("editPassword").value = this.dataset.password;
                document.getElementById("editRole").value = this.dataset.role;
            });
        });
    });
</script>
</body>
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
<script src="${pageContext.request.contextPath}/assets2/js/main.js"></script>
</body>
</html>
