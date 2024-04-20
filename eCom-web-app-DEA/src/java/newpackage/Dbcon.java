/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class Dbcon {
    
    private Connection conn;

    public Dbcon() {
        conn = null;
    }

    public void connect() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/login";
        String username = "root";
        String password = "";
        conn = DriverManager.getConnection(url, username, password);
    }

    public void disconnect() throws SQLException {
        if (conn != null) {
            conn.close();
        }
    }

    public ResultSet executeQuery(String query) throws SQLException {
        Statement stmt = conn.createStatement();
        return stmt.executeQuery(query);
    }

    public void executePreparedStatement(String query, Object... params) throws SQLException {
        PreparedStatement preparedStatement = conn.prepareStatement(query);
        for (int i = 0; i < params.length; i++) {
            preparedStatement.setObject(i + 1, params[i]);
        }
        preparedStatement.executeUpdate();
        preparedStatement.close();
    }
    public ResultSet executeQueryWithPreparedStatement(String query, Object... params) throws SQLException {
    PreparedStatement preparedStatement = conn.prepareStatement(query);
    for (int i = 0; i < params.length; i++) {
        preparedStatement.setObject(i + 1, params[i]);
    }
    ResultSet resultSet = preparedStatement.executeQuery();
    return resultSet;
}
}