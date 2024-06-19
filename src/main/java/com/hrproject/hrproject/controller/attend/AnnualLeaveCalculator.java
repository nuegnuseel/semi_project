package com.hrproject.hrproject.controller.attend;

import com.hrproject.hrproject.dto.AttendDto;
import com.hrproject.hrproject.dto.HrmDto;

import java.time.LocalDate;
import java.time.Period;

public class AnnualLeaveCalculator {

    // 연차 계산 메서드
    public int calculateAnnualLeave(LocalDate hireDate01) {

        LocalDate hireDate = hireDate01;
        LocalDate today = LocalDate.now();
        Period period = Period.between(hireDate, today);
        int yearsOfService = period.getYears();

        int annualLeave = 0;

        // 근속 연수에 따라 연차 부여 규칙 적용
        if (yearsOfService < 1) {
            // 1년 미만 근속
            annualLeave = calculateLessThanOneYear(hireDate, today);
        } else if (yearsOfService == 1) {
            // 1년차
            annualLeave = 15;
        } else if (yearsOfService == 2) {
            // 2년차
            annualLeave = 15;
        } else if (yearsOfService >= 3 && yearsOfService < 5) {
            // 3년차, 4년차
            annualLeave = 16;
        } else if (yearsOfService >= 5 && yearsOfService < 7) {
            // 5년차, 6년차
            annualLeave = 17;
        } else if (yearsOfService >= 7 && yearsOfService < 9) {
            // 7년차, 8년차
            annualLeave = 18;
        } else if (yearsOfService >= 9) {
            // 9년차 이상
            annualLeave = 19;
        }

        return annualLeave;
    }

    // 1년 미만 근속자 연차 계산
    private int calculateLessThanOneYear(LocalDate hireDate, LocalDate today) {
        Period period = Period.between(hireDate, today);
        int monthsWorked = period.getMonths() ;
        int leaveDays = monthsWorked; //월 만근 수

        return leaveDays;
    }

    // 테스트용 메인 메서드
    public static void main(String[] args) {
        // 테스트용 입사일 설정
        LocalDate hireDate = LocalDate.of(2000, 1, 1); // 예시 입사일

        // AttendDto 생성
        HrmDto hrmDto = new HrmDto();
        hrmDto.setHireDate(String.valueOf(hireDate));

        // 연차 계산기 인스턴스 생성
        AnnualLeaveCalculator calculator = new AnnualLeaveCalculator();

        // 연차 계산
        int annualLeave = calculator.calculateAnnualLeave(LocalDate.parse(hrmDto.getHireDate()));
        System.out.println("연차: " + annualLeave);
    }
}
