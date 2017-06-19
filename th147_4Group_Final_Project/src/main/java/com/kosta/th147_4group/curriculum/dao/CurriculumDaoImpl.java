package com.kosta.th147_4group.curriculum.dao;

import java.sql.SQLException;
import java.util.HashMap;
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
	public List getSearchKorean(String param) {
		return sqlSession.selectList("sqlSession.getSearchKorean", param);
	}

	@Override
	public List getAllKorean() throws SQLException {
		return sqlSession.selectList("sqlSession.getAllKorean");
	}

	@Override
	public void deleteKorean(int kNum) throws SQLException {
		int delete = sqlSession.delete("sqlSession.deleteKoreanByNum", (int) kNum);
		System.out.println("KOREAN DB 컬럼 삭제여부 : " + delete);
	}

	@Override
	public List<KoreanVO> getNowPageKorean(Map mapNum) throws SQLException {
		return sqlSession.selectList("sqlSession.getNowPageKorean", mapNum);
	}

	@Override
	public void insertKorean(KoreanVO KoreanVO) throws ClassNotFoundException, SQLException {
		sqlSession.insert("sqlSession.insertKorean", KoreanVO);
	}

	@Override
	public void updateKoreanHit(int stNum) throws ClassNotFoundException, SQLException {
		int result = sqlSession.update("sqlSession.updateKoreanHit", stNum);
		System.out.println("국어과목 조회수 update 결과 : " + result);
	}

	@Override
	public void updateKorean(Map mapNum) throws ClassNotFoundException, SQLException {
		int result = sqlSession.update("sqlSession.updateKorean", mapNum);
		System.out.println("국어과목 수정 결과 : " + result);
	}

}
