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
import com.smhrd.model.projectDTO;
import com.smhrd.model.team_organizingDAO;
import com.smhrd.model.team_organizingDTO;

@WebServlet("/프로젝트생성Service")
public class 프로젝트생성Service extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 인코딩부터 하기
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		// 2. 요청객체로부터 데이터값 꺼내기
		int team_idx = 0; // 이것도 가짜 데이터입니다.
		String team_name = request.getParameter("team_name");
		String proj_name = request.getParameter("proj_name");
		String proj_st_dt = request.getParameter("proj_st_dt");
		String proj_ed_dt = request.getParameter("proj_ed_dt");
		String proj_status = request.getParameter("proj_status");
		String proj_des = request.getParameter("proj_des");
		String mem_id = (String) session.getAttribute("mem_id");

		// 프로젝트 생성을 위한 데이터 처리 -> DB에 데이터 저장하기!
		projectDTO dto = new projectDTO(team_idx, team_name, proj_name, proj_des, proj_st_dt, proj_ed_dt, proj_status,mem_id);
		projectDAO dao = new projectDAO();
		int result = dao.create_proj(dto);
		System.out.println(result);
		
		int team_idx1 = Integer.parseInt(dao.team_idx(dto));
		System.out.println(team_idx1);
		
		team_organizingDTO dto2 = new team_organizingDTO(0, team_idx1, mem_id, "y","y");
		team_organizingDAO dao2 = new team_organizingDAO();
		
		int result2 = dao2.make_to(dto2);
		
		if (result == 1) {
			System.out.println("조건문 입장");

			request.setAttribute("proj_name", proj_name);
			request.setAttribute("team_idx", team_idx1);

			RequestDispatcher dispatcher = request.getRequestDispatcher("선택창.jsp"); // 주소를 쓸 때에는 반드시 상대번지 값을 적어주어야
																							// 한다.
			dispatcher.forward(request, response);

		} else {
			System.out.println("뭔가 잘못됨 ㅇㅇ");
		}

	}

}
