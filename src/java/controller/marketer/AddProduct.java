/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.marketer;

import com.google.gson.JsonObject;
import dao.CategoryDAO;
import dao.ColorDAO;
import dao.ProductDAO;
import dao.ProductDetailsDAO;
import dao.SizeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.math.BigDecimal;
import java.util.List;
import model.Category;
import model.Color;
import model.Product;
import model.Size;

/**
 *
 * @author ASUS
 */
@MultipartConfig

public class AddProduct extends HttpServlet {

    SizeDAO sizeDAO = new SizeDAO();
    ColorDAO colorDAO = new ColorDAO();
    CategoryDAO categoryDAO = new CategoryDAO();
    ProductDAO productDAO = new ProductDAO();
    ProductDetailsDAO detailsDAO = new ProductDetailsDAO();
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
            out.println("<title>Servlet AddProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProduct at " + request.getContextPath() + "</h1>");
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
        List<Size> listSize = sizeDAO.getAll();
        request.setAttribute("listSize", listSize);

        List<Color> listColor = colorDAO.getAll();
        request.setAttribute("listColor", listColor);

        List<Category> categoriesWomen = categoryDAO.getCategoriesByParentID(1);
        request.setAttribute("categoriesWomen", categoriesWomen);
        List<Category> categoriesMen = categoryDAO.getCategoriesByParentID(2);
        request.setAttribute("categoriesMen", categoriesMen);

        request.getRequestDispatcher("view/admin/addProduct.jsp").forward(request, response);
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
        addNewProduct(request);
        request.getRequestDispatcher("view/admin/manageProduct.jsp").forward(request, response);
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

    private void addNewProduct(HttpServletRequest request) {
        try {
            String productTitle = request.getParameter("productTitle");
            String brief = request.getParameter("brief");
            String description = request.getParameter("description");
            String priceString = request.getParameter("productPrice");
            BigDecimal price = new BigDecimal(priceString);
            int status = request.getParameter("status") != null ? 1 : 0;
            int feature = request.getParameter("feature") != null ? 1 : 0;
            int category = Integer.parseInt(request.getParameter("category"));

            // In các giá trị để kiểm tra
            System.out.println("Title: " + productTitle);
            System.out.println("Brief: " + brief);
            System.out.println("Description: " + description);
            System.out.println("Price: " + price);
            System.out.println("Status: " + status);
            System.out.println("Feature: " + feature);
            System.out.println("Category: " + category);

            // Giả sử bạn có một class CategoryDAO để lấy Category từ ID
            Category cate = categoryDAO.getCategory(category);
            String imgDir;
            File fileSaveDir;

            // Xác định thư mục lưu ảnh và đường dẫn ảnh dựa trên parent ID của category
            if (cate.getParentID() == 1) {
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
            Part part = request.getPart("image");
            String imgPath = "";
            if (part != null && part.getSize() > 0) {
                String fileName = extractFileName(part);
                imgDir = imgDir + fileName;
                if (fileName != null && !fileName.isEmpty()) {
                    part.write(fileSaveDir + File.separator + fileName);
                    imgPath = imgDir; // Lưu đường dẫn ảnh vào sản phẩm
                }
            }

            // Tạo đối tượng Product
            Product product = new Product();
            product.setProductName(productTitle);
            Category categoryObj = new Category();
            categoryObj.setCateID(category);
            product.setCateID(categoryObj);
            product.setThumbnail(imgPath);
            product.setPrice(price);
            product.setStatus(status);
            product.setDescription(description);
            product.setBriefInfomation(brief);
            product.setFeatured(feature);

            // Thêm sản phẩm vào cơ sở dữ liệu
            productDAO.addProduct(product);

            // Lấy productID mới được tạo
            int productID = productDAO.getLastInsertedProductID();

            String[] sizes = request.getParameterValues("size");
            String[] colors = request.getParameterValues("color");
            String[] quantities = request.getParameterValues("quantity");

            for (int i = 0; i < sizes.length; i++) {
                int size = Integer.parseInt(sizes[i]);
                int color = Integer.parseInt(colors[i]);
                int quantity = Integer.parseInt(quantities[i]);
                System.out.println("Size: " + size);
                System.out.println("Color: " + color);
                System.out.println("Quantity: " + quantity);
                detailsDAO.addProductDetails(productID, size, color, quantity);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi khi thêm sản phẩm mới. Vui lòng thử lại.");
        }
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
