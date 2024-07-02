/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.marketer;

import dao.BlogDAO;
import jakarta.servlet.RequestDispatcher;
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
import model.Blog;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
/**
 *
 * @author 84976
 */
public class ViewPostList extends HttpServlet {

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
            out.println("<title>Servlet EditPostList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditPostList at " + request.getContextPath() + "</h1>");
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
        String blogIDParam = request.getParameter("blogID");
        if (blogIDParam != null && !blogIDParam.isEmpty()) {
            int blogID = Integer.parseInt(blogIDParam);
            // Lấy thông tin blog từ cơ sở dữ liệu bằng BlogDAO
            BlogDAO blogDAO = new BlogDAO();
            Blog blog = blogDAO.getBlogByID(blogID);
            // Đặt thông tin blog vào attribute để hiển thị trên trang JSP chỉnh sửa
            request.setAttribute("blog", blog);
            System.out.println(blog);
            // Chuyển hướng đến trang chỉnh sửa
                request.getRequestDispatcher("view/admin/viewPostList.jsp").forward(request, response);
        } else {
            // Xử lý khi không có blogID được cung cấp
            // Ví dụ: chuyển hướng hoặc hiển thị thông báo lỗi
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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String blogID = request.getParameter("blogID");
        int blogIDParam = Integer.parseInt(blogID);

        // Lấy các thông tin cập nhật từ request
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String description = request.getParameter("description");
        String brief_info = request.getParameter("brief_info");

        // Sửa lỗi khi trường productID không có hoặc là chuỗi rỗng
        String productIDString = request.getParameter("productID");
        int productID = 0; // Mặc định giá trị là 0
        if (productIDString != null && !productIDString.isEmpty()) {
            productID = Integer.parseInt(productIDString);
        }

        // Sửa lỗi khi trường status không có hoặc là chuỗi rỗng
        String statusString = request.getParameter("status");
        int status = 0; // Mặc định giá trị là 0
        if (statusString != null && !statusString.isEmpty()) {
            status = Integer.parseInt(statusString);
        }

        // Sửa lỗi khi trường featured không có hoặc là chuỗi rỗng
        String featuredString = request.getParameter("featured");
        int featured = 0; // Mặc định giá trị là 0
        if (featuredString != null && !featuredString.isEmpty()) {
            featured = Integer.parseInt(featuredString);
        }

        // Check if a new image is uploaded
        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String image = null;

        if (fileName != null && !fileName.isEmpty()) {
            String uploadDir = getServletContext().getRealPath("asset/image/post/");
            File file = new File(uploadDir, fileName);

            try (InputStream input = filePart.getInputStream()) {
                Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
            } catch (IOException e) {
                e.printStackTrace();
            }

            image = "asset/image/post/" + fileName;
        } else {
            // If no new file is uploaded, retain the existing image
            BlogDAO blogDAO = new BlogDAO();
            Blog existingBlog = blogDAO.getBlogByID(blogIDParam);
            image = existingBlog.getThumbnail();
        }

        // Cập nhật blog
        BlogDAO blogDAO = new BlogDAO();
        blogDAO.updateBlog(blogIDParam, title, image, description, productID, status, brief_info, author, featured);
        Blog blog = blogDAO.getBlogByID(blogIDParam);
        request.setAttribute("blog", blog);
        // Đặt thông báo thành công vào session
        request.getSession().setAttribute("successMessage", "Blog updated successfully!");

        // Chuyển hướng về trang managerpostlist
        request.getRequestDispatcher("view/admin/viewPostList.jsp").forward(request, response);
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
