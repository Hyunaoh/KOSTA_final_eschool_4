package com.kosta.th147_4group.curriculum.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.kosta.th147_4group.vo.KoreanVO;

@Repository
public interface CurriculumDao {

	//public int getKoreanCount();
	public KoreanVO getKorean(String grade) throws SQLException;
	public List<KoreanVO> getAllKorean() throws SQLException;
	public void deleteKorean(int cNum) throws SQLException;
	public List<KoreanVO> getNowPage(Map mapNum) throws SQLException;

}
