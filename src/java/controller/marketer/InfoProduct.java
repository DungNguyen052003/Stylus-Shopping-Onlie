/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.marketer;

import dao.CategoryDAO;
import dao.ProductDAO;
import dao.ProductDetailsDAO;
import dao.ProductImageDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.math.BigDecimal;
import java.util.List;
import model.Category;
import model.Product;
import model.ProductDetails;
import model.ProductImage;

/**
 *
 * @author ASUS
 */
@MultipartConfig
public class InfoProduct extends HttpServlet {

    ProductImageDAO productImageDAO = new ProductImageDAO();
    ProductDAO productDAO = new ProductDAO();
    CategoryDAO categoryDAO = new CategoryDAO();
    ProductDetailsDAO productDetailDAO = new ProductDetailsDAO();
    private static final String UPLOAD_DIR_MEN = "C:\\Users\\TienP\\Documents\\NetBeansProjects\\ProjectStylus\\web\\asset\\image\\men";
    private static final String UPLOAD_DIR_WOMEN = "C:\\Users\\TienP\\Documents\\NetBeansProjects\\ProjectStylus\\web\\asset\\image\\women";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InfoProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InfoProduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        int productId = Integer.parseInt(request.getParameter("productId"));
        System.out.println("ProductID: " + productId);
        Product products = productDAO.getProductById(productId);
       
        request.setAttribute("product", products);
        List<ProductImage> productImg = new ProductImageDAO().get(productId);
        request.setAttribute("productList", productImg);
        
        ProductDetailsDAO pdDAO = new ProductDetailsDAO();
        List<ProductDetails> detailList = pdDAO.getDetailByProductID(productId);
        
        session.setAttribute("detailList", detailList);
        List<Category> categoriesWomen = categoryDAO.getCategoriesByParentID(1);
        session.setAttribute("categoriesWomen", categoriesWomen);
        List<Category> categoriesMen = categoryDAO.getCategoriesByParentID(2);
        session.setAttribute("categoriesMen", categoriesMen);
        request.getRequestDispatcher("view/admin/infoProduct.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println(action);
        switch (action) {
            case "updateStatus":
                getStatusProduct(request, response);
                break;
            case "updateFeatured":
                getFeatureProduct(request, response);
                break;
            case "updateProduct":
                editProduct(request, response);
                break;
            case "updateQuantity":
                updateQuantity(request, response);
                break;
            case "updateImage":
                uploadImage(request, response);
                break;
            default:
                throw new AssertionError();
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void getStatusProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        System.out.println("ProductID: " + productId);
        int status = Integer.parseInt(request.getParameter("status"));
        System.out.println("Status: " + status);
        boolean updated = productDAO.updateProductStatus(productId, status);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"success\":" + updated + "}");
    }

    private void getFeatureProduct(HttpServletRequest request, HttpServletResponse response) {
        int productId = Integer.parseInt(request.getParameter("id"));
        int feature = Integer.parseInt(request.getParameter("featured"));
        System.out.println("featured :" + feature);
        boolean updateStatus = productDAO.updateProductFeature(feature, productId);
    }

   private void editProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("productID"));
            String name = request.getParameter("name");
            String priceString = request.getParameter("price");
            BigDecimal price = new BigDecimal(priceString);
            String briefInfo = request.getParameter("brief");
            String info = request.getParameter("description");
            int categoryID = Integer.parseInt(request.getParameter("category"));
            String img = request.getParameter("currentThumbnail");

            Category category = categoryDAO.getCategory(categoryID);

            String imgDir;
            File fileSaveDir;
            Product product = new Product();

            // Xác định thư mục lưu ảnh và đường dẫn ảnh dựa trên parent ID của category
            if (category.getParentID() == 1) {
                imgDir = "asset/image/women/";
                fileSaveDir = new File(UPLOAD_DIR_WOMEN);
            } else {
                imgDir = "asset/image/men/";
                fileSaveDir = new File(UPLOAD_DIR_MEN);
            }

            // Đảm bảo thư mục tồn tại
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdirs();
            }

            // Xử lý file upload từ request
            Part part = request.getPart("thumbnail");
            if (part != null && part.getSize() > 0) {
                String fileName = extractFileName(part);
                imgDir = imgDir + fileName;

                // Đảm bảo fileName không null
                if (fileName != null && !fileName.isEmpty()) {
                    part.write(fileSaveDir + File.separator + fileName);
                    product.setThumbnail(imgDir); // Lưu đường dẫn ảnh vào sản phẩm
                } else {
                    product.setThumbnail(img); // Sử dụng ảnh hiện tại nếu không có ảnh mới
                }
            } else {
                product.setThumbnail(img); // Sử dụng ảnh hiện tại nếu không có ảnh mới
            }

            // Cập nhật thông tin sản phẩm
            product.setProductID(id);
            product.setProductName(name);
            product.setPrice(price);
            product.setBriefInfomation(briefInfo);
            product.setCateID(category);
            product.setDescription(info);
            productDAO.updateProduct(product);

        } catch (ServletException | IOException | NumberFormatException e) {
            e.printStackTrace();
        }
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().append("<!DOCTYPE html>")
                .append("<html>")
                .append("<head>")
                .append("<title>Blog Update</title>")
                .append("<script type=\"text/javascript\">")
                .append("setTimeout(function(){ window.location.href = 'ManageProduct'; }, 1500);")
                .append("</script>")
                .append("</head>")
                .append("<body>")
                .append("</body>")
                .append("</html>");
       
    }

    private void updateQuantity(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("detailId");
        String quantity = request.getParameter("quantity");
        ProductDetailsDAO pdDAO = new ProductDetailsDAO();
        pdDAO.updateQuantitybyID(id, quantity);
    }

    private void uploadImage(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String productImageID = request.getParameter("productImageId");
        String imgDir;
        File fileSaveDir;
        int categoryId = Integer.parseInt(request.getParameter("category"));
        String img = request.getParameter("currentImage");
        Category category = categoryDAO.getCategory(categoryId);
        
        if (category.getParentID() == 1) {
            imgDir = "asset/image/women/";
            fileSaveDir = new File(UPLOAD_DIR_WOMEN);
        } else {
            imgDir = "asset/image/men/";
            fileSaveDir = new File(UPLOAD_DIR_MEN);
        }

        // Đảm bảo thư mục tồn tại
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }

        Part part = request.getPart("image");
        if (part != null && part.getSize() > 0) {
            String fileName = extractFileName(part);
            imgDir = imgDir + fileName;
// Đảm bảo fileName không null
            if (fileName != null && !fileName.isEmpty()) {
                part.write(fileSaveDir + File.separator + fileName);
            } else {
                imgDir = img;
            }
        } else {
            imgDir = img;
        }
        System.out.println(productImageID);
        System.out.println(categoryId);
        System.out.println(imgDir);
        productImageDAO.updateImage(productImageID, imgDir);
        response.sendRedirect("yourPage.jsp");
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
