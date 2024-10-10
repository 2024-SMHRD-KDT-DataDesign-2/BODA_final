package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class KanbanDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getFactory();

	// 칸반 생성
	public int create_kanban(KanbanDTO dto) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.insert("kanbanin", dto);

		sqlSession.close();

		return cnt;

	}
	
	// 칸반 조회
	public List<KanbanDTO> selectAll(int kan_idx) {
		// db로 전달! -> sqlSession 대여 -> sql 문장 실행 -> sqlSession 반납
		SqlSession sqlSession = sqlSessionFactory.openSession();

		
		
		List<KanbanDTO> resultList = sqlSession.selectList("select_kanban",kan_idx);

		sqlSession.close();

		return resultList;

	}
	
	// 전체 칸반
		public List<KanbanDTO> select() {
			// db로 전달! -> sqlSession 대여 -> sql 문장 실행 -> sqlSession 반납
			SqlSession sqlSession = sqlSessionFactory.openSession();

			List<KanbanDTO> resultList = sqlSession.selectList("select_kanbanall");

			sqlSession.close();

			return resultList;

		}
		
	// 칸반 수정
		public int kanbanupdate(KanbanDTO dto) {
	    	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	    	
	    	int row = sqlSession.update("kanbanupdate", dto);
	    	
	    	sqlSession.close();
	    	
	    	return row;
	    	
	    }
		
	// 칸반 삭제
		public int kanbandelete(KanbanDTO dto) {
	    	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	    	
	    	int row = sqlSession.delete("kanbandelete", dto);
	    	
	    	sqlSession.close();
	    	
	    	return row;
	    	
	    }
}
