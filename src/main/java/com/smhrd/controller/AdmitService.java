package com.smhrd.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import com.smhrd.model.projectDAO;
import com.smhrd.model.team_approveDTO;
import com.smhrd.model.team_organizingDTO;

@WebServlet("/AdmitService")
public class AdmitService extends HttpServlet {
   private static final long serialVersionUID = 1L;

   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {  
	   
	  request.setCharacterEncoding("UTF-8");
	   
      // Step 1: Read the JSON data from the request body
      StringBuilder requestBody = new StringBuilder();
      BufferedReader reader = request.getReader();
      String line;
      while ((line = reader.readLine()) != null) {
         requestBody.append(line);
      }
      
      ArrayList<String> approveList = new ArrayList<String>();
      ArrayList<String> rejectList = new ArrayList<String>();

      // Step 2: Parse the JSON data using JSONObject
      try {
         JSONObject jsonObject = new JSONObject(requestBody.toString());
         JSONArray usersArray = jsonObject.getJSONArray("users");
         String action = jsonObject.getString("action");
         

         // Step 3: Process the user approvals or rejections
         for (int i = 0; i < usersArray.length(); i++) {
            String userId = usersArray.getString(i);
            if ("approve".equals(action)) {
               // Handle approval (e.g., update the database)
               System.out.println("Approved user: " + userId);
                  approveList.add(userId);
            } else if ("reject".equals(action)) {
               // Handle rejection (e.g., update the database)
               System.out.println("Rejected user: " + userId);
                  rejectList.add(userId);
            }
         }
         
         // Step 4: Send a success response back to the client
         response.setContentType("application/json");
         JSONObject jsonResponse = new JSONObject();
         jsonResponse.put("status", "success");
         response.getWriter().write(jsonResponse.toString());

      } catch (Exception e) {
         e.printStackTrace();
         response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
         response.getWriter().write("{\"status\": \"error\"}");
      }
      System.out.println("approveList : " + approveList);
      System.out.println("rejectList : " + rejectList);
      
      projectDAO dao = new projectDAO();
      
      
      // 팀원 승인(addTeam) 과정 
      for(int i=0; i < approveList.size(); i++) {
         // 1. team_approve 에서 team_approve 데이터 꺼내오기
         team_approveDTO temp = dao.getApproveDTO(approveList.get(i));
         System.out.println("temp : " + temp);
         team_organizingDTO dto = new team_organizingDTO();
         dto.setTeam_idx(temp.getTeam_idx());
         dto.setMem_id(temp.getMem_id());
         dto.setMem_role(temp.getMem_role());
         
         // 2. 받은 team_approve 데이터로 team_organizing에 업데이트하기.
         int row = dao.addTeamOrganizing(dto);         
         if(row == 1) {
            System.out.println(approveList.get(i) + "팀원승인 완료");
         }
      
         // team_approve에서 처리 끝난 신청자 row 지우기.
         int row2 = dao.removeTeamApply(approveList.get(i));
         if(row2 == 1) {
            System.out.println(approveList.get(i) + "승인완료 처리 후 테이블에서 삭제 완료");
         }
      }
      
      // 팀원 거부(reject) 과정 --> 10.04 성공!!
      for(int i=0; i < rejectList.size(); i++) {
         // team_approve에서 처리 끝난 신청자 row 지우기.
         int row3 = dao.removeTeamApply(rejectList.get(i));
         if(row3 == 1) {
         System.out.println(rejectList.get(i) + "승인거부 처리 후 테이블에서 삭제 완료");
         }
      }
      
      
   }

}
