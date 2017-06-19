package com.kosta.th147_4group.studentboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.th147_4group.vo.FamilyViolenceVO;

@Repository
public class FamilyViolenceDaoImpl implements FamilyViolenceDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public FamilyViolenceVO detailFamilyViolence(int fvNum) throws ClassNotFoundException, SQLException {
		return sqlSession.selectOne("sqlSession.detailFamilyViolence", (int) fvNum);
	}

	@Override
	public List<FamilyViolenceVO> getAllFamilyViolence() throws ClassNotFoundException, SQLException {
		return sqlSession.selectList("sqlSession.getAllFamilyViolence");
	}

	@Override
	public void deleteFamilyViolence(int fvNum) throws ClassNotFoundException, SQLException {
		int delete = sqlSession.delete("sqlSession.deleteFamilyViolence", (int)fvNum);
		System.out.println("FamilyViolence DB 컬럼 삭제여부 : " + delete);
		
	}

	@Override
	public List<FamilyViolenceVO> getNowPageFamilyViolence(Map mapNum) throws ClassNotFoundException, SQLException {
		return sqlSession.selectList("sqlSession.getNowPageFamilyViolence", mapNum);
	}

	@Override
	public void insertFamilyViolence(FamilyViolenceVO familyViolenceVO) throws ClassNotFoundException, SQLException {
		sqlSession.insert("sqlSession.insertFamilyViolence", familyViolenceVO);
	}

	@Override
	public void updateFamilyViolenceHit(int fvNum) throws ClassNotFoundException, SQLException {
		int result = sqlSession.update("sqlSession.updateFamilyViolenceHit", fvNum);
		System.out.println("조회수 update 결과 : " + result);
	}

	@Override
	public void updateFamilyViolence(Map mapNum) throws ClassNotFoundException, SQLException {
		int result = sqlSession.update("sqlSession.updateFamilyViolence", mapNum);
		System.out.println("가정폭력내용 수정 결과 : " + result);
	}

}
