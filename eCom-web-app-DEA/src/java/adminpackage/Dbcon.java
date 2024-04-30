package adminpackage;

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

    // Method to establish a database connection
    public void connect() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/test";
        String username = "root";
        String password = "";
        conn = DriverManager.getConnection(url, username, password);
    }

    // Method to disconnect from the database
    public void disconnect() throws SQLException {
        if (conn != null) {
            conn.close();
        }
    }

    // Method to execute a SQL query and return a ResultSet
    public ResultSet executeQuery(String query) throws SQLException {
        Statement stmt = conn.createStatement();
        return stmt.executeQuery(query);
    }

    // Method to execute a PreparedStatement with parameters
    public void executePreparedStatement(String query, Object... params) throws SQLException {
        PreparedStatement preparedStatement = conn.prepareStatement(query);
        for (int i = 0; i < params.length; i++) {
            preparedStatement.setObject(i + 1, params[i]);
        }
        preparedStatement.executeUpdate();
        preparedStatement.close();
    }
    // Method to execute a PreparedStatement that returns an index key

    public int executePreparedStatementInt(String query, Object... params) throws SQLException {
        PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        for (int i = 0; i < params.length; i++) {
            preparedStatement.setObject(i + 1, params[i]);
        }
        preparedStatement.executeUpdate();

        ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
        if (generatedKeys.next()) {
            int generatedKey = generatedKeys.getInt(1);
            generatedKeys.close();
            preparedStatement.close();
            return generatedKey;
        } else {
            generatedKeys.close();
            preparedStatement.close();
            return -1;
        }
    }

    // Method to execute a SQL query using a PreparedStatement and return a ResultSet
    public ResultSet executeQueryWithPreparedStatement(String query, Object... params) throws SQLException {
        PreparedStatement preparedStatement = conn.prepareStatement(query);
        for (int i = 0; i < params.length; i++) {
            preparedStatement.setObject(i + 1, params[i]);
        }
        ResultSet resultSet = preparedStatement.executeQuery();
        return resultSet;
    }
}
