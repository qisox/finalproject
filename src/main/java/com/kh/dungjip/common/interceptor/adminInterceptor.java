package com.kh.dungjip.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.dungjip.member.model.vo.Member;

public class adminInterceptor implements  HandlerInterceptor{

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();

		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String userType= loginUser.getUserType();
		
		if(userType.equals("관리자")) { //관리자일시
			return true; //요청 유지
			
		}else { 
			
			request.getSession().setAttribute("errorMsg", "비정상적인 접근입니다.");
			response.sendRedirect(request.getContextPath());
			
			return false; //요청 막기
		}
		
	}
	
}
