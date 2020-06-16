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
@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/*.xml"})
public class DatasourceTest {
	@Inject
	private DataSource ds;
	@Test
	public void testConnection() {
		try (
			Connection conn = ds.getConnection(
					)){
			System.out.println(conn);
			log.info(conn);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("datasource test fail");
		}
	}
}
