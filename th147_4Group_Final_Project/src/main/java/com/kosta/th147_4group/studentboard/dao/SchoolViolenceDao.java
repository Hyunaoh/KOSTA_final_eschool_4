package com.kosta.th147_4group.studentboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.kosta.th147_4group.vo.SchoolViolenceVO;

public interface SchoolViolenceDao {

	//게시물 부분 출력
		public SchoolViolenceVO detailSchoolViolence(int svNum) throws ClassNotFoundException, SQLException;
		//게시물 전체 결과물 출력
		public List<SchoolViolenceVO> getAllSchoolViolence() throws ClassNotFoundException, SQLException;
		//게시물 삭제
		public void deleteSchoolViolence(int svNum) throws ClassNotFoundException, SQLException;
		//게시물 페이징 처리
		public List<SchoolViolenceVO> getNowPageSchoolViolence(Map mapNum) throws ClassNotFoundException, SQLException;
		//게시물 입력
		public void insertSchoolViolence(SchoolViolenceVO schoolViolenceVO) throws ClassNotFoundException, SQLException;
		//게시물 조회수 증가
		public void updateSchoolViolenceHit(int svNum) throws ClassNotFoundException, SQLException;
		//게시물 특정 컬럼 수정
		public void updateSchoolViolence(Map mapNum) throws ClassNotFoundException, SQLException;
	
}
