/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BlogDAO;
import dao.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Blog;
import model.Category;

/**
 *
 * @author ngock
 */
public class BlogServlet extends HttpServlet {

    BlogDAO d = new BlogDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BlogServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BlogServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDAO categoryDAO = new CategoryDAO();
        Blog blog = d.getLatestBlog();
        String action = request.getParameter("action");
        if ("filterBlogbyCate".equals(action)) {
            request.setAttribute("action", "filterBlogbyCate");
            filterBlogbyCategory(request);
        } else if ("searchBlog".equals(action)){
            request.setAttribute("action", "searchBlog");
            filterBlogbyKeyword(request);
        }else{
            pageBlog(request);
        }

        List<Category> categoriesWomen = categoryDAO.getCategoriesByParentID(1);
        request.setAttribute("categoriesWomen", categoriesWomen);
        List<Category> categoriesMen = categoryDAO.getCategoriesByParentID(2);
        request.setAttribute("categoriesMen", categoriesMen);
        request.setAttribute("blog", blog);
        request.getRequestDispatcher("/view/customer/Blog.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDAO categoryDAO = new CategoryDAO();
        Blog blog = d.getLatestBlog();
        request.setAttribute("action", "searchBlog");
        filterBlogbyKeyword(request);
        List<Category> categoriesWomen = categoryDAO.getCategoriesByParentID(1);
        request.setAttribute("categoriesWomen", categoriesWomen);
        List<Category> categoriesMen = categoryDAO.getCategoriesByParentID(2);
        request.setAttribute("categoriesMen", categoriesMen);
        request.setAttribute("blog", blog);
        request.getRequestDispatcher("/view/customer/Blog.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void pageBlog(HttpServletRequest request) {
        List<Blog> list = d.getAllBlogs();
        int page = 1;
        int pageSize = 3;
        int size = list.size();
        int numberpage = ((size % pageSize == 0) ? (size / pageSize) : (size / pageSize) + 1);
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * pageSize;
        end = Math.min(page * pageSize, size);
        List<Blog> blogList = d.getBlogListByPage(list, start, end);
        request.setAttribute("list", blogList);
        request.setAttribute("page", page);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.setAttribute("numberpage", numberpage);
    }

    private void filterBlogbyCategory(HttpServletRequest request) {
        String blogId = request.getParameter("blogCateId");
        List<Blog> list = d.getAllBlogsByCate(blogId);
        int page = 1;
        int pageSize = 3;
        int size = list.size();
        int numberpage = ((size % pageSize == 0) ? (size / pageSize) : (size / pageSize) + 1);
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * pageSize;
        end = Math.min(page * pageSize, size);
        List<Blog> blogList = d.getBlogListByPage(list, start, end);
        request.setAttribute("blogCateId", blogId);
        request.setAttribute("list", blogList);
        request.setAttribute("page", page);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.setAttribute("numberpage", numberpage);
    }

    private void filterBlogbyKeyword(HttpServletRequest request) {
        String keyword = request.getParameter("keyword");
        List<Blog> list = d.getAllBlogsKeyword(keyword);
        System.out.println(list);
        int page = 1;
        int pageSize = 3;
        int size = list.size();
        int numberpage = ((size % pageSize == 0) ? (size / pageSize) : (size / pageSize) + 1);
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * pageSize;
        end = Math.min(page * pageSize, size);
        List<Blog> blogList = d.getBlogListByPage(list, start, end);
        request.setAttribute("keyword", keyword);
        request.setAttribute("list", blogList);
        request.setAttribute("page", page);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.setAttribute("numberpage", numberpage);
    }
}
