/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import dao.ProductDetailsDAO;
import dao.ProductImageDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import model.Category;
import model.Product;
import model.ProductDetails;
import model.ProductImage;

/**
 *
 * @author ASUS
 */
public class InfoProduct extends HttpServlet {

    ProductDAO productDAO = new ProductDAO();
    CategoryDAO categoryDAO = new CategoryDAO();
    ProductDetailsDAO productDetailDAO = new ProductDetailsDAO();

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
        System.out.println(products);
        request.setAttribute("product", products);
        List<ProductImage> productImg = new ProductImageDAO().get(productId);
        request.setAttribute("productList", productImg);
        ProductDetailsDAO pdDAO = new ProductDetailsDAO();
        List<ProductDetails> detailList = pdDAO.getDetailByProductID(productId);
        System.out.println(detailList);
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
               
                updateProductDetails(request, response);
                break;
            case "updateQuantity":
                 System.out.println(request.getParameter("detailId"));
                System.out.println(request.getParameter("quantity"));
                updateQuantity(request, response);
                break;
            default:
                throw new AssertionError();
        }
        request.getRequestDispatcher("view/admin/infoProduct.jsp").forward(request, response);
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

    private void updateProductDetails(HttpServletRequest request, HttpServletResponse response) {
        int productId = Integer.parseInt(request.getParameter("productId"));
        String productName = request.getParameter("productName");
        double price = Double.parseDouble(request.getParameter("price"));
        String briefInfomation = request.getParameter("briefInfomation");
        String description = request.getParameter("description");

        // Update product information
        Product product = new Product();
        product.setProductID(productId);
        product.setProductName(productName);
        product.setPrice(price);
        product.setBriefInfomation(briefInfomation);
        product.setDescription(description);
        productDAO.updateProduct(product);

        // Update quantities
        Map<String, String[]> parameterMap = request.getParameterMap();
        for (String key : parameterMap.keySet()) {
            if (key.startsWith("quantities[")) {
                String[] parts = key.split("[\\[\\]_]");
                int sizeId = Integer.parseInt(parts[1]);
                int colorId = Integer.parseInt(parts[2]);
                int quantity = Integer.parseInt(request.getParameter(key));
                productDetailDAO.updateQuantity(productId, sizeId, colorId, quantity);
            }
        }
    }

    private void updateQuantity(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("detailId");
        String quantity = request.getParameter("quantity");
        ProductDetailsDAO pdDAO = new ProductDetailsDAO();
        pdDAO.updateQuantitybyID(id,quantity);
    }
}
