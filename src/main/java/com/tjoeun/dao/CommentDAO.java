package com.tjoeun.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.tjoeun.vo.CommentVO;

public class CommentDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public CommentDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "joe", "0000");
			//System.out.println("연결성공: " + conn);
		} catch (ClassNotFoundException e) {
			System.out.println("연결실패1");
		} catch (SQLException e) {
			System.out.println("연결실패2");
		}
	}

	public int insertComment(CommentVO cmo) {
		System.out.println("CommentDAO의 Insert() 메소드");
		//System.out.println("DAO :" + cmo);
		try {
			String sql = "insert into usercomment (idx, userID, userComment) values (?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cmo.getIdx());
			pstmt.setString(2, cmo.getUserID());
			pstmt.setString(3, cmo.getUserComment());
//			pstmt.executeUpdate();
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<CommentVO> commentSelectList(int idx) {
		System.out.println("CommentDAO의 commentSelectList() 메소드");
		ArrayList<CommentVO> list = new ArrayList<CommentVO>();
		try {
			String sql = "select * from usercomment where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CommentVO cmo = new CommentVO();
				cmo.setIdx(rs.getInt("idx"));
				cmo.setUserID(rs.getString("userID"));
				cmo.setUserComment(rs.getString("userComment"));
				cmo.setWritedate(rs.getDate("writeDate"));
				list.add(cmo);	
				//System.out.println(list);
			}
		} catch (Exception e) {
			
		}
		return list;
	}

}
