package dao;

import context.DBContext;
import java.security.Timestamp;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Customer;
import model.FeedBack;

public class CustomerDAO extends DBContext {

    public Customer findCustomer(Customer customer) {
        String sql = """
                     SELECT *
                       FROM [dbo].[Customer]
                       WHERE Email = ? AND Password = ?""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, customer.getEmail());
            statement.setString(2, customer.getPassword());
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                customer.setGender(resultSet.getInt("Gender"));
                customer.setCustomerID(resultSet.getInt("CustomerID"));
                customer.setAddress(resultSet.getString("Address"));
                customer.setPhone(resultSet.getString("Phone"));
                customer.setRoleID(resultSet.getInt("RoleID"));
                customer.setPassword(resultSet.getString("Password"));
                customer.setName(resultSet.getString("Name"));
                customer.setImage(resultSet.getString("Image"));
                return customer;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int getNumberAccounts() {
        try {
            String sql = "SELECT COUNT(*) FROM Customer";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int number = rs.getInt(1);
                return number;
            }
        } catch (Exception e) {
        }
        return 1;
    }

    public boolean checkEmailDuplicate(String email) {

        String sql = """
                     SELECT email FROM Account WHERE email = ? 
                     UNION
                     SELECT email FROM Customer WHERE email = ? and verify_status != 0""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Thay vì System.out.println(e); để in ra stack trace
        }
        return false;
    }

    public boolean checkEmailRegister(String email) {

        String sql = """
                     SELECT email FROM Account WHERE email = ?
                     UNION
                     SELECT email FROM Customer WHERE email = ? verify_status != 0""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Thay vì System.out.println(e); để in ra stack trace
        }
        return false;
    }

    public void changeVerifyStatus(String email, int status) {
        String sql = """
                     UPDATE Customer
                     SET verify_Status = ? , createdDate = CURRENT_TIMESTAMP
                     WHERE email = ?;""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, status);
            st.setString(2, email);
            st.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(); // Thay vì System.out.println(e); để in ra stack trace
        }
    }

    public int getVerifyStatus(String email) {
        String sql = """
                     select * from Customer
                     where email = ?;""";
        int a = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, email);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                a = rs.getInt("verify_Status");
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Thay vì System.out.println(e); để in ra stack trace
        }
        return a;
    }

    public void insert(Customer a) {
        String sql = """
                     INSERT INTO [dbo].[Customer]
                                ([Password]
                                ,[RoleID]
                                ,[Phone]
                                ,[CreatedDate]
                                ,[Gender]
                                ,[Email]
                                ,[Image]
                                ,[Name]
                                ,[Address])
                          VALUES (?,?,?, CURRENT_TIMESTAMP, ?,?,?,?,?)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, a.getPassword());
            st.setInt(2, a.getRoleID());
            st.setString(3, a.getPhone());
            st.setInt(4, a.getGender());
            st.setString(5, a.getEmail());
            st.setString(6, a.getImage());
            st.setString(7, a.getName());
            st.setString(8, a.getAddress());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(String phone, String gender, String image, String name, String address, String email) {
        String sql = """
                     UPDATE Customer
                     SET Phone = ?, Gender = ?,Image= ?, Name = ?, Address = ?
                     WHERE email = ?;""";
        try {
            System.out.println("Executing update with email: " + email);
            System.out.println("SQL: " + sql);
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, phone);
            st.setString(2, gender);
            st.setString(3, image);
            st.setString(4, name);
            st.setString(5, address);
            st.setString(6, email);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateCustomerPass(String email, String newPass) {
        String sql = "UPDATE Customer SET password = ? WHERE email = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newPass);
            st.setString(2, email);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
//    public boolean checkPassword(String email, String password){
//        String sql = "UPDATE Customer SET password = ? WHERE email = ?;";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, newPass);
//            st.setString(2, email);
//            st.executeUpdate();
//        } catch (Exception e) {
//            
//        }
//    }

    public Customer CustomerbyEmail(String email) {
        String sql = """
                     SELECT *
                       FROM [dbo].[Customer]
                       WHERE Email = ?""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, email);

            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                Customer c = new Customer();
                c.setGender(resultSet.getInt("Gender"));
                c.setCustomerID(resultSet.getInt("CustomerID"));
                c.setAddress(resultSet.getString("Address"));
                c.setPhone(resultSet.getString("Phone"));
                c.setRoleID(resultSet.getInt("RoleID"));
                c.setPassword(resultSet.getString("Password"));
                c.setName(resultSet.getString("Name"));
                c.setImage(resultSet.getString("Image"));
                c.setEmail(resultSet.getString("Email"));
                return c;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Customer getByCustomerID(int customerID) {
        String sql = "SELECT * FROM Customer WHERE CustomerID = ?";
        Customer customer = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, customerID);

            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                customer = new Customer();
                customer.setCustomerID(rs.getInt("CustomerID"));
                customer.setAddress(rs.getString("Address"));
                customer.setEmail(rs.getString("Email"));
                customer.setPhone(rs.getString("Phone"));
                customer.setRoleID(rs.getInt("RoleID"));
                customer.setPassword(rs.getString("Password"));
                customer.setName(rs.getString("Name"));
                customer.setImage(rs.getString("Image"));
                customer.setGender(rs.getInt("gender"));
                customer.setVerifiedStatus(rs.getInt("verify_Status"));
                // customer.setCreatedDate(rs.getDate("CreatedDate"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer; // Trả về đối tượng customer, không phải null
    }

    public List<Customer> getAll() {
        List<Customer> customers = new ArrayList<>();
        String sql = "select * from Customer where verify_Status != 0";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Customer customer = new Customer();
                customer.setAddress(rs.getString("Address"));
                customer.setCustomerID(rs.getInt("CustomerID"));
                customer.setEmail(rs.getString("Email"));
                customer.setGender(rs.getInt("Gender"));
                customer.setImage(rs.getString("Image"));
                customer.setPhone(rs.getString("Phone"));
                customer.setName(rs.getString("Name"));
                customer.setPassword(rs.getString("Password"));
                customer.setRoleID(rs.getInt("RoleID"));
                customer.setStatus(rs.getInt("status"));
                //    customer.setVerifiedStatus(rs.getInt("Status"));

                customers.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }

    public List<Customer> getListByPage(List<Customer> list, int start, int end) {
        ArrayList<Customer> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Customer> getSortedCustomer(String sortBy) {
        List<Customer> customers = new ArrayList<>();
        String sql = """
                     select * from Customer where verify_Status != 0""";

        switch (sortBy) {
            case "fullName":
                sql += " ORDER BY Name";
                break;
            case "email":
                sql += " ORDER BY Email";
                break;
            case "mobile":
                sql += " ORDER BY Phone";
                break;
            case "status":
                sql += " ORDER BY status";
                break;
            default:
                sql += " ORDER BY CustomerID";
                break;
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setAddress(rs.getString("Address"));
                customer.setCustomerID(rs.getInt("CustomerID"));
                customer.setEmail(rs.getString("Email"));
                customer.setGender(rs.getInt("Gender"));
                customer.setImage(rs.getString("Image"));
                customer.setPhone(rs.getString("Phone"));
                customer.setName(rs.getString("Name"));
                customer.setPassword(rs.getString("Password"));
                customer.setRoleID(rs.getInt("RoleID"));
                customer.setStatus(rs.getInt("status"));
                //    customer.setVerifiedStatus(rs.getInt("Status"));

                customers.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;

    }

    public List<Customer> filterCustomer(String fullName, String email, String mobile, int status) {
        List<Customer> customers = new ArrayList<>();
        String sql1 = """
                       select * from Customer where verify_Status != 0""";
        String sql2 = "";

        if (fullName != null && !fullName.isEmpty()) {
            sql2 += "AND Name LIKE ?  ";
        }
        if (email != null && !email.isEmpty()) {
            sql2 += "AND Email LIKE  ? ";
        }
        if (mobile != null && !mobile.isEmpty()) {
            sql2 += "AND Phone LIKE ?  ";
        }
        if (status == 1 || status == 0) {
            sql2 += "AND Status = ? ";
        }

        String sql = sql1 + sql2;

        try {
            statement = connection.prepareStatement(sql);
            int parameterIndex = 1;

            if (fullName != null && !fullName.isEmpty()) {
                statement.setString(parameterIndex++, "%" + fullName + "%");
            }
            if (email != null && !email.isEmpty()) {
                statement.setString(parameterIndex++, "%" + email + "%");
            }
            if (mobile != null && !mobile.isEmpty()) {
                statement.setString(parameterIndex++, "%" + mobile + "%");
            }
            if (status == 1 || status == 0) {
                statement.setInt(parameterIndex++, status);
            }
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setAddress(rs.getString("Address"));
                customer.setCustomerID(rs.getInt("CustomerID"));
                customer.setEmail(rs.getString("Email"));
                customer.setGender(rs.getInt("Gender"));
                customer.setImage(rs.getString("Image"));
                customer.setPhone(rs.getString("Phone"));
                customer.setName(rs.getString("Name"));
                customer.setPassword(rs.getString("Password"));
                customer.setRoleID(rs.getInt("RoleID"));
                customer.setStatus(rs.getInt("status"));
                //    customer.setVerifiedStatus(rs.getInt("Status"));

                customers.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }

}

