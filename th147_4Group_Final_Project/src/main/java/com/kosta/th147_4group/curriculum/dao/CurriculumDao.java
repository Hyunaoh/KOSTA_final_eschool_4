package com.kosta.th147_4group.curriculum.dao;

import java.util.List;

import com.kosta.th147_4group.vo.KoreanVO;

public interface CurriculumDao {

	//public int getKoreanCount();
	public KoreanVO getKorean(String grade);

}
