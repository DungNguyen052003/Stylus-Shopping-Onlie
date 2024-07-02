
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.BrandDAO;
import dao.ColorDAO;
import dao.OrderStatusDAO;
import dao.PaymentMethodDAO;
import dao.SizeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Brand;
import model.Color;
import model.PaymentMethod;
import model.Size;
import model.OrderStatus;

/**
 *
 * @author ASUS
 */
public class SettingList extends HttpServlet {

    SizeDAO sizeDAO = new SizeDAO();
    ColorDAO colorDAO = new ColorDAO();
    BrandDAO brandDAO = new BrandDAO();
    OrderStatusDAO orderStatusDAO = new OrderStatusDAO();
    PaymentMethodDAO paymentDAO = new PaymentMethodDAO();

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
            out.println("<title>Servlet SettingList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SettingList at " + request.getContextPath() + "</h1>");
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
        List<Size> listSize = sizeDAO.getAll();
        request.setAttribute("listSize", listSize);

        List<Color> listColor = colorDAO.getAll();
        request.setAttribute("listColor", listColor);

        List<Brand> listBrand = brandDAO.listAllBrand();
        request.setAttribute("listBrand", listBrand);

        List<OrderStatus> listOrderStatus = orderStatusDAO.listAllOrderStatus();
        request.setAttribute("listOrderStatus", listOrderStatus);

        List<PaymentMethod> listPayment = paymentDAO.listAllPaymentMethod();
        request.setAttribute("listPayment", listPayment);

        request.getRequestDispatcher("view/admin/settingList.jsp").forward(request, response);
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
        switch (action) {
            case "addSize":
                addSize(request, response);
                break;
            case "addColor":
                addColor(request, response);
                break;
            case "addOrderStatus":
                addOrderStatus(request, response);
                break;
            case "addBrand":
                addBrand(request, response);
                break;
            case "addPayment":
                addPayment(request, response);
                break;
            default:
                throw new AssertionError();
        }
        List<Size> listSize = sizeDAO.getAll();
        request.setAttribute("listSize", listSize);

        List<Color> listColor = colorDAO.getAll();
        request.setAttribute("listColor", listColor);

        List<Brand> listBrand = brandDAO.listAllBrand();
        request.setAttribute("listBrand", listBrand);

        List<OrderStatus> listOrderStatus = orderStatusDAO.listAllOrderStatus();
        request.setAttribute("listOrderStatus", listOrderStatus);

        List<PaymentMethod> listPayment = paymentDAO.listAllPaymentMethod();
        request.setAttribute("listPayment", listPayment);

        request.getRequestDispatcher("view/admin/settingList.jsp").forward(request, response);
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

    private void addSize(HttpServletRequest request, HttpServletResponse response) {
        String sizeName = request.getParameter("sizeName");
        Size size = new Size();
        size.setName(sizeName);
        if (sizeDAO.isSizeDuplicate(sizeName)) {
            request.setAttribute("errorMessage", "Size already exists!");
        } else {
            sizeDAO.addNewSize(size);
            request.setAttribute("message", "Size added successfully!");
        }
        request.setAttribute("message", "Size added successfully!");
    }

    private void addColor(HttpServletRequest request, HttpServletResponse response) {
        String colorName = request.getParameter("colorName");
        Color color = new Color();
        color.setName(colorName);
        if (colorDAO.isColorDuplicate(colorName)) {
            request.setAttribute("errorMessage", "Color already exists!");
        } else {
            colorDAO.addNewColor(color);
            request.setAttribute("message", "Color added successfully!");
        }
    }

    private void addOrderStatus(HttpServletRequest request, HttpServletResponse response) {
        String statusDetail = request.getParameter("orderStatusDetail");
        OrderStatus statusOrder = new OrderStatus();
        statusOrder.setName(statusDetail);
        if (orderStatusDAO.isOrderStatusDuplicate(statusDetail)) {
            request.setAttribute("errorMessage", "Order Status already exists!");
        } else {
            orderStatusDAO.addNewOrderStatus(statusOrder);
            request.setAttribute("message", "Order Status added successfully!");
        }
    }

    private void addBrand(HttpServletRequest request, HttpServletResponse response) {
        String brandName = request.getParameter("brandName");
        Brand brand = new Brand();
        brand.setBrandName(brandName);
        if (brandDAO.isBrandDuplicate(brandName)) {
            request.setAttribute("errorMessage", "Brand already exists!");
        } else {
            brandDAO.addNewBrand(brand);
            request.setAttribute("message", "Brand added successfully!");
        }
    }

    private void addPayment(HttpServletRequest request, HttpServletResponse response) {
        String paymentMethod = request.getParameter("paymentMethod");
        PaymentMethod payment = new PaymentMethod();
        payment.setMethod(paymentMethod);
        if (paymentDAO.isPaymentDuplicate(paymentMethod)) {
            request.setAttribute("errorMessage", "Payment Method already exists!");
        } else {
            paymentDAO.addNewPayment(payment);
            request.setAttribute("message", "Payment Method added successfully!");
        }
    }

}
