<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="entity.Product" %>
<%@ include file="./header.jsp" %>
<%
    entity.Product product = (entity.Product) request.getAttribute("product");
    if (product == null) {
        response.sendRedirect("shop.jsp");
        return;
    }
%>

<!--%@ include file="header.jsp" %-->

<main class="main-content">
    <section class="product-detail-area">
        <div class="container">
            <div class="row">
                <!-- Product Image -->
                <div class="col-md-6">
                    <img src="<%= product.getImage() %>" class="img-fluid" alt="<%= product.getProductName() %>">
                </div>
                <!-- Product Info -->
                <div class="col-md-6">
                    <h2><%= product.getProductName() %></h2>
                    <p><%= product.getDescription() %></p>
                    <p>Price: $<%= product.getPrice() %></p>
                    <% if (product.getSaleID() != 0) { %>
                    <p>On Sale!</p>
                    <% } %>
                    <form action="add-to-cart" method="post">
                        <input type="hidden" name="id" value="<%= product.getProductID() %>">
                        <input type="hidden" name="name" value="<%= product.getProductName() %>">
                        <input type="hidden" name="price" value="<%= product.getPrice() %>">
                        <input type="hidden" name="image" value="<%= product.getImage() %>">
                        <input type="number" name="quantity" id="quantity20" value="1" min="1" />
                        <button type="submit" class="btn btn-black">Add to cart</button>
                    </form>

                </div>
            </div>
        </div>
    </section>
</main>

<%@ include file="footer.jsp" %>
