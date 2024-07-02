/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.marketer;

import dao.StatisticsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 *
 * @author ngock
 */
public class MktDashboard extends HttpServlet {

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
            out.println("<title>Servlet MktDashboard</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MktDashboard at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StatisticsDAO dao = new StatisticsDAO();

        int postCount = 0;
        int productCount = 0;
        int customerCount = 0;
        int feedbackCount = 0;

        // Fetching other data without filters
        try {
            postCount = dao.getNumberOfBlogs();
            productCount = dao.getNumberOfProducts();
            customerCount = dao.getNumberOfCustomers();
            feedbackCount = dao.getNumberOfFeedbacks();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Default date range for new customers trend
        LocalDate endLocalDate = LocalDate.now();
        LocalDate startLocalDate = endLocalDate.minusDays(6);
        String startDate = startLocalDate.toString();
        String endDate = endLocalDate.toString();

        // Check for filter parameters for the new customers trend chart
        String startDateParam = request.getParameter("startDate");
        String endDateParam = request.getParameter("endDate");

        if (startDateParam != null && !startDateParam.isEmpty()) {
            startDate = startDateParam;
            startLocalDate = LocalDate.parse(startDateParam);
            endDate = startLocalDate.plusDays(6).toString();
        }
        // Fetching filtered new customers trend
        Map<String, Integer> trend = new HashMap<>();
        try {
            trend = dao.getNewCustomersTrend(startDate, endDate);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        List<String> last7DaysForNewCustomers = new ArrayList<>();
        LocalDate current = LocalDate.parse(startDate);
        while (!current.isAfter(LocalDate.parse(endDate))) {
            last7DaysForNewCustomers.add(current.toString());
            current = current.plusDays(1);
        }

        // Setting attributes for JSP
        request.setAttribute("startDate", startDate);
        request.setAttribute("endDate", endDate);
        request.setAttribute("newCustomersTrend", trend);
        request.setAttribute("last7DaysForNewCustomers", last7DaysForNewCustomers);

        // Setting other attributes for unfiltered data
        request.setAttribute("postCount", postCount);
        request.setAttribute("productCount", productCount);
        request.setAttribute("customerCount", customerCount);
        request.setAttribute("feedbackCount", feedbackCount);

        request.getRequestDispatcher("/view/marketing/mktDashboard.jsp").forward(request, response);
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

//StatisticsDAO dao = new StatisticsDAO();
//
//int postCount = 0;
//int productCount = 0;
//int customerCount = 0;
//int feedbackCount = 0;
//List<CustomerTrend> newCustomersTrend = new ArrayList<>();
//
//String startDate = request.getParameter("startDate");
//String endDate = request.getParameter("endDate");
//
//LocalDate start;
//LocalDate end;
//
//if (startDate == null || endDate == null) {
//    // If start date or end date is not provided, get the last 7 days
//    end = LocalDate.now();
//    start = end.minusDays(6);
//} else {
//    start = LocalDate.parse(startDate);
//    end = LocalDate.parse(endDate);
//}
//
//// Ensure we only fetch data for the 7-day range from the provided start date
//end = start.plusDays(6);
//
//try {
//    postCount = dao.getNumberOfBlogs();
//    productCount = dao.getNumberOfProducts();
//    customerCount = dao.getNumberOfCustomers();
//    feedbackCount = dao.getNumberOfFeedbacks();
//    newCustomersTrend = dao.getNewCustomersTrend(start.toString() + " 00:00:00", end.toString() + " 23:59:59");
//
//    // Create a list of dates within the range and initialize counts to 0
//    List<CustomerTrend> trendList = new ArrayList<>();
//    for (LocalDate date = start; !date.isAfter(end); date = date.plusDays(1)) {
//        trendList.add(new CustomerTrend(date.toString(), 0));
//    }
//
//    // Update the list with actual counts from the database
//    for (CustomerTrend trend : newCustomersTrend) {
//        for (CustomerTrend t : trendList) {
//            if (t.getDate().equals(trend.getDate())) {
//                t.setCount(trend.getCount());
//                break;
//            }
//        }
//    }
//
//    newCustomersTrend = trendList;
//
//} catch (SQLException e) {
//    e.printStackTrace();
//}
