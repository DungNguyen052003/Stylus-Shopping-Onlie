/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import validation.Validate;


/**
 *
 * @author 84976
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

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
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("view/authen/register.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        String fName = request.getParameter("name");
        String uName = request.getParameter("username");
        String uPass = request.getParameter("pass");
        String uPho = request.getParameter("phone");
        String uEmail = request.getParameter("email");

        AccountDAO ac = new AccountDAO();
        Account account;

        String message = "Something wrong";
        int slUPrev = ac.getNumberAccounts();
        boolean isDup = ac.checkUserNameDuplicate(uName);
        boolean isValidPassword = Validate.isValidPassword(uPass);
       
        if (isValidPassword) {
            
            if (isDup) {
                message = "Username already exists!";
                request.setAttribute("error", message);
               // request.getRequestDispatcher("view/authen/register.jsp").forward(request, response);
            } else {
                // Create an account object with the provided information
                account = new Account(slUPrev, uName, uPass, 5, Integer.parseInt(uPho), uEmail, null, fName);
                // Insert the account into the database
                ac.insert(account);
                int slUAfter = ac.getNumberAccounts();
                if (slUAfter > slUPrev) {
                    message = "Sign Up successful. Please Login!";
                    request.setAttribute("error", message);
                }
                request.getRequestDispatcher("view/authen/login.jsp").forward(request, response);
            }

        } else {
            // Nếu mật khẩu không hợp lệ, hiển thị thông báo lỗi
            message = "8-16 characters at least 1 lowercase letter, 1 uppercase letter, 1 number and 1 special character";
            request.setAttribute("errorMessage", message);
            
        }
        request.getRequestDispatcher("view/authen/register.jsp").forward(request, response);
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
}
