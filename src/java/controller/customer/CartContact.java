/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import dao.CartDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import jakarta.servlet.http.HttpSession;
import java.lang.reflect.Type;
import java.math.BigDecimal;
import model.Customer;
import model.OrderDetail;

/**
 *
 * @author acer
 */
public class CartContact extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet CartContact</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartContact at " + request.getContextPath() + "</h1>");
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
        String selectedProductsJson = request.getParameter("selectedProducts");
        double subtotal = Double.parseDouble(request.getParameter("subtotal"));
        Gson gson = new Gson();
        Type listType = new TypeToken<List<HashMap<String, String>>>() {}.getType();
        List<HashMap<String, String>> selectedProducts = gson.fromJson(selectedProductsJson, listType);

        // Tạo danh sách OrderDetail từ selectedProducts
        List<OrderDetail> orderDetailsList = new ArrayList<>();
        for (HashMap<String, String> productMap : selectedProducts) {
            try {
                int productDetailID = Integer.parseInt(String.valueOf(productMap.get("productDetailID")));
                int quantity = Integer.parseInt(String.valueOf(productMap.get("quantity")));
                BigDecimal price = new BigDecimal((String) productMap.get("price"));
                BigDecimal totalPrice = new BigDecimal((String) productMap.get("total"));

                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setProductDetailID(productDetailID);
                orderDetail.setQuantity(quantity);
                orderDetail.setPrice(price);
                orderDetail.setTotalPrice(totalPrice);

                orderDetailsList.add(orderDetail);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        HttpSession session = request.getSession();
        Customer cs = (Customer) session.getAttribute("account");
        if(cs == null){
            response.sendRedirect("Home");
        }
        List<String> address = new CartDAO().getAddress(cs.getCustomerID());
        session.setAttribute("orderDetails", orderDetailsList);
        session.setAttribute("selectedProducts", selectedProducts);
        request.setAttribute("subtotal", subtotal);
        request.setAttribute("address", address);
        request.getRequestDispatcher("view/customer/cartContact.jsp").forward(request, response);
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
