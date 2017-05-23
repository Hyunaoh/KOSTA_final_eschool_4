package com.kosta.th147_4group.studentboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.kosta.th147_4group.vo.StudentProposalVO;

public interface StudentBoardDao {

	//StudentProposal 건의사항 게시판
	//public int getStudentBaordCount();
	public StudentProposalVO getStudentProposal(String stGrade) throws SQLException;

	public List<StudentProposalVO> getAllStudentProposal() throws SQLException;

	public void deleteStudentProposal(int stNum) throws SQLException;
	
	public List<StudentProposalVO> getNowPage(Map mapNum) throws SQLException;

}
