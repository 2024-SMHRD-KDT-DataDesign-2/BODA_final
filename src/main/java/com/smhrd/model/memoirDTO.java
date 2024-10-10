package com.smhrd.model;


import java.sql.Date;

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
public class memoirDTO {
   // 회원 데이터를 저장할 수 있도록 나만의 자료형을 만들자
   // 1. 필드 --> 테이블의 컬럼명과 일치 시키자
   private int memoir_idx;
   private int team_idx;
   private String mem_id;
   private String memoir_name;
   private String memoir_info;
   private String memoir_info1;
   private String memoir_info2;
   private String memoir_date;
   
   
   
}

