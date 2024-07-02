/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vnpay.common;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.CartDAO;
import dao.OrderDaoForSale;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import model.Customer;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author CTT VNPAY
 */
public class ajaxServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String paymentMethod = req.getParameter("paymentMethod");

        HttpSession session = req.getSession();
        Customer c = (Customer) session.getAttribute("account");
        int customerid = c.getCustomerID();
        String fullname = req.getParameter("fullname");
        String phone = req.getParameter("phone");
        String address = req.getParameter("addressInput");
        int status = 1;
        Order order = new Order();
        order.setCustomerId(customerid);
        order.setFullName(fullname);
        order.setPhone(phone);
        order.setAddress(address);
        order.setOrderDate(LocalDateTime.now());
        order.setStatus(status);

        String amountParam = req.getParameter("amount");
        BigDecimal amountRaw = new BigDecimal(amountParam).multiply(BigDecimal.valueOf(100000));
        BigDecimal totalAmount = amountRaw.divide(BigDecimal.valueOf(100000), BigDecimal.ROUND_HALF_UP);
        order.setTotalAmount(totalAmount);
        session.setAttribute("order", order);

        if ("vnpayqr".equals(paymentMethod)) {
            String vnp_Version = "2.1.0";
            String vnp_Command = "pay";
            String orderType = "other";
            long amountLong = amountRaw.longValueExact();
            String bankCode = req.getParameter("bankCode");

            String vnp_TxnRef = Config.getRandomNumber(8);
            String vnp_IpAddr = Config.getIpAddress(req);

            String vnp_TmnCode = Config.vnp_TmnCode;

            Map<String, String> vnp_Params = new HashMap<>();
            vnp_Params.put("vnp_Version", vnp_Version);
            vnp_Params.put("vnp_Command", vnp_Command);
            vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
            vnp_Params.put("vnp_Amount", String.valueOf(amountLong));
            vnp_Params.put("vnp_CurrCode", "VND");

            if (bankCode != null && !bankCode.isEmpty()) {
                vnp_Params.put("vnp_BankCode", bankCode);
            }
            vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
            vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
            vnp_Params.put("vnp_OrderType", orderType);

            String locate = req.getParameter("language");
            if (locate != null && !locate.isEmpty()) {
                vnp_Params.put("vnp_Locale", locate);
            } else {
                vnp_Params.put("vnp_Locale", "vn");
            }
            vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
            vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

            Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
            SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
            String vnp_CreateDate = formatter.format(cld.getTime());
            vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

            cld.add(Calendar.MINUTE, 15);
            String vnp_ExpireDate = formatter.format(cld.getTime());
            vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

            List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
            Collections.sort(fieldNames);
            StringBuilder hashData = new StringBuilder();
            StringBuilder query = new StringBuilder();
            Iterator<String> itr = fieldNames.iterator();
            while (itr.hasNext()) {
                String fieldName = itr.next();
                String fieldValue = vnp_Params.get(fieldName);
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    // Build hash data
                    hashData.append(fieldName);
                    hashData.append('=');
                    hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                    // Build query
                    query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                    query.append('=');
                    query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                    if (itr.hasNext()) {
                        query.append('&');
                        hashData.append('&');
                    }
                }
            }
            String queryUrl = query.toString();
            String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
            queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
            String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;

            com.google.gson.JsonObject job = new com.google.gson.JsonObject();
            job.addProperty("code", "00");
            job.addProperty("message", "success");
            job.addProperty("data", paymentUrl);
            Gson gson = new Gson();
            resp.getWriter().write(gson.toJson(job));

        } else if ("shipcod".equals(paymentMethod)) {
            CartDAO dao = new CartDAO();
            int saleID = new OrderDaoForSale().getSaleOrderLeast();
            int method = 2;
            BigDecimal adjustedAmount = BigDecimal.valueOf(Double.parseDouble(amountParam));
            int orderId = dao.insertOrder(customerid, fullname, phone, address, status, adjustedAmount, saleID, method);
            List<OrderDetail> orderDetailsList = (List<OrderDetail>) session.getAttribute("orderDetails");
            for (OrderDetail orderDetail : orderDetailsList) {
                dao.insertOrderDetails(orderId, orderDetail.getProductDetailID(), orderDetail.getQuantity(), orderDetail.getPrice(), orderDetail.getTotalPrice(), null, LocalDate.now());
                dao.deleteCartAfterOrder(customerid, orderDetail.getProductDetailID());
                dao.updateQuantityAfterOrder(orderDetail.getProductDetailID(), orderDetail.getQuantity());
                session.removeAttribute("orderDetails");
                session.removeAttribute("order");
            }
            req.setAttribute("status", 7);
            req.getRequestDispatcher("view/authen/verify.jsp").forward(req, resp);
        }
    }

}
