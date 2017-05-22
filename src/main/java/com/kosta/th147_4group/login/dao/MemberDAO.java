package com.kosta.th147_4group.login.dao;

import java.sql.SQLException;

import com.kosta.th147_4group.vo.MemberVO;

public interface MemberDAO {

	//회원가입
	public int insertMember(final MemberVO memberVO) throws ClassNotFoundException, SQLException;
	
	//회원가입인원 출력
	public MemberVO getMember(String id) throws ClassNotFoundException, SQLException;
}
