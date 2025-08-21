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

        <style>
            .error-message {
                color: red;
                font-size: 1em;
                margin-bottom: 15px;
                text-align: center;
            }
            .search-container {
                margin-bottom: 20px;
            }
            .search-input {
                flex: 1;
            }
        </style>    
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
            <div class="container mt-4">
                <h2 class="mb-3">User List</h2>

                <!-- Display error message from server -->
                <c:if test="${not empty mess}">
                    <div class="error-message">${mess}</div>
                </c:if>

                <!-- Search Bar -->
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-6">
                            <div class="search-container">
                                <form action="userlist" method="post" style="display: flex; align-items: center;">
                                    <input type="hidden" name="action" value="searchname">
                                    <label for="nameSearch" style="margin-right: 10px;">Search By Name or Email:</label>
                                    <input name="nameSearch" type="text" class="form-control search-input" placeholder="Enter name or email..." style="flex: 1;">
                                    <button type="submit" class="btn btn-primary btn-edit" style="margin-left: 10px;">
                                        Search
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Add User Button -->
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
                            <th>Status</th>
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
                                <td>${user.isIsActive() ? 'Active' : 'Banned'}</td>
                                <td>
                                    <c:if test="${currentUser != null && (user.getRole() != 'Admin' || user.getUser_ID() == currentUser.getUser_ID())}">
                                        <button type="button" class="btn btn-primary btn-edit"
                                                data-bs-toggle="modal" data-bs-target="#editUserModal"
                                                data-id="${user.getUser_ID()}"
                                                data-name="${user.getUser_Name()}"
                                                data-email="${user.getEmail()}"
                                                data-role="${user.getRole()}">
                                            Edit
                                        </button>
                                    </c:if>
                                    <c:if test="${currentUser != null && user.getUser_ID() != currentUser.getUser_ID() && user.getRole() != 'Admin'}">
                                        <form action="userlist" method="post" class="d-inline ban-form" data-user-id="${user.getUser_ID()}">
                                            <input type="hidden" name="action" value="${user.isIsActive() ? 'ban' : 'unban'}">
                                            <input type="hidden" name="${user.isIsActive() ? 'idtoban' : 'idtounban'}" value="${user.getUser_ID()}">
                                            <input type="submit" class="btn btn-warning ${user.isIsActive() ? 'btn-ban' : 'btn-unban'}" value="${user.isIsActive() ? 'Ban' : 'Unban'}">
                                        </form>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <!-- Pagination -->
                <c:if test="${nameSearch == null}">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination" style="margin-left: 300px; margin-top: 30px">
                            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                <a class="page-link" href="userlist?page=${currentPage - 1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <c:forEach var="i" begin="1" end="${totalPages}">
                                <li class="page-item ${i == currentPage ? 'active' : ''}">
                                    <a class="page-link" href="userlist?page=${i}">${i}</a>
                                </li>
                            </c:forEach>
                            <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                <a class="page-link" href="userlist?page=${currentPage + 1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </c:if>

                <c:if test="${nameSearch != null}">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination" style="margin-left: 300px; margin-top: 30px">
                            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                <form method="POST" action="userlist">
                                    <input type="hidden" name="action" value="searchname">
                                    <input type="hidden" name="nameSearch" value="${nameSearch}">
                                    <input type="hidden" name="page" value="${currentPage - 1}">
                                    <button type="submit" class="page-link">&laquo;</button>
                                </form>
                            </li>
                            <c:forEach var="i" begin="1" end="${totalPages}">
                                <li class="page-item ${i == currentPage ? 'active' : ''}">
                                    <form method="POST" action="userlist">
                                        <input type="hidden" name="action" value="searchname">
                                        <input type="hidden" name="nameSearch" value="${nameSearch}">
                                        <input type="hidden" name="page" value="${i}">
                                        <button type="submit" class="page-link">${i}</button>
                                    </form>
                                </li>
                            </c:forEach>
                            <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                <form method="POST" action="userlist">
                                    <input type="hidden" name="action" value="searchname">
                                    <input type="hidden" name="nameSearch" value="${nameSearch}">
                                    <input type="hidden" name="page" value="${currentPage + 1}">
                                    <button type="submit" class="page-link">&raquo;</button>
                                </form>
                            </li>
                        </ul>
                    </nav>
                </c:if>
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
                                <input type="text" name="username" class="form-control" autocomplete="off" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input type="email" name="email" class="form-control" autocomplete="off" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <input type="password" name="password" class="form-control" autocomplete="new-password" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Role</label>
                                <input type="text" name="role" class="form-control" autocomplete="off" required>
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
                    <form action="userlist" method="post" class="modal-content">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" id="editUserId" name="id">
                        <div class="modal-header">
                            <h5 class="modal-title">Edit User</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label class="form-label">User Name</label>
                                <input type="text" id="editName" name="username" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input type="email" id="editEmail" name="email" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <input type="password" id="editPassword" name="password" class="form-control" placeholder="Leave blank to keep unchanged">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Role</label>
                                <input type="text" id="editRole" name="role" class="form-control" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <input type="submit" class="btn btn-primary" value="Update">
                        </div>
                    </form>
                </div>
            </div>

            <!-- JavaScript -->
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    // Populate Edit User Modal with user data
                    document.querySelectorAll(".btn-edit").forEach(btn => {
                        btn.addEventListener("click", function () {
                            console.log("ID:", this.dataset.id); // Debug
                            console.log("Name:", this.dataset.name);
                            console.log("Email:", this.dataset.email);
                            console.log("Role:", this.dataset.role);
                            document.getElementById("editUserId").value = this.dataset.id;
                            document.getElementById("editName").value = this.dataset.name;
                            document.getElementById("editEmail").value = this.dataset.email;
                            document.getElementById("editPassword").value = ""; // Do not send old password
                            document.getElementById("editRole").value = this.dataset.role;
                        });
                    });

                    // Add confirmation popup for Ban action
                    document.querySelectorAll(".ban-form").forEach(form => {
                        const submitButton = form.querySelector("input[type='submit']");
                        const userId = form.dataset.userId;
                        submitButton.addEventListener("click", function (event) {
                            const action = form.querySelector("input[name='action']").value;
                            if (action === "ban") {
                                if (!confirm("Are you sure you want to ban this user?")) {
                                    event.preventDefault(); // Prevent form submission if "No" is clicked
                                }
                            }
                        });
                    });
                });
            </script>
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