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

public class projectDTO {

	private int team_idx;
	private String team_name;
	private String proj_name;
	private String proj_des;
	private String proj_st_dt;
	private String proj_ed_dt;
	private String proj_status;
	private String mem_id;

}
