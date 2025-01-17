/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.AccountDAO;
import dao.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Customer;

/**
 *
 * @author TienP
 */
public class VerifyOTP extends HttpServlet {
   
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
            out.println("<title>Servlet VerifyOTP</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerifyOTP at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String email = request.getParameter("email");
        CustomerDAO cs = new CustomerDAO();
        boolean bl = cs.checkEmailRegister(email);
        System.out.println(bl);
        if(cs.checkEmailRegister(email)){
            cs.changeVerifyStatus(email, 1);
            request.setAttribute("status",1 );
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
        }else{
            request.setAttribute("status",2 );
        }
        request.getRequestDispatcher("view/authen/verify.jsp").forward(request, response);
    } 
    
    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        String digit1 = request.getParameter("digit1");
//        String digit2 = request.getParameter("digit2");
//        String digit3 = request.getParameter("digit3");
//        String digit4 = request.getParameter("digit4");
//        String digit5 = request.getParameter("digit5");
//        String digit6 = request.getParameter("digit6");
//      
//        String otp = digit1 + digit2 + digit3 + digit4 + digit5 + digit6;
//        String verifyCode = (String) request.getSession().getAttribute("verifyCode");
//        String type = (String) request.getSession().getAttribute("type");
//       
//        if (type.equals("register")) {
//            Customer cus = (Customer) request.getSession().getAttribute("pendingCustomer");
//
//            if (otp.equals(verifyCode)) {
//                
//                CustomerDAO cusDAO = new CustomerDAO();
//                cusDAO.insert(cus);
//                response.sendRedirect("home");
//            } else {
//                request.setAttribute("msg", "Verification code is not correct. Please try again");
//                request.getRequestDispatcher("verify.jsp").forward(request, response);
//            }
//        }else{
//            if(otp.equals(verifyCode)){
//                response.sendRedirect("NewPassword");
//            }else{
//                request.setAttribute("msg", "Verification code is not correct. Please try again");
//                request.getRequestDispatcher("verify.jsp").forward(request, response);
//            }
//        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
