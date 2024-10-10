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

@WebServlet("/memoirService3") // URL 매핑
public class memoirService3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 요청 객체에 대한 인코딩 설정
		request.setCharacterEncoding("UTF-8");

		String idx = request.getParameter("memoir_idx");
		String name = request.getParameter("memoir_name");
        String info = request.getParameter("memoir_info");
        String info1 = request.getParameter("memoir_info1");
        String info2 = request.getParameter("memoir_info2");

		// 5. DAO를 통해 DB에 데이터 삽입
		memoirDAO dao = new memoirDAO();
		// 6.1 데이터 삽입 성공 후, memoir 테이블의 데이터를 조회
		memoirDTO dto = new memoirDTO();
		dto.setMemoir_idx(Integer.parseInt(idx));
		dto.setMemoir_name(name);
		dto.setMemoir_info(info);
		dto.setMemoir_info1(info1);
		dto.setMemoir_info2(info2);
		
		int result = dao.memoirupdate(dto);
		
		// 6.3 게시판 페이지로 포워딩하여 데이터를 출력
		RequestDispatcher rd = request.getRequestDispatcher("memoirService2");
		rd.forward(request, response);

	}
}