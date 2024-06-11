package com.hrproject.hrproject.dto;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AttendDto {
    private int empNo; //사원번호
    private String eName; //사원명
    private String attendCount; //근태번호
    private String attendNo; //근태코드
    private double num; //근태수
    private String attendDate; //근태기간
    private String offDay; //휴가명
    private String detailOffday; //휴가날짜 및 사유
    private String print; //인쇄
}
