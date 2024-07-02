/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.sale;

import dao.OrderDetailDAO;
import dao.orderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import model.Order;

/**
 *
 * @author 84976
 */
public class SaleDashBoard extends HttpServlet {

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
            out.println("<title>Servlet SaleDashBoard</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SaleDashBoard at " + request.getContextPath() + "</h1>");
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
    //
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        orderDAO orderDAO = new orderDAO();
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();

        String view = request.getParameter("view");
        view = (view == null) ? "dashboard" : view;

        // Setting common attributes
        int totalOrders = orderDAO.countOrders();
        int canceledOrders = orderDAO.countCancelOrder();
        double totalAmount = orderDAO.sumAllMoneyOrder();
        int totalProducts = orderDetailDAO.totalProductsOrdered();
        int totalCustomers = orderDAO.totalCustomersOrdered();

        request.setAttribute("totalOrders", totalOrders);
        request.setAttribute("canceledOrders", canceledOrders);
        request.setAttribute("totalAmount", totalAmount);
        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("totalCustomers", totalCustomers);

        String year_raw = request.getParameter("year");
        String month_raw = request.getParameter("month");
        String from_raw = request.getParameter("from");
        String to_raw = request.getParameter("to");

        LocalDate currentDate = LocalDate.now();
        LocalDate startOfWeek = currentDate.with(DayOfWeek.MONDAY);
        LocalDate endOfWeek = startOfWeek.plusDays(6);

        int year = (year_raw == null ? currentDate.getYear() : Integer.parseInt(year_raw));
        int month = (month_raw == null ? startOfWeek.getMonthValue() : Integer.parseInt(month_raw));
        int from = (from_raw == null ? startOfWeek.getDayOfMonth() : Integer.parseInt(from_raw));
        int to = (to_raw == null ? endOfWeek.getDayOfMonth() : Integer.parseInt(to_raw));
        String[] daysOfWeek = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};

        // Assuming `orderDAO.totalMoneyWeek(from, to, year, month)` returns a LinkedHashMap
        Map<String, Object[]> amountWeeklyData = orderDAO.totalMoneyWeek(from, to, year, month);

        double[] amountOrdersWeek = new double[7];
        String[] orderDatesWeek = new String[7];

        for (int i = 0; i < 7; i++) {
            String day = daysOfWeek[i];
            if (amountWeeklyData.containsKey(day)) {
                Object[] data = amountWeeklyData.get(day);
                java.sql.Date orderDate = (java.sql.Date) data[0];
                Double totalAmountFromDB = (Double) data[1]; // Use a different variable name here
                amountOrdersWeek[i] = totalAmountFromDB; // Store the total amount
                orderDatesWeek[i] = orderDate.toString(); // Convert date to string for JavaScript
            } else {
                amountOrdersWeek[i] = 0;
                orderDatesWeek[i] = "";
            }
            request.setAttribute("orderDate" + (i + 1), orderDatesWeek[i]);
            request.setAttribute("amountOrders" + (i + 1), amountOrdersWeek[i]);
        }

        // Fetching data for order statuses
        Map<String, Object[]> weeklyData = orderDAO.getCancelledAndTotalOrdersLast7Days(from, to, year, month);

        double[] successfulOrdersWeek = new double[7];
        double[] cancelledOrdersWeek = new double[7];
        double[] pendingOrdersWeek = new double[7];
        double[] processingOrdersWeek = new double[7];

        for (int i = 0; i < 7; i++) {
            String day = daysOfWeek[i];
            if (weeklyData.containsKey(day)) {
                Object[] result = weeklyData.get(day);
                Date orderDate = (Date) result[0];
                double[] orderCounts = (double[]) result[1];
                successfulOrdersWeek[i] = orderCounts[0];
                cancelledOrdersWeek[i] = orderCounts[1];
                pendingOrdersWeek[i] = orderCounts[2];
                processingOrdersWeek[i] = orderCounts[3];
                orderDatesWeek[i] = orderDate.toString();
            } else {
                successfulOrdersWeek[i] = 0;
                cancelledOrdersWeek[i] = 0;
                pendingOrdersWeek[i] = 0;
                processingOrdersWeek[i] = 0;
            }
            request.setAttribute("orderDate" + (i + 1), orderDatesWeek[i]);
            request.setAttribute("successfulOrders" + (i + 1), successfulOrdersWeek[i]);
            request.setAttribute("cancelledOrders" + (i + 1), cancelledOrdersWeek[i]);
            request.setAttribute("pendingOrders" + (i + 1), pendingOrdersWeek[i]);
            request.setAttribute("processingOrders" + (i + 1), processingOrdersWeek[i]);
        }

        switch (view) {
            case "details":
                List<Order> orders = orderDAO.getTotalOrders();
                request.setAttribute("orders", orders);
                break;

            case "cancelled":
                List<Order> canceledOrderList = orderDAO.getCanceledOrders();
                request.setAttribute("canceledOrders", canceledOrderList);
                break;
        }

        request.setAttribute("view", view);
        request.getRequestDispatcher("view/sale/saleDashBoard.jsp").forward(request, response);
    }

