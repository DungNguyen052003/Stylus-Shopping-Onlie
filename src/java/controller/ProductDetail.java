/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.FeedBackDAO;
import dao.ProductDAO;
import dao.ProductDetailsDAO;
import dao.ProductImageDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Product;
import model.FeedBack;
import model.ProductDetails;
import model.ProductImage;

/**
 *
 * @author 84976
 */
public class ProductDetail extends HttpServlet {

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
            out.println("<title>Servlet ProductDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductDetail at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));
        Product products = new ProductDAO().getProductById(productId);
        List<FeedBack> feedBack = new FeedBackDAO().getFeedbacksByProductId(productId);
        List<ProductImage> productimg = new ProductImageDAO().get(products.getProductID());
        List<Product> latestProducts = new ProductDAO().getLatestProductsFromDatabase(products.getCateID().getCateID());
        request.setAttribute("categoriesWomen", new CategoryDAO().getCategoriesByParentID(1));
        request.setAttribute("categoriesMen", new CategoryDAO().getCategoriesByParentID(2));
        request.setAttribute("products", products);
        request.setAttribute("productList", productimg);
        request.setAttribute("listFB", feedBack);
        request.setAttribute(("latestProducts"), latestProducts);
        ProductDetailsDAO pdDAO = new ProductDetailsDAO();
        List<ProductDetails> detailList = pdDAO.getDetailByProductID(productId);
        request.setAttribute("detailList", detailList);
        request.getRequestDispatcher("/view/customer/productDetail.jsp").forward(request, response);

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

        request.getRequestDispatcher("./view/customer/productDetail.jsp").forward(request, response);
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

}
