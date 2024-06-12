package com.hrproject.hrproject.dao;



import com.hrproject.hrproject.dto.AttendDto;
import com.hrproject.hrproject.mybatis.MybatisConnectionFactory;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class AttendDao {
    public int insertAttendDao(AttendDto attendDto) {
        int result = 0;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        result = sqlSession.insert("insertAttend", attendDto);
        sqlSession.close();
        return result;

    }

    public List<AttendDto> getAttendList() {
        try (SqlSession sqlSession = MybatisConnectionFactory.getSqlSession()) {
            List<AttendDto> attendList = sqlSession.selectList("getAttendList");
            System.out.println("select query is successfully");
            System.out.println(attendList); // 가져온 데이터 로깅

            return attendList;
        } catch (Exception e) {
            // 예외 발생 시 처리
            e.printStackTrace(); // 혹은 로깅
            return null; // 또는 예외를 상위로 다시 throw
        }
    }

}