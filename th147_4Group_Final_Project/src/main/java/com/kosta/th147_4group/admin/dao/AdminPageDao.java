package com.kosta.th147_4group.admin.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.kosta.th147_4group.vo.MemberVO;


public interface AdminPageDao {
	
	//회원정보 상세페이지
	public MemberVO detailAdmin(int num) throws ClassNotFoundException, SQLException;
	//모든 회원정보 출력
	public List<MemberVO> getAllAdmin() throws ClassNotFoundException, SQLException;
	//회원정보 삭제
	public void deleteAdmin(int num) throws ClassNotFoundException, SQLException;
	//회원정보 페이지
	public List<MemberVO> getNowPageAdmin(Map mapNum) throws ClassNotFoundException, SQLException;
	//회원정보 입력
	public void insertAdmin(MemberVO memberVO) throws ClassNotFoundException, SQLException;
	//조회수
	/*public void updateAdminHit(int num) throws ClassNotFoundException, SQLException;*/
	//회원정보 수정
	public void updateAdmin(Map mapNum) throws ClassNotFoundException, SQLException;
	//회원 아이디 체크
	public MemberVO idCheckAdmin(String id) throws ClassNotFoundException, SQLException;
	
}
