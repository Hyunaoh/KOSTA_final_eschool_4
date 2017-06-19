package com.kosta.th147_4group.schoolinfo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.th147_4group.vo.MemberVO;


@Repository
public class SchoolInfoDAOImpl implements SchoolInfoDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MemberVO> selectTeacher() throws Exception {

		return sqlSession.selectList("sqlSession.selectTeacher");
	}

/*	
    @Override
	public int updateTeacher() throws Exception {
		
		return sqlSession.update("sqlSession.UpdateTeacher");
		
	}

	@Override
	public void deleteTeacher(String teId) throws Exception {
		int delete = sqlSession.delete("sqlSession.deleteTeacher", teId);
	}
*/

	@Override
	public int insertTeacher() throws Exception {
		return sqlSession.insert("sqlSession.insertTeacher");
	}


}
