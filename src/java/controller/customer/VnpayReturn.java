/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import com.vnpay.common.Config;
import dao.CartDAO;
import dao.OrderDaoForSale;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author acer
 */
public class VnpayReturn extends HttpServlet {

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
            out.println("<title>Servlet VnpayReturn</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VnpayReturn at " + request.getContextPath() + "</h1>");
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
        Map fields = new HashMap();
        for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
            String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
            String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                fields.put(fieldName, fieldValue);
            }
        }
        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
        if (fields.containsKey("vnp_SecureHashType")) {
            fields.remove("vnp_SecureHashType");
        }
        if (fields.containsKey("vnp_SecureHash")) {
            fields.remove("vnp_SecureHash");
        }
        String signValue = Config.hashAllFields(fields);
        if (signValue.equals(vnp_SecureHash)) {
            if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                CartDAO dao = new CartDAO();
                HttpSession sesion = request.getSession();
                BigDecimal amount = new BigDecimal(request.getParameter("vnp_Amount"));
                Order order = (Order) sesion.getAttribute("order");
                int customerid = order.getCustomerId();
                String fullname = order.getFullName();
                String phone = order.getPhone();
                String address = order.getAddress();
                int status = order.getStatus();
                int saleID = new OrderDaoForSale().getSaleOrderLeast();
                int method = 1;
                BigDecimal adjustedAmount = amount.divide(BigDecimal.valueOf(100000));
                int orderId = dao.insertOrder(customerid, fullname, phone, address, status, adjustedAmount, saleID, method);
                List<OrderDetail> orderDetailsList = (List<OrderDetail>) sesion.getAttribute("orderDetails");
                for (OrderDetail orderDetail : orderDetailsList) {
                    dao.insertOrderDetails(orderId, orderDetail.getProductDetailID(), orderDetail.getQuantity(), orderDetail.getPrice(), orderDetail.getTotalPrice(), null, LocalDate.now());
                    dao.deleteCartAfterOrder(customerid, orderDetail.getProductDetailID());
                    dao.updateQuantityAfterOrder(orderDetail.getProductDetailID(), orderDetail.getQuantity());
                    sesion.removeAttribute("orderDetails");
                    sesion.removeAttribute("order");
                }
            } else {

            }
            request.setAttribute("status", 7);
            request.getRequestDispatcher("view/authen/verify.jsp").forward(request, response);
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
        processRequest(request, response);
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

