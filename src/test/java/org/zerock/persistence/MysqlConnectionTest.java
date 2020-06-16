package org.zerock.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

public class MysqlConnectionTest {
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://127.0.0.1:3306/test_db?serverTimezone=UTC";
	private static final String USER = "root";
	private static final String PW = "12341234";
	@Test
	public void testConnection() throws ClassNotFoundException {
		Class.forName(DRIVER);
		try (Connection conn
				= DriverManager.getConnection(
					URL, USER, PW)){
				
			System.out.println(conn);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("MYSQL CONNECTION fail");
		}
	}
}
