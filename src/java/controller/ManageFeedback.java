/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.FeedBackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import model.PageControl;
import model.FeedBack;

/**
 *
 * @author TienP
 */
public class ManageFeedback extends HttpServlet {

    FeedBackDAO feedbackDAO = new FeedBackDAO();

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
            out.println("<title>Servlet ManageFeedback</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageFeedback at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");

        if ("filterFeedback".equals(action)) {
            filterFeedback(request, pagecontrol);
        } else {
            List<FeedBack> listFeedback = pageFeedback(request, pagecontrol);
            String sortBy = request.getParameter("sort");
            if (sortBy != null && !sortBy.isEmpty()) {
                listFeedback = sortFeedback(request, pagecontrol);
            }
            for(FeedBack db : listFeedback){
                System.out.println(db);
            }
            request.setAttribute("FeedbackList", listFeedback);
        }
        request.getRequestDispatcher("/view/admin/managerFeedback.jsp").forward(request, response);
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
             updateFeedbackStatus(request, response);
        }
        request.getRequestDispatcher("/view/admin/managerFeedback.jsp").forward(request, response);
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

    private List<FeedBack> pageFeedback(HttpServletRequest request, PageControl pagecontrol) {
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
        int pageSize = 4;
        String requestURL = request.getRequestURL().toString();
        String queryString = request.getQueryString();
        pagecontrol.setUrlPattern(requestURL + "?");

        int totalRecord = feedbackDAO.getTotalFeedbackRecord();
        List<FeedBack> feedbackList = feedbackDAO.getAll(page, pageSize);

        int totalPage = (totalRecord % pageSize) == 0 ? (totalRecord / pageSize) : ((totalRecord / pageSize) + 1);

        pagecontrol.setPage(page);
        pagecontrol.setTotalPage(totalPage);
        pagecontrol.setTotalRecord(totalRecord);
        request.setAttribute("pageControl", pagecontrol);

        return feedbackList;

    }

    private List<FeedBack> sortFeedback(HttpServletRequest request, PageControl pagecontrol) {
        String sortBy = request.getParameter("sort");
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
        int pageSize = 4;
        String requestURL = request.getRequestURL().toString();
        pagecontrol.setUrlPattern(requestURL + "?sort=" + sortBy + "&");
        List<FeedBack> feedbackList;

        switch (sortBy) {
            case "fullName":
                feedbackList = feedbackDAO.getSortedFeedback("fullName", page, pageSize);
                break;
            case "productName":
                feedbackList = feedbackDAO.getSortedFeedback("productName", page, pageSize);
                break;
            case "ratedStar":
                feedbackList = feedbackDAO.getSortedFeedback("ratedStar", page, pageSize);
                break;
            case "status":
                feedbackList = feedbackDAO.getSortedFeedback("status", page, pageSize);
                break;
            default:
                feedbackList = feedbackDAO.getAll(page, pageSize);
                break;
        }

        pagecontrol.setPage(page);

        return feedbackList;
    }

    private void updateFeedbackStatus(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String feedbackID = request.getParameter("id");
        String status = request.getParameter("status");
        feedbackDAO.changeFeedbackStatus(feedbackID, status);
        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//        response.getWriter().write("{\"success\":" + updated + "}");
    }

    private void filterFeedback(HttpServletRequest request, PageControl pageControl) {

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

        int pageSize = 4;
        StringBuilder requestURL = new StringBuilder(request.getRequestURL().toString());
        requestURL.append("?action=filterFeedback");

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

        pageControl.setUrlPattern(requestURL.toString());

        String productName = request.getParameter("productName");
        String fullName = request.getParameter("fullName");
        String content = request.getParameter("content");
        String statusStr = request.getParameter("status");
        int status = -1;
        if (statusStr != null && !statusStr.isEmpty()) {
            status = "active".equals(statusStr) ? 1 : 0;
        }

        int rate;
        try {
            rate = Integer.parseInt(request.getParameter("rate"));
        } catch (NumberFormatException e) {
            rate = -1;
        }

        List<FeedBack> listFeedBacks = feedbackDAO.filterFeedback(page, pageSize, productName, fullName, content, rate, status);
        System.out.println(listFeedBacks);
        int totalRecord = feedbackDAO.getTotalFilteredFeedbackRecord(productName, fullName, content, rate, status);
        System.out.println(totalRecord);
        int totalPage = (totalRecord % pageSize) == 0 ? (totalRecord / pageSize) : ((totalRecord / pageSize) + 1);
        pageControl.setPage(page);
        pageControl.setTotalPage(totalPage);
        pageControl.setTotalRecord(totalRecord);

        request.setAttribute("FeedbackList", listFeedBacks);
        request.setAttribute("pageControl", pageControl);
        System.out.println(pageControl);

    }

}
