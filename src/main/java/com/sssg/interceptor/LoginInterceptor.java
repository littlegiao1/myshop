package com.sssg.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.sun.java.swing.plaf.windows.resources.windows;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.sssg.po.User;



public class LoginInterceptor implements HandlerInterceptor{

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object arg2, Exception arg3)
			throws Exception {
		
		
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		String url = request.getRequestURI();
		if((url.indexOf("/login")>=0)||url.indexOf("/findItemByCategory")>=0||url.indexOf("/createUser")>=0||url.indexOf("/findAllItem")>=0||url.indexOf("/toItem")>=0||url.indexOf("/findItemByName")>=0||url.indexOf("/selectItemDetailByItemId")>=0||url.indexOf("/selectCategoryAndDetail")>=0||url.indexOf("/selectAllItemName")>=0||url.indexOf("/returnLogin")>=0||url.indexOf("/validateUserCode")>=0||url.indexOf("/queryUserQuestion")>=0||url.indexOf("/queryUserAnswerByUserCode")>=0||url.indexOf("/updateUserPswByUserCode")>=0) {
			return true;
		}
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user_session");
		if(user!=null) {
			return true;
		}
		System.out.println("±»À¹½Ø£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡¡£¡£");
		//request.getRequestDispatcher("/login.jsp").forward(request, response);
		response.sendRedirect(request.getContextPath()+"/returnLogin.action");
		return false;
	}
	

}
