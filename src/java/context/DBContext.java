/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author TienP
 */
import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {

    protected Connection connection;
    protected PreparedStatement statement;
    protected ResultSet resultSet;

    public DBContext() {
        try {
            String url = "jdbc:sqlserver://" + serverName + ":" + portNumber
                    + ";databaseName=" + dbName;
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, userID, password);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private final String serverName = "localhost";
    private final String dbName = "stylus.6";
    private final String portNumber = "1433";
    private final String userID = "sa";
    private final String password = "Aqswdefr19";

}
