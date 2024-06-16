/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Customer;
import model.PageControl;

/**
 *
 * @author 84976
 */
public class ManagerCustomerList extends HttpServlet {

    CustomerDAO csDAO = new CustomerDAO();

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
            out.println("<title>Servlet ManagerCustomerList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerCustomerList at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        if ("filterCustomer".equals(action)) {
            request.setAttribute("action", "filterCustomer");
            filterCustomer(request);
        } else {
            pageCustomer(request);
            String sortBy = request.getParameter("sort");
            if (sortBy != null && !sortBy.isEmpty()) {
                sortCustomer(request);
            }}
        request.getRequestDispatcher("/view/admin/managerCustomerList.jsp").forward(request, response);

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
       if(action.equals("updateStatus")){
           getStatusCustomer(request, response);
       }else if(action.equals("updateFeature")){
           getFeatureCustomer(request, response);
       }
        request.getRequestDispatcher("/view/admin/manageProduct.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }
private void getStatusCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int CustomerID = Integer.parseInt(request.getParameter("id"));
        int status = Integer.parseInt(request.getParameter("status"));
        boolean updated = csDAO.updateCustomerStatus(CustomerID, status);
        response.setContentType("application/json");
    }
    private void filterCustomer(HttpServletRequest request) {

        List<Customer> customer;
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String statusStr = request.getParameter("status");
        int status = -1;
        if (statusStr != null && !statusStr.isEmpty()) {
            status = "active".equals(statusStr) ? 1 : 0;
        }
        customer = csDAO.filterCustomer(fullName, email, mobile, status);
        for(Customer cs : customer){
            System.out.println(cs.toString());
        }
        int page = 1, numPerPage = 6;
        int size = customer.size();
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
        List<Customer> customerpage = csDAO.getListByPage(customer, start, end);

        request.setAttribute("customerpage", customerpage);
        request.setAttribute("page", page);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.setAttribute("numberpage", numberpage);
        if (fullName != null && !fullName.isEmpty()) {
            request.setAttribute("fullName", fullName);
        }
        
        if (email != null && !email.isEmpty()) {
            request.setAttribute("email", email);
        }
        if (mobile != null && !mobile.isEmpty()) {
            request.setAttribute("mobile", mobile);
        }
        if (statusStr != null && !statusStr.isEmpty()) {
            request.setAttribute("status", statusStr);
        }
    }

    private void pageCustomer(HttpServletRequest request) {
        List<Customer> customer = csDAO.getAll();
        int page = 1, numPerPage = 6;
        int size = customer.size();
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
        List<Customer> customerpage = csDAO.getListByPage(customer, start, end);

        request.setAttribute("customerpage", customerpage);
        request.setAttribute("page", page);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.setAttribute("numberpage", numberpage);

    }

    private void sortCustomer(HttpServletRequest request) {
        String sortBy = request.getParameter("sort");
        List<Customer> customer;
        switch (sortBy) {
            case "fullName":
                customer = csDAO.getSortedCustomer("fullName");
                break;
            case "email":
                customer = csDAO.getSortedCustomer("email");
                break;
            case "mobile":
                customer = csDAO.getSortedCustomer("mobile");
                break;
            case "status":
                customer = csDAO.getSortedCustomer("status");
                break;
            default:
                customer = csDAO.getAll();
                break;
        }

        int page = 1, numPerPage = 6;
        int size = customer.size();
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
        List<Customer> customerpage = csDAO.getListByPage(customer, start, end);

        request.setAttribute("customerpage", customerpage);
        request.setAttribute("page", page);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.setAttribute("numberpage", numberpage);
        if (sortBy != null && !sortBy.isEmpty()) {
            request.setAttribute("sort", sortBy);
        }
    }

//    private void getFeatureCustomer(HttpServletRequest request, HttpServletResponse response) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }

    private void getFeatureCustomer(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
