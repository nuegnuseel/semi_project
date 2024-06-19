package com.hrproject.hrproject.dto;

import com.hrproject.hrproject.controller.hrm.Grade;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class HrmDto {
    private int empNo;
    private String ename;
    private String foreignName;
    private String birthDate;
    private String password;
    private int deptNo;
    private String deptName;
    private int posNo;
    private String posName;
    private String roleName;
    private String mobile;
    private String passport;
    private String email;
    private String bankName;
    private String account;
    private String accountHolder;
    private String postCode;
    private String address;
    private String addressDetail;
    private String hireDate;
    private String hireType;
    private String resignDate;
    private String outReasons;
    private String originalProfile;
    private String renameProfile;
    private String remarks;
    private int salary;
    private Grade grade;
    private boolean showable;
}

