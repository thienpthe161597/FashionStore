/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Product;
import entity.Sale;
import entity.ProductVariant;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductDAO {

    DBContext db = new DBContext();
    Connection con = db.connection;

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        System.out.println(dao.getProductByName("Nike Air Maxs"));
    }

    public List<Product> getRandomProduct() {
        List<Product> product = new ArrayList<>();
        String query = "SELECT TOP 8 * \n"
                + "FROM Product\n"
                + "ORDER BY NEWID() ";
        try (PreparedStatement ps = con.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Product p = new Product();
                p.setCategoryID(rs.getInt("Category_ID"));
                p.setDescription(rs.getString("Description"));
                p.setGender(rs.getString("Gender"));
                p.setImage(rs.getString("Image"));
                p.setPrice(rs.getInt("Price"));
                p.setProductID(rs.getInt("Product_ID"));
                p.setProductName(rs.getString("ProductName"));
                p.setSaleID(rs.getInt("Sale_ID"));
                product.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    public List<Product> getAllProduct() {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT * FROM Product";  // Fixed SQL Query
        try (PreparedStatement ps = con.prepareStatement(query); ResultSet resultSet = ps.executeQuery()) {
            while (resultSet.next()) {
                int productId = resultSet.getInt("Product_ID");
                int categoryId = resultSet.getInt("Category_ID");
                int saleId = resultSet.getInt("Sale_ID");
                String name = resultSet.getString("ProductName");
                String description = resultSet.getString("Description");
                int price = resultSet.getInt("Price");
                String productGender = resultSet.getString("Gender");
                String image = resultSet.getString("Image");

                productList.add(new Product(productId, categoryId, saleId, name, description, price, productGender, image));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    public List<Product> getAllProductVarient() {
        List<Product> product = new ArrayList<>();
        String query = "SELECT Category_ID, Description, Gender, Image, Price, Product_ID, ProductName, Sale_ID "
                + "FROM Product";  // Fixed SQL Query
        try (PreparedStatement ps = con.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Product p = new Product();
                p.setCategoryID(rs.getInt("Category_ID"));
                p.setDescription(rs.getString("Description"));
                p.setGender(rs.getString("Gender"));
                p.setImage(rs.getString("Image"));
                p.setPrice(rs.getInt("Price"));
                p.setProductID(rs.getInt("Product_ID"));
                p.setProductName(rs.getString("ProductName"));
                p.setSaleID(rs.getInt("Sale_ID"));
                product.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    public List<Product> getAllProductSale() {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT * FROM Product Where Sale_ID IS NOT NULL";  // Fixed SQL Query
        try (PreparedStatement ps = con.prepareStatement(query); ResultSet resultSet = ps.executeQuery()) {
            while (resultSet.next()) {
                int productId = resultSet.getInt("Product_ID");
                int categoryId = resultSet.getInt("Category_ID");
                int saleId = resultSet.getInt("Sale_ID");
                String name = resultSet.getString("ProductName");
                String description = resultSet.getString("Description");
                int price = resultSet.getInt("Price");
                String productGender = resultSet.getString("Gender");
                String image = resultSet.getString("Image");

                productList.add(new Product(productId, categoryId, saleId, name, description, price, productGender, image));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    public boolean addNewProduct(Product product) {
        try {
            String query;
            PreparedStatement ps;

            if (product.getSaleID() == 0) { // Treat 0 as NULL
                query = "INSERT INTO [dbo].[Product] (Category_ID, ProductName, Description, Price, Gender, Image) VALUES (?,?,?,?,?,?)";
                ps = con.prepareStatement(query);
                ps.setInt(1, product.getCategoryID());
                ps.setString(2, product.getProductName());
                ps.setString(3, product.getDescription());
                ps.setInt(4, product.getPrice());
                ps.setString(5, product.getGender());
                ps.setString(6, product.getImage());
            } else {
                query = "INSERT INTO [dbo].[Product] (Category_ID, Sale_ID, ProductName, Description, Price, Gender, Image) VALUES (?,?,?,?,?,?,?)";
                ps = con.prepareStatement(query);
                ps.setInt(1, product.getCategoryID());
                ps.setInt(2, product.getSaleID());
                ps.setString(3, product.getProductName());
                ps.setString(4, product.getDescription());
                ps.setInt(5, product.getPrice());
                ps.setString(6, product.getGender());
                ps.setString(7, product.getImage());
            }

            int rowAffected = ps.executeUpdate();
            return rowAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateProduct(Product product) {
        try {
            String query;
            PreparedStatement ps;

            if (product.getSaleID() == 0) { // Treat 0 as NULL
                query = "UPDATE [dbo].[Product] SET Category_ID = ?, Sale_ID = NULL, ProductName = ?, Description = ?, Price = ?, Gender = ?, Image = ? WHERE Product_ID = ?";
                ps = con.prepareStatement(query);
                ps.setInt(1, product.getCategoryID());
                ps.setString(2, product.getProductName());
                ps.setString(3, product.getDescription());
                ps.setInt(4, product.getPrice());
                ps.setString(5, product.getGender());
                ps.setString(6, product.getImage());
                ps.setInt(7, product.getProductID());
            } else {
                query = "UPDATE [dbo].[Product] SET Category_ID = ?, Sale_ID = ?, ProductName = ?, Description = ?, Price = ?, Gender = ?, Image = ? WHERE Product_ID = ?";
                ps = con.prepareStatement(query);
                ps.setInt(1, product.getCategoryID());
                ps.setInt(2, product.getSaleID());
                ps.setString(3, product.getProductName());
                ps.setString(4, product.getDescription());
                ps.setInt(5, product.getPrice());
                ps.setString(6, product.getGender());
                ps.setString(7, product.getImage());
                ps.setInt(8, product.getProductID());
            }

            int rowAffected = ps.executeUpdate();
            return rowAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteProduct(int id) {
        String query = "Delete from [dbo].[Product]\n"
                + "WHERE [Product_ID] = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);
            int rowAffected = ps.executeUpdate();
            return rowAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Product getProductByName(String namePro) {
        Product product = new Product();
        String query = " select * from [dbo].[Product] where ProductName = ? ";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, namePro);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    product.setProductID(rs.getInt("Product_ID"));
                } else {
                    return null;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    public Product getProductByIDCate(int id) {
        Product product = new Product();
        String query = " select * from [dbo].[Product] where Category_ID = ? ";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    product.setProductName(rs.getString("ProductName"));
                } else {
                    return null;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    public Product getProductByID(int id) {
        String query = "SELECT * FROM Product WHERE Product_ID = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Product(
                            rs.getInt("Product_ID"),
                            rs.getInt("Category_ID"),
                            rs.getInt("Sale_ID"),
                            rs.getString("ProductName"),
                            rs.getString("Description"),
                            rs.getInt("Price"),
                            rs.getString("Gender"),
                            rs.getString("Image")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Minh Codes
    public List<Product> getFilteredProducts(int catId, String sort, String gender, int page, int pageSize) throws SQLException {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT * FROM Product WHERE 1=1";

        if (catId > 0) {
            query += " AND Category_ID = ?";
        }

        if ("Men".equals(gender)) {
            query += " AND (Gender = 'Men' OR Gender = 'Unisex')";
        } else if ("Women".equals(gender)) {
            query += " AND (Gender = 'Women' OR Gender = 'Unisex')";
        } else if ("Unisex".equals(gender)) {
            query += " AND Gender = 'Unisex'";
        }

        if ("asc".equals(sort)) {
            query += " ORDER BY Price ASC";
        } else if ("desc".equals(sort)) {
            query += " ORDER BY Price DESC";
        } else {
            query += " ORDER BY Product_ID";
        }

        query += " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement statement = con.prepareStatement(query)) {
            int paramIndex = 1;

            if (catId > 0) {
                statement.setInt(paramIndex++, catId);
            }

            statement.setInt(paramIndex++, (page - 1) * pageSize);
            statement.setInt(paramIndex, pageSize);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int productId = resultSet.getInt("Product_ID");
                int categoryId = resultSet.getInt("Category_ID");
                int saleId = resultSet.getInt("Sale_ID");
                String name = resultSet.getString("ProductName");
                String description = resultSet.getString("Description");
                int price = resultSet.getInt("Price");
                String productGender = resultSet.getString("Gender");
                String image = resultSet.getString("Image");

                productList.add(new Product(productId, categoryId, saleId, name, description, price, productGender, image));
            }
        }
        return productList;
    }

    public int getTotalProducts(int categoryId, String gender) throws SQLException {
        String query = "SELECT COUNT(*) FROM Product WHERE 1=1";
        if (categoryId > 0) {
            query += " AND Category_ID = ?";
        }

        if ("Men".equals(gender)) {
            query += " AND (Gender = 'Men' OR Gender = 'Unisex')";
        } else if ("Women".equals(gender)) {
            query += " AND (Gender = 'Women' OR Gender = 'Unisex')";
        } else if ("Unisex".equals(gender)) {
            query += " AND Gender = 'Unisex'";
        }

        try (PreparedStatement statement = con.prepareStatement(query)) {
            if (categoryId > 0) {
                statement.setInt(1, categoryId);
            }
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1);
            }
        }
        return 0;
    }

    public List<Product> searchProducts(String keyword, int page, int pageSize) throws SQLException {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT * FROM Product WHERE ProductName LIKE ? ORDER BY Product_ID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement statement = con.prepareStatement(query)) {
            statement.setString(1, "%" + keyword + "%");
            statement.setInt(2, (page - 1) * pageSize);
            statement.setInt(3, pageSize);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int productId = resultSet.getInt("Product_ID");
                int categoryId = resultSet.getInt("Category_ID");
                int saleId = resultSet.getInt("Sale_ID");
                String name = resultSet.getString("ProductName");
                String description = resultSet.getString("Description");
                int price = resultSet.getInt("Price");
                String gender = resultSet.getString("Gender");
                String image = resultSet.getString("Image");
                productList.add(new Product(productId, categoryId, saleId, name, description, price, gender, image));
            }
        }
        return productList;
    }

    public int getTotalSearchResults(String keyword) throws SQLException {
        int total = 0;
        String query = "SELECT COUNT(*) FROM Product WHERE ProductName LIKE ?";

        try (PreparedStatement statement = con.prepareStatement(query)) {

            statement.setString(1, "%" + keyword + "%");
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                total = resultSet.getInt(1);
            }
        }
        return total;
    }

    public Product getProductById(int productId) throws SQLException {
        String query = "SELECT * FROM Product WHERE Product_ID = ?";
        try (PreparedStatement statement = con.prepareStatement(query)) {
            statement.setInt(1, productId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int categoryId = resultSet.getInt("Category_ID");
                int saleId = resultSet.getInt("Sale_ID");
                String name = resultSet.getString("ProductName");
                String description = resultSet.getString("Description");
                int price = resultSet.getInt("Price");
                String gender = resultSet.getString("Gender");
                String image = resultSet.getString("Image");

                return new Product(productId, categoryId, saleId, name, description, price, gender, image);
            }
        }
        return null;
    }

    public List<ProductVariant> getProductVariants(int productId) throws SQLException {
        List<ProductVariant> variants = new ArrayList<>();
        String query = "SELECT * FROM Product_Variant WHERE Product_ID = ?";
        try (PreparedStatement statement = con.prepareStatement(query)) {
            statement.setInt(1, productId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int pvId = resultSet.getInt("PV_ID");
                String color = resultSet.getString("Color");
                int size = resultSet.getInt("Size");
                int quantity = resultSet.getInt("Quantity");
                variants.add(new ProductVariant(pvId, productId, color, size, quantity));
            }
        }
        return variants;
    }

    public List<String> getProductColors(int productId) throws SQLException {
        List<String> colors = new ArrayList<>();
        String query = "SELECT DISTINCT Color FROM Product_Variant WHERE Product_ID = ?";

        try (PreparedStatement statement = con.prepareStatement(query)) {
            statement.setInt(1, productId);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                colors.add(resultSet.getString("Color"));
            }
        }
        return colors;
    }

    public List<String> getProductSizes(int productId, String color) throws SQLException {
        List<String> sizes = new ArrayList<>();
        String query = "SELECT DISTINCT Size FROM Product_Variant WHERE Product_ID = ? AND Color = ?";

        try (PreparedStatement statement = con.prepareStatement(query)) {
            statement.setInt(1, productId);
            statement.setString(2, color);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                sizes.add(resultSet.getString("Size"));
            }
        }
        return sizes;
    }

    public List<String> getProductMainImages(int productId) throws SQLException {
        List<String> mainImages = new ArrayList<>();
        String query = "SELECT ImgURL FROM Product_Image WHERE Product_ID = ? AND isMain = 1";

        try (PreparedStatement statement = con.prepareStatement(query)) {
            statement.setInt(1, productId);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                mainImages.add(resultSet.getString("ImgURL"));
            }
        }
        return mainImages;
    }

    public List<String> getImagesByColor(int productId, String color) throws SQLException {
        List<String> images = new ArrayList<>();
        String query = "SELECT ImgURL FROM Product_Image WHERE Product_ID = ? AND Color = ?";

        try (PreparedStatement statement = con.prepareStatement(query)) {
            statement.setInt(1, productId);
            statement.setString(2, color);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                images.add(resultSet.getString("ImgURL"));
            }
        }
        return images;
    }

    public String getColorByImage(String imgURL) throws SQLException {
        String color = "";
        String query = "SELECT Color From Product_Image Where ImgURL = ?";
        try (PreparedStatement statement = con.prepareStatement(query)) {
            statement.setString(1, imgURL);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                color = resultSet.getString("Color");
            }
        }

        return color;
    }

    public int getProductVariantId(int productId, String color, String size) throws SQLException {
        int id = 0;
        String query = "SELECT PV_ID From Product_Variant Where Product_ID = ? AND Color = ? AND Size = ?";
        try (PreparedStatement statement = con.prepareStatement(query)) {
            statement.setInt(1, productId);
            statement.setString(2, color);
            statement.setString(3, size);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                id = resultSet.getInt("PV_ID");
            }
        }
        return id;
    }

    public ProductVariant getProductVariantById(int pvId) throws SQLException {
        String query = "SELECT * FROM Product_Variant WHERE PV_ID = ?";
        try (PreparedStatement statement = con.prepareStatement(query)) {
            statement.setInt(1, pvId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int productId = resultSet.getInt("Product_ID");
                String color = resultSet.getString("Color");
                int size = resultSet.getInt("Size");
                int quantity = resultSet.getInt("Quantity");

                return new ProductVariant(pvId, productId, color, size, quantity);
            }
        }
        return null;
    }

    public String getProductColorMainImage(int productId, String color) throws SQLException {
        String imgURL = "";
        String query = "SELECT ImgURL From Product_Image Where Product_ID = ? AND Color = ? AND isMain = 1";
        try (PreparedStatement statement = con.prepareStatement(query)) {
            statement.setInt(1, productId);
            statement.setString(2, color);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                imgURL = resultSet.getString("ImgURL");
            }
        }
        return imgURL;
    }

    public int getProductVariantStock(int productVariantId) throws SQLException {
        int stock = 0;
        String query = "SELECT Quantity FROM Product_Variant WHERE PV_ID = ?";

        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, productVariantId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    stock = rs.getInt("Quantity");
                }
            }
        }
        return stock;
    }

    public int getSaleDiscount(int saleId) throws SQLException {

        int sale = 0;
        String query = "SELECT Sale FROM Sale WHERE Sale_ID = ?";

        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, saleId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    sale = rs.getInt("Sale");
                }
            }
        }
        return sale;
    }

    public List<Sale> getAllSales() {
        List<Sale> salesList = new ArrayList<>();
        String sql = "SELECT Sale_ID, Sale FROM Sale";

        try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int saleId = rs.getInt("Sale_ID");
                int sale = rs.getInt("Sale");
                salesList.add(new Sale(saleId, sale));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return salesList;
    }

}
