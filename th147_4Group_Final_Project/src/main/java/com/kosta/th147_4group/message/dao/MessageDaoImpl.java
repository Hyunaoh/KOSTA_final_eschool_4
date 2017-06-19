package com.kosta.th147_4group.message.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.th147_4group.vo.Grade_2017VO;
import com.kosta.th147_4group.vo.MessageVO;

@Repository
public class MessageDaoImpl implements MessageDao {

	@Autowired
	private SqlSession msgSession;
	
	@Override
	public List<MessageVO> selectMessage(String sessionID) {
		return msgSession.selectList("msgSession.selectMessage", sessionID);
	}
	
	@Override
	public void insertMessage(MessageVO vo) {
		int res = msgSession.insert("msgSession.insertMessage", vo);
		System.out.println("메세지 insert 여부 : " + res);
	}

	@Override
	public List<Grade_2017VO> searchMessageMember(Grade_2017VO vo) {
		return msgSession.selectList("msgSession.searchMessageMember", vo);
	}

	@Override
	public List<Grade_2017VO> searchDetailMessageMember(Grade_2017VO vo) {
		return msgSession.selectList("msgSession.searchDetailMessageMember", vo);
	}

	@Override
	public List<Grade_2017VO> selectTeacherMember() {
		return msgSession.selectList("msgSession.selectTeacherMember");
	}

	@Override
	public List<Grade_2017VO> selectParentMember() {
		return msgSession.selectList("msgSession.selectParentMember");
	}
	
}
