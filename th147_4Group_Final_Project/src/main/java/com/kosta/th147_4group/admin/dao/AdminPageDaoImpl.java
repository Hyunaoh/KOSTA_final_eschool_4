package com.kosta.th147_4group.admin.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.th147_4group.vo.MemberVO;

@Repository
public class AdminPageDaoImpl implements AdminPageDao {

	@Autowired
	private SqlSession adminSqlSession;
	
	@Override
	public MemberVO detailAdmin(int num) throws ClassNotFoundException, SQLException {
		return adminSqlSession.selectOne("adminSqlSession.detailAdmin", (int) num);
	}

	@Override
	public List<MemberVO> getAllAdmin() throws ClassNotFoundException, SQLException {
		return adminSqlSession.selectList("adminSqlSession.getAllAdmin");
	}

	@Override
	public void deleteAdmin(int num) throws ClassNotFoundException, SQLException {
		int delete = adminSqlSession.delete("adminSqlSession.deleteAdmin", (int)num);
		System.out.println("admin 관리자계정으로 Member DB 컬럼 삭제여부 : " + delete);
	}

	@Override
	public List<MemberVO> getNowPageAdmin(Map mapNum) throws ClassNotFoundException, SQLException {
		return adminSqlSession.selectList("adminSqlSession.getNowPageAdmin", mapNum);
	}

	@Override
	public void insertAdmin(MemberVO memberVO) throws ClassNotFoundException, SQLException {
		adminSqlSession.insert("adminSqlSession.insertAdmin", memberVO);
	}

	@Override
	public void updateAdmin(Map mapNum) throws ClassNotFoundException, SQLException {
		int result = adminSqlSession.update("adminSqlSession.updateAdmin", mapNum);
		System.out.println("admin단에서 회원정보 수정 결과 : " + result);
	}

	@Override
	public MemberVO idCheckAdmin(String id) throws ClassNotFoundException, SQLException {
		return adminSqlSession.selectOne("adminSqlSession.idCheckAdmin", id);
	}



}
