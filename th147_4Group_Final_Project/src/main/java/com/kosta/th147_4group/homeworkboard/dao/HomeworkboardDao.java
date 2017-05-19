package com.kosta.th147_4group.homeworkboard.dao;

import java.sql.SQLException;
import java.util.List;

import com.kosta.th147_4group.vo.HomeworkVO;

//crud
public interface HomeworkboardDao {
	//게시판 갯수
	public int getCount(String field, String query)throws ClassNotFoundException,SQLException;
	//전체게시물
	public List<HomeworkVO> getHomeworkVO(int page, String filed, String query)throws ClassNotFoundException,SQLException;
	//게시물 삭제
		public int delete(String seq)throws ClassNotFoundException, SQLException;
	//게시물 수정
	public int update(HomeworkVO vo) throws ClassNotFoundException,SQLException;
	//게시물 상세
	public HomeworkVO getHomeworkVO(String seq) throws ClassNotFoundException,SQLException;
	//게시물 입력
	public int insert(HomeworkVO vo) throws ClassNotFoundException,SQLException;
}
