package com.kosta.th147_4group.studentboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.th147_4group.vo.SchoolViolenceVO;

@Repository
public class SchoolViolenceDaoImpl implements SchoolViolenceDao {

	@Autowired
	private SqlSession sqlSession;
	
	//SchoolViolence 학교폭력
	@Override
	public SchoolViolenceVO detailSchoolViolence(int svNum) throws SQLException {
		return sqlSession.selectOne("sqlSession.detailSchoolViolence", (int) svNum);
	}

	@Override
	public List<SchoolViolenceVO> getAllSchoolViolence() throws SQLException {
		return sqlSession.selectList("sqlSession.getAllSchoolViolence");
	}
	
	//글 삭제
	@Override
	public void deleteSchoolViolence(int svNum) throws SQLException {
		int delete = sqlSession.delete("sqlSession.deleteSchoolViolence", (int)svNum);
		System.out.println("SchoolViolence DB 컬럼 삭제여부 : " + delete);
		
	}

	//페이징 처리
	@Override
	public List<SchoolViolenceVO> getNowPageSchoolViolence(Map mapNum) throws SQLException {
		return sqlSession.selectList("sqlSession.getNowPageSchoolViolence", mapNum);
	}

	@Override
	public void insertSchoolViolence(SchoolViolenceVO schoolViolenceVO) throws ClassNotFoundException, SQLException {
		sqlSession.insert("sqlSession.insertSchoolViolence", schoolViolenceVO);
	}

	@Override
	public void updateSchoolViolenceHit(int svNum) throws ClassNotFoundException, SQLException {
		int result = sqlSession.update("sqlSession.updateSchoolViolenceHit", svNum);
		System.out.println("조회수 update 결과 : " + result);
	}

	@Override
	public void updateSchoolViolence(Map mapNum) throws ClassNotFoundException, SQLException {
		int result = sqlSession.update("sqlSession.updateSchoolViolence", mapNum);
		System.out.println("학교폭력내용 수정 결과 : " + result);
	}

	

}
