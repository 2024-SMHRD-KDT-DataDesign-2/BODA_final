package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.smhrd.db.SqlSessionManager;

public class memoirDAO {

    // SqlSessionFactory를 가져오기
    SqlSessionFactory sqlSessionFactory = SqlSessionManager.getFactory();

    // memoirs 테이블에 데이터 삽입하는 메서드
    public int memoirs(memoirDTO dto) {
        // SqlSession을 통해 MyBatis 작업 처리
        SqlSession sqlSession = sqlSessionFactory.openSession(true);  // Auto-commit 설정
        int cnt = sqlSession.insert("memoirs", dto);  // SQL 실행
        sqlSession.close();
        return cnt;
    }
 // memoir 테이블에서 데이터를 조회하는 메서드 추가
    public List<memoirDTO> getMemoirList() {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);  // Auto-commit 설정
        List<memoirDTO> memoirList = sqlSession.selectList("getMemoirList");  // SQL 실행
        sqlSession.close();
        return memoirList;
    }
    
// memoir 테이블 데이터 수정
    public int memoirupdate(memoirDTO dto) {
    	SqlSession sqlSession = sqlSessionFactory.openSession(true);
    	
    	int row = sqlSession.update("memoirupdate", dto);
    	
    	sqlSession.close();
    	
    	return row;
    	
    }
}

    

