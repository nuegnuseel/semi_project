package com.hrproject.hrproject.controller.hrm;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum Grade {
    //열거형 제한 getter, 속성가지는 생성자
    MEMBER("member"),
    HRM_MANAGER("hrmManager"),
    SALARY_MANAGER("salaryManager"),
    ATTEND_MANAGER("attendManager"),
    ADMIN("admin");
    private final String label;

//    public String label() {
//        return label;
//    }
//    Grade(String label){
//        this.label = label;
//    }
}