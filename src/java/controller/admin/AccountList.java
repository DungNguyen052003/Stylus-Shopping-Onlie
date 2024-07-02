package controller.admin;

import dao.AccountDAO;
import dao.RoleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;
import model.Account;
import model.PageControl;
import model.Role;

/**
 *
 * @author ASUS
 */
public class AccountList extends HttpServlet {

    AccountDAO accountDAO = new AccountDAO();
    RoleDAO roleDAO = new RoleDAO();

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
            out.println("<title>Servlet UserList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserList at " + request.getContextPath() + "</h1>");
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
        PageControl pageControl = new PageControl();
        request.setAttribute("pageControl", pageControl);

        List<Role> listRole = roleDAO.listRole();
        request.setAttribute("listRole", listRole);

        List<Account> listAccount = pageAccount(request, pageControl);
        String sortBy = request.getParameter("sort");
        if (sortBy != null && !sortBy.isEmpty()) {
            listAccount = sortProduct(request, pageControl);

        }
        request.setAttribute("listAccount", listAccount);

        String action = request.getParameter("action");
        System.out.println("Action do get: " + action);
        if ("filterAccount".equals(action)) {
            filterAccount(request, pageControl);
        } else if ("searchUsers".equals(action)) {
            searchUsers(request, pageControl);
        }

        request.getRequestDispatcher("view/admin/accountList.jsp").forward(request, response);
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
        PageControl pagecontrol = new PageControl();
        request.setAttribute("pageControl", pagecontrol);

        String action = request.getParameter("action");
        System.out.println("Action doPost: " + action);
        switch (action) {
            case "statusAccount":
                getStatusAccount(request, response);
                break;
            case "updateRole":
                getUpdateRole(request, response);
                break;
            default:
                throw new AssertionError();
        }
        request.getRequestDispatcher("view/admin/accountList.jsp").forward(request, response);
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

    private List<Account> pageAccount(HttpServletRequest request, PageControl pageControl) {
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
        pageControl.setUrlPattern(requestURL + "?");

        int totalRecord = accountDAO.getTotalRecord();
        List<Account> listAccount = accountDAO.listAllAccount(page, pageSize);
        System.out.println(listAccount);

        int totalPage = (totalRecord % pageSize) == 0 ? (totalRecord / pageSize) : ((totalRecord / pageSize) + 1);

        pageControl.setPage(page);
        pageControl.setTotalPage(totalPage);
        pageControl.setTotalRecord(totalRecord);

        request.setAttribute("pageControl", pageControl);
        return listAccount;

    }

    private void getStatusAccount(HttpServletRequest request, HttpServletResponse response) {
        int accountId = Integer.parseInt(request.getParameter("id"));
        int status = Integer.parseInt(request.getParameter("status"));
        boolean updated = accountDAO.updateAccountStatus(accountId, status);
        response.setContentType("application/json");
    }

    private void getUpdateRole(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int accountID = Integer.parseInt(request.getParameter("accountID"));
        System.out.println(accountID);
        int roleID = Integer.parseInt(request.getParameter("roleID"));
        boolean updated = accountDAO.updateRoleAccount(accountID, roleID);
    }

    private List<Account> sortProduct(HttpServletRequest request, PageControl pageControl) {
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
        int pageSize = 9;
        String requestURL = request.getRequestURL().toString();
        String queryString = request.getQueryString();
        pageControl.setUrlPattern(requestURL + "?sort=" + sortBy + "&");
        List<Account> accountList;
        int totalRecord;
        int totalPage;
        switch (sortBy) {
            case "id":
                accountList = accountDAO.getSortedAccount("id", page, pageSize);
                break;
            case "name":
                accountList = accountDAO.getSortedAccount("name", page, pageSize);
                break;
            case "gender":
                accountList = accountDAO.getSortedAccount("gender", page, pageSize);
                break;
            case "role":
                accountList = accountDAO.getSortedAccount("role", page, pageSize);
                break;
            case "email":
                accountList = accountDAO.getSortedAccount("email", page, pageSize);
                break;
            case "status":
                accountList = accountDAO.getSortedAccount("status", page, pageSize);
                break;
            default:
                accountList = accountDAO.listAllAccount(page, pageSize);
                break;
        }
        System.out.println("AccountList: " + accountList);
        totalRecord = accountDAO.getTotalRecord();
        totalPage = (totalRecord % pageSize) == 0 ? (totalRecord / pageSize) : ((totalRecord / pageSize) + 1);

        pageControl.setPage(page);
        pageControl.setTotalPage(totalPage);
        pageControl.setTotalRecord(totalRecord);
        return accountList;
    }

    private void filterAccount(HttpServletRequest request, PageControl pageControl) {

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
        StringBuilder requestURL = new StringBuilder(request.getRequestURL().toString());
        requestURL.append("?action=filterAccount");

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

        String genderStr = request.getParameter("gender");
        int gender = -1;
        if (genderStr != null && !genderStr.isEmpty()) {
            try {
                gender = Integer.parseInt(genderStr);
            } catch (NumberFormatException e) {
                gender = -1; // Invalid gender value
            }
        }

        String statusStr = request.getParameter("status");
        int status = -1;
        if (statusStr != null && !statusStr.isEmpty()) {
            status = "active".equals(statusStr) ? 1 : 0;
        }

        int role;
        try {
            role = Integer.parseInt(request.getParameter("role"));
        } catch (NumberFormatException e) {
            role = 0;
        }

        System.out.println("Role: " + role);
        System.out.println("Status: " + status);
        System.out.println("Gender: " + gender);

        List<Account> listAccount = accountDAO.filterAccount(page, pageSize, role, gender, status);
        int totalRecord = accountDAO.getTotalFilteredRecord(role, gender, status);
        int totalPage = (totalRecord % pageSize) == 0 ? (totalRecord / pageSize) : ((totalRecord / pageSize) + 1);
        pageControl.setPage(page);
        pageControl.setTotalPage(totalPage);
        pageControl.setTotalRecord(totalRecord);
        request.setAttribute("listAccount", listAccount);
        request.setAttribute("pageControl", pageControl);
    }

    private void searchUsers(HttpServletRequest request, PageControl pageControl) {
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
        StringBuilder requestURL = new StringBuilder(request.getRequestURL().toString());
        requestURL.append("?action=searchUsers");

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
        String search = request.getParameter("search");
        List<Account> listAccount = accountDAO.searchUser(page, pageSize, search);
        int totalRecord = accountDAO.getTotalRecordBySearchUser(search);
        int totalPage = (totalRecord % pageSize) == 0 ? (totalRecord / pageSize) : ((totalRecord / pageSize) + 1);
        pageControl.setPage(page);
        pageControl.setTotalPage(totalPage);
        pageControl.setTotalRecord(totalRecord);
        request.setAttribute("listAccount", listAccount);
        request.setAttribute("pageControl", pageControl);
    }

}
