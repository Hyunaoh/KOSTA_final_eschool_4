package com.kosta.th147_4group.curriculum.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.kosta.th147_4group.vo.CurriculumVO;

@Repository
public interface CurriculumDao {
	// 검색창
	public List getSearchCurriculum(String param) throws ClassNotFoundException, SQLException;
	// 모든 커리큘럼 데이터 받아오기
	public List<CurriculumVO> getAllCurriculum() throws ClassNotFoundException, SQLException;
	// 반, 번호로 교사의 결재 내역을 받아온다.
	public List<CurriculumVO> getCurriculumByInfo(CurriculumVO CurriculumVO) throws ClassNotFoundException, SQLException;

	public int deleteCurriculum(CurriculumVO vo) throws ClassNotFoundException, SQLException;

	public List<CurriculumVO> getNowPageCurriculum(Map mapNum) throws ClassNotFoundException, SQLException;
	
	public int insertCurriculum(CurriculumVO CurriculumVO) throws ClassNotFoundException, SQLException;
	//게시물 조회수 증가
	public void updateCurriculumHit(int stNum) throws ClassNotFoundException, SQLException;
	//게시물 특정 컬럼 수정
	public void updateCurriculum(CurriculumVO mapNum) throws ClassNotFoundException, SQLException;
	// 결재받기
	public void updateSign(CurriculumVO vo) throws ClassNotFoundException, SQLException;
	
	public List<CurriculumVO> selectSignInfo(CurriculumVO vo) throws ClassNotFoundException, SQLException;
	
	public List<CurriculumVO> selectPageSignInfo(Map mapNum) throws ClassNotFoundException, SQLException;

	public List<CurriculumVO> getNowPageAllCurriculum(Map mapNum) throws ClassNotFoundException, SQLException;

	public int selectChart(Map mapNum) throws ClassNotFoundException, SQLException;
	
	public List<CurriculumVO> principalSelect(CurriculumVO vo) throws ClassNotFoundException, SQLException;

	public int updateSignPrinciPal(CurriculumVO vo) throws ClassNotFoundException, SQLException;

	public List<CurriculumVO> subprinSelect(CurriculumVO vo) throws ClassNotFoundException, SQLException;
	
	public int updateSignSubprin(CurriculumVO vo) throws ClassNotFoundException, SQLException;
	
	public List<CurriculumVO> selectChartList(Map mapNum) throws ClassNotFoundException, SQLException;
}
