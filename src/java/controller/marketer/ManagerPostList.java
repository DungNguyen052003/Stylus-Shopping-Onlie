/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.marketer;

import dao.BlogDAO;
import dao.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Blog;
import model.Category;
import model.Customer;

/**
 *
 * @author 84976
 */
public class ManagerPostList extends HttpServlet {

    BlogDAO d = new BlogDAO();

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
            out.println("<title>Servlet ManagerPostList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerPostList at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        CategoryDAO categoryDAO = new CategoryDAO();
        List<Category> categoriesWomen = categoryDAO.getCategoriesByParentID(1);
        session.setAttribute("categoriesWomen", categoriesWomen);
        List<Category> categoriesMen = categoryDAO.getCategoriesByParentID(2);
        session.setAttribute("categoriesMen", categoriesMen);
        if ("filterPost".equals(action)) {
            request.setAttribute("action", "filterPost");
            filterPost(request);
        } else {
            pagePost(request);
            String sortBy = request.getParameter("sort");
            if (sortBy != null && !sortBy.isEmpty()) {
                sortPost(request);
            }
        }
        request.getRequestDispatcher("/view/admin/managerPostList.jsp").forward(request, response);
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
           getStatusBlog(request, response);
       }else if(action.equals("updateFeature")){
           getFeatureBlog(request, response);
       }
        request.getRequestDispatcher("/view/admin/manageProduct.jsp").forward(request, response);
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
 private void getStatusBlog(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int blogID = Integer.parseInt(request.getParameter("id"));
        int status = Integer.parseInt(request.getParameter("status"));
        boolean updated = d.updateBlogStatus(blogID, status);
        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//        response.getWriter().write("{\"success\":" + updated + "}");
    }
 private void getFeatureBlog(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int featureID = Integer.parseInt(request.getParameter("id"));
        int status = Integer.parseInt(request.getParameter("status"));
        boolean updated = d.updateBlogFeature(featureID, status);
        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//        response.getWriter().write("{\"success\":" + updated + "}");
    }
    private void pagePost(HttpServletRequest request) {
        List<Blog> blogs = d.getAllBlogs();

        int page = 1, numPerPage = 6;
        int size = blogs.size();
        int numberpage = ((size % numPerPage == 0) ? (size / 6) : (size / 6) + 1);
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * 6;
        end = Math.min(page * numPerPage, size);

        List<Blog> blogpage = d.getListByPage(blogs, start, end);
        request.setAttribute("blogpage", blogpage);
        request.setAttribute("page", page);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.setAttribute("numberpage", numberpage);
    }

    private void filterPost(HttpServletRequest request) {
        List<Blog> blogs;
        String author = request.getParameter("author");
        String title = request.getParameter("title");
        String statusStr = request.getParameter("status");
        int status = -1;
        if (statusStr != null && !statusStr.isEmpty()) {
            status = "active".equals(statusStr) ? 1 : 0;
        }
        int category = -1;
        try {
            category = Integer.parseInt(request.getParameter("subCategory"));
        } catch (NumberFormatException e) {
            category = -1;
        }

        blogs = d.filterBlog(author, title, category, status);
        int page = 1, numPerPage = 6;
        int size = blogs.size();
        int numberpage = ((size % numPerPage == 0) ? (size / 6) : (size / 6) + 1);
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * 6;
        end = Math.min(page * numPerPage, size);
        List<Blog> blogpage = d.getListByPage(blogs, start, end);

        request.setAttribute("blogpage", blogpage);
        request.setAttribute("page", page);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.setAttribute("numberpage", numberpage);
        if (author != null && !author.isEmpty()) {
            request.setAttribute("author", author);
        }

        if (title != null && !title.isEmpty()) {
            request.setAttribute("title", title);
        }
        if (category != -1) {
            request.setAttribute("category", category);
        }
        if (statusStr != null && !statusStr.isEmpty()) {
            request.setAttribute("status", statusStr);
        }
    }

    private void sortPost(HttpServletRequest request) {
        String sortBy = request.getParameter("sort");
        List<Blog> blog;
        switch (sortBy) {
            case "title":
                blog = d.getSortedBlog("title");
                break;
            case "category":
                blog = d.getSortedBlog("category");
                break;
            case "author":
                blog = d.getSortedBlog("author");
                break;
            case "feature":
                blog = d.getSortedBlog("feature");
                break;
            case "status":
                blog = d.getSortedBlog("status");
                break;
            default:
                blog = d.getAllBlogs();
                break;
        }

        int page = 1, numPerPage = 6;
        int size = blog.size();
        int numberpage = ((size % numPerPage == 0) ? (size / 6) : (size / 6) + 1);
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * 6;
        end = Math.min(page * numPerPage, size);
        List<Blog> blogpage = d.getListByPage(blog, start, end);

        request.setAttribute("blogpage", blogpage);
        request.setAttribute("page", page);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.setAttribute("numberpage", numberpage);
        if (sortBy != null && !sortBy.isEmpty()) {
            request.setAttribute("sort", sortBy);
        }
    }

}
