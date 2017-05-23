package com.kosta.th147_4group.parentboard.dao;

import java.util.ArrayList;

import com.kosta.th147_4group.vo.ParentsVO;

public interface ParentBaordDao {

	public ArrayList<ParentsVO> paListAll(); // 전체글 가져오기
	public void paWrite(ParentsVO parentsVO);//글쓰기
	public int paListAllcount(int num);

	
	
	
	
	
}