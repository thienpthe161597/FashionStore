<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Customer Detail</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
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
        <h2>Customer Detail</h2>

        <c:if test="${not empty customer}">
            <table class="table table-bordered">
                <tr><th>ID</th><td>${customer.user_ID}</td></tr>
                <tr><th>Name</th><td>${customer.user_Name}</td></tr>
                <tr><th>Email</th><td>${customer.email}</td></tr>
                <tr><th>Phone</th><td>${customer.phone}</td></tr>
                <tr><th>Address</th><td>${customer.address}</td></tr>
                <tr><th>Role</th><td>${customer.role}</td></tr>
                <tr><th>Created At</th><td>${customer.created_At}</td></tr>
            </table>
        </c:if>

        <a href="customer-list" class="btn btn-secondary">Back</a>
    </div>

</body>
</html>
