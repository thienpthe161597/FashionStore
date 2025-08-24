<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>Customer List</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
    </head>
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
    <body class="d-flex">

        <!-- Sidebar -->
        <div class="sidebar pe-4 pb-3 bg-light" style="width: 250px; min-height: 100vh;">
            <nav class="navbar navbar-light">
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
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fas fa-shoe-prints me-2"></i>Fashion Store</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="shoes" class="dropdown-item" style="margin-left: 50px">List shoes</a>
                            <a href="shoesimage" class="dropdown-item" style="margin-left: 50px">Image shoes</a>
                            <a href="shoesvariant" class="dropdown-item" style="margin-left: 50px">Variant shoes</a>
                            <a href="shoessize" class="dropdown-item" style="margin-left: 50px">Shoe Sizes</a>
                        </div>
                    </div>
                    <a href="brand" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Category</a>
                    <c:if test="${user.getRole() eq 'Admin'}">
                        <a href="userlist" class="nav-item nav-link"><i class="fa fa-th me-2"></i>User List</a>
                    </c:if>
                    <a href="customer-list" class="nav-item nav-link active"><i class="fa fa-users me-2"></i>Customer List</a>
                    <a href="order" class="nav-item nav-link"><i class="fa fa-shopping-cart me-2"></i>Order List</a>
                    <a href="logout" class="nav-item nav-link"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
                </div>
            </nav>
        </div>

        <!-- Nội dung -->
        <div class="container mt-4 flex-grow-1">
            <h2>Customer List</h2>

            <!-- Form tìm kiếm -->
            <form method="get" action="customer-list" class="d-flex mb-3">
                <input type="text" name="search" class="form-control" value="${search}" placeholder="Search by name or email"/>
                <button type="submit" class="btn btn-primary ms-2">Search</button>
            </form>

            <!-- Bảng danh sách khách -->
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Detail</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="c" items="${customers}">
                        <tr>
                            <td>${c.user_ID}</td>
                            <td>${c.user_Name}</td>
                            <td>${c.email}</td>
                            <td>${c.phone}</td>
                            <td>
                                <a href="customer-detail?id=${c.user_ID}" class="btn btn-info btn-sm">View</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- Phân trang -->
            <nav>
                <ul class="pagination">
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <li class="page-item ${i == currentPage ? 'active' : ''}">
                            <a class="page-link" href="customer-list?page=${i}&search=${search}">${i}</a>
                        </li>
                    </c:forEach>
                </ul>
            </nav>
        </div>

    </body>
</html>
