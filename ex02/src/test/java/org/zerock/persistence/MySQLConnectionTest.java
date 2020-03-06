package org.zerock.persistence;
import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MySQLConnectionTest {
	private static final String URL = "jdbc:mysql://127.0.0.1:3306/world?useSSL=false&characterEncoding=UTF-8&serverTimezone=UTC";
	private static final String USER = "root";
	private static final String PASSWORD = "0224";
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	@Test
	public void testConnection() throws Exception{
		try(Connection con = DriverManager.getConnection(URL,USER,PASSWORD)){
			System.out.println(con);
		}catch(Exception e) {
			System.out.println(e);
		}
	}
}
