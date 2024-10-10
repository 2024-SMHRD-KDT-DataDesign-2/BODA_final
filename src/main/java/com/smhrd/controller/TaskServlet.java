package com.smhrd.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.smhrd.model.KanbanDAO;
import com.smhrd.model.KanbanDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/getTasks")
public class TaskServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
	  response.setContentType("application/json");
      response.setCharacterEncoding("UTF-8"); // 한글인코딩 성공!      
      
      
      KanbanDAO dao = new KanbanDAO();
      List<KanbanDTO> tasks = dao.select();
     
      
      Gson gson = new Gson();
      String jsonResponse = gson.toJson(tasks);
      
      
      response.getWriter().write(jsonResponse);
      
   }

}


