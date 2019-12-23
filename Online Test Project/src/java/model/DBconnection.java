package model;

import java.sql.*;

public class DBconnection {

    Connection con = null;
    String url = "jdbc:mysql://localhost:3306/online_tests";
    
    String user = "root";
    String password = "POULAbola@1509";

    public Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException | SQLException cnfe) {
            System.err.println("Exception: " + cnfe);
        }

        return con;
    }
    

}
