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
                    <p class="text-danger">On Sale!</p>
                    <% } %>

                    <form action="add-to-cart" method="post">
                        <input type="hidden" name="id" value="<%= product.getProductID() %>">
                        <input type="hidden" name="name" value="<%= product.getProductName() %>">
                        <input type="hidden" name="price" value="<%= product.getPrice() %>">
                        <input type="hidden" name="image" value="<%= product.getImage() %>">


                        <!--
<div class="mb-3">
    <label for="color" class="form-label">Color:</label>
    <select name="color" id="color" class="form-select" required>
                        <% 
                            java.util.List<entity.ProductVariant> variants = 
                                (java.util.List<entity.ProductVariant>) request.getAttribute("variants");
                            java.util.Set<String> colors = new java.util.HashSet<>();
                            if (variants != null) {
                                for (entity.ProductVariant pv : variants) {
                                    if (!colors.contains(pv.getColor())) {
                        %>
                        <option value="<%= pv.getColor() %>"><%= pv.getColor() %></option>
                        <% 
                                        colors.add(pv.getColor());
                                    }
                                }
                            }
                        %>
                    </select>
                </div>
                
                <div class="mb-3">
                    <label for="size" class="form-label">Size:</label>
                    <select name="size" id="size" class="form-select" required>
                        <% 
                            if (variants != null) {
java.util.Set<Integer> sizes = new java.util.HashSet<>();
                                for (entity.ProductVariant pv : variants) {
                                    if (!sizes.contains(pv.getSize())) {
                        %>
                        <option value="<%= pv.getSize() %>">Size <%= pv.getSize() %></option>
                        <% 
                                        sizes.add(pv.getSize());
                                    }
                                }
                            }
                        %>
                    </select>
                </div>
                -->
                <div class="mb-3">
                    <label for="quantity" class="form-label">Quantity:</label>
                    <input type="number" name="quantity" id="quantity" value="1" min="1" class="form-control" />
                </div>
                        


                        <!-- Chọn màu sắc -->
                        <div class="mb-3">
                            <label for="color" class="form-label">Color:</label>
                            <select name="color" id="color" class="form-select" required>
                                <% 
                                    java.util.List<entity.ProductVariant> variants = 
                                        (java.util.List<entity.ProductVariant>) request.getAttribute("variants");
                                    java.util.Set<String> colors = new java.util.HashSet<>();
                                    if (variants != null) {
                                        for (entity.ProductVariant pv : variants) {
                                            if (!colors.contains(pv.getColor())) {
                                %>
                                <option value="<%= pv.getColor() %>"><%= pv.getColor() %></option>
                                <% 
                                                colors.add(pv.getColor());
                                            }
                                        }
                                    }
                                %>
                            </select>
                        </div>

                        <!-- Chọn size -->
                        <div class="mb-3">
                            <label for="size" class="form-label">Size:</label>
                            <select name="size" id="size" class="form-select" required>
                                <% 
                                    if (variants != null) {
                                        java.util.Set<Integer> sizes = new java.util.HashSet<>();
                                        for (entity.ProductVariant pv : variants) {
                                            if (!sizes.contains(pv.getSize())) {
                                %>
                                <option value="<%= pv.getSize() %>">Size <%= pv.getSize() %></option>
                                <% 
                                                sizes.add(pv.getSize());
                                            }
                                        }
                                    }
                                %>
                            </select>
                        </div>

                        <!-- Nhập số lượng -->
                        <div class="mb-3">
                            <label for="quantity" class="form-label">Quantity:</label>
                            <input type="number" name="quantity" id="quantity" value="1" min="1" class="form-control" />
                        </div>

                        <button type="submit" class="btn btn-black">Add to cart</button>
                    </form>

                </div>
            </div>
        </div>
    </section>


<%@ include file="footer.jsp" %>
<%@ include file="footer.jsp" %>

