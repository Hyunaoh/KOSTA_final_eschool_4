package com.kosta.th147_4group.curriculum.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.th147_4group.vo.KoreanVO;

@Repository
public class CurriculumDaoImpl implements CurriculumDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public KoreanVO getKorean(String koGrade) {
		return sqlSession.selectOne("sqlSession.getKorean", (String) koGrade);
	}

	@Override
	public List getAllKorean() throws SQLException {
		return sqlSession.selectList("sqlSession.getAllKorean");
	}

	@Override
	public void deleteKorean(int kNum) throws SQLException {
		int delete = sqlSession.delete("sqlSession.deleteKoreanByNum", (int)kNum);
		System.out.println("KOREAN DB 컬럼 삭제여부 : " + delete);
	}

	@Override
	public List<KoreanVO> getNowPage(Map mapNum) throws SQLException {
		
			return sqlSession.selectList("sqlSession.getNowPage", mapNum); 
	}


}
