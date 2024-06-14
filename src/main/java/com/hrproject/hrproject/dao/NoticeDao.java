package com.hrproject.hrproject.dao;

import com.hrproject.hrproject.dto.NoticeDto;
import com.hrproject.hrproject.dto.SalaryDto;
import com.hrproject.hrproject.mybatis.MybatisConnectionFactory;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class NoticeDao {
    public List<NoticeDto> getNoticeList(){
        List<NoticeDto>noticeList=null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession(true);
        noticeList = sqlSession.selectList("getNoticeList");
        sqlSession.close();
        return noticeList;
    }

    public int insertNoticeDao(NoticeDto noticeDto) {
        int result = 0;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        result = sqlSession.insert("insertNotice",noticeDto);
        //sqlSession.commit();
        if (result>0){
            System.out.println("notice insert Qry is successfully");
        }
        sqlSession.close();
        return result;

    }

    //제목을 누르면 공지사항의 내용을 볼수 있음
    public NoticeDto getNoticeByNoticeNo(int noticeNo) {
        NoticeDto notice = null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession(true);
        try {
            notice = sqlSession.selectOne("getNoticeByNoticeNo", noticeNo);
        } finally {
            sqlSession.close();
        }
        return notice;
    }
}
