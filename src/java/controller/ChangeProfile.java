/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import model.Customer;

/**
 *
 * @author TienP
 */
@MultipartConfig
public class ChangeProfile extends HttpServlet {

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
            out.println("<title>Servlet ChangeProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeProfile at " + request.getContextPath() + "</h1>");
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
//        HttpSession session = request.getSession();
//        Account acc = (Account) session.getAttribute("account");
//        request.setAttribute("acc", acc);
        request.getRequestDispatcher("view/customer/userProfile.jsp");

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
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String imgDir = "asset/image/cus/";
        File fileSaveDir = new File("C:\\Users\\TienP\\Documents\\NetBeansProjects\\ProjectStylus\\web\\asset\\image\\cus");
        String currentImg = request.getParameter("currentImage2");
        if (!fileSaveDir.exists()) {
                fileSaveDir.mkdirs();
            }
        Part part = request.getPart("image");
        if (part != null && part.getSize() > 0) {
            String fileName = extractFileName(part);
            currentImg = imgDir + fileName;
            if (fileName != null && !fileName.isEmpty()) {
                part.write(fileSaveDir + File.separator + fileName);
            } 
        } 
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        CustomerDAO cd = new CustomerDAO();
        cd.update(phone, gender, currentImg, name, address, email);
        HttpSession session = request.getSession();
        CustomerDAO cs = new CustomerDAO();
        Customer acc = cs.CustomerbyEmail(email);
        session.setAttribute("account", acc);
        String message = "Profile updated successfully!";
         response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().append("<!DOCTYPE html>")
                .append("<html>")
                .append("<head>")
                .append("<title>Blog Update</title>")
                .append("<script type=\"text/javascript\">")
                .append("setTimeout(function(){ window.location.href = 'Home'; }, 1500);")
                .append("</script>")
                .append("</head>")
                .append("<body>")
                .append("</body>")
                .append("</html>");
   
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

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
