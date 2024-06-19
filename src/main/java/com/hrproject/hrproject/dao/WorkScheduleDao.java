package com.hrproject.hrproject.dao;

import com.hrproject.hrproject.dto.HrmDto;
import com.hrproject.hrproject.dto.WorkScheduleAdminDto;
import com.hrproject.hrproject.dto.WorkScheduleDto;
import com.hrproject.hrproject.dto.WorkScheduleLogDto;
import com.hrproject.hrproject.mybatis.MybatisConnectionFactory;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

public class WorkScheduleDao {
    public List<WorkScheduleDto> getEmpWorkList(int empNo) {
        List<WorkScheduleDto> salaryList = null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        salaryList = sqlSession.selectList("getWorkList", empNo);
        if (salaryList != null) {
            System.out.println("Work select query is successfully");
//            System.out.println("SalaryDao.java__salaryList >>> "+salaryList);
        }
        sqlSession.close();
        return salaryList;
    }
    public List<WorkScheduleDto> getEmpWorkList(WorkScheduleDto workScheduleDto) {
        List<WorkScheduleDto> salaryList = null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        salaryList = sqlSession.selectList("getWorkMonthList", workScheduleDto);
        if (salaryList != null) {
            System.out.println("Work select query is successfully");
//            System.out.println("SalaryDao.java__salaryList >>> "+salaryList);
        }
        sqlSession.close();
        return salaryList;
    }


    public List<WorkScheduleDto> getTodaySchedule(String date) {
        List<WorkScheduleDto> dto = null;

        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        dto = sqlSession.selectList("getTodaySchedule", date);
        if (dto != null) {
            System.out.println("Work select query is successfully");
//            System.out.println("SalaryDao.java__salaryList >>> "+salaryList);
        }
        sqlSession.close();

        return dto;
    }

    public void createAllEmpSchedule(List<HrmDto> empNoList) {

        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        sqlSession.insert("createAllEmpSchedule", empNoList);
        sqlSession.close();
    }

    public int updateWorkSchedule(WorkScheduleDto workScheduleDto) {
        int result = 0;

        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        result = sqlSession.insert("updateWorkSchedule", workScheduleDto);
        sqlSession.close();
        return result;
    }

//    public List<WorkScheduleDto> getWorkSchedulelist(Map<Integer, String> empNoDateMap) {
//           List <WorkScheduleDto> dto = null;
//            SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
//           dto= sqlSession.selectList("getWorkScheduleList",empNoDateMap);
//            return dto;
//    }

    public WorkScheduleDto getWorkScheduleOne(Map<String, Object> empNoDateMap) {
        WorkScheduleDto dto = null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        dto = sqlSession.selectOne("getWorkScheduleOne", empNoDateMap);
        sqlSession.close();
        return dto;
    }

    public void updateWorkStartTime(WorkScheduleDto workScheduleDto) {
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        sqlSession.selectOne("updateWorkStartTime", workScheduleDto);
        sqlSession.close();
    }

    public void updateWorkEndTime(WorkScheduleDto workScheduleDto) {
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        sqlSession.selectOne("updateWorkEndTime", workScheduleDto);
        sqlSession.close();
    }

    public List<WorkScheduleAdminDto> selectAllByAdmin() {
        List<WorkScheduleAdminDto> adminWrokList = null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        adminWrokList = sqlSession.selectList("selectAllByAdmin");
        sqlSession.close();
        return adminWrokList;
    }

    public List<WorkScheduleDto> refreshWorkDB() {
        List<WorkScheduleDto> workScheduleDtoList;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        workScheduleDtoList = sqlSession.selectList("refreshWorkDB");
        sqlSession.close();
        return workScheduleDtoList;
    }


    public void updateVacationCode(List<WorkScheduleDto> workScheduleDtoList) {
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        sqlSession.update("updateVacationCode", workScheduleDtoList);
    }


    public WorkScheduleDto getEmpWork(WorkScheduleDto workScheduleDto) {
        WorkScheduleDto workDto = null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        workDto = sqlSession.selectOne("getEmpWork");
        return workDto;
    }

    public List<WorkScheduleAdminDto> getAdminWorkList(WorkScheduleAdminDto workScheduleAdminDto) {
        List<WorkScheduleAdminDto> WSADList = null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        WSADList = sqlSession.selectList("getAdminWorkList", workScheduleAdminDto);
        sqlSession.close();

        return WSADList;
    }

    public void modifyWorkTime(Map<String, Object> modifyParamMap) {
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        sqlSession.selectList("modifyWorkTime", modifyParamMap);
        sqlSession.close();
    }

    public void deleteWorkSchedule(int workIdx) {
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        sqlSession.delete("deleteWorkSchedule",workIdx);
        sqlSession.close();
    }

    public WorkScheduleLogDto getWorkScheduleByWorkIdx(int workIdx) {
        WorkScheduleLogDto workScheduleLogDto = null;

        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        workScheduleLogDto=sqlSession.selectOne("getWorkScheduleByWorkIdx", workIdx);
        sqlSession.close();

        return workScheduleLogDto;

    }

    public void insertWorkScheduleLog(WorkScheduleLogDto workScheduleLogDto) {
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        sqlSession.insert("getWorkScheduleByWorkIdx", workScheduleLogDto);
        sqlSession.close();
    }
}
