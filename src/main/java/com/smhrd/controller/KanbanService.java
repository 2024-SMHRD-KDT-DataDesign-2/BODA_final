package com.smhrd.controller;

import java.io.IOException;

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

@WebServlet("/KanbanService")
public class KanbanService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. 요청객체에 대하여 인코딩
		request.setCharacterEncoding("UTF-8");

		// 2. 요청객체로 부터 데이터 값 꺼내기
		String task_name = request.getParameter("task_name");
		String task_info = request.getParameter("task_info");
		String task_progress = request.getParameter("status");
		String task_st_dt = request.getParameter("task_st_dt");
		String task_ed_dt = request.getParameter("task_ed_dt");
		String task_file1 = request.getParameter("task_file1");
		String task_importance = request.getParameter("task_importance");
		
		// 3. 세션에서 값 꺼내오기
		HttpSession session = request.getSession();
		
		memberDTO meminfo = (memberDTO)session.getAttribute("info");
		projectDTO projinfo = (projectDTO)session.getAttribute("projData");
		
		
		KanbanDTO dto = new KanbanDTO();
		KanbanDAO dao = new KanbanDAO();
		
		if(task_progress.equals("todo")) {
			dto.setKanban_color("blue");
		}else if(task_progress.equals("inprogress")) {
			dto.setKanban_color("green");
		}else {
			dto.setKanban_color("red");
		}
		
		dto.setKanban_idx(0);
		dto.setTeam_idx(projinfo.getTeam_idx());
		dto.setTask_name(task_name);
		dto.setTask_info(task_info);
		dto.setTask_progress(task_progress);
		dto.setTask_st_dt(task_st_dt);
		dto.setTask_ed_dt(task_ed_dt);
		dto.setTask_file1(task_file1);
		dto.setTask_file2(task_file1);
		dto.setTask_file3(task_file1);
		
		dto.setTask_importance(task_importance);
		dto.setMem_id(meminfo.getMem_id());

		int result= dao.create_kanban(dto);

		System.out.println(result);
		
		if (result == 1) {
			
			RequestDispatcher rd = request.getRequestDispatcher("KanbanSelect");
			rd.forward(request, response);

		}

	}

}
