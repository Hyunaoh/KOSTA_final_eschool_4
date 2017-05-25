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
	
	@Override
	public SchoolViolenceVO detailSchoolViolence(int svNum) throws ClassNotFoundException, SQLException {
		return sqlSession.selectOne("sqlSession.detailSchoolViolence", (int) svNum);
	}

	@Override
	public List<SchoolViolenceVO> getAllSchoolViolence() throws ClassNotFoundException, SQLException {
		return sqlSession.selectList("sqlSession.getAllSchoolViolence");
	}

	@Override
	public void deleteSchoolViolence(int svNum) throws ClassNotFoundException, SQLException {
		sqlSession.delete("sqlSession.deleteSchoolViolence", (int) svNum);
		return ;

	}

	@Override
	public List<SchoolViolenceVO> SchoolViolenceGetNowPage(Map mapNum) throws ClassNotFoundException, SQLException {
		return sqlSession.selectList("sqlSession.SchoolViolenceGetNowPage", mapNum);
	}

	@Override
	public void insertSchoolViolence(SchoolViolenceVO schoolViolenceVO) throws ClassNotFoundException, SQLException {
		sqlSession.insert("sqlSession.insertSchoolViolence", schoolViolenceVO);

	}

	@Override
	public void updateSchoolViolence(int svNum) throws ClassNotFoundException, SQLException {
		int update = sqlSession.update("sqlSession.updateSchoolViolence", (int)svNum);

	}

}
