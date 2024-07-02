
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.CustomerDAO;
import dao.RoleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;
import model.Customer;
import model.PageControl;
import model.Role;

import java.util.List;

/**
 *
 * @author ASUS
 */
public class CustomerList extends HttpServlet {

    CustomerDAO customerDAO = new CustomerDAO();
    RoleDAO roleDAO = new RoleDAO();

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
            out.println("<title>Servlet CustomerList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerList at " + request.getContextPath() + "</h1>");
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
        PageControl pageControl = new PageControl();
        request.setAttribute("pageControl", pageControl);

        List<Role> listRole = roleDAO.listRole();
        request.setAttribute("listRole", listRole);

        List<Customer> listCustomer = pageCustomer(request, pageControl);
        String sortBy = request.getParameter("sort");
        if (sortBy != null && !sortBy.isEmpty()) {
            listCustomer = sortCustomer(request, pageControl);
        }
        request.setAttribute("listCustomer", listCustomer);
        String action = request.getParameter("action");
        System.out.println("Action do get: " + action);
        if ("filterCustomer".equals(action)) {
            filterCustomer(request, pageControl);
        } else if ("searchUsers".equals(action)) {
            searchUsers(request, pageControl);
        }

        request.getRequestDispatcher("view/admin/customerList.jsp").forward(request, response);
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
        switch (action) {
            case "statusCustomer":
                getStatusCustomer(request, response);
                break;
            default:
                throw new AssertionError();
        }
        request.getRequestDispatcher("view/admin/customerList.jsp").forward(request, response);
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

    private List<Customer> pageCustomer(HttpServletRequest request, PageControl pageControl) {
        String pageRaw = request.getParameter("page");
        int page;
        try {
            page = Integer.parseInt(pageRaw);
            if (page <= 0) {
                page = 1;
            }
        } catch (NumberFormatException e) {
            page = 1;
        }
        int pageSize = 5;
        String requestURL = request.getRequestURL().toString();
        pageControl.setUrlPattern(requestURL + "?");

        int totalRecord = customerDAO.getTotalRecord();
        List<Customer> listAccount = customerDAO.getAllCustomer(page, pageSize);
        System.out.println(listAccount);

        int totalPage = (totalRecord % pageSize) == 0 ? (totalRecord / pageSize) : ((totalRecord / pageSize) + 1);

        pageControl.setPage(page);
        pageControl.setTotalPage(totalPage);
        pageControl.setTotalRecord(totalRecord);

        request.setAttribute("pageControl", pageControl);
        return listAccount;
    }

    private void getStatusCustomer(HttpServletRequest request, HttpServletResponse response) {
        int customerId = Integer.parseInt(request.getParameter("id"));
        int status = Integer.parseInt(request.getParameter("status"));
        boolean updated = customerDAO.updateCustomerStatus(customerId, status);
        response.setContentType("application/json");
    }

    private void searchUsers(HttpServletRequest request, PageControl pageControl) {
        String pageRaw = request.getParameter("page");
        int page;
        try {
            page = Integer.parseInt(pageRaw);
            if (page <= 0) {
                page = 1;
            }
        } catch (NumberFormatException e) {
            page = 1;
        }

        int pageSize = 5;
        StringBuilder requestURL = new StringBuilder(request.getRequestURL().toString());
        requestURL.append("?action=searchUsers");

        Map<String, String[]> parameterMap = request.getParameterMap();
        for (Map.Entry<String, String[]> entry : parameterMap.entrySet()) {
            String key = entry.getKey();
            String[] values = entry.getValue();
            if (!key.equals("page")) { // Skip the 'page' parameter for now
                for (String value : values) {
                    requestURL.append("&").append(key).append("=").append(value);
                }
            }
        }
        requestURL.append("&");

        pageControl.setUrlPattern(requestURL.toString());
        String search = request.getParameter("search");
        List<Customer> listCustomer = customerDAO.searchUser(page, pageSize, search);
        int totalRecord = customerDAO.getTotalRecordBySearchUser(search);
        int totalPage = (totalRecord % pageSize) == 0 ? (totalRecord / pageSize) : ((totalRecord / pageSize) + 1);
        pageControl.setPage(page);
        pageControl.setTotalPage(totalPage);
        pageControl.setTotalRecord(totalRecord);
        request.setAttribute("listCustomer", listCustomer);
        request.setAttribute("pageControl", pageControl);
    }

