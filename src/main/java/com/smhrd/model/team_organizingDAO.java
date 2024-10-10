package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class team_organizingDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getFactory();

	// 팀구성 생성
	public int make_to(team_organizingDTO dto) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int cnt = sqlSession.insert("make", dto);
		sqlSession.close();
		return cnt;
	}
}
