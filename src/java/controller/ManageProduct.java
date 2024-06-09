/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Category;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.Map;
import model.PageControl;
import model.Product;

/**
 *
 * @author ASUS
 */
@MultipartConfig
public class ManageProduct extends HttpServlet {

    ProductDAO productDAO = new ProductDAO();
    CategoryDAO categoryDAO = new CategoryDAO();
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
            out.println("<title>Servlet ManageProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageProduct at " + request.getContextPath() + "</h1>");
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
        PageControl pagecontrol = new PageControl();

        String action = request.getParameter("action");
        if ("filterProduct".equals(action)) {
            filterProduct(request, pagecontrol);
        } else {
            List<Product> listProduct = pageProduct(request, pagecontrol);
            String sortBy = request.getParameter("sort");
            if (sortBy != null && !sortBy.isEmpty()) {
                listProduct = sortProduct(request, pagecontrol);

            }
            request.setAttribute("manageProduct", listProduct);
        }

        List<Category> categoriesWomen = categoryDAO.getCategoriesByParentID(1);
        session.setAttribute("categoriesWomen", categoriesWomen);
        List<Category> categoriesMen = categoryDAO.getCategoriesByParentID(2);
        session.setAttribute("categoriesMen", categoriesMen);
        request.getRequestDispatcher("/view/admin/manageProduct.jsp").forward(request, response);
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

        switch (action) {
            case "updateStatus":
                getStatusProduct(request, response);
                break;
            case "editProduct":
                editProduct(request);
                break;
//            case "filterProduct":
//                filterProduct(request, pagecontrol);
//                break;
            default:
                throw new AssertionError();
        }
        request.getRequestDispatcher("/view/admin/manageProduct.jsp").forward(request, response);

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

    private List<Product> pageProduct(HttpServletRequest request, PageControl pagecontrol) {
        String pageRaw = request.getParameter("page");
        int page;
        try {
            page = Integer.parseInt(pageRaw);
            if (page <= 0) {
                page = 1;
            }
        } catch (NumberFormatException e) {
            page = 1;
        }
        int pageSize = 9;
        String requestURL = request.getRequestURL().toString();
        String queryString = request.getQueryString();
        pagecontrol.setUrlPattern(requestURL + "?");

        int totalRecord = productDAO.getTotalRecord();
        List<Product> productList = productDAO.listAllProduct(page, pageSize);

        int totalPage = (totalRecord % pageSize) == 0 ? (totalRecord / pageSize) : ((totalRecord / pageSize) + 1);

        pagecontrol.setPage(page);
        pagecontrol.setTotalPage(totalPage);
        pagecontrol.setTotalRecord(totalRecord);

        request.setAttribute("pageControl", pagecontrol);

        return productList;

    }

    private void getStatusProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        int status = Integer.parseInt(request.getParameter("status"));
        boolean updated = productDAO.updateProductStatus(productId, status);
        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//        response.getWriter().write("{\"success\":" + updated + "}");
    }

    private void editProduct(HttpServletRequest request) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            String info = request.getParameter("description");
            int status = Integer.parseInt(request.getParameter("status"));
            int categoryID = Integer.parseInt(request.getParameter("category"));
            String img = request.getParameter("currentImage");

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
            Part part = request.getPart("image");
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
            product.setBriefInfomation(info);
            product.setStatus(status);
            product.setCateID(category);

            productDAO.updateProduct(product);

        } catch (ServletException | IOException | NumberFormatException e) {
            e.printStackTrace();
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

    private List<Product> sortProduct(HttpServletRequest request, PageControl pagecontrol) {
        String sortBy = request.getParameter("sort");
        String pageRaw = request.getParameter("page");
        int page;
        try {
            page = Integer.parseInt(pageRaw);
            if (page <= 0) {
                page = 1;
            }
        } catch (NumberFormatException e) {
            page = 1;
        }
        int pageSize = 9;
        String requestURL = request.getRequestURL().toString();
        String queryString = request.getQueryString();
        pagecontrol.setUrlPattern(requestURL + "?sort=" + sortBy + "&");
        List<Product> productList;
        int totalRecord;
        int totalPage;
        switch (sortBy) {
            case "title":
                productList = productDAO.getSortedProducts("title", page, pageSize);
                break;
            case "category":
                productList = productDAO.getSortedProducts("category", page, pageSize);
                break;
            case "price":
                productList = productDAO.getSortedProducts("price", page, pageSize);
                break;
            case "sale":
                productList = productDAO.getSortedProducts("sale", page, pageSize);
                break;
            case "feature":
                productList = productDAO.getSortedProducts("featured", page, pageSize);
                break;
            case "status":
                productList = productDAO.getSortedProducts("status", page, pageSize);
                break;
            default:
                productList = productDAO.listAll(page, pageSize);
                break;
        }

        totalRecord = productDAO.getTotalRecord();
        totalPage = (totalRecord % pageSize) == 0 ? (totalRecord / pageSize) : ((totalRecord / pageSize) + 1);

        pagecontrol.setPage(page);
        pagecontrol.setTotalPage(totalPage);
        pagecontrol.setTotalRecord(totalRecord);

        return productList;
    }

    private void filterProduct(HttpServletRequest request, PageControl pageControl) {
        HttpSession session = request.getSession();
        String pageRaw = request.getParameter("page");
        int page;
        try {
            page = Integer.parseInt(pageRaw);
            if (page <= 0) {
                page = 1;
            }
        } catch (NumberFormatException e) {
            page = 1;
        }

        int pageSize = 9;
        StringBuilder requestURL = new StringBuilder(request.getRequestURL().toString());
        requestURL.append("?action=filterProduct");

        Map<String, String[]> parameterMap = request.getParameterMap();
        for (Map.Entry<String, String[]> entry : parameterMap.entrySet()) {
            String key = entry.getKey();
            String[] values = entry.getValue();
            if (!key.equals("page")) { // Skip the 'page' parameter for now
                for (String value : values) {
                    requestURL.append("&").append(key).append("=").append(value);
                }
            }
        }
        requestURL.append("&");

        pageControl.setUrlPattern(requestURL.toString());

        int minPrice;
        try {
            minPrice = Integer.parseInt(request.getParameter("priceMin"));
        } catch (NumberFormatException e) {
            minPrice = 0;
        }

        int maxPrice;
        try {
            maxPrice = Integer.parseInt(request.getParameter("priceMax"));
        } catch (NumberFormatException e) {
            maxPrice = 0;
        }

        String search = request.getParameter("search");

        String statusStr = request.getParameter("status");
        int status = -1;
        if (statusStr != null && !statusStr.isEmpty()) {
            status = "active".equals(statusStr) ? 1 : 0;
        }

        int subCategory;
        try {
            subCategory = Integer.parseInt(request.getParameter("subCategory"));
        } catch (NumberFormatException e) {
            subCategory = -1;
        }

        List<Product> listProduct = productDAO.filterProduct(page, pageSize, minPrice, maxPrice, search, status, subCategory);
        System.out.println(listProduct);
        int totalRecord = productDAO.getTotalFilteredRecord(minPrice, maxPrice, search, status, subCategory);
        System.out.println(totalRecord);
        int totalPage = (totalRecord % pageSize) == 0 ? (totalRecord / pageSize) : ((totalRecord / pageSize) + 1);
        pageControl.setPage(page);
        pageControl.setTotalPage(totalPage);
        pageControl.setTotalRecord(totalRecord);

        request.setAttribute("manageProduct", listProduct);
        request.setAttribute("pageControl", pageControl);
        System.out.println(pageControl);

    }
}
