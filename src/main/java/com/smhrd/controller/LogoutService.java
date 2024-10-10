package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutService")
public class LogoutService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 로그아웃 == 세션에 들어있는 데이터 전부 지우기

		// 1. jsp가 아니라 내장객체가 없다 -> session 꺼내오기
		HttpSession session = request.getSession();

		// 2. session 무효화 시켜주기 (모든 데이터 지우기)
		session.invalidate();

		// 한줄로 쓰기 : request.getSession().invalidate();

		// 3. main.jsp로 redirect방식으로 이동
		RequestDispatcher rd = request.getRequestDispatcher("찐로그인.jsp");
		rd.forward(request, response);

	}

}
