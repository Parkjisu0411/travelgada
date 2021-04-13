package com.gada.travelgada.service;

import java.sql.*;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
public class VisitorDao {
	
	private String url = "jdbc:log4jdbc:mysql://13.125.205.62:3306/gadadb?serverTimezone=UTC&characterEncoding=UTF-8"; // 기본적으로 이 3개 기본적으로 복사
	private String uid = "gada";
	private String upw = "gada";
	
	public VisitorDao() {

		try {
			Class.forName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
		} catch (Exception e) {
		System.out.println(e.getMessage());
		}
	}

	public void setCount() {
		log.info("VisitorService setCount()");
		log.info("카운트가 들어가요!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

		Connection con = null;    
		Statement stmt = null;

		try {
			con = DriverManager.getConnection(url, uid, upw);
			stmt = con.createStatement();
			stmt.executeUpdate("insert into visitor (visitor_id, visit_date) values (get_seq('visitor_seq'),sysdate())"); //해당 데이터를 갖고 옴
	       
		}catch (Exception e) {
			e.printStackTrace();
		}

	}
}