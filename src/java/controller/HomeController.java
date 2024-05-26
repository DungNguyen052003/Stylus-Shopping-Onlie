/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.BlogDAO;
import dao.ProductDAO;
import dao.SliderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Blog;
import model.Product;
import model.Slider;

/**
 *
 * @author TienP
 */
public class HomeController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet HomeController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String update = request.getParameter("update");
        String message = request.getParameter("message");
        ProductDAO pd = new ProductDAO();
        SliderDAO sd = new SliderDAO();
        BlogDAO bd = new BlogDAO();
        List<Product> listbyAll = pd.listTop8Cate(0);
        List<Product> listbyMen = pd.listTop8Cate(1);
        List<Product> listbyWomen = pd.listTop8Cate(2);
        List<Product> listHot = pd.listHotTrend();
        List<Product> listFeature = pd.listFeature();
        List<Product> listSale = pd.listSale();
        List<Slider> listSlider = sd.listSlider();
        List<Blog> blogList = bd.getAllBlogs();
        Blog blog = bd.getLatestBlog();
        request.setAttribute("listbyAll", listbyAll);
        request.setAttribute("listbyMen", listbyMen);
        request.setAttribute("listbyWomen", listbyWomen);
        request.setAttribute("listHot", listHot);
        request.setAttribute("listFeature", listFeature);
        request.setAttribute("listSale", listSale);
        request.setAttribute("listSlider", listSlider);
        request.setAttribute("blogList", blogList);
        request.setAttribute("blog", blog);       
        request.getRequestDispatcher("/view/customer/home.jsp").forward(request, response);
    } 
    public static void main(String[] args){
        
        ProductDAO pd = new ProductDAO();
        SliderDAO sd = new SliderDAO();
        BlogDAO bd = new BlogDAO();
        List<Product> listbyAll = pd.listTop8Cate(0);
        List<Product> listbyMen = pd.listTop8Cate(1);
        List<Product> listbyWomen = pd.listTop8Cate(2);
        List<Product> listHot = pd.listHotTrend();
        List<Product> listFeature = pd.listFeature();
        List<Product> listSale = pd.listSale();
        List<Slider> listSlider = sd.listSlider();
        List<Blog> blogList = bd.getAllBlogs();
         for(Product p : listbyAll){
            System.out.println(p.toString());
        }
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
