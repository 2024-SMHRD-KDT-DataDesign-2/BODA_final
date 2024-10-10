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

import com.smhrd.model.KanbanDAO;
import com.smhrd.model.KanbanDTO;
import com.smhrd.model.memberDTO;
import com.smhrd.model.projectDAO;
import com.smhrd.model.projectDTO;

@WebServlet("/KanbanSelect")
public class KanbanSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. 요청객체에 대하여 인코딩
		request.setCharacterEncoding("UTF-8");

		// 2. 세션에서 값 꺼내오기
		HttpSession session = request.getSession();
		
		projectDTO projinfo = (projectDTO)session.getAttribute("projData");
		
		System.out.println(projinfo.getTeam_idx());
		
		KanbanDTO dto = new KanbanDTO();
		KanbanDAO dao = new KanbanDAO();
		
		List<KanbanDTO> kanbanList = dao.selectAll(projinfo.getTeam_idx());
		
		request.setAttribute("selectAll", kanbanList);
		
		RequestDispatcher rd = request.getRequestDispatcher("서브칸반.jsp");
		rd.forward(request, response);

	}

}
