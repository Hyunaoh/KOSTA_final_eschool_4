package com.kosta.th147_4group.curriculum.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.kosta.th147_4group.vo.KoreanVO;

@Repository
public interface CurriculumDao {

	// public int getKoreanCount();
	public List getSearchKorean(String param) throws ClassNotFoundException, SQLException;

	public List<KoreanVO> getAllKorean() throws ClassNotFoundException, SQLException;

	public void deleteKorean(int cNum) throws ClassNotFoundException, SQLException;

	public List<KoreanVO> getNowPageKorean(Map mapNum) throws ClassNotFoundException, SQLException;
	
	public void insertKorean(KoreanVO KoreanVO) throws ClassNotFoundException, SQLException;
	//게시물 조회수 증가
	public void updateKoreanHit(int stNum) throws ClassNotFoundException, SQLException;
	//게시물 특정 컬럼 수정
	public void updateKorean(Map mapNum) throws ClassNotFoundException, SQLException;

}
