package org.zerock.persistence;



import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/*.xml"})
public class MybatisTest {
	@Inject
	private SqlSessionFactory sqlFactory;
	@Test
	public void testFactory() {
		System.out.println(sqlFactory);
	}
	@Test
	public void testConnection() {
		try (SqlSession session = sqlFactory.openSession(
					)){
			System.out.println(session);
			log.info(session);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("datasource test fail");
		}
	}
}
