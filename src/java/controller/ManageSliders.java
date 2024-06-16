/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.SliderDAO;
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
import java.util.List;
import java.util.Map;
import model.PageControl;
import model.Slider;

/**
 *
 * @author ASUS
 */
@MultipartConfig
public class ManageSliders extends HttpServlet {

    SliderDAO sliderDAO = new SliderDAO();
    private static final String UPLOAD_DIR = "C:\\Users\\TienP\\Documents\\NetBeansProjects\\ProjectStylus\\web\\asset\\image\\slide";

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
            out.println("<title>Servlet ManageSliders</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageSliders at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        PageControl pagecontrol = new PageControl();
        request.setAttribute("pageControl", pagecontrol);
        
        
        List<Slider> listSlider = pageSlider(request, pagecontrol);
        session.setAttribute("listSlider", listSlider);
        
        String action = request.getParameter("action");
        if ("filterSliders".equals(action)) {
            filterSlider(request, pagecontrol);
        } 
            
            
        request.getRequestDispatcher("view/admin/manageSlider.jsp").forward(request, response);
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
        PageControl pagecontrol = new PageControl();
        switch (action) {
            case "updateStatus":
                getStatusProduct(request, response);
                break;
            case "editProduct":
                editProduct(request);
                break;

            default:
                throw new AssertionError();
        }
        request.getRequestDispatcher("view/admin/manageSlider.jsp").forward(request, response);
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

    private List<Slider> pageSlider(HttpServletRequest request, PageControl pagecontrol) {
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
        pagecontrol.setUrlPattern(requestURL + "?");

        int totalRecord = sliderDAO.getTotalRecord();
        List<Slider> productList = sliderDAO.listAllSlider(page, pageSize);
        System.out.println(productList);
        int totalPage = (totalRecord % pageSize) == 0 ? (totalRecord / pageSize) : ((totalRecord / pageSize) + 1);

        pagecontrol.setPage(page);
        pagecontrol.setTotalPage(totalPage);
        pagecontrol.setTotalRecord(totalRecord);

        request.setAttribute("pageControl", pagecontrol);

        return productList;
    }

    private void getStatusProduct(HttpServletRequest request, HttpServletResponse response) {
        int sliderID = Integer.parseInt(request.getParameter("id"));
        int status = Integer.parseInt(request.getParameter("status"));
        boolean updated = sliderDAO.updateSliderStatus(sliderID, status);
        response.setContentType("application/json");
    }

    private void editProduct(HttpServletRequest request) {
        try {
            // Kiểm tra null cho các tham số truyền vào từ request
            String idParam = request.getParameter("id");
            String name = request.getParameter("name");
            String statusParam = request.getParameter("status");
            String campaignParam = request.getParameter("campain");
            String img = request.getParameter("currentImage");

            if (idParam == null || name == null || statusParam == null || campaignParam == null) {
                // Xử lý trường hợp thiếu tham số
                // Có thể thông báo lỗi và/hoặc không tiếp tục xử lý
                return;
            }

            int id = Integer.parseInt(idParam);
            int status = Integer.parseInt(statusParam);
            int campaign = Integer.parseInt(campaignParam);

            String imgDir = "asset/image/slide/";
            File fileSaveDir = new File(UPLOAD_DIR);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdirs();
            }
            Slider slider = new Slider();
            // Lấy file upload từ request
            Part part = request.getPart("image");
            if (part != null && part.getSize() > 0) {
                String fileName = extractFileName(part);
                imgDir = imgDir + fileName;
                // Đảm bảo fileName không null
                if (fileName != null && !fileName.isEmpty()) {
                    part.write(UPLOAD_DIR + File.separator + fileName);
                }
                slider.setImage(imgDir);
            } else {
                slider.setImage(img);
            }
            System.out.println(img);
            slider.setId(id);
            slider.setTitle(name);
            slider.setCampainID(campaign);
            slider.setStatus(status);

            sliderDAO.updateSlider(slider);
        } catch (ServletException | IOException | NumberFormatException e) {
            e.printStackTrace();
            // Xử lý các exception ở đây, ví dụ: thông báo lỗi và/hoặc rollback thay đổi
        }
    }

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

    private void filterSlider(HttpServletRequest request, PageControl pagecontrol) {
        HttpSession session = request.getSession();
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
        requestURL.append("?action=filterSliders");
        
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
        pagecontrol.setUrlPattern(requestURL.toString());
        
        String search = request.getParameter("search");
        String statusStr = request.getParameter("status");
        pagecontrol.setUrlPattern(requestURL + "?search="+"&");
        int status = -1; // Giả sử mặc định là inactive
        if (statusStr != null && !statusStr.isEmpty()) {
            status = "active".equals(statusStr) ? 1 : 0;
        }
        List<Slider> productList = sliderDAO.filterSliders(search, status, page, pageSize);
        System.out.println(productList);
        int totalRecord = sliderDAO.getTotalFilteredRecord(search, status);
        int totalPage = (totalRecord % pageSize) == 0 ? (totalRecord / pageSize) : ((totalRecord / pageSize) + 1);

        pagecontrol.setPage(page);
        pagecontrol.setTotalPage(totalPage);
        pagecontrol.setTotalRecord(totalRecord);
        session.setAttribute("listSlider", productList);
        session.setAttribute("pageControl", pagecontrol);
    }

}
