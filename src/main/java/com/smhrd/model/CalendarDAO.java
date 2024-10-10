package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class CalendarDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getFactory();

	// 캘린더 조회
	public List<KanbanDTO> calendar(int team_idx) {
		// db로 전달! -> sqlSession 대여 -> sql 문장 실행 -> sqlSession 반납
		SqlSession sqlSession = sqlSessionFactory.openSession();

		List<KanbanDTO> resultList = sqlSession.selectList("select_kanban1",team_idx);

		sqlSession.close();

		return resultList;

	}
}
