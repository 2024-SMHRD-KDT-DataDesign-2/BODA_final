package com.smhrd.db;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {
	// 전역변수로 쓸 수 있는 변수 지정! static영역에 선언하는게 좋다 static끼리.
	public static SqlSessionFactory sqlSessionFactory;

	// 초기화 블럭 -> static{}
	// 클래스가 로딩되거나 호출될 때 자동으로 실행될 수 있는 구조!
	// 주로 초기화 해야 하는 작업이 있을 때 static블록을 사용한다!
	static {
		try {
			String resource = "com/smhrd/db/Mybatis-config.xml"; // 경로를 우리 파일에 맞게 다시적기
			InputStream inputStream = Resources.getResourceAsStream(resource); // 경로를 컴터가 문자라서 인식 못해서 오류 -> try catch ㄱㄱ
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

		} catch (Exception e) {
			// 오류가 발생되면 해당 내용을 출력하는 영역!
			e.printStackTrace();
		}
	}

	// 해당 클래스의 메소드를 호출하면 결과적으로 만들어진 sqlSessionFactory(변수)를 가져갈 수 있는
	// 구조가 필요하다. => DAO에서 DB 접근을 위하여 SqlSession을 대여/반납하기 위한 기능
	// 초기화블럭이 static이므로 호출메소드도 static이어야한다(같은 영역에 위치)
	public static SqlSessionFactory getFactory() {
		return sqlSessionFactory;
	}
}
