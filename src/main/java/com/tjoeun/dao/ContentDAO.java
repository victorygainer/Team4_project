package com.tjoeun.dao;


import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.vo.ContentVO;
import com.tjoeun.vo.Param;

public class ContentDAO {

	private static ContentDAO instance = new ContentDAO();
	private ContentDAO() { }
	public static ContentDAO getInstance() {
		return instance;
	}
	
	public void contentInsert(SqlSession mapper, ContentVO co) {
		System.out.println("ContentDAO 클래스의 insert() 메소드");
		mapper.insert("contentInsert", co);
	}
	public void contentStatus(SqlSession mapper, ContentVO co) {
		System.out.println("ContentDAO 클래스의 contentStatus 메소드");
		mapper.update("contentStatus", co);
	}
	public int selectCount(SqlSession mapper) {
		System.out.println("ContentDAO 클래스의 selectCount() 메소드");
		return (int) mapper.selectOne("selectContentCount");
	}
	public ArrayList<ContentVO> selectList(SqlSession mapper, HashMap<String, Integer> hmap) {
		System.out.println("ContentDAO 클래스의 selectList() 메소드");
		return (ArrayList<ContentVO>) mapper.selectList("selectContentList", hmap);
	}
	public int selectCountMulti(SqlSession mapper, Param param) {
		System.out.println("ContentDAO 클래스의 selectCountMulti() 메소드");
		return (int) mapper.selectOne("selectCountMulti", param);
	}
	public ArrayList<ContentVO> selectListMulti(SqlSession mapper, Param param) {
		System.out.println("ContentDAO 클래스의 selectListMulti() 메소드");
		return (ArrayList<ContentVO>) mapper.selectList("selectListMulti", param);
	}
	public void contentIncrement(SqlSession mapper, int idx) {
		System.out.println("ContentDAO 클래스의 increment() 메소드");
		mapper.update("contentIncrement", idx);
	}
	public ContentVO selectContentByIdx(SqlSession mapper, int idx) {
		System.out.println("ContentDAO 클래스의 selectByIdx() 메소드");
		return (ContentVO) mapper.selectOne("selectContentByIdx", idx);
	}
	public ContentVO checkContentOwner(SqlSession mapper, int idx) {
		System.out.println("ContentDAO 클래스의 selectByIdx() 메소드");
		return (ContentVO) mapper.selectOne("checkContentOwner", idx);
	}
	



}
