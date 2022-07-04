package com.tjoeun.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tjoeun.dao.ReservationDAO;
import com.tjoeun.vo.ReservationVO;

@WebServlet("/Reservation")
public class Reservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public Reservation() {
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
		
		int idx = Integer.parseInt(request.getParameter("idx")); // 콘텐츠 번호
		String userID = request.getParameter("userID"); // 콘텐츠 소유자
		String resID = request.getParameter("resID"); // 콘텐츠 예약자
		String subject = request.getParameter("subject");// 콘텐츠 이름
		System.out.println(idx);
		System.out.println(userID);
		System.out.println(resID);
		System.out.println(subject);
		
		// 입력체크
		// 로그인 하지 않은 사람은 예약불가
		if (resID == null) {
			response.getWriter().write("1");
			return;
		}
		// 콘텐츠 소유자 예약불가
		if (resID.equals(userID)) {
			response.getWriter().write("2");
			return;
		}
		
		// 넘어온 데이터가 정상이므로 ReservationVO 클래스 객체를 만들어 저장한다.
		ReservationVO ro = new ReservationVO();
		ro.setIdx(idx);
		ro.setResID(resID);
		ro.setSubject(subject);
		ro.setContentOwner(userID);
		
		int result = new ReservationDAO().resInsert(ro);
		
		if (result == 1) {
			// update sql 명령이 정상적으로 실행되었을 때 메시지를 session에 저장한다.
			response.getWriter().write("3");
		} else {
			// update sql 명령이 정상적으로 실행되지 않았을 때 메시지를 session에 저장한다.
			response.getWriter().write("4");
		}		
	}

}






