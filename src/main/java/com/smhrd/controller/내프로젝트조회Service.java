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

import com.smhrd.model.memberDTO;
import com.smhrd.model.projectDAO;
import com.smhrd.model.projectDTO;

@WebServlet("/내프로젝트조회Service")
public class 내프로젝트조회Service extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		session.getAttribute("mem_id");
		System.out.println("내프로젝트조회Service에 info 세션이 잇나요?"+session.getAttribute("mem_id"));
		
		memberDTO temp = (memberDTO)session.getAttribute("info");
		System.out.println("session에 info가 있어서 temp가 있나요?" + temp);
		
		// 1. DAO 생성
				projectDAO dao = new projectDAO();
				
				// 2. dao.selectAll() 기능 사용하기
				//    => DB에서 전체회원조회하는 기능 
				List<projectDTO> resultList = dao.selectMyProject(temp);
				System.out.println("내프로젝트정보"+resultList);
				
				// 3. request scope에 전체 회원정보 담아주기 (session 안쓰고 request 쓰기)
				request.setAttribute("resultList2", resultList);
				
				// 4. select.jsp 이동 forward방식으로 이동 
				
				RequestDispatcher rd =request.getRequestDispatcher("내프로젝트.jsp");
				rd.forward(request, response);
	
	
	
	}

}
