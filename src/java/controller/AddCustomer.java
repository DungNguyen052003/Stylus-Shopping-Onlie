package controller;

import dao.CustomerDAO;
import java.io.File;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Date;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50 // 50 MB
)



public class AddCustomer extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/admin/managercustomerlist.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CustomerDAO customerDAO = new CustomerDAO();
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String roldIDParam = request.getParameter("roldID");
        int roldID = 5; // Giá trị mặc định
        if (roldIDParam != null && !roldIDParam.isEmpty()) {
            try {
                roldID = Integer.parseInt(roldIDParam);
            } catch (NumberFormatException e) {
                // Xử lý ngoại lệ nếu không thể chuyển đổi thành số nguyên
                e.printStackTrace();
                // Có thể hiển thị thông báo lỗi cho người dùng nếu cần
            }
        }
        int status = request.getParameter("status") != null ? 1 : 0;
        int gender = Integer.parseInt(request.getParameter("gender"));

        // Xử lý ảnh
        String image = "";
        try {
            Part filePart = request.getPart("image");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadDir = getServletContext().getRealPath("asset/image/post/");
            File file = new File(uploadDir, fileName);
            try (InputStream input = filePart.getInputStream()) {
                Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
            }
            image = "asset/image/post/" + fileName;
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        }

        boolean isDup = customerDAO.checkEmailDuplicate(email);
        if (isDup) {
            String message = "Email already exists!";
            request.setAttribute("error", message);
            try {
                 response.sendRedirect("managercustomerlist");
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            // Thêm khách hàng mới vào cơ sở dữ liệu
            request.getSession().setAttribute("successMessage", "Customer added successfully!");
            customerDAO.insert(address, email, phone, roldID, gender, name, image, status, new Date());
            response.sendRedirect("ManagerCustomerList");
    }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
