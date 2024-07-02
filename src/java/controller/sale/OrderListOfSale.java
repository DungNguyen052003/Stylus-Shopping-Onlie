/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.sale;

import dao.OrderDaoForSale;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.OrderStatus;

/**
 *
 * @author acer
 */
public class OrderListOfSale extends HttpServlet {

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
            out.println("<title>Servlet OrderListOfSale</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderListOfSale at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    OrderDaoForSale os = new OrderDaoForSale();

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
        String action = request.getParameter("action");
        if(action != null ){
            request.setAttribute("action", action);
            filterOrder(request);
        }else{
            pageOrderList(request);
        }
        
        List<OrderStatus> status = os.getListStatusOfSale();
        request.setAttribute("status", status);
        request.getRequestDispatcher("/view/sale/orderListForSale.jsp").forward(request, response);

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

    private void pageOrderList(HttpServletRequest request) {
        List<Order> orders = new ArrayList<>();
        HttpSession session = request.getSession();
        int accID = (int) session.getAttribute("accID");
        System.out.println(accID);
        orders = os.getAllOrdersOfSale(accID);

        int page = 1, numPerPage = 6;
        int size = orders.size();
        int numberpage = ((size % numPerPage == 0) ? (size / 6) : (size / 6) + 1);
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * 6;
        end = Math.min(page * numPerPage, size);

        List<Order> saleOrder = os.getOrderListByPage(orders, start, end);
        request.setAttribute("saleOrder", saleOrder);
        request.setAttribute("page", page);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.setAttribute("numberpage", numberpage);
    }
    private void filterOrder(HttpServletRequest request) {
        String statusId = request.getParameter("statusId");
        String orderId = request.getParameter("orderId");
        List<Order> orders = new ArrayList<>();
        HttpSession session = request.getSession();
        int accID = (int) session.getAttribute("accID");
        System.out.println(accID);
        if(statusId != null  && !statusId.equals("all")){
            orders = os.getOrdersOfSaleByStatus(accID, statusId);
            request.setAttribute("statusId", statusId);
        }else if(orderId != null && !orderId.isBlank()){
             orders = os.getOrdersOfSaleByOrderId(accID, orderId);
            request.setAttribute("orderId", orderId);
        }else{
            orders = os.getAllOrdersOfSale(accID);
        }
        int page = 1, numPerPage = 6;
        int size = orders.size();
        int numberpage = ((size % numPerPage == 0) ? (size / numPerPage) : (size / numPerPage) + 1);
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numPerPage;
        end = Math.min(page * numPerPage, size);

        List<Order> saleOrder = os.getOrderListByPage(orders, start, end);
        request.setAttribute("saleOrder", saleOrder);
        request.setAttribute("page", page);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.setAttribute("numberpage", numberpage);
    }
    
}
