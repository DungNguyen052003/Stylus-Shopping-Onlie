/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import com.google.gson.Gson;
import dao.CartDAO;
import dao.ProductDetailsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Cart;
import model.Customer;

/**
 *
 * @author TienP
 */
public class AddToCart extends HttpServlet {

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
            out.println("<title>Servlet AddToCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCart at " + request.getContextPath() + "</h1>");
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
        Customer cs = (Customer) session.getAttribute("account");
        String productDetailId = request.getParameter("productDetailID");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int customerId = cs.getCustomerID();
        CartDAO cd = new CartDAO();
        List<Cart> list = cd.getCartProductDetails(customerId);
        ProductDetailsDAO pd = new ProductDetailsDAO();
        boolean exist = false;
        for (Cart c : list) {
            if (c.getProductDetails().getProductDetailID() == Integer.parseInt(productDetailId)) {
                cd.updateCartQuantity(c.getCartID(), quantity + c.getQuantity());
                exist = true;
                 break;
            }
        }
        if (!exist) {
            cd.insertToCart(customerId, productDetailId, quantity);
        }
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"status\": \"success\"}");

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
        HttpSession session = request.getSession();
        Customer cs = (Customer) session.getAttribute("account");
        String productDetailId = request.getParameter("productDetailID");
        System.out.println(productDetailId);
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int customerId = cs.getCustomerID();
        CartDAO cd = new CartDAO();
        List<Cart> list = cd.getCartProductDetails(customerId);
        ProductDetailsDAO pd = new ProductDetailsDAO();
        boolean exist = false;
        for (Cart c : list) {
            if (c.getProductDetails().getProductDetailID() == Integer.parseInt(productDetailId)) {
                cd.updateCartQuantity(c.getCartID(), quantity + c.getQuantity());
                exist = true;
                 break;
            }
        }
        if (!exist) {
            cd.insertToCart(customerId, productDetailId, quantity);
        }
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"status\": \"success\"}");
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
