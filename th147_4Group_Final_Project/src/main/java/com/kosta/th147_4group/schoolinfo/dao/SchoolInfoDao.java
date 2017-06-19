package com.kosta.th147_4group.schoolinfo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kosta.th147_4group.vo.MemberVO;


@Repository
public interface SchoolInfoDao {
	public List<MemberVO> selectTeacher() throws Exception;
/*	public int updateTeacher() throws Exception;
	public void deleteTeacher(String teId) throws Exception;*/
	public int insertTeacher() throws Exception;
}
