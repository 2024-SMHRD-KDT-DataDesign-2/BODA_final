package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.projectDAO;
import com.smhrd.model.projectDTO;

@WebServlet("/프로젝트검색Service")
public class 프로젝트검색Service extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");		
	
		String search_value = request.getParameter("search_value");
		System.out.println("프로젝트검색Service의 req.search 값 : "+request.getParameter("search_value"));
		
		projectDAO dao = new projectDAO();
		
		List<projectDTO> search_resultList = dao.searchProject(search_value+"%");
		
		request.setAttribute("search_resultList", search_resultList);
		System.out.println("프로젝트검색리턴값 : "+search_resultList);
		
		RequestDispatcher rd = request.getRequestDispatcher("팀찾기.jsp");
		rd.forward(request, response);
	
	}

}
