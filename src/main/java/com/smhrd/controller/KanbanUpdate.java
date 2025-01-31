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

@WebServlet("/KanbanUpdate")
public class KanbanUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. 요청객체에 대하여 인코딩
		request.setCharacterEncoding("UTF-8");

		String kanban_idx = request.getParameter("kanban_idx");
		String task_name = request.getParameter("task_name");
		String task_info = request.getParameter("task_info");
		String task_progress = request.getParameter("status");
		String task_importance = request.getParameter("task_importance");
		
		System.out.println(kanban_idx);
		System.out.println(task_name);
		System.out.println(task_info);
		System.out.println(task_progress);
		System.out.println(task_importance);
		
		KanbanDTO dto = new KanbanDTO();
		KanbanDAO dao = new KanbanDAO();
		
		dto.setKanban_idx(Integer.parseInt(kanban_idx));
		dto.setTask_name(task_name);
		dto.setTask_info(task_info);
		dto.setTask_progress(task_progress);
		dto.setTask_importance(task_importance);
		
		int result = dao.kanbanupdate(dto);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("KanbanSelect");
		rd.forward(request, response);

	}

}
