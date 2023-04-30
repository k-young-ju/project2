package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO {
	Connection con;
	
	public void getCon() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			//String url="jdbc:mysql://192.168.0.19:3306/p2";
			String url="jdbc:mysql://localhost:3306/p2";
			String user="root";
			String password="1111";
			
			con = DriverManager.getConnection(url, user, password);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
