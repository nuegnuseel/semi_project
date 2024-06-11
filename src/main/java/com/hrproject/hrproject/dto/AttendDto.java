package com.hrproject.hrproject.dto;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AttendDto {
    private int empNo;
    private String eName;
    private String attendCount;
    private String attendNo;
    private double num;
    private String attendDate;
    private String offDay;
    private String detailOffday;
    private String print;
}
