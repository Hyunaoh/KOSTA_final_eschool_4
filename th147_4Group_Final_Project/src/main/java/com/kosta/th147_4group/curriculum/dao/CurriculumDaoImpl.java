package com.kosta.th147_4group.curriculum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.kosta.th147_4group.vo.KoreanVO;

public class CurriculumDaoImpl implements CurriculumDao {

	private SqlSession sqlSession;

	public KoreanVO getKorean(String koGrade) {
		return sqlSession.selectOne(koGrade);
	}


}
