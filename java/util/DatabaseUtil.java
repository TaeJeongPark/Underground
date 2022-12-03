package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {

	public static Connection getConnection() {
		try {
			String dbURL = "jdbc:mysql://localhost/underground";
			String dbiID = "root";
			String dbPassword = "0000";
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(dbURL,dbiID,dbPassword);
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
}
