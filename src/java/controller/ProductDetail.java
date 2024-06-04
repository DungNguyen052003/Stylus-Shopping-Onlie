/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.sun.jdi.connect.spi.Connection;
import context.DBContext;
import dao.CategoryDAO;
import dao.ColorDAO;
import dao.FeedBackDAO;
import dao.ProductDAO;
import dao.ProductDAO.ProductSaleInfo;
import dao.ProductImageDAO;
import dao.SizeDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.List;
import model.Category;
import model.Product;
import java.sql.SQLException;
import model.Color;
import model.FeedBack;
import model.ProductImage;
import model.Size;

/**
 *
 * @author 84976
 */
@WebServlet(name = "ProductDetail", urlPatterns = {"/productdetail"})

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
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            Product products = new ProductDAO().get(productId);
            Category category = new CategoryDAO().get(products.getCateID().getCateID());
            List<FeedBack> feedBack = new FeedBackDAO().getFeedbacksByProductId(products.getProductID());
            List<Size> size = new SizeDAO().get(products.getProductID());
            List<FeedBack> listFB = new FeedBackDAO().get(products.getProductID());
            List<Product> listProduct = new ProductDAO().getProductByCategory(products.getCateID().getCateID());
            List<Color> color = new ColorDAO().getColorsByProductID(products.getProductID());
            List<ProductImage> productimg = new ProductImageDAO().get(products.getProductID());
            List<ProductSaleInfo> productSaleInfos = new ProductDAO().getProductsByCampain(products.getCampainID());
            List<Product> latestProducts = new ProductDAO().getLatestProductsFromDatabase(products.getCateID().getCateID());
            
            request.setAttribute("productSaleInfos", productSaleInfos);
            request.setAttribute("categoriesWomen", new CategoryDAO().getCategoriesByParentID(1));
            request.setAttribute("categoriesMen", new CategoryDAO().getCategoriesByParentID(2));
            request.setAttribute("products", products);
            request.setAttribute("productList", productimg);
            request.setAttribute("color", color);
            request.setAttribute("size", size);
            request.setAttribute("listFB", listFB);
            request.setAttribute("listProduct", listProduct);
            request.setAttribute("category", category);
            request.setAttribute("feedback", feedBack);
            request.setAttribute(("latestProducts"), latestProducts);
            request.getRequestDispatcher("/view/customer/productDetail.jsp").forward(request, response);

            String categoryIdStr = request.getParameter("categoryId");
            if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
                try {
                    int categoryId = Integer.parseInt(categoryIdStr);
                    List<Product> productList = new ProductDAO().findProductByCategory(categoryId);
                    request.setAttribute("productList", productList);
                    //response.sendRedirect("productlist?categoryId=" + categoryIdStr);

                    request.getRequestDispatcher("view/customer/productlist.jsp").forward(request, response);

                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    // Xử lý khi tham số không phải là một số nguyên hợp lệ
                }
            }

            String keyword = request.getParameter("keyword");
            if (keyword == null || keyword.isEmpty()) {
                List<Product> productLists = new ProductDAO().getAll();
                request.setAttribute("productLists", productLists);
            } else {
                List<Product> findProduct = new ProductDAO().findByName(keyword);
                request.setAttribute("findProduct", findProduct);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            //response.sendRedirect("error.jsp");
        }
        request.getRequestDispatcher("view/customer/productDetail.jsp").forward(request, response);
    }

//    public ProductDetail() {
//    }
    public static void main(String[] args) {
         Product products = new ProductDAO().get(1);
        List<Product> latestProducts = new ProductDAO().getLatestProductsFromDatabase(products.getCateID().getCateID());
        for(Product pd : latestProducts){
            System.out.println(pd);
        }
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
