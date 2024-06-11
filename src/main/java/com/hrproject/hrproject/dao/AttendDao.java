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
        List<AttendDto> attendList = null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        attendList = sqlSession.selectList("getAttendList");
        if (attendList !=null){
            System.out.println("select query is successfully");
            System.out.println(attendList);
        }
        sqlSession.close();
        return attendList;
    }
}