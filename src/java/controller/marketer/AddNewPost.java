package controller.marketer;

import dao.BlogDAO;
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
import java.util.Date;
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
public class AddNewPost extends HttpServlet {
private static final String UPLOAD_DIR = "C:\\Users\\TienP\\Documents\\NetBeansProjects\\ProjectStylus\\web\\asset\\image\\post";    /**
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
            out.println("<title>Servlet AddNewPost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddNewPost at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        String title = request.getParameter("title");
        String thumbnail = request.getParameter("thumbnail");
        String author = request.getParameter("author");
        String description = request.getParameter("description");
        String brief_info = request.getParameter("briefinfor");
        //String productIDParam = request.getParameter("productID");
        int productID = 0;
        String productIDParam = request.getParameter("productID");
        if (productIDParam != null && !productIDParam.isEmpty()) {
            try {
                productID = Integer.parseInt(productIDParam);
            } catch (NumberFormatException e) {
                // Xử lý ngoại lệ nếu productID không hợp lệ
                e.printStackTrace();
                // Có thể hiển thị thông báo lỗi cho người dùng nếu cần
            }
        }
        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // Tên tệp


        
        File file = new File(UPLOAD_DIR, fileName);

        
        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            e.printStackTrace();
        }
        String image = "asset/image/post/" + fileName;

        // Xử lý status và featured từ checkbox
        int status = request.getParameter("status") != null ? 1 : 0;
        int featured = request.getParameter("featured") != null ? 1 : 0;
        BlogDAO bd = new BlogDAO();
        bd.insertBlog(title, image, description, featured, status, brief_info, author, featured, new Date());
        request.getSession().setAttribute("successMessage", "Blog added successfully!");

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().append("<!DOCTYPE html>")
                .append("<html>")
                .append("<head>")
                .append("<title>Blog Update</title>")
                .append("<script type=\"text/javascript\">")
                .append("setTimeout(function(){ window.location.href = 'ManagerPostList'; }, 1500);")
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

}
