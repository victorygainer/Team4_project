package com.tjoeun.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.dao.ContentDAO;
import com.tjoeun.mybatis.MySession;
import com.tjoeun.vo.ContentList;
import com.tjoeun.vo.ContentVO;
import com.tjoeun.vo.Param;

public class ContentService {

	private static ContentService instance = new ContentService();

	private ContentService() {
	}

	public static ContentService getInstance() {
		return instance;
	}

	private static ContentDAO dao = ContentDAO.getInstance();
	
	public void contentInsert(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("contentInsert 클래스의 insert() 메소드");
		SqlSession mapper = MySession.getSession();

		ContentVO co = new ContentVO();
		co.setUserID(request.getParameter("userID"));
		co.setSubject(request.getParameter("subject"));
		co.setContent(request.getParameter("content"));

		dao.contentInsert(mapper, co);

		mapper.commit();
		mapper.close();
	}

	public static ContentList selectList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("contentService 클래스의 selectList() 메소드");

		// list.nhn이 요청될 때 넘어오는 브라우저에 표시할 페이지 번호를 받는다.
		// 브라우저 표시할 페이지 번호가 정상적으로 넘어왔으면 넘어온 페이지 번호로, 정상적으로 넘어오지 않았다면
		// 1로 브라우저에 표시할 페이지 변호를 설정한다.
		int currentPage = 1;

		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (Exception e) {
		}

		// 1페이지에 표시할 글의 개수를 정한다.
		int pageSize = 10;
		// 테이블에 저장된 전체 글의 개수를 얻어온다.
		SqlSession mapper = MySession.getSession();
		int totalCount = dao.selectCount(mapper);

		// 1페이지 분량의 글과 페이지 작업에 사용되는 8개의 변수를 초기화시키는 클래스(MvcboardList)의 객체를 만든다.
		ContentList contentList = new ContentList(pageSize, totalCount, currentPage);
		// 1페이지 분량의 시작, 끝, 인덱스를 기억하는 HashMap 객체를 만들고 초기화시킨다.
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", contentList.getStartNo());
		hmap.put("endNo", contentList.getEndNo());
		// 1페이지 분량의 글 목록을 얻어와서 contentList의 ArrayList에 넣어준다.
		contentList.setList(dao.selectList(mapper, hmap));
		for (ContentVO co : contentList.getList()) {
			System.out.println("1페이지 분량의 글목록: " + co);
			request.setAttribute("contentList", contentList);
			mapper.close();
		}
		return contentList;
	}

	public static ContentList selectListMulti(HttpServletRequest request, HttpServletResponse response, String item, int currentPage) {
		SqlSession mapper = MySession.getSession();
		ContentList contentList = null;
		System.out.println("ContentService 클래스의 selectListMulti() 메소드");
		try {
			int pageSize= 10;
			Param param = new Param();
			param.setItem(item);
			int totalCount = dao.selectCountMulti(mapper, param);
			System.out.println("totalCount: " + totalCount);
			
			contentList = new ContentList(pageSize, totalCount, currentPage);
			param.setStartNo(contentList.getStartNo());
			System.out.println("contentList.getStartNo(): " + contentList.getStartNo());
			param.setEndNo(contentList.getEndNo());
			System.out.println("contentList.getEndNo(): " + contentList.getEndNo());
			contentList.setList(dao.selectListMulti(mapper, param));
			System.out.println(contentList.getList());
				mapper.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return contentList;
	}
	

	public void orderInsert(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("contentService 클래스의 orderInsert() 메소드");
		SqlSession mapper = MySession.getSession();

		ContentVO co = new ContentVO();
		co.setIdx(Integer.parseInt(request.getParameter("idx")));
		dao.contentStatus(mapper, co);

		mapper.commit();
		mapper.close();
	}

	public void contentIncrement(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("contentService 클래스의 increment() 메소드");
		SqlSession mapper = MySession.getSession();
		int idx = Integer.parseInt(request.getParameter("idx"));
		dao.contentIncrement(mapper, idx);
		mapper.commit();
		mapper.close();
	}

	public void selectContentByIdx(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("contentService 클래스의 selectByIdx() 메소드");
		SqlSession mapper = MySession.getSession();
		int idx = Integer.parseInt(request.getParameter("idx"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		ContentVO co = dao.selectContentByIdx(mapper, idx);
		System.out.println("selectContentByIdx: " + co);
		request.setAttribute("co", co);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("enter", "\r\n");
		mapper.close();
	}

	public String checkContentOwner(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("contentService 클래스의 checkContentOwner 메소드");
		SqlSession mapper = MySession.getSession();
		int idx = Integer.parseInt(request.getParameter("idx"));
		System.out.println(idx);
		ContentVO co = dao.checkContentOwner(mapper, idx);
		System.out.println(co);
		String userID = co.getUserID();
		System.out.println("Service userID: " + userID);
		co.setUserID(userID);
		return userID;
	}
}
