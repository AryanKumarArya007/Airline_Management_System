package airline.servlets;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class DatabaseConnection {

    private static DataSource dataSource;

    // Static block to initialize the DataSource using JNDI lookup
    static {
        try {
            // Initialize the JNDI context and get the DataSource
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            // This must match the name you configure in context.xml
            dataSource = (DataSource) envContext.lookup("jdbc/airlineDB");
        } catch (NamingException e) {
            e.printStackTrace();
            throw new ExceptionInInitializerError("Database connection setup failed");
        }
    }

    // Method to get a connection from the DataSource
    public static Connection getConnection() throws SQLException {
        try {
            // Return a connection from the DataSource
            return dataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Failed to get database connection", e);
        }
    }
}
