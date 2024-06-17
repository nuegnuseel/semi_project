package com.hrproject.hrproject.dao;

import com.hrproject.hrproject.dto.HrmDto;
import com.hrproject.hrproject.dto.HrmPageDto;
import com.hrproject.hrproject.mybatis.MybatisConnectionFactory;
import org.apache.ibatis.session.SqlSession;
import org.mindrot.jbcrypt.BCrypt;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class HrmDao {
    public int insertHrm(HrmDto hrmDto) {
        int result = 0;

        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession(true);
        result = sqlSession.insert("insertHrm", hrmDto);

        sqlSession.close();
        return result;
    }

    public int updateHrm(HrmDto hrmDto) {
        int result = 0;

        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession(true);
        result = sqlSession.update("updateHrm", hrmDto);

        sqlSession.close();
        return result;
    }

//    public int setShowAbleHrm(int[] noArray) {
    /* 일괄 삭제 할때 쓸거 */
//        int result = 0;
//
//        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
//        result = sqlSession.delete("setShowAbleHrm", noArray);
//        sqlSession.close();
//        return result;
//    }
    public int setShowAbleHrm(HrmDto hrmDto) {
        int result = 0;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        result = sqlSession.update("setShowAbleHrm", hrmDto);
        sqlSession.close();
        return result;
    }

    public HrmDto getHrm(int empNo) {
        HrmDto hrmDto = null;

        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession(true);
        hrmDto = sqlSession.selectOne("getHrm", empNo);
        sqlSession.close();

        return hrmDto;
    }

    public int getHrmTotal() { // 이걸 Modal 안에 사용할거니까
        int total = 0;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession(true);
        total = sqlSession.selectOne("getHrmTotal");
        sqlSession.close();

        return total;
    }

    public int getHrmTotal(String search, String searchWord) {
        int total = 0;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession(true);
        Map<String, String> searchMap = new HashMap<>();
        searchMap.put("search", search);
        searchMap.put("searchWord", searchWord);
        total = sqlSession.selectOne("getSearchHrmTotal", searchMap);
        sqlSession.close();

        return total;
    }
    public List<HrmDto> getHrmBoardList(HrmPageDto hrmPageDto) {
        List<HrmDto> hrmList =  null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession(true);
        hrmList = sqlSession.selectList("getHrmList", hrmPageDto);
        sqlSession.close();
        return hrmList;

    }

    public List<HrmDto> getSearchHrmBoardList(HrmPageDto hrmPageDto) {
        List<HrmDto> hrmList = null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession(true);
        hrmList = sqlSession.selectList("getSearchHrmList", hrmPageDto);
        sqlSession.close();
        return hrmList;
    }
    public List<HrmDto> getSearchEmpNoByName(String searchName){ //salary insert modal의 search modal용
        List<HrmDto>empNoList = null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession(true);
        empNoList=sqlSession.selectList("getSearchEmpNoByName",searchName);
        sqlSession.close();
        return empNoList;
    }
    public int getMaxEmpNo() {
        int maxEmpNo = 1;

        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession(true);
        maxEmpNo = sqlSession.selectOne("getMaxEmpNo");
        sqlSession.close();

        return maxEmpNo;
    }

    public HrmDto login(int empNo, int password) {
        HrmDto hrmDto = null;
        HrmDao hrmDao = new HrmDao();
        hrmDto = null;
//        String hashPW = hrmDao.getHrm(empNo).getPassword(); DB에 password추가 및 회원정보 수정에서 비번 바꾸는 기능 추가후 주석 풀기
//        if (BCrypt.checkpw(password, hashPW)){  DB에 password추가 및 회원정보 수정에서 비번 바꾸는 기능 추가후 주석 풀기
        if (empNo == password){
            hrmDto = hrmDao.getHrm(empNo);
        }
        return hrmDto;
    }
    public List<HrmDto> getEmpNoList() {
        List<HrmDto> empNoList = null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession(true);
        empNoList=sqlSession.selectList("getEmpNoList");
        sqlSession.close();
        return empNoList;
    }

    public int duplicateCheck(String check, String checkValue) {
        int result = 0;
        Map<String, String> duplicateCheckMap = new HashMap<>();
        duplicateCheckMap.put("check", check);
        duplicateCheckMap.put("checkValue", checkValue);
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession(true);
        result = sqlSession.selectOne("duplicateCheck", duplicateCheckMap);
        sqlSession.close();
        return result;
    }
    public int changePW(HrmDto hrmDto) {
        int result = 0;

        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession(true);
        result = sqlSession.update("changeHrmPw", hrmDto);

        sqlSession.close();
        return result;

    }
}