package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.memberDTO;
import com.smhrd.model.projectDAO;

@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. 인코딩
		request.setCharacterEncoding("UTF-8");
		// 2. 데이터 꺼내오기
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		// 3. 데이터 처리하기 -> DAO거쳐서 DB와야뎀
		projectDAO dao = new projectDAO();
		memberDTO dto = new memberDTO();
		dto.setMem_id(mem_id);
		dto.setMem_pw(mem_pw);

		memberDTO info = dao.login(dto);
		memberDTO idCheck = dao.idCheck(dto);

		// 로그인 성공시 해당 회원의 모든 정보를 리턴 받는다
		String mem1 = mem_id;
		// 4. 결과 출력하기 -> 로그인 성공/실패 여부에 상관없이 무조건 main.jsp로 이동
		// 단 로그인 성공시 session 영역에 회원의 정보를 저장한 상태로 페이지 이동

		HttpSession session = request.getSession();
		if (info != null) {
			// 로그인 성공 -> main.jsp(info 정보를 session영역에 저장하여 이동)
			// 1. session영역 활용!
			session.setAttribute("mem_id", mem1);
			session.setAttribute("info", info);
			System.out.println("로그인 성공, info에 있는거" + session.getAttribute("info"));
			System.out.println("로그인 성공");
			RequestDispatcher rd = request.getRequestDispatcher("선택창.jsp");
			rd.forward(request, response);
		} else {
			session.setAttribute("idCheck", idCheck);
			System.out.println("id는 맞다, 비밀번호가 틀리셨습니다.");
			RequestDispatcher rd = request.getRequestDispatcher("로그인.jsp");
			rd.forward(request, response);
		}

	}
}
