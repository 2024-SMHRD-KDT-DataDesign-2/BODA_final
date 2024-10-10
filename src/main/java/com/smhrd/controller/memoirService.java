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

@WebServlet("/memoirService")  // URL 매핑
public class memoirService extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. 요청 객체에 대한 인코딩 설정
        request.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession();
        System.out.println("info in memoirService : " + session.getAttribute("info"));
        System.out.println("info in memoirService : " + session.getAttribute("projData"));
        memberDTO mdto = (memberDTO)session.getAttribute("info");
        projectDTO pdto = (projectDTO)session.getAttribute("projData");
        String mem_id = mdto.getMem_id();
        int team_idx = pdto.getTeam_idx();		
        
        
        // 3. 요청 파라미터로부터 데이터를 가져옴 (HTML 폼에서 전송된 데이터)
        String name = request.getParameter("memoir_name");
        String info = request.getParameter("memoir_info");
        String info1 = request.getParameter("memoir_info1");
        String info2 = request.getParameter("memoir_info2");
        
        // 4. memoirDTO 객체 생성 (세션에서 가져온 team_idx와 mem_id를 사용)
        memoirDTO dto = new memoirDTO(0, team_idx, mem_id, name, info, info1, info2,"11");
        
        // 5. DAO를 통해 DB에 데이터 삽입
        memoirDAO dao = new memoirDAO();
        int result = dao.memoirs(dto);  // DB에 데이터 삽입 시도

        // 6. 처리 결과에 따른 페이지 이동
        if (result == 1) {
            
            // 6.3 게시판 페이지로 포워딩하여 데이터를 출력
            RequestDispatcher rd = request.getRequestDispatcher("회고록.jsp");
            rd.forward(request, response);
        } 
        
        
        
    }
}