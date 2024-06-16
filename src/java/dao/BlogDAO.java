/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Category;
import model.Blog;
import model.Product;

/**
 *
 * @author 84976
 */
public class BlogDAO extends DBContext {

    PreparedStatement stm; //thực hiện câu lệnh sql
    ResultSet rs; //lưu trữ dữ liệu lấy về từ câu lệnh select

    public List<Blog> getAllBlogs() {
        List<Blog> list = new ArrayList<>();

        try {
            String sql = "select b.BlogID, b.BlogTitle, b.Thumbnail, b.Description, b.ProductID, b.Status, b.Brief_Info, b.Author, b.Featured, b.CreateDate, c.CateID, c.Name as CateName from Blog b\n"
                    + " inner join Product p on b.ProductID = p.ProductID\n"
                    + "inner join Category c on c.CateID = p.CateID";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int blogID = rs.getInt("blogID");
                String blogTitle = rs.getString("blogTitle");
                String thumbnail = rs.getString("thumbnail");
                String description = rs.getString("description");
                int productID = rs.getInt("productID");
                int status = rs.getInt("status");
                String brief_info = rs.getString("brief_info");
                String author = rs.getString("author");
                int featured = rs.getInt("featured");
                LocalDateTime CreateDate = rs.getTimestamp("CreateDate").toLocalDateTime();
                String cateName = rs.getString("CateName");
                int cateID = rs.getInt("cateID");

                // Tạo đối tượng Blog
                Blog blog = new Blog();
                Category c = new Category();
                c.setCateID(blogID);
                c.setName(cateName);

                blog.setBlogID(blogID);
                blog.setBlogTitle(blogTitle);
                blog.setThumbnail(thumbnail);
                blog.setDescription(description);
                blog.setProductID(productID);
                blog.setStatus(status);
                blog.setBrief_info(brief_info);
                blog.setAuthor(author);
                blog.setFeatured(featured);
                blog.setCreateDate(CreateDate);
                blog.setCategory(c);

                list.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Blog getLatestBlog() {
        Blog blog = null;

        try {
            String sql = "select b.BlogID, b.BlogTitle, b.Thumbnail, b.Description, b.ProductID, b.Status, b.Brief_Info, b.Author, b.Featured, b.CreateDate, c.CateID, c.Name as CateName from Blog b\n"
                    + "inner join Product p on b.ProductID = p.ProductID\n"
                    + "inner join Category c on c.CateID = p.CateID\n"
                    + "order by b.CreateDate desc";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                int blogID = rs.getInt("BlogID");
                String blogTitle = rs.getString("BlogTitle");
                String thumbnail = rs.getString("Thumbnail");
                String description = rs.getString("Description");
                int productID = rs.getInt("ProductID");
                int status = rs.getInt("Status");
                String brief_info = rs.getString("Brief_Info");
                String author = rs.getString("Author");
                int featured = rs.getInt("Featured");
                LocalDateTime CreateDate = rs.getTimestamp("CreateDate").toLocalDateTime();
                String cateName = rs.getString("CateName");
                int cateID = rs.getInt("CateID");

                // Create a new Category object and set its properties
                Category c = new Category();
                c.setCateID(cateID);
                c.setName(cateName);

                // Create a new Blog object and set its properties
                blog = new Blog();
                blog.setBlogID(blogID);
                blog.setBlogTitle(blogTitle);
                blog.setThumbnail(thumbnail);
                blog.setDescription(description);
                blog.setProductID(productID);
                blog.setStatus(status);
                blog.setBrief_info(brief_info);
                blog.setAuthor(author);
                blog.setFeatured(featured);
                blog.setCreateDate(CreateDate);
                blog.setCategory(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blog;
    }

    public static void main(String[] args) {
        // Khởi tạo một đối tượng BlogDAO
        BlogDAO blogDAO = new BlogDAO();

        // Gọi phương thức searchByTitle với từ khóa "Exo"
        List<Blog> searchResults = blogDAO.searchByTitle("Exo");

        // Hiển thị kết quả
        if (searchResults != null && !searchResults.isEmpty()) {
            System.out.println("Kết quả tìm kiếm:");
            for (Blog blog : searchResults) {
                System.out.println("BlogID: " + blog.getBlogID());
                System.out.println("BlogTitle: " + blog.getBlogTitle());
                // Hiển thị các trường khác của Blog nếu cần
            }
        } else {
            System.out.println("Không tìm thấy kết quả phù hợp.");
        }
    }

    public List<Blog> getBlogsByCategory() {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = "SELECT c.Name AS CategoryName\n"
                    + "FROM Blog b\n"
                    + "INNER JOIN Product p ON b.ProductID = p.ProductID\n"
                    + "INNER JOIN Category c ON p.CateID = c.CateID\n"
                    + "WHERE b.BlogID = ?";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setBlogID(rs.getInt("BlogID"));
                blog.setBlogTitle(rs.getString("BlogTitle"));
                blog.setThumbnail(rs.getString("Thumbnail"));
                blog.setDescription(rs.getString("Description"));
                blog.setCreateDate(rs.getTimestamp("CreateDate").toLocalDateTime());
                blog.setProductID(rs.getInt("ProductID"));
                blog.setStatus(rs.getInt("Status"));
                blog.setBrief_info(rs.getString("Brief_Info"));
                blog.setAuthor(rs.getString("Author"));
                blog.setFeatured(rs.getInt("Featured"));

                Category category = new Category();
                category.setName(rs.getString("CategoryName"));
                blog.setCategory(category);

                list.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Category> getAllRootCategories() {
        List<Category> categories = new ArrayList<>();
        try {
            String sql = " SELECT \n"
                    + "    b.*,\n"
                    + "    c.Name AS CategoryName\n"
                    + "FROM \n"
                    + "    Blog b\n"
                    + "INNER JOIN \n"
                    + "    Product p ON b.ProductID = p.ProductID\n"
                    + "INNER JOIN \n"
                    + "    Category c ON p.CateID = c.CateID;";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCateID(rs.getInt("CateID"));
                category.setName(rs.getString("Name"));
                // category.setStatus(rs.getInt("Status"));
                category.setParentID(rs.getInt("ParentID"));
                categories.add(category);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    public void insertBlog(String blogTitle, String thumbnail, String description, int productID,
            int status, String briefInfo, String author, int featured, Date createDate) {
        try {
            String sql = "INSERT INTO Blog (blogTitle, thumbnail, description, productID, status, brief_info, author, featured, createDate) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement stm = connection.prepareStatement(sql); // Khai báo stm ở đây để tránh lỗi null pointer exception
            stm.setString(1, blogTitle);
            stm.setString(2, thumbnail);
            stm.setString(3, description);
            stm.setInt(4, productID);
            stm.setInt(5, status);
            stm.setString(6, briefInfo);
            stm.setString(7, author);
            stm.setInt(8, featured);
            stm.setDate(9, new java.sql.Date(createDate.getTime()));
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Blog getBlogByID(int id) {
        try {
            String sql = """
                         select b.BlogID, b.BlogTitle, b.Thumbnail, b.Description, b.ProductID, b.Status, b.Brief_Info, b.Author, b.Featured, b.CreateDate, c.CateID, c.Name as CateName from Blog b
                          inner join Product p on b.ProductID = p.ProductID
                         inner join Category c on c.CateID = p.CateID
                         where b.BlogID = ?""";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();

            while (rs.next()) {
                int blogID = rs.getInt("blogID");
                String blogTitle = rs.getString("blogTitle");
                String thumbnail = rs.getString("thumbnail");
                String description = rs.getString("description");
                int productID = rs.getInt("productID");
                int status = rs.getInt("status");
                String brief_info = rs.getString("brief_info");
                String author = rs.getString("author");
                int featured = rs.getInt("featured");
                LocalDateTime CreateDate = rs.getTimestamp("CreateDate").toLocalDateTime();
                String cateName = rs.getString("CateName");
                int cateID = rs.getInt("cateID");

                // Tạo đối tượng Blog
                Blog blog = new Blog();
                Category c = new Category();
                c.setCateID(blogID);
                c.setName(cateName);
                // Sử dụng constructor không đối số

                // Gán giá trị cho các trường của đối tượng Blog
                blog.setBlogID(blogID);
                blog.setBlogTitle(blogTitle);
                blog.setThumbnail(thumbnail);
                blog.setDescription(description);
                blog.setProductID(productID);
                blog.setStatus(status);
                blog.setBrief_info(brief_info);
                blog.setAuthor(author);
                blog.setFeatured(featured);
                blog.setCreateDate(CreateDate);
                blog.setCategory(c);
                return blog;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

//    public static void main(String[] args) {
//        BlogDAO d = new BlogDAO();
//        Blog b = d.getBlogByID(1);
//        System.out.println(b.getBlogID());
//        System.out.println(b.getBrief_info());
//        System.out.println(b.toString());
//    }
    public void updateBlog(int blogID, String blogTitle, String thumbnail, String description, int productID,
            int status, String brief_info, String author, int featured) {
        try {
            String sql = "UPDATE Blog SET blogTitle=?, thumbnail=?, description=?, productID=?, status=?, brief_info=?, author=?, featured=? WHERE blogID=?";
            PreparedStatement rs = connection.prepareStatement(sql);
            rs.setString(1, blogTitle);
            rs.setString(2, thumbnail);
            rs.setString(3, description);
            rs.setInt(4, productID);
            rs.setInt(5, status);
            rs.setString(6, brief_info);
            rs.setString(7, author);
            rs.setInt(8, featured);
            rs.setInt(9, blogID);
            rs.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Blog> searchByTitle(String keyword) {
        List<Blog> blogs = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM Blog WHERE BlogTitle LIKE ?";
        try {

            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + keyword + "%"); // Set parameter for the title search
            rs = stm.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setBlogID(rs.getInt("BlogID"));
                blog.setBlogTitle(rs.getString("BlogTitle"));
                blog.setThumbnail(rs.getString("Thumbnail"));
                blog.setDescription(rs.getString("Description"));
                blog.setCreateDate(rs.getTimestamp("CreateDate").toLocalDateTime());
                blog.setProductID(rs.getInt("ProductID"));
                blog.setStatus(rs.getInt("Status"));
                blog.setBrief_info(rs.getString("Brief_Info"));
                blog.setAuthor(rs.getString("Author"));
                blog.setFeatured(rs.getInt("Featured"));
                blogs.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Đóng các resource - connection, statement và result set
            // Đảm bảo rằng bạn đã đóng connection, statement và result set ở đây
            // Đảm bảo bạn xử lý các exception và đóng tất cả các resource một cách an toàn
        }
        return blogs;
    }

    public List<Blog> getListByPage(List<Blog> list, int start, int end) {
        ArrayList<Blog> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Blog> getSortedBlog(String sortBy) {
        List<Blog> blogs = new ArrayList<>();
        String sql = """
                   SELECT b.*, b.Status AS BlogStatus, p.*, ct.* 
                   FROM Blog b 
                   JOIN Product p ON b.ProductID = p.ProductID 
                   JOIN Category ct ON p.CateID = ct.CateID""";

        switch (sortBy) {
            case "title":
                sql += " ORDER BY b.BlogTitle";
                break;
            case "category":
                sql += " ORDER BY ct.CateID";
                break;
            case "author":
                sql += " ORDER BY b.Author";
                break;
            case "feature":
                sql += " ORDER BY b.Featured";
                break;
            case "status":
                sql += " ORDER BY b.status";
                break;
            default:
                sql += " ORDER BY b.BlogID";
                break;
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setBlogID(rs.getInt("BlogID"));
                blog.setBlogTitle(rs.getString("BlogTitle"));
                blog.setThumbnail(rs.getString("Thumbnail"));
                blog.setDescription(rs.getString("Description"));
                blog.setCreateDate(rs.getTimestamp("CreateDate").toLocalDateTime());
                blog.setProductID(rs.getInt("ProductID"));
                blog.setStatus(rs.getInt("BlogStatus"));
                blog.setBrief_info(rs.getString("Brief_Info"));
                blog.setAuthor(rs.getString("Author"));
                blog.setFeatured(rs.getInt("Featured"));
                String cateName = rs.getString("Name");
                int cateID = rs.getInt("cateID");
                Category c = new Category();
                c.setCateID(cateID);
                c.setName(cateName);
                blog.setCategory(c);
                blogs.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blogs;
    }

    public List<Blog> getBlogsByCategory(String cateID) {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = "select * from Blog where CateID = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, cateID);
            rs = stm.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setBlogID(rs.getInt("BlogID"));
                blog.setBlogTitle(rs.getString("BlogTitle"));
                blog.setThumbnail(rs.getString("Thumbnail"));
                blog.setDescription(rs.getString("Description"));
                blog.setCreateDate(rs.getTimestamp("CreateDate").toLocalDateTime());
                blog.setProductID(rs.getInt("ProductID"));
                blog.setStatus(rs.getInt("BlogStatus"));
                blog.setBrief_info(rs.getString("Brief_Info"));
                blog.setAuthor(rs.getString("Author"));
                blog.setFeatured(rs.getInt("Featured"));
                String cateName = rs.getString("Name");
                int categoryID = Integer.parseInt(cateID);
                Category c = new Category();
                c.setCateID(categoryID);
                c.setName(cateName);
                blog.setCategory(c);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Blog> getFeaturedBlogs() {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Blog WHERE Featured = 1";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setBlogID(rs.getInt("BlogID"));
                blog.setBlogTitle(rs.getString("BlogTitle"));
                blog.setThumbnail(rs.getString("Thumbnail"));
                blog.setDescription(rs.getString("Description"));
                blog.setCreateDate(rs.getTimestamp("CreateDate").toLocalDateTime());
                blog.setProductID(rs.getInt("ProductID"));
                blog.setStatus(rs.getInt("BlogStatus"));
                blog.setBrief_info(rs.getString("Brief_Info"));
                blog.setAuthor(rs.getString("Author"));
                blog.setFeatured(rs.getInt("Featured"));
                list.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Blog> getLastestBlog() {
        List<Blog> list = new ArrayList<>();

        try {
            String sql = "Select top 1 * From Blog Order By CreateDate DESC";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setBlogID(rs.getInt("BlogID"));
                blog.setBlogTitle(rs.getString("BlogTitle"));
                blog.setThumbnail(rs.getString("Thumbnail"));
                blog.setDescription(rs.getString("Description"));
                blog.setCreateDate(rs.getTimestamp("CreateDate").toLocalDateTime());
                blog.setProductID(rs.getInt("ProductID"));
                blog.setStatus(rs.getInt("BlogStatus"));
                blog.setBrief_info(rs.getString("Brief_Info"));
                blog.setAuthor(rs.getString("Author"));
                blog.setFeatured(rs.getInt("Featured"));
                list.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Blog> searchBlogsByTitle(String search) {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = "select * from Blog\n"
                    + "where blog.BlogTitle like ? ";
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + search + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setBlogID(rs.getInt("BlogID"));
                blog.setBlogTitle(rs.getString("BlogTitle"));
                blog.setThumbnail(rs.getString("Thumbnail"));
                blog.setDescription(rs.getString("Description"));
                blog.setCreateDate(rs.getTimestamp("CreateDate").toLocalDateTime());
                blog.setProductID(rs.getInt("ProductID"));
                blog.setStatus(rs.getInt("BlogStatus"));
                blog.setBrief_info(rs.getString("Brief_Info"));
                blog.setAuthor(rs.getString("Author"));
                blog.setFeatured(rs.getInt("Featured"));
                list.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Product getRelatedProducts(int blogID) {
        try {
            String sql = "SELECT p.* ,ct.Name\n"
                    + "FROM Blog b JOIN Product p ON b.ProductID = p.ProductID \n"
                    + "join Category ct on ct.CateID = p.CateID\n"
                    + "where b.BlogID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, blogID);
            ResultSet rss = stm.executeQuery();
            while (rs.next()) {

                Product product = new Product();
                product.setProductID(rss.getInt("ProductID"));
                product.setProductName(rss.getString("ProductName"));
                product.setPrice(rss.getDouble("Price"));
                product.setThumbnail(rss.getString("ThumbNail"));
                product.setDescription(rss.getString("Description"));
                product.setBriefInfomation(rss.getString("BriefInformation"));
                product.setCreateDate(rss.getTimestamp("CreateDate").toLocalDateTime());
                product.setUpdateDate(rss.getTimestamp("UpdateDate").toLocalDateTime());
                product.setCampainID(rss.getInt("CampainID"));
                // Tạo một đối tượng Category
                Category category = new Category();
                category.setCateID(rss.getInt("CateID"));
                category.setName(rss.getString("name"));
                product.setCateID(category);

                return product;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Blog> filterBlog(String author, String title, int category, int status) {
        List<Blog> blogs = new ArrayList<>();
        String sql1 = """
                       SELECT b.*, b.Status AS BlogStatus, p.*, ct.* 
                                          FROM Blog b 
                                          JOIN Product p ON b.ProductID = p.ProductID 
                                          JOIN Category ct ON p.CateID = ct.CateID
                                            where 1=1""";
        String sql2 = "";

        if (author != null && !author.isEmpty()) {
            sql2 += "AND b.Author LIKE ?  ";
        }
        if (title != null && !title.isEmpty()) {
            sql2 += "AND b.BlogTitle LIKE  ? ";
        }
        if (category != -1) {
            sql2 += "AND ct.CateID = ?  ";
        }
        if (status == 1 || status == 0) {
            sql2 += "AND Status = ? ";
        }

        String sql = sql1 + sql2;

        try {
            statement = connection.prepareStatement(sql);
            int parameterIndex = 1;

            if (author != null && !author.isEmpty()) {
                statement.setString(parameterIndex++, "%" + author + "%");
            }
            if (title != null && !title.isEmpty()) {
                statement.setString(parameterIndex++, "%" + title + "%");
            }
            if (category != -1) {
                statement.setInt(parameterIndex++, category);
            }
            if (status == 1 || status == 0) {
                statement.setInt(parameterIndex++, status);
            }
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setBlogID(rs.getInt("BlogID"));
                blog.setBlogTitle(rs.getString("BlogTitle"));
                blog.setThumbnail(rs.getString("Thumbnail"));
                blog.setDescription(rs.getString("Description"));
                blog.setCreateDate(rs.getTimestamp("CreateDate").toLocalDateTime());
                blog.setProductID(rs.getInt("ProductID"));
                blog.setStatus(rs.getInt("BlogStatus"));
                blog.setBrief_info(rs.getString("Brief_Info"));
                blog.setAuthor(rs.getString("Author"));
                blog.setFeatured(rs.getInt("Featured"));
                String cateName = rs.getString("Name");
                int cateID = rs.getInt("cateID");
                Category c = new Category();
                c.setCateID(cateID);
                c.setName(cateName);
                blog.setCategory(c);
                blogs.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blogs;
    }

    public boolean updateBlogStatus(int blogID, int status) {
        String sql = "update Blog\n"
                + "set Status = ?\n"
                + "where BlogID = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, status);
            statement.setInt(2, blogID);
            int updateStatus = statement.executeUpdate();
            return updateStatus > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateBlogFeature(int featureID, int status) {
        String sql = "update Blog\n"
                + "set Featured = ?\n"
                + "where BlogID = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, status);
            statement.setInt(2, featureID);
            int updateStatus = statement.executeUpdate();
            return updateStatus > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
