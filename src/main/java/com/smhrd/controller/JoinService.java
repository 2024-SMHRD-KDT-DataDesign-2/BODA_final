package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.memberDTO;
import com.smhrd.model.projectDAO;

@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. 요청객체에 대하여 인코딩
		request.setCharacterEncoding("UTF-8");

		// 2. 요청객체로 부터 데이터 값 꺼내기
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		String mem_name = request.getParameter("mem_name");
		String mem_nick = request.getParameter("mem_nick");
		String mem_birthdate = request.getParameter("mem_birthdate");
		String mem_email = request.getParameter("mem_email");

		System.out.println(mem_birthdate);

		// 3. 회원가입을 위한 데이터 처리 -> DB 데이터 저장하는 과정!
		memberDTO dto = new memberDTO(mem_id, mem_pw, mem_name, mem_nick, mem_birthdate, mem_email);
		projectDAO dao = new projectDAO();
		int result = dao.join(dto);

		// 4. 데이터 처리결과에 따른 결과화면 처리
		if (result == 1) {
			// 회원가입 성공! -> 회원가입한 mem_name 값을 가지고 페이지 이동

		} else {
			// 회원가입 실패!
		}
		RequestDispatcher rd = request.getRequestDispatcher("찐로그인.jsp");
		rd.forward(request, response);

	}

}
