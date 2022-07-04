package com.tjoeun.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.ibatis.session.SqlSession;
import com.tjoeun.dao.ReservationDAO;
import com.tjoeun.mybatis.MySession;
import com.tjoeun.vo.ReservationList;
import com.tjoeun.vo.ReservationParam;

public class ReservationService {

	private static ReservationService instance = new ReservationService();

	private ReservationService() {
	}

	public static ReservationService getInstance() {
		return instance;
	}

	private static ReservationDAO dao = ReservationDAO.getInstance();
	
	public static ReservationList selectResList(HttpServletRequest request, HttpServletResponse response) {
		SqlSession mapper = MySession.getSession();
		ReservationList reservationList = null;
		int currentPage = 1;
		System.out.println("ReservationService 클래스의 selectResList() 메소드");
		try {
			int pageSize = 10;
			String userID = request.getParameter("userID");
			//System.out.println("DAO: " + userID);
			ReservationParam param = new ReservationParam();
			param.setResID(userID);
			int totalCount = dao.selectResCount(mapper, param);
			//System.out.println(totalCount);
			
			// 1페이지 분량의 글과 페이지 작업에 사용되는 8개의 변수를 초기화시키는 클래스의 객체를 만든다.
			reservationList = new ReservationList(pageSize, totalCount, currentPage);
			param.setStartNo(reservationList.getStartNo());
			param.setEndNo(reservationList.getEndNo());
			reservationList.setList(dao.selectResList(mapper, param));
			//System.out.println(reservationList.getList());
			mapper.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reservationList;
	}

	public ReservationList selectMyResList(HttpServletRequest request, HttpServletResponse response) {
		SqlSession mapper = MySession.getSession();
		ReservationList reservationList = null;
		int currentPage = 1;
		System.out.println("ReservationService 클래스의 selectResList() 메소드");
		try {
			int pageSize = 10;
			String userID = request.getParameter("userID");
			System.out.println("DAO selectMyResList: " + userID);
			ReservationParam param = new ReservationParam();
			param.setContentOwner(userID);
			int totalCount = dao.selectMyResCount(mapper, param);
			System.out.println(totalCount);
			
			// 1페이지 분량의 글과 페이지 작업에 사용되는 8개의 변수를 초기화시키는 클래스의 객체를 만든다.
			reservationList = new ReservationList(pageSize, totalCount, currentPage);
			param.setStartNo(reservationList.getStartNo());
			param.setEndNo(reservationList.getEndNo());
			reservationList.setList(dao.selectMyResList(mapper, param));
			System.out.println(reservationList.getList());
			mapper.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reservationList;
	}
}