//    private void processTotalOrder(HttpServletRequest request, orderDAO dao) {
//        String year_raw = request.getParameter("year");
//        String month_raw = request.getParameter("month");
//        String from_raw = request.getParameter("from");
//        String to_raw = request.getParameter("to");
//
//        LocalDate currentDate = LocalDate.now();
//        LocalDate startOfWeek = currentDate.with(DayOfWeek.MONDAY);
//        LocalDate endOfWeek = startOfWeek.plusDays(6);
//
//        int year = (year_raw == null ? currentDate.getYear() : Integer.parseInt(year_raw));
//        int month = (month_raw == null ? startOfWeek.getMonthValue() : Integer.parseInt(month_raw));
//        int from = (from_raw == null ? startOfWeek.getDayOfMonth() : Integer.parseInt(from_raw));
//        int to = (to_raw == null ? endOfWeek.getDayOfMonth() : Integer.parseInt(to_raw));
//
//        double[] totalMoneyWeek = new double[7];
//        for (int i = 1; i <= 7; i++) {
//            totalMoneyWeek[i - 1] = dao.totalMoneyWeek(i, from, to, year, month);
//        }
//
//        for (int i = 1; i <= 7; i++) {
//            request.setAttribute("totalMoney" + i, totalMoneyWeek[i - 1]);
//        }
//        request.setAttribute("year", year);
//    }
//    private void processSuccessOrder(HttpServletRequest request, orderDAO dao) {
//        List<Integer> ordersCount = dao.getSuccessAndTotalOrdersLast7Days();
//        List<Integer> totalOrders = new ArrayList<>();
//        List<Integer> totalDelivered = new ArrayList<>();
//
//        for (int i = 0; i < ordersCount.size(); i += 2) {
//            totalDelivered.add(ordersCount.get(i));
//            totalOrders.add(ordersCount.get(i + 1));
//        }
//
//        request.setAttribute("totalDelivered", totalDelivered);
//        request.setAttribute("totalOrders", totalOrders);
//    }
//    private void processCancelledOrder(HttpServletRequest request, HttpServletResponse response, orderDAO dao)
//        throws ServletException, IOException {
//    String year_raw = request.getParameter("year");
//    String month_raw = request.getParameter("month");
//    String from_raw = request.getParameter("from");
//    String to_raw = request.getParameter("to");
//
//    LocalDate currentDate = LocalDate.now();
//    LocalDate startOfWeek = currentDate.with(DayOfWeek.MONDAY);
//    LocalDate endOfWeek = startOfWeek.plusDays(6);
//
//    int year = (year_raw == null ? currentDate.getYear() : Integer.parseInt(year_raw));
//    int month = (month_raw == null ? startOfWeek.getMonthValue() : Integer.parseInt(month_raw));
//    int from = (from_raw == null ? startOfWeek.getDayOfMonth() : Integer.parseInt(from_raw));
//    int to = (to_raw == null ? endOfWeek.getDayOfMonth() : Integer.parseInt(to_raw));
//
//    double[] successfulOrdersWeek = new double[7];
//    double[] cancelledOrdersWeek = new double[7];
//    double[] totalOrdersWeek = new double[7];
//
//    for (int i = 0; i < 7; i++) {
//        double[] result = dao.getCancelledAndTotalOrdersLast7Days(i + 1, from, to, year, month);
//        successfulOrdersWeek[i] = result[0];
//        cancelledOrdersWeek[i] = result[1];
//        totalOrdersWeek[i] = result[2];
//    }
//
//    for (int i = 0; i < 7; i++) {
//        request.setAttribute("successfulOrders" + (i + 1), successfulOrdersWeek[i]);
//        request.setAttribute("cancelledOrders" + (i + 1), cancelledOrdersWeek[i]);
//        request.setAttribute("totalOrders" + (i + 1), totalOrdersWeek[i]);
//    }
//    request.setAttribute("year", year);
//    request.getRequestDispatcher("view/admin/barChart.jsp").forward(request, response);
//}
//    private void processCancelledOrder(HttpServletRequest request, orderDAO dao) {
//        List<Integer> ordersCounts = dao.getCancelledAndTotalOrdersLast7Days();
//        List<Integer> totalOrders = new ArrayList<>();
//        List<Integer> totalCancelled = new ArrayList<>();
//
//        for (int i = 0; i < ordersCounts.size(); i += 2) {
//            totalCancelled.add(ordersCounts.get(i));
//            totalOrders.add(ordersCounts.get(i + 1));
//        }
//
//        request.setAttribute("totalOrders", totalOrders);
//        request.setAttribute("totalCancelled", totalCancelled);
//    }
    private void processOrderStatus(HttpServletRequest request, orderDAO dao) {
        String id_raw = request.getParameter("id");
        if (id_raw != null && !id_raw.isEmpty()) {
            //  orderDAO od = new orderDAO();
            int orderId = Integer.parseInt(id_raw);
            // Update order status to "Delivered"
            dao.updateOrderStatus(orderId);
            // Reload updated order status list
        } else {
            // Handle case where id parameter is missing or invalid

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
