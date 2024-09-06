package com.happytable.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;

@Log4j2
public class JDBCTests {

	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testConnection() {

		try (Connection con = DriverManager.getConnection("jdbc:log4jdbc:oracle:thin:@jhj1395.synology.me:21521:XE", "happy",
				"7979")) {

			log.info(con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}

}
