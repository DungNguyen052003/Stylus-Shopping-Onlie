/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.marketer;

import dao.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.ChangeHistory;
import model.Customer;

/**
 *
 * @author ngock
 */
public class CustomerDetail extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet CustomerDetail</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerDetail at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int customerID = Integer.parseInt(request.getParameter("customerID"));
        CustomerDAO customerDAO = new CustomerDAO();
        Customer customer = customerDAO.getByCustomerID(customerID);

        List<ChangeHistory> changeHistory = customerDAO.getChangeHistory(customerID);

        request.setAttribute("customer", customer);
        request.setAttribute("changeHistory", changeHistory);

        request.getRequestDispatcher("/view/admin/customerDetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int customerID = Integer.parseInt(request.getParameter("customerID"));
        String name = request.getParameter("name");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        Account acc = new Account();
        CustomerDAO c = new CustomerDAO();
        Customer cus = c.getByCustomerID(customerID);
        Customer customer = new Customer(customerID, address, email, phone, gender, name);
        c.insertChangeHistory(cus, account);
        c.updateCustomer(customer);
        response.sendRedirect("customerdetail?customerID=" + customerID);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
