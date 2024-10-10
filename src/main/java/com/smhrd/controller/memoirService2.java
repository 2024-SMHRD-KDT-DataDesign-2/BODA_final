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
import com.smhrd.model.memoirDAO;
import com.smhrd.model.memoirDTO;
import com.smhrd.model.projectDTO;

@WebServlet("/memoirService2") // URL 매핑
public class memoirService2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 요청 객체에 대한 인코딩 설정
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();

		// 5. DAO를 통해 DB에 데이터 삽입
		memoirDAO dao = new memoirDAO();
		// 6.1 데이터 삽입 성공 후, memoir 테이블의 데이터를 조회
		List<memoirDTO> memoirList = dao.getMemoirList(); // memoir 테이블의 데이터 조회

		// 6. 처리 결과에 따른 페이지 이동

		// 6.2 조회한 데이터를 request 객체에 저장
		session.setAttribute("getMemoirList", memoirList);
		
		// 6.3 게시판 페이지로 포워딩하여 데이터를 출력
		RequestDispatcher rd = request.getRequestDispatcher("게시판.jsp");
		rd.forward(request, response);

	}
}