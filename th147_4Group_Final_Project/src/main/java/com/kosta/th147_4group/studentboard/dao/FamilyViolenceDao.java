package com.kosta.th147_4group.studentboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.kosta.th147_4group.vo.FamilyViolenceVO;


public interface FamilyViolenceDao {

	//게시물 부분 출력
			public FamilyViolenceVO detailFamilyViolence(int fvNum) throws ClassNotFoundException, SQLException;
			//게시물 전체 결과물 출력
			public List<FamilyViolenceVO> getAllFamilyViolence() throws ClassNotFoundException, SQLException;
			//게시물 삭제
			public void deleteFamilyViolence(int fvNum) throws ClassNotFoundException, SQLException;
			//게시물 페이징 처리
			public List<FamilyViolenceVO> getNowPageFamilyViolence(Map mapNum) throws ClassNotFoundException, SQLException;
			//게시물 입력
			public void insertFamilyViolence(FamilyViolenceVO familyViolenceVO) throws ClassNotFoundException, SQLException;
			//게시물 조회수 증가
			public void updateFamilyViolenceHit(int fvNum) throws ClassNotFoundException, SQLException;
			//게시물 특정 컬럼 수정
			public void updateFamilyViolence(Map mapNum) throws ClassNotFoundException, SQLException;
		
}
