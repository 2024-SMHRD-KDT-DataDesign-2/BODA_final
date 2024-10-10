package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//모든 매개변수를 받아서 필드를 초기화 시켜주는 생성자
@AllArgsConstructor
//기본 생성자
@NoArgsConstructor
//getter 메소드
@Getter
//@ Setter 메소드
@Setter

@Data
public class team_approveDTO {

	private int approve_idx;
	private int team_idx;
	private String mem_id;
	private String approve_dt;
	private String mem_role;

}