package persistance;

import java.sql.Connection;
import java.sql.DriverManager;

public class Database {

    private static Database database;
    private Connection connection;

    private Database(){}

    public Database getInstance() {
        if(database == null) {
            database = new Database();
        }
        return database;
    }

    public boolean createConnection() {
        try {
            Class.forName("org.sqlite.JDBC");
            connection = DriverManager.getConnection("jdbc:sqlite:library.db");
            System.out.println("Opened database successfully");
            return true;
        } catch ( Exception e ) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            return false;
        }
    }
}
