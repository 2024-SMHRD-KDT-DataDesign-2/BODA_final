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
import com.smhrd.model.team_organizingDTO;

@WebServlet("/팀원신청Service")
public class 팀원신청Service extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		String team_name = request.getParameter("team_name");
		String proj_name = request.getParameter("proj_name");
		String team_idx = request.getParameter("team_idx");
		System.out.println(proj_name);
		System.out.println(team_name);
		System.out.println(team_idx);
		
		HttpSession session = request.getSession();
		
		memberDTO info = (memberDTO) session.getAttribute("info");
		System.out.println("팀원신청Service - info.mem_id : " + info.getMem_id());

		projectDAO dao = new projectDAO();

		team_organizingDTO dto = new team_organizingDTO();
		
		dto.setMem_id(info.getMem_id());
		dto.setMem_role("팀원");
		dto.setTeam_idx(Integer.parseInt(team_idx));


		int result = dao.teamApply(dto);
		System.out.println("teamApply() 잘되면 1 출력 : " + result);

		RequestDispatcher rd = request.getRequestDispatcher("선택창.jsp");
		rd.forward(request, response);

	}

}