    private List<Customer> sortCustomer(HttpServletRequest request, PageControl pageControl) {
        String sortBy = request.getParameter("sort");
        String pageRaw = request.getParameter("page");
        int page;
        try {
            page = Integer.parseInt(pageRaw);
            if (page <= 0) {
                page = 1;
            }
        } catch (NumberFormatException e) {
            page = 1;
        }
        int pageSize = 5;
        String requestURL = request.getRequestURL().toString();
        String queryString = request.getQueryString();
        pageControl.setUrlPattern(requestURL + "?sort=" + sortBy + "&");
        List<Customer> customerList;
        int totalRecord;
        int totalPage;
        switch (sortBy) {
            case "id":
                customerList = customerDAO.getSortedCustomer("id", page, pageSize);
                break;
            case "name":
                customerList = customerDAO.getSortedCustomer("name", page, pageSize);
                break;
            case "gender":
                customerList = customerDAO.getSortedCustomer("gender", page, pageSize);
                break;
            case "email":
                customerList = customerDAO.getSortedCustomer("email", page, pageSize);
                break;
            case "status":
                customerList = customerDAO.getSortedCustomer("status", page, pageSize);
                break;
            default:
                customerList = customerDAO.getAllCustomer(page, pageSize);
                break;
        }
        System.out.println("CustomerList: " + customerList);
        totalRecord = customerDAO.getTotalRecord();
        totalPage = (totalRecord % pageSize) == 0 ? (totalRecord / pageSize) : ((totalRecord / pageSize) + 1);

        pageControl.setPage(page);
        pageControl.setTotalPage(totalPage);
        pageControl.setTotalRecord(totalRecord);
        return customerList;
    }

    private void filterCustomer(HttpServletRequest request, PageControl pageControl) {
        String pageRaw = request.getParameter("page");
        int page;
        try {
            page = Integer.parseInt(pageRaw);
            if (page <= 0) {
                page = 1;
            }
        } catch (NumberFormatException e) {
            page = 1;
        }

        int pageSize = 5;
        StringBuilder requestURL = new StringBuilder(request.getRequestURL().toString());
        requestURL.append("?action=filterCustomer");

        Map<String, String[]> parameterMap = request.getParameterMap();
        for (Map.Entry<String, String[]> entry : parameterMap.entrySet()) {
            String key = entry.getKey();
            String[] values = entry.getValue();
            if (!key.equals("page")) { // Skip the 'page' parameter for now
                for (String value : values) {
                    requestURL.append("&").append(key).append("=").append(value);
                }
            }
        }
        requestURL.append("&");

        pageControl.setUrlPattern(requestURL.toString());

        String genderStr = request.getParameter("gender");
        int gender = -1;
        if (genderStr != null && !genderStr.isEmpty()) {
            try {
                gender = Integer.parseInt(genderStr);
            } catch (NumberFormatException e) {
                gender = -1; // Invalid gender value
            }
        }

        String statusStr = request.getParameter("status");
        int status = -1;
        if (statusStr != null && !statusStr.isEmpty()) {
            status = "active".equals(statusStr) ? 1 : 0;
        }

        List<Customer> listCustomer = customerDAO.filterCustomer(page, pageSize, gender, status);
        int totalRecord = customerDAO.getTotalFilteredRecord(gender, status);
        int totalPage = (totalRecord % pageSize) == 0 ? (totalRecord / pageSize) : ((totalRecord / pageSize) + 1);
        pageControl.setPage(page);
        pageControl.setTotalPage(totalPage);
        pageControl.setTotalRecord(totalRecord);
        request.setAttribute("listCustomer", listCustomer);
        request.setAttribute("pageControl", pageControl);
    }
}
