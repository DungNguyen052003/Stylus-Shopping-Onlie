/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.AdminDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author ngock
 */
public class AdminDashBoard extends HttpServlet {

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
            out.println("<title>Servlet AdminDashBoard</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminDashBoard at " + request.getContextPath() + "</h1>");
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
        AdminDAO a = new AdminDAO();
        int newSuccessOrders = a.getNewOrderCountByStatus(5);
        int newCancelledOrders = a.getNewOrderCountByStatus(6);
        int newSubmittedOrders = a.getSubmittedOrderCount();
        BigDecimal totalRevenue = a.getTotalRevenue();
        double averageFeedbackStars = a.getAverageFeedbackStars();
        int totalOrders = a.getTotalOrderCount();
        int totalFeedbacks = a.getTotalFeedbackCount();
        int totalCustomers = a.getTotalCustomerCount();
        Map<String, BigDecimal> revenueByCategory = a.getRevenueByCategory();
        Map<String, Integer> newlyRegisteredCustomersCountByDay = a.getNewlyRegisteredCustomersCountByDay();
        Map<String, Integer> newlyBoughtCustomersCountByDay = a.getNewlyBoughtCustomersCountByDay();
        Map<String, Double> avgStarsByCategory = a.getAverageFeedbackStarsByCategory();

        // Default date range for order trends
        LocalDate endLocalDate = LocalDate.now();
        LocalDate startLocalDate = endLocalDate.minusDays(6);
        String startDate = startLocalDate.toString();
        String endDate = endLocalDate.toString();

        // Check for filter parameters for the order trend chart
        String startDateParam = request.getParameter("startDate");
        String endDateParam = request.getParameter("endDate");

        if (startDateParam != null && !startDateParam.isEmpty()) {
            startDate = startDateParam;
            startLocalDate = LocalDate.parse(startDateParam);
            endDate = startLocalDate.plusDays(6).toString();
        }

        // Fetching filtered order trend
        Map<String, Map<String, Integer>> orderTrend = new HashMap<>();
        try {
            orderTrend = a.getOrderTrend(startDate, endDate);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        List<String> last7DaysForOrderTrend = new ArrayList<>();
        LocalDate current = LocalDate.parse(startDate);
        while (!current.isAfter(LocalDate.parse(endDate))) {
            last7DaysForOrderTrend.add(current.toString());
            current = current.plusDays(1);
        }
        List<String> last7DaysForOtherCharts = new ArrayList<>();
        LocalDate currentOtherCharts = LocalDate.now().minusDays(6);
        while (!currentOtherCharts.isAfter(LocalDate.now())) {
            last7DaysForOtherCharts.add(currentOtherCharts.toString());
            currentOtherCharts = currentOtherCharts.plusDays(1);
        }
        request.setAttribute("startDate", startDate);
        request.setAttribute("endDate", endDate);
        request.setAttribute("orderTrend", orderTrend);
        request.setAttribute("last7DaysForOrderTrend", last7DaysForOrderTrend);
        request.setAttribute("newSuccessOrders", newSuccessOrders);
        request.setAttribute("totalOrders", totalOrders);
        request.setAttribute("totalFeedbacks", totalFeedbacks);
        request.setAttribute("totalCustomers", totalCustomers);
        request.setAttribute("newCancelledOrders", newCancelledOrders);
        request.setAttribute("newSubmittedOrders", newSubmittedOrders);
        request.setAttribute("totalRevenue", totalRevenue);
        request.setAttribute("newCustomers", newlyRegisteredCustomersCountByDay);
        request.setAttribute("newlyBoughtCustomers", newlyBoughtCustomersCountByDay);
        request.setAttribute("avgFeedbackStars", averageFeedbackStars);
        request.setAttribute("revenueByCategory", revenueByCategory);
        request.setAttribute("avgStarsByCategory", avgStarsByCategory);
        request.setAttribute("last7DaysForOtherCharts", last7DaysForOtherCharts);
        request.getRequestDispatcher("/view/admin/adminDashboard.jsp").forward(request, response);
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
//String startDate = LocalDate.now().minusDays(6).toString();
//    String endDate = LocalDate.now().toString();
