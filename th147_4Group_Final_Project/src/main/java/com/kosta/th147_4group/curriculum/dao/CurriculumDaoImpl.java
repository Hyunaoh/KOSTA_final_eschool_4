package com.kosta.th147_4group.curriculum.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.th147_4group.vo.CurriculumVO;

@Repository
public class CurriculumDaoImpl implements CurriculumDao {

	@Autowired
	private SqlSession curriculumSession;

	@Override
	public List getSearchCurriculum(String param) {
		return curriculumSession.selectList("curriculumSession.getSearchCurriculum", param);
	}

	@Override
	public List getAllCurriculum() throws SQLException {
		return curriculumSession.selectList("curriculumSession.getAllCurriculum");
	}

	@Override
	public int deleteCurriculum(CurriculumVO vo) throws SQLException {
		return curriculumSession.delete("curriculumSession.deleteCurriculumByNum", vo);
	}

	@Override
	public List<CurriculumVO> getNowPageCurriculum(Map mapNum) throws SQLException {
		return curriculumSession.selectList("curriculumSession.getNowPageCurriculum", mapNum);
	}

	@Override
	public int insertCurriculum(CurriculumVO vo) throws ClassNotFoundException, SQLException {
		return curriculumSession.insert("curriculumSession.insertCurriculum", vo);
	}

	@Override
	public void updateCurriculumHit(int stNum) throws ClassNotFoundException, SQLException {
		int result = curriculumSession.update("curriculumSession.updateCurriculumHit", stNum);
		System.out.println("국어과목 조회수 update 결과 : " + result);
	}

	@Override
	public void updateCurriculum(CurriculumVO vo) throws ClassNotFoundException, SQLException {
		int result = curriculumSession.update("curriculumSession.updateCurriculum", vo);
		System.out.println("과목 수정 결과 : " + result);
	}

	@Override
	public List<CurriculumVO> getCurriculumByInfo(CurriculumVO vo) throws ClassNotFoundException, SQLException {
		return curriculumSession.selectList("curriculumSession.getCurriculumByInfo", vo);
	}

	@Override
	public void updateSign(CurriculumVO vo) throws ClassNotFoundException, SQLException {
		int result = curriculumSession.update("curriculumSession.updateSign", vo);
		System.out.println("결재 결과 : " + result);
	}

	@Override
	public List<CurriculumVO> selectSignInfo(CurriculumVO vo) throws ClassNotFoundException, SQLException {
		return curriculumSession.selectList("curriculumSession.selectSignInfo", vo);
	}

	@Override
	public List<CurriculumVO> selectPageSignInfo(Map mapNum) throws ClassNotFoundException, SQLException {
		return curriculumSession.selectList("curriculumSession.selectPageSignInfo", mapNum);
	}

	/* 교장 View */
	@Override
	public List<CurriculumVO> getNowPageAllCurriculum(Map mapNum) throws ClassNotFoundException, SQLException {
		return curriculumSession.selectList("curriculumSession.getNowPageAllCurriculum", mapNum);
	}

	/* chart부분에서 과목의 count값을 가져옴 */
	@Override
	public int selectChart(Map mapNum) throws ClassNotFoundException, SQLException {
		return curriculumSession.selectOne("curriculumSession.selectChart", mapNum);
	}

	@Override
	public List<CurriculumVO> principalSelect(CurriculumVO vo) throws ClassNotFoundException, SQLException {
		return curriculumSession.selectList("curriculumSession.principalSelect", vo);
	}

	@Override
	public int updateSignPrinciPal(CurriculumVO vo) throws ClassNotFoundException, SQLException {
		return curriculumSession.update("curriculumSession.updateSignPrinciPal", vo);
	}

	@Override
	public List<CurriculumVO> subprinSelect(CurriculumVO vo) throws ClassNotFoundException, SQLException {
		return curriculumSession.selectList("curriculumSession.subprinSelect", vo);
	}

	@Override
	public int updateSignSubprin(CurriculumVO vo) throws ClassNotFoundException, SQLException {
		return curriculumSession.update("curriculumSession.updateSignSubprin", vo);
	}

	@Override
	public List<CurriculumVO> selectChartList(Map mapNum) throws ClassNotFoundException, SQLException {
		return curriculumSession.selectList("curriculumSession.selectChartList", mapNum);
	}

}
