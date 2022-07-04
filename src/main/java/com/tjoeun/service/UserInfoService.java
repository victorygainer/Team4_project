package com.tjoeun.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.ibatis.session.SqlSession;
import com.tjoeun.dao.UserInfoDAO;
import com.tjoeun.mybatis.MySession;
import com.tjoeun.vo.UserInfoVO;

public class UserInfoService {

	private static UserInfoService instance = new UserInfoService();

	private UserInfoService() {
	}

	public static UserInfoService getInstance() {
		return instance;
	}

	private UserInfoDAO dao = UserInfoDAO.getInstance();
	
	public void register(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("UserInfoService 클래스의 register() 메소드");
		SqlSession mapper = MySession.getSession();
		
		UserInfoVO vo = new UserInfoVO();
		vo.setUserID(request.getParameter("userID"));
		vo.setUserPassword(request.getParameter("userPassword"));
		System.out.println(vo);
		
		dao.register(mapper, vo);
		mapper.commit();
		mapper.close();
	}
}

