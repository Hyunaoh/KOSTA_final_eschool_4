package com.kosta.th147_4group.hope.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.th147_4group.common.SearchVO;
import com.kosta.th147_4group.vo.HopeVO;


@Service
public class HopeService {
	@Autowired
	private SqlSessionTemplate sqlSession;	
		
    public Integer selectBoardCount(SearchVO param) throws Exception {
		return sqlSession.selectOne("hope.selectBoardCount", param);
    }
    public List<SearchVO> selectBoardList(SearchVO param) throws Exception { 
		return sqlSession.selectList("hope.selectBoardList", param);
    }
    
    public void insertBoard(HopeVO param) throws Exception {
    	if (param.getBrdno()==null || "".equals(param.getBrdno()))
    		sqlSession.insert("hope.insertBoard", param);
    	else sqlSession.update("hope.updateBoard", param);
    }
 
    public HopeVO selectBoardOne(String param) throws Exception {
		return sqlSession.selectOne("hope.selectBoardOne", param);
    }
    
    public void updateBoardRead(String param) throws Exception {
		sqlSession.insert("hope.updateBoardRead", param);
    }
    
    public void deleteBoardOne(String param) throws Exception {
		sqlSession.delete("hope.deleteBoardOne", param);
    }
    
}
