package com.kosta.th147_4group.studentboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.th147_4group.vo.StudentProposalVO;

@Repository
public class StudentBoardDaoImpl implements StudentBoardDao {

	@Autowired
	private SqlSession sqlSession;
	
	//StudentProposal 건의사항
	@Override
	public StudentProposalVO detailStudentProposal(int stNum) throws SQLException {
		return sqlSession.selectOne("sqlSession.detailStudentProposal", (int) stNum);
	}
	
	@Override
	public List<StudentProposalVO> getAllStudentProposal() throws SQLException {
		return sqlSession.selectList("sqlSession.getAllStudentProposal");
	}
	//글 삭제
	@Override
	public void deleteStudentProposal(int stNum) throws SQLException {
		int delete = sqlSession.delete("sqlSession.deleteStudentProposalByNum", (int)stNum);
		System.out.println("StudentProposal DB 컬럼 삭제여부 : " + delete);
	}
	//페이징 처리
	@Override
	public List<StudentProposalVO> getNowPage(Map mapNum) throws SQLException {
		return sqlSession.selectList("sqlSession.getNowPage", mapNum); 
	}
	//글 등록
	@Override
	public void insertStudentProposal(StudentProposalVO studentProposalVO) throws ClassNotFoundException, SQLException {
		sqlSession.insert("sqlSession.insertStudentProposal", studentProposalVO);
		
	}
	//글 수정
	@Override
	public void updateStudentProposal(int stNum) throws ClassNotFoundException, SQLException {
		int update = sqlSession.update("sqlSession.insertStudentProposal", (int)stNum);
		
	}


}
