package com.tjoeun.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tjoeun.dao.CommentDAO;
import com.tjoeun.vo.CommentVO;

@WebServlet("/CommentList")
public class CommentList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CommentList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("CommentList 클래스의 doGet() 메소드");
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("CommentList 클래스의 doPost() 메소드");
		actionDo(request, response);
	}

	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("CommentList 클래스의 actionDo() 메소드");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		int idx = Integer.parseInt(request.getParameter("idx").trim());
		String userID = request.getParameter("userID").trim();
		String userComment = request.getParameter("userComment").trim();
		System.out.println("CommentList 클래스 idx: " + idx);
		response.getWriter().write(getJSON(idx));
	}
		
		private String getJSON(int idx) {
		System.out.println("CommentList 클래스의 getJSON 메소드");
		CommentDAO dao = new CommentDAO();
		ArrayList<CommentVO> list = dao.commentSelectList(idx);
		
		StringBuffer result = new StringBuffer();
		result.append("{\"result\": [");
		for (CommentVO cmo : list) {
			result.append("[{\"value\": \"" + cmo.getUserID().trim() + "\"},");
			result.append("{\"value\": \"" + cmo.getUserComment() + "\"},");
			result.append("{\"value\": \"" + cmo.getWritedate() + "\"}],");
		}
		result.append("]}");
		//System.out.println(result);
		return result.toString();	
	}
}
