package com.kosta.th147_4group.courseedums.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.th147_4group.common.SearchVO;
import com.kosta.th147_4group.vo.CourseEduMsVO;
import com.kosta.th147_4group.vo.HopeVO;

@Service
public class CourseEduMsService {

		@Autowired
		private SqlSessionTemplate sqlSession;	
			
	    public Integer selectBoardCount(SearchVO param) throws Exception {
			return sqlSession.selectOne("courseedums.selectBoardCount", param);
	    }
	    public List<SearchVO> selectBoardList(SearchVO param) throws Exception { 
			return sqlSession.selectList("courseedums.selectBoardList", param);
	    }
	    
	    public void insertBoard(CourseEduMsVO param) throws Exception {
	    	if (param.getBrdno()==null || "".equals(param.getBrdno()))
	    		sqlSession.insert("courseedums.insertBoard", param);
	    	else sqlSession.update("courseedums.updateBoard", param);
	    }
	 
	    public CourseEduMsVO selectBoardOne(String param) throws Exception {
			return sqlSession.selectOne("courseedums.selectBoardOne", param);
	    }
	    
	    public void updateBoardRead(String param) throws Exception {
			sqlSession.insert("courseedums.updateBoardRead", param);
	    }
	    
	    public void deleteBoardOne(String param) throws Exception {
			sqlSession.delete("courseedums.deleteBoardOne", param);
	    }
	    
	}
