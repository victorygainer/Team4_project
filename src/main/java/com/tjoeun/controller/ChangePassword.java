package com.tjoeun.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tjoeun.dao.UserInfoDAO;
import com.tjoeun.vo.UserInfoVO;

@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChangePassword() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// System.out.println("ChangePassword 서블릿의 doGet() 메소드 실행");
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// System.out.println("ChangePassword 서블릿의 doPost() 메소드 실행");
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// System.out.println("ChangePassword 서블릿의 actionDo() 메소드 실행");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		String userID = request.getParameter("userID");
		String userPassword = request.getParameter("userPassword").trim();
		String originalPassword = request.getParameter("originalPassword").trim();
		String userPassword1 = request.getParameter("userPassword1").trim();
		String userPassword2 = request.getParameter("userPassword2").trim();
		
		// 입력 체크
		if (originalPassword == null || originalPassword.equals("") ||
			userPassword1 == null || userPassword1.equals("") ||
			userPassword2 == null || userPassword2.equals(""))
			{
			response.getWriter().write("1");
			return;
		}
		
		// 비밀번호 체크
		if (!userPassword.equals(originalPassword)) {
			// 비밀번호 불일치 메시지 session에 저장한다.
			response.getWriter().write("2");
			return;
		}
		
		if (!userPassword1.equals(userPassword2)) {
			// 비밀번호 불일치 메시지 session에 저장한다.
			response.getWriter().write("3");
			return;
		}
		
		// 넘어온 데이터가 정상이므로 RegisterVO 클래스 객체를 만들어 저장한다.
		UserInfoVO vo = new UserInfoVO();
		vo.setUserID(userID);
		vo.setUserPassword(userPassword1);
		//System.out.println(vo);
		
		// 테이블에 회원 정보를 저장하는 메소드를 실행한다.
		int result = new UserInfoDAO().userUpdate(vo);
		//System.out.println(result);
		
		// 저장 체크
		if (result == 1) {
			// update sql 명령이 정상적으로 실행되었을 때 메시지를 session에 저장한다.
			response.getWriter().write("4");
		} else {
			// update sql 명령이 정상적으로 실행되지 않았을 때 메시지를 session에 저장한다.
			response.getWriter().write("5");
		}
	}

}






