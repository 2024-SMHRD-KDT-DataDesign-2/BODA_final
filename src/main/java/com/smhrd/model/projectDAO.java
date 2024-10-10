package com.smhrd.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class projectDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getFactory();

	// 프로젝트 추가 기능
	public int create_proj(projectDTO dto) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.insert("create", dto);

		System.out.println("DAO에서 프로젝트생성 성공했나? : " + cnt);

		sqlSession.close();

		return cnt;

	}

	// 팀 식별자 가져오기
	public String team_idx(projectDTO dto) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		String cnt = (String) sqlSession.selectOne("team_idx", dto);
		System.out.println("성공여부 : " + cnt);
		sqlSession.close();
		return cnt;

	}

	public int join(memberDTO dto) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		// 1. 회원가입을 하고자 하는 데이터 가지고 있어야 한다! => 매개변수 사용!

		// 2. db로 전달! -> sqlSession 대여 -> sql 문장 실행 -> sqlSession 반납

		int cnt = sqlSession.insert("join", dto);

		// 3. db로 부터 결과 값 확인!
		System.out.println("성공여부 : " + cnt);

		sqlSession.close();

		return cnt;

	}

	public memberDTO login(memberDTO dto) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		memberDTO result = sqlSession.selectOne("login", dto);
		System.out.println("selectOne한 dto에 뭐가 들어있을까요?: " + result);
		sqlSession.close();

		return result;

	}

	public memberDTO idCheck(memberDTO dto) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		memberDTO result = sqlSession.selectOne("idCheck", dto);
		System.out.println("idcheck한 dto에 뭐가 들어있을까요?: " + result);

		sqlSession.close();

		return result;

	}

	public void passwordCheck(memberDTO dto) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		memberDTO result = sqlSession.selectOne("login", dto);

	}

	public List<projectDTO> selectAllProject() {
		// 1. sqlSession 빌려오기
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		// 2. sqlSession을 사용하기(select 여러개 값)
		List<projectDTO> resultList = sqlSession.selectList("selectAllProject");
		// memberDTO => 한명의 정보를 표현할 수 있는 type
		// 여러명의 정보를 하나로 묶어서 표현해야 함
		// 1) 객체 배열 2) ArrayList
		// : 크기가 가변적인 ArrayList가 우리한테 적합함
		// : ArrayList의 부모 클래스 격인 List 형태로 리턴 받아오자 !

		// 3. sqlSession 반납
		sqlSession.close();

		// 4. 조회한 결과값 반환(return)
		return resultList;

	}

	public List<projectDTO> selectMyProject(memberDTO dto) {
		// 1. sqlSession 빌려오기
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		// 2. sqlSession을 사용하기(select 여러개 값)
		List<projectDTO> resultList = sqlSession.selectList("selectMyProject", dto);
		// memberDTO => 한명의 정보를 표현할 수 있는 type
		// 여러명의 정보를 하나로 묶어서 표현해야 함
		// 1) 객체 배열 2) ArrayList
		// : 크기가 가변적인 ArrayList가 우리한테 적합함
		// : ArrayList의 부모 클래스 격인 List 형태로 리턴 받아오자 !

		// 3. sqlSession 반납
		sqlSession.close();

		// 4. 조회한 결과값 반환(return)
		return resultList;

	}

	public int update(memberDTO dto) {
		// 1. session 빌려오기
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		// 2. session 사용하기
		int row = sqlSession.update("update", dto);
		System.out.println("DAO내부 row값 : " + row);
		// 3. session 반납하기
		sqlSession.close();
		// 4. 조회한 결과를 return해주기
		return row;

	}

	public List<projectDTO> searchProject(String search_value) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<projectDTO> resultList = sqlSession.selectList("searchProject", search_value);

		sqlSession.close();

		return resultList;
	}

	public ArrayList<String> getProjectList() {
		ArrayList<String> list = new ArrayList<String>();
		try {
			// 데이터베이스에 연결
			String url = "jdbc:oracle:thin:@project-db-campus.smhrd.com:1524:xe";
			String user = "cgi_24k_dd26_p2_3";
			String password = "smhrd3";

			// 드라이버를 가져옴
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 접속 정보를 활용해서 연결 객체를 생성
			Connection conn = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt;

			ResultSet rs = null;

			// 쿼리문을 통해 데이터를 ResultSet에 담기
			String sql = "SELECT * FROM TEAMS ";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// System.out.println(rs.getString("proj_name"));
				list.add(rs.getString("proj_name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public projectDTO getProjData(String proj_name) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		projectDTO result = sqlSession.selectOne("getProjData", proj_name);
		System.out.println("getProjData 쿼리문 잘됬나요?: " + result);
		sqlSession.close();

		return result;

	}

	public int teamApply(team_organizingDTO dto) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int row = sqlSession.update("applyTeam", dto);
		// 3. session 반납하기
		sqlSession.close();
		// 4. 조회한 결과를 return해주기
		return row;

	}

	public team_approveDTO getApproveDTO(String mem_id) {
		System.out.println("getApproveDTO 진입 성공");
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		team_approveDTO result = sqlSession.selectOne("getTeamidxFromTeamapprove", mem_id);
		System.out.println("getApproveDTO 쿼리문 잘됬나요?: " + result);
		sqlSession.close();
		return result;
	}

	public int addTeamOrganizing(team_organizingDTO dto) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		System.out.println("addTeamOrganizing 진입 성공");
		int row = sqlSession.update("addTeamOrganizing", dto);
		System.out.println("addTeamOrganizing 쿼리문 잘됬나요?: " + row);
		sqlSession.close();
		return row;

	}

	public int removeTeamApply(String mem_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int row = sqlSession.delete("removeTeamApply", mem_id);
		sqlSession.close();
		return row;
	}

}
