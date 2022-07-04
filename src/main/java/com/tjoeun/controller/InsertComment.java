package com.tjoeun.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tjoeun.dao.CommentDAO;
import com.tjoeun.vo.CommentVO;

@WebServlet("/InsertComment")
public class InsertComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertComment() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("InsertComment 클래스의 doGet() 메소드");
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("InsertComment 클래스의 doPost() 메소드");
		actionDo(request, response);
	}

	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("InsertComment 클래스의 actionDo() 메소드");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");

		int idx = Integer.parseInt(request.getParameter("idx").trim());
		String userID = request.getParameter("userID");
		String userComment = request.getParameter("userComment").trim();
		System.out.println("서블릿 idx: " + idx);
		System.out.println("서블릿 userID: " + userID);
		System.out.println("서블릿 userComment: " + userComment);
		
		
		CommentVO cmo = new CommentVO(idx, userID, userComment);
		System.out.println(cmo);
		int result = new CommentDAO().insertComment(cmo);
		response.getWriter().write(String.valueOf(result));
		response.getWriter().write(result + "");
	
	}
}
