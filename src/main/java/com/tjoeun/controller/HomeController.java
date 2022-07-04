package com.tjoeun.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.tjoeun.dao.UserInfoDAO;
import com.tjoeun.service.ContentService;
import com.tjoeun.service.ReservationService;
import com.tjoeun.service.UserInfoService;
import com.tjoeun.vo.ContentList;
import com.tjoeun.vo.ContentVO;
import com.tjoeun.vo.ReservationList;
import com.tjoeun.vo.UserInfoVO;

@WebServlet("*.nhn")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// 컨트롤러에서 사용할 service 클래스 객체를 생성
	private UserInfoService userService = UserInfoService.getInstance();
	private ContentService contentService = ContentService.getInstance();
	private ReservationService reservationService = ReservationService.getInstance();
	private UserInfoDAO dao = UserInfoDAO.getInstance();
	private ContentList list = new ContentList();
	private ReservationList resList = new ReservationList();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HomeController 클래스의 doGet() 메소드");
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HomeController 클래스의 doPost() 메소드");
		// System.out.println(request.getParameter("name"));
		actionDo(request, response);
	}

	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HomeController 클래스의 actionDo() 메소드");
		
		//	한글 깨짐 방지
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		//	요청을 받는다.
		HttpSession session = request.getSession();
		String url = request.getRequestURI();
		String contextPath = request.getContextPath();
		String context = url.substring(contextPath.length());
		
		//	요청받은 경로를 만든다.
		String viewPage = "/WEB-INF/";
		switch (context) {
			case "/index1.nhn":
				viewPage += "index1";
				break;
			
		// 로그인 DB 시작
			case "/login.nhn":
				viewPage += "login";
				break;
				
			case "/register.nhn":
				viewPage += "register";
				break;
				
			case "/registerOK.nhn":
				String userID = request.getParameter("userID");
				String userPassword = request.getParameter("userPassword");
				UserInfoVO vo = new UserInfoVO(); 
				vo.setUserID(userID);
				vo.setUserPassword(userPassword);
				// System.out.println("registerVO: " + vo);
				userService.register(request, response);
				session = request.getSession();
				session.setAttribute("userID", userID);
				viewPage += "index1";
				break;	
				
			case "/loginOK.nhn":
//				로그인 버튼이 클릭되면 넘어오는 데이터(id, password)를 받는다.
//				request.getParameter(): 이전 페이지에서 넘어오는 데이터를 받는다. 넘어오는 데이터가 없으면 null 이다.
				userID = request.getParameter("userID");
				userPassword = request.getParameter("userPassword");
				int LOGIN_OK = 1;
				int WRONG_PASSWORD = 0;
				int ID_NOT_EXIST = -1;
				vo = new UserInfoVO(); 
				vo.setUserID(userID);
				vo.setUserPassword(userPassword);
				System.out.println("userID = " + userID + ", userPassword= " + userPassword);
				int loginUser = dao.loginCheck(userID, userPassword);
				//	System.out.println(loginCheck);
				String msg ="";	
				if(loginUser == LOGIN_OK) {
					session.setAttribute("userID", userID);
					session.setAttribute("userPassword", userPassword);
					viewPage += "index1";
					break;
				} else if(loginUser == WRONG_PASSWORD) {
					msg = "패스워드를 잘못 입력하셨습니다.";
					session.setAttribute("msg",msg);
					viewPage += "errorPage";
					break;
				} else if(loginUser == ID_NOT_EXIST) {
					msg = "존재하지 않는 아이디입니다.";
					session.setAttribute("msg",msg);
					viewPage += "errorPage";
					break;
				} else {
					msg = "시스템(SQL)에 문제가 있습니다.";
					session.setAttribute("msg",msg);
					viewPage += "errorPage";
					break;
				}
				
				
			case "/logout.nhn":
				session.invalidate();
				viewPage += "index1";
				break;
				
			case "/mypageView.nhn":
				viewPage += "mypageView";
				break;
				
			case "/errorPage.nhn":
				viewPage += "errorPage";
				break;
				
		// 컨텐츠 DB 시작 	
			case "/content.nhn":
				viewPage += "content";
				break;
			case "/contentOK.nhn":
				
				contentService.contentInsert(request, response);
				
				viewPage += "index1";
				break;
				
			case "/list.nhn":
				//브라우저에 출력할 1페이지 분량의 글과 페이징 작업에 사용할 8개의 변수가 저장된 클래스 객체를 
				// 얻어오는 메소드를 호출한다.
				contentService.selectList(request, response);
				viewPage += "list";
				break;
				
			case "/contentSearch.nhn":
				int currentPage = 1;
				try {
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
				} catch (NumberFormatException e) {}
				
				String item = request.getParameter("item");
				System.out.println(item);
				if (item != null) {
					session.setAttribute("item", item);
				} else {
					item = (String)session.getAttribute("item");
				}
				
				if (item == null || item.trim().length() == 0) {
					list =  ContentService.selectList(request,response);
				} else {
					list = ContentService.selectListMulti(request, response, item, currentPage);
				}
				System.out.println("list:" + list);
				request.setAttribute("contentList", list);
				request.setAttribute("enter", "\r\n");
				viewPage += "searchView";
				break;
				
			case "/increment.nhn":
				contentService.contentIncrement(request, response);
				viewPage += "contentIncrement";
				break;
				
			case "/contentView.nhn":
				contentService.selectContentByIdx(request, response);
				viewPage += "contentView";
				break;
				
			case "/updatePassword.nhn":
				viewPage += "changePasswordForm";
				break;
				
			case "/changePasswordForm.nhn":
				viewPage += "changePasswordForm";
				break;
			
			// 예약 
			case "/reservationGo.nhn":
				currentPage = 1;
				try {
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
				} catch (NumberFormatException e) {}
				userID = request.getParameter("userID");
				//System.out.println("reservationGo userID: " + userID);

				request.setAttribute(userID, "userID");
				resList = reservationService.selectResList(request, response);
				//System.out.println("resList:" + resList);
				request.setAttribute("reservationList", resList);
				viewPage += "reservationView";
				break;	
			
			case "/myContentResGo.nhn":
				currentPage = 1;
				try {
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
				} catch (NumberFormatException e) {}
				userID = request.getParameter("userID");
				//System.out.println("mycontentResGo userID: " + userID);
				request.setAttribute(userID, "userID");
				resList = reservationService.selectMyResList(request, response);
				System.out.println("resList:" + resList);
				request.setAttribute("reservationList", resList);
				viewPage += "myContentResView";
				break;	
			}
			

		
		viewPage += ".jsp"; /* "/WEB-INF/" + "signUp" + ".jsp" => /WEB-INF/signUp.jsp */
		// System.out.println(viewPage);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}