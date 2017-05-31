package com.kosta.th147_4group.studentboard.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kosta.th147_4group.vo.StudentProposalVO;

public interface StudentBoardDao {

	//StudentProposal 건의사항 게시판
	//public int getStudentBaordCount();
	
	//게시물 부분 출력
	public StudentProposalVO detailStudentProposal(int stNum) throws ClassNotFoundException, SQLException;
	//게시물 전체 결과물 출력
	public List<StudentProposalVO> getAllStudentProposal() throws ClassNotFoundException, SQLException;
	//게시물 삭제
	public void deleteStudentProposal(int stNum) throws ClassNotFoundException, SQLException;
	//게시물 페이징 처리
	public List<StudentProposalVO> getNowPageProposal(Map mapNum) throws ClassNotFoundException, SQLException;
	//게시물 입력
	public void insertStudentProposal(StudentProposalVO studentProposalVO) throws ClassNotFoundException, SQLException;
	//게시물 조회수 증가
	public void updateStudentHit(int stNum) throws ClassNotFoundException, SQLException;
	//게시물 특정 컬럼 수정
	public void updateStudent(Map mapNum) throws ClassNotFoundException, SQLException;
}
