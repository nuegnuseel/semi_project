package com.hrproject.hrproject.dao;

import com.hrproject.hrproject.dto.SalaryDto;
import com.hrproject.hrproject.dto.SalaryPlusEmpNameDto;
import com.hrproject.hrproject.mybatis.MybatisConnectionFactory;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class SalaryDao {
    public int insertSalaryDao(SalaryDto salaryDto) {
        int result = 0;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        result = sqlSession.insert("insertSalary",salaryDto);
        //sqlSession.commit();
        if (result>0){
            System.out.println("salary insert Qry is successfully");
        }
        sqlSession.close();
        return result;

    }

    public List<SalaryPlusEmpNameDto> getSalaryList() {
        List<SalaryPlusEmpNameDto> salaryList = null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        salaryList = sqlSession.selectList("getSalaryList");
        if (salaryList !=null){
            System.out.println("salary select query is successfully");
//            System.out.println("SalaryDao.java__salaryList >>> "+salaryList);
        }
        sqlSession.close();
        return salaryList;
    }
}
