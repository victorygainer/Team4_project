package com.tjoeun.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.controller.HomeController;
import com.tjoeun.vo.UserInfoVO;

public class UserInfoDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private static UserInfoDAO instance = new UserInfoDAO();
	
	public UserInfoDAO() {		
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
	
	public static UserInfoDAO getInstance() {
		return instance;
	}

	public void register(SqlSession mapper, UserInfoVO vo) {
		System.out.println("UserInfoDAO 클래스의 register() 메소드");
		mapper.insert("register", vo);
	}

	public int loginCheck(String userID, String userPassword) {
		System.out.println("UserInfoDAO 클래스의 loginCheck() 메소드");
		
		try {
			String sql = "select * from userinfo where userID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs= pstmt.executeQuery();
			
			//System.out.println("rs.next(): " + rs.next());
			//System.out.println("rs.getString(): " + rs.getString(2));
			//System.out.println("userPassword: " + userPassword);
			//System.out.println(rs.getString(2).equals(userPassword));
			
			if(rs.next()) {
				if(rs.getString(2).equals(userPassword)) {
					return 1;
				} 
				else {
					return 0;
				}
			}
			return -1;
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -2;
	}

	public int userUpdate(UserInfoVO vo) {
		System.out.println("UserInfoDAO 클래스의 userUpdate() 메소드");
		try {
			String sql = "update userinfo set userpassword = ? where userid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserPassword());
			pstmt.setString(2, vo.getUserID());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}


}