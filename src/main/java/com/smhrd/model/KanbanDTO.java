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

public class KanbanDTO {
	// 회원 데이터를 저장할 수 있도록 나만의 자료형을 만들자
	// 1. 필드 --> 테이블의 컬럼명과 일치 시키자
	
	private int kanban_idx;
	private int team_idx;
	private String task_name;
	private String task_info;
	private String task_progress;
	private String task_st_dt;
	private String task_ed_dt;
	private String task_file1;
	private String task_file2;
	private String task_file3;
	private String kanban_color;
	private String task_importance;
	private String mem_id;

}
