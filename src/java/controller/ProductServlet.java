/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Category;
import model.PageControl;
import model.Product;

/**
 *
 * @author ASUS
 */
public class ProductServlet extends HttpServlet {

    ProductDAO productDAO = new ProductDAO();
    CategoryDAO categoryDAO = new CategoryDAO();

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
            out.println("<title>Servlet Product</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Product at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        PageControl pagecontrol = new PageControl();

        List<Product> listProduct = pageProduct(request, pagecontrol);
        session.setAttribute("listProduct", listProduct);
        List<Category> categoriesWomen = categoryDAO.getCategoriesByParentID(1);
        session.setAttribute("categoriesWomen", categoriesWomen);
        List<Category> categoriesMen = categoryDAO.getCategoriesByParentID(2);
        session.setAttribute("categoriesMen", categoriesMen);

        String id = request.getParameter("id");
        if (id != null) {
            List<Product> productWomen = findProductByCate(request, pagecontrol);
            session.setAttribute("listProduct", productWomen);
            List<Product> productMen = findProductByCate(request, pagecontrol);
            session.setAttribute("listProduct", productMen);
            request.setAttribute("pageControl", pagecontrol);
        }

        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "search":
                    listProduct = findProduct(request, pagecontrol);
                    break;
                case "sortByPrice":
                    listProduct = listProductByPrice(request);
                    break;
                case "newest":
                    listProduct = listNewestProduct(request, pagecontrol);
                    break;
                default:
                    listProduct = pageProduct(request, pagecontrol);
                    session.setAttribute("listProduct", listProduct);
                    request.setAttribute("pageControl", pagecontrol);
            }session.setAttribute("listProduct", listProduct);
            request.setAttribute("pageControl", pagecontrol);
        }
        
        

        request.getRequestDispatcher("view/customer/shop.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        PageControl pagecontrol = new PageControl();
        List<Product> listProduct;

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private List<Product> findProduct(HttpServletRequest request, PageControl pagecontrol) {
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
        //total record
        int totalRecord;
        int totalPage;
        //get về URL
        String requestURL = request.getRequestURL().toString();
        String keyword = request.getParameter("keyword");
        System.out.println("vao find product" + keyword + page);
        List<Product> listProduct = productDAO.findByName(keyword, page);
        System.out.println(listProduct);
        totalRecord = productDAO.findTotalRecordByName(keyword);
        pagecontrol.setUrlPattern(requestURL + "?action=search&keyword=" + keyword + "&");
        System.out.println(pagecontrol.getUrlPattern());
        //total page
        totalPage = (totalRecord % 3) == 0 ? (totalRecord / 3) : ((totalRecord / 3) + 1);
        //set total record, total page, page and pageControl
        pagecontrol.setPage(page);
        pagecontrol.setTotalPage(totalPage);
        pagecontrol.setTotalRecord(totalRecord);

        return listProduct;

    }

    private List<Product> findProductByCate(HttpServletRequest request, PageControl pagecontrol) {
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
        int totalRecord;
        int totalPage;

        //get về URL
        String requestURL = request.getRequestURL().toString();

        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        totalRecord = productDAO.findTotalRecordByCategory(id);
        System.out.println(totalRecord);
        List<Product> productList = productDAO.findByCategory(id, page);
        pagecontrol.setUrlPattern(requestURL + "?id=" + id + "&");

        //total record
        //total page
        totalPage = (totalRecord % 3) == 0 ? (totalRecord / 3) : ((totalRecord / 3) + 1);
        //set total record, total page, page and pageControl
        pagecontrol.setPage(page);
        pagecontrol.setTotalPage(totalPage);
        pagecontrol.setTotalRecord(totalRecord);
        System.out.println(productList);
        return productList;
    }

    private List<Product> listProductByPrice(HttpServletRequest request) {
        double mini = Double.parseDouble(request.getParameter("mini").replace("$", ""));
        double max = Double.parseDouble(request.getParameter("max").replace("$", ""));
        List<Product> listProduct = productDAO.findProductsByPriceRange(mini, max);
        return listProduct;

    }

    private List<Product> pageProduct(HttpServletRequest request, PageControl pagecontrol) {
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
        int pageSize = 9;
        String requestURL = request.getRequestURL().toString();
        String queryString = request.getQueryString();
        pagecontrol.setUrlPattern(requestURL + "?");

        int totalRecord = productDAO.getTotalRecord();
        List<Product> productList = productDAO.listAll(page, pageSize);

        int totalPage = (totalRecord % pageSize) == 0 ? (totalRecord / pageSize) : ((totalRecord / pageSize) + 1);

        pagecontrol.setPage(page);
        pagecontrol.setTotalPage(totalPage);
        pagecontrol.setTotalRecord(totalRecord);

        request.setAttribute("pageControl", pagecontrol);

        return productList;

    }

    private List<Product> listNewestProduct(HttpServletRequest request, PageControl pagecontrol) {
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
        int pageSize = 9;
        String requestURL = request.getRequestURL().toString();
        String queryString = request.getQueryString();
        pagecontrol.setUrlPattern(requestURL + "?action=newest" + "&");

        int totalRecord = productDAO.getTotalRecord();
        List<Product> productList = productDAO.listNewest(page, pageSize);

        int totalPage = (totalRecord % pageSize) == 0 ? (totalRecord / pageSize) : ((totalRecord / pageSize) + 1);
        pagecontrol.setPage(page);
        pagecontrol.setTotalPage(totalPage);
        pagecontrol.setTotalRecord(totalRecord);
        request.setAttribute("pageControl", pagecontrol);
        System.out.println(productList);
        return productList;
    }
}
