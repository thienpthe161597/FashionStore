/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Product;
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
        System.out.println(dao.getProductByName("Nike Air Maxx", 12));
    }

    public Product getProductByNamee(String namePro) {
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

    public int getTotalPages(int pageSize) {
        String query = "SELECT COUNT(*) FROM Product";
        try (PreparedStatement ps = con.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                int totalProducts = rs.getInt(1);
                return (int) Math.ceil((double) totalProducts / pageSize); // Tính tổng số trang
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 1;
    }

    public List<Product> getAllProduct(int page, int pageSize) {
        List<Product> product = new ArrayList<>();
        String query = "SELECT * FROM Product ORDER BY Product_ID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, (page - 1) * pageSize);
            ps.setInt(2, pageSize);
            ResultSet rs = ps.executeQuery();
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

    public List<Product> getAllProductt() {
        List<Product> product = new ArrayList<>();
        String query = "SELECT * FROM Product ";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
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

    public boolean addNewProduct(Product product) {
        try {
            String query = "INSERT INTO [dbo].[Product] (Category_ID,Sale_ID,ProductName,Description,Price,Gender,Image) VALUES (?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, product.getCategoryID());
            ps.setInt(2, product.getSaleID());
            ps.setString(3, product.getProductName());
            ps.setString(4, product.getDescription());
            ps.setInt(5, product.getPrice());
            ps.setString(6, product.getGender());
            ps.setString(7, "");
            int rowAffected = ps.executeUpdate();
            return rowAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateProduct(Product product) {
        String query = "UPDATE [dbo].[Product]\n"
                + "SET \n"
                + "    [Category_ID] = ?, \n"
                + "    [Sale_ID] = ?, \n"
                + "    [ProductName] = ?, \n"
                + "    [Description] = ?, \n"
                + "    [Price] = ?, \n"
                + "    [Gender] = ?, \n"
                + "    [Image] = ?\n"
                + "WHERE [Product_ID] = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, product.getCategoryID());
            ps.setInt(2, product.getSaleID());
            ps.setString(3, product.getProductName());
            ps.setString(4, product.getDescription());
            ps.setInt(5, product.getPrice());
            ps.setString(6, product.getGender());
            ps.setString(7, "");
            ps.setInt(8, product.getProductID());
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

    public Product getProductByName(String namePro, int excludeId) {
        Product product = null;
        String query = "SELECT * FROM [dbo].[Product] WHERE ProductName = ? AND Product_ID <> ?";

        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, namePro);
            ps.setInt(2, excludeId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    product = new Product();
                    product.setProductID(rs.getInt("Product_ID"));
                    product.setProductName(rs.getString("ProductName"));
                    product.setDescription(rs.getString("Description"));
                    product.setCategoryID(rs.getInt("Category_ID"));
                    product.setGender(rs.getString("Gender"));
                    product.setImage(rs.getString("Image"));
                    product.setPrice(rs.getInt("Price"));
                    product.setSaleID(rs.getInt("Sale_ID"));
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
        Product product = new Product();
        String query = " select * from [dbo].[Product] where Product_ID = ? ";
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

    public List<Product> searchByName(String nameSearch, int page, int pageSize) {
        List<Product> product = new ArrayList<>();
        String query = "SELECT * FROM [dbo].[Product] WHERE ProductName LIKE ? ORDER BY Product_ID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, "%" + nameSearch + "%");
            ps.setInt(2, (page - 1) * pageSize);
            ps.setInt(3, pageSize);

            ResultSet rs = ps.executeQuery();
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

    public int getTotalPagesBySearch(String nameSearch, int pageSize) {
        String query = "SELECT COUNT(*) FROM [dbo].[Product] WHERE ProductName LIKE ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, "%" + nameSearch + "%");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int totalProducts = rs.getInt(1);
                return (int) Math.ceil((double) totalProducts / pageSize);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 1;
    }

    public int getTotalPagesByFilter(int brandCheck, int pageSize) {
        String query = "SELECT COUNT(*) FROM [dbo].[Product] WHERE Category_ID = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, brandCheck);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int totalProducts = rs.getInt(1);
                return (int) Math.ceil((double) totalProducts / pageSize);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 1;
    }

    public List<Product> filterByBrand(int brandCheck, Integer page, int pageSize) {
        List<Product> product = new ArrayList<>();
        String query = "SELECT * FROM [dbo].[Product] WHERE Category_ID = ? ORDER BY Product_ID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, brandCheck);
            ps.setInt(2, (page - 1) * pageSize);
            ps.setInt(3, pageSize);
            ResultSet rs = ps.executeQuery();
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

   public List<Product> getFilteredProducts(int catId, String sort, String gender, int page, int pageSize) throws SQLException {
    List<Product> productList = new ArrayList<>();
    String query = "SELECT * FROM Product WHERE 1=1";

    if (catId > 0) {
        query += " AND Category_ID = ?";
    }

    if (gender != null && !"default".equals(gender)) {
        if ("Men".equals(gender)) query += " AND (Gender='Men' OR Gender='Unisex')";
        else if ("Women".equals(gender)) query += " AND (Gender='Women' OR Gender='Unisex')";
        else if ("Unisex".equals(gender)) query += " AND Gender='Unisex'";
    }

    if ("asc".equals(sort)) query += " ORDER BY Price ASC";
    else if ("desc".equals(sort)) query += " ORDER BY Price DESC";
    else query += " ORDER BY Product_ID";

    query += " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

    try (PreparedStatement statement = con.prepareStatement(query)) {
        int paramIndex = 1;
        if (catId > 0) statement.setInt(paramIndex++, catId);

        statement.setInt(paramIndex++, (page - 1) * pageSize);
        statement.setInt(paramIndex, pageSize);

        try (ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                productList.add(new Product(
                        rs.getInt("Product_ID"),
                        rs.getInt("Category_ID"),
                        rs.getInt("Sale_ID"),
                        rs.getString("ProductName"),
                        rs.getString("Description"),
                        rs.getInt("Price"),
                        rs.getString("Gender"),
                        rs.getString("Image")
                ));
            }
        }
    }
    return productList;
}

// Method tính tổng sản phẩm theo filter
public int getTotalProductCount(int catId, String gender) {
    String query = "SELECT COUNT(*) FROM Product WHERE 1=1";
    if (catId > 0) query += " AND Category_ID = ?";
    if (gender != null && !"default".equals(gender)) {
        if ("Men".equals(gender)) query += " AND (Gender='Men' OR Gender='Unisex')";
        else if ("Women".equals(gender)) query += " AND (Gender='Women' OR Gender='Unisex')";
        else if ("Unisex".equals(gender)) query += " AND Gender='Unisex'";
    }

    try (PreparedStatement ps = con.prepareStatement(query)) {
        int paramIndex = 1;
        if (catId > 0) ps.setInt(paramIndex++, catId);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt(1);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return 0;
}
public double getSaleDiscount(int saleId) {
    String query = "SELECT Discount FROM Sale WHERE Sale_ID = ?";
    try (PreparedStatement ps = con.prepareStatement(query)) {
        ps.setInt(1, saleId);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getDouble("Discount");
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return 0; // nếu không tìm thấy sale, trả về 0%
}
public Product getProductByIDFull(int id) {
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
    return null; // Nếu không tìm thấy
}


}
