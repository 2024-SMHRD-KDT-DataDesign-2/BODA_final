package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.model.CalendarDAO;
import com.smhrd.model.KanbanDAO;
import com.smhrd.model.KanbanDTO;
import com.smhrd.model.projectDTO;

@WebServlet("/CalendarService")
public class CalendarService extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. 요청객체에 대하여 인코딩
		request.setCharacterEncoding("UTF-8");

		// 2. 세션에서 값 꺼내오기
		HttpSession session = request.getSession();

		projectDTO projinfo = (projectDTO) session.getAttribute("projData");

		System.out.println(projinfo.getTeam_idx());

		// 데이터베이스에서 일정 데이터를 조회
		
		KanbanDTO dto = new KanbanDTO();
		CalendarDAO dao = new CalendarDAO();
		
		List<KanbanDTO> events = dao.calendar(projinfo.getTeam_idx());

		// JSON으로 변환
		Gson gson = new Gson();
		String json = gson.toJson(events);

		// 응답 헤더 설정
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		// JSON 데이터를 클라이언트로 전송
		response.getWriter().write(json);
		
	}
}