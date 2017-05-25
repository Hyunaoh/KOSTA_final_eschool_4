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
	
	//StudentProposal 건의사항
	@Override
	public FamilyViolenceVO detailFamilyViolence(int stNum) throws SQLException {
		return sqlSession.selectOne("sqlSession.detailFamilyViolence", (int) stNum);
	}
	
	@Override
	public List<FamilyViolenceVO> getAllFamilyViolence() throws SQLException {
		return sqlSession.selectList("sqlSession.getAllFamilyViolence");
	}
	//글 삭제
	@Override
	public void deleteFamilyViolence(int fmNum) throws SQLException {
		sqlSession.delete("sqlSession.deleteFamilyViolence", (int) fmNum);
		return ;
	}
	//페이징 처리
	@Override
	public List<FamilyViolenceVO> FamilyViolenceGetNowPage(Map mapNum) throws SQLException {
		return sqlSession.selectList("sqlSession.FamilyViolenceGetNowPage", mapNum); 
	}
	//글 등록
	@Override
	public void insertFamilyViolence(FamilyViolenceVO familyViolenceVO) throws ClassNotFoundException, SQLException {
		sqlSession.insert("sqlSession.insertFamilyViolence", familyViolenceVO);
		
	}
	//글 수정
	@Override
	public void updateFamilyViolence(int fmNum) throws ClassNotFoundException, SQLException {
		int update = sqlSession.update("sqlSession.updateFamilyViolence", (int)fmNum);
		
	}


}
