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
import com.smhrd.model.projectDAO;
import com.smhrd.model.projectDTO;

@WebServlet("/프로젝트입장Service2")
public class 프로젝트입장Service2 extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

   request.setCharacterEncoding("UTF-8");   
      
   HttpSession session = request.getSession();
   
   KanbanDAO dao2 = new KanbanDAO();
   List<KanbanDTO> tasks = dao2.select();
   
   session.setAttribute("tasks", tasks);
   
   RequestDispatcher rd = request.getRequestDispatcher("메인.jsp");
   rd.forward(request, response);
   
/*   if(projData != null) {
      System.out.println("projData : "+ projData);*/
      // (성공) response.sendRedirect("https://www.naver.com");
      // response.sendRedirect("메인페이지/메인페이지.jsp"); // (실패) 하얀화면만 뜸.
      
      
		/*
		 * RequestDispatcher dispatcher = request.getRequestDispatcher("메인.jsp"); //주소를
		 * 쓸 때에는 반드시 상대번지 값을 적어주어야 한다. dispatcher.forward(request, response);
		 */
      // forward로 접속하면 css, js 둘다 적용 안됨.
      
		/*
		 * RequestDispatcher rd = request.getRequestDispatcher("메인.jsp");
		 * rd.forward(request, response);
		 */
   //}
   
      
   

}
   
}

