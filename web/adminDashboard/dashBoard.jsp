<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Admin Dashboard</title>
    <link href="${pageContext.request.contextPath}/assets2/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets2/css/style.css" rel="stylesheet">
</head>
<body>
<div class="wrapper d-flex">
    <!-- Sidebar -->
    <jsp:include page="sidebar.jsp"/>

    <!-- Main Content -->
    <div class="main p-4">
        <h2 class="mb-4">Dashboard</h2>

        <div class="row">
            <div class="col-md-4">
                <div class="card text-white bg-primary mb-3">
                    <div class="card-body">
                        <h5 class="card-title">T?ng s? giày</h5>
                        <p class="card-text fs-3">${totalShoes}</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card text-white bg-success mb-3">
                    <div class="card-body">
                        <h5 class="card-title">T?ng Category</h5>
                        <p class="card-text fs-3">${totalCategories}</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card text-white bg-warning mb-3">
                    <div class="card-body">
                        <h5 class="card-title">T?ng doanh thu</h5>
                        <p class="card-text fs-3">${totalRevenue} ?</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Optional chart -->
        <div class="card mt-4">
            <div class="card-body">
                <h5 class="card-title">Bi?u ?? doanh thu</h5>
                <canvas id="revenueChart"></canvas>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    const ctx = document.getElementById('revenueChart').getContext('2d');
    const revenueChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['Tháng 1','Tháng 2','Tháng 3','Tháng 4'],
            datasets: [{
                label: 'Doanh thu',
                data: [1200000, 1900000, 3000000, 2500000],
                borderColor: 'rgba(75, 192, 192, 1)',
                fill: false
            }]
        }
    });
</script>
</body>
</html>
