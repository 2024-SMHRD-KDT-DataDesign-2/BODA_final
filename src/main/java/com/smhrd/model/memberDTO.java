package com.smhrd.model;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
// 게터 메소드 생성
@Getter
// 세터 메소드 생성
@Setter

// 모든 매개변수를 받아서 필드를 초기화 시켜주는 생성자
@AllArgsConstructor
// 기본 생성자
@NoArgsConstructor

//@data 기본 생성자 게터,세터,토스트링 만능
@Data
public class memberDTO {
	// 회원 데이터를 저장할 수 있도록 나만의 자료형을 만들자
	// 1. 필드 --> 테이블의 컬럼명과 일치 시키자
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_nick;
	private String mem_birthdate;
	private String mem_email;
}
	
	