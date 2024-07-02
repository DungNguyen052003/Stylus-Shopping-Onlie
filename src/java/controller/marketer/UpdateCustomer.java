/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.marketer;

import dao.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import model.Customer;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
/**
 *
 * @author 84976
 */
public class UpdateCustomer extends HttpServlet {

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
            out.println("<title>Servlet UpdateCustomer</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateCustomer at " + request.getContextPath() + "</h1>");
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
        String cusIDParam = request.getParameter("customerID");
        int customerID = Integer.parseInt(cusIDParam);
        CustomerDAO cd = new CustomerDAO();
        Customer customer = cd.getByCustomerID(customerID);
        request.setAttribute("customer", customer);
        request.getRequestDispatcher("view/admin/updateCustomer.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String customerID = request.getParameter("customerID");
        int cusIDParam = Integer.parseInt(customerID);

        String name = request.getParameter("name");
        String usename = request.getParameter("usename");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String statusString = request.getParameter("status");
        int status = 0; // Mặc định giá trị là 0
        if (statusString != null && !statusString.isEmpty()) {
            status = Integer.parseInt(statusString);
        }
        String genderString = request.getParameter("gender"); // lấy dữ liệu từ form
        int gender = 0; // Mặc định giá trị là 0
        if (genderString != null && !genderString.isEmpty()) {
            gender = Integer.parseInt(genderString);
        }

        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String image = null;

        if (fileName != null && !fileName.isEmpty()) {
            String uploadDir = getServletContext().getRealPath("asset/image/cus/");
            File file = new File(uploadDir, fileName);

            try (InputStream input = filePart.getInputStream()) {
                Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
            } catch (IOException e) {
                e.printStackTrace();
            }

            image = "asset/image/cus/" + fileName;
        } else {
            // If no new file is uploaded, retain the existing image
            CustomerDAO cd = new CustomerDAO();
            Customer existingCustomer = cd.getByCustomerID(cusIDParam);
            image = existingCustomer.getImage();
        }

        CustomerDAO cd = new CustomerDAO();
        cd.editCustomer(cusIDParam, phone, genderString, image, name, address, email);

        request.getSession().setAttribute("successMessage", "Customer updated successfully!");
        response.sendRedirect("ManagerCustomerList");
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
