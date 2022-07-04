package com.tjoeun.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.vo.ContentVO;
import com.tjoeun.vo.ReservationParam;
import com.tjoeun.vo.ReservationVO;

public class ReservationDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
private static ReservationDAO instance = new ReservationDAO();
	
	public ReservationDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "joe", "0000");
			//System.out.println("연결성공: " + conn);
		} catch (ClassNotFoundException e) {
			System.out.println("클래스가 존재하지 않습니다.");
		} catch (SQLException e) {
			System.out.println("알 수 없는 오류가 발생했습니다.");
		}
	}
	
	public static ReservationDAO getInstance() {
		return instance;
	}
	
	public int resInsert(ReservationVO ro) {
		System.out.println("ReservationDAO 클래스의 resInsert() 메소드");
		try {
			String sql = "insert into reservation (residx, idx, resid, subject, contentowner) \r\n"
					+ "		values (reservation_residx_seq.nextval, ?, ?, ?, ?)";
			/*
			String sql = "insert into ajax (idx, name, age, gender, email) values (ajax_idx_seq.nextval, ?, ?, ?, ?)";
			 */
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ro.getIdx());
			pstmt.setString(2, ro.getResID());
			pstmt.setString(3, ro.getSubject());
			pstmt.setString(4, ro.getContentOwner());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int selectResCount(SqlSession mapper, ReservationParam param) {
		System.out.println("ReservationDAO 클래스의 selectResCount() 메소드");
		//System.out.println("DAO ro :" + param);
		return (int) mapper.selectOne("selectResCount", param);
	}

	public ArrayList<ReservationVO> selectResList(SqlSession mapper, ReservationParam param) {
		System.out.println("ReservationDAO 클래스의 selectResList() 메소드");
		return (ArrayList<ReservationVO>) mapper.selectList("selectResList", param);
	}

	public int selectMyResCount(SqlSession mapper, ReservationParam param) {
		System.out.println("ReservationDAO 클래스의 selectMyResCount() 메소드");
		//System.out.println("DAO selectMyResCount :" + param);
		return (int) mapper.selectOne("selectMyResCount", param);
	}

	public ArrayList<ReservationVO> selectMyResList(SqlSession mapper, ReservationParam param) {
		// TODO Auto-generated method stub
		return (ArrayList<ReservationVO>) mapper.selectList("selectMyResList", param);
	}


}
