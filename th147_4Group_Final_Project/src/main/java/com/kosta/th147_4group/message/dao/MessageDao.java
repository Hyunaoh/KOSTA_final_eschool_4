package com.kosta.th147_4group.message.dao;

import java.util.List;

import com.kosta.th147_4group.vo.Grade_2017VO;
import com.kosta.th147_4group.vo.MessageVO;

public interface MessageDao {

	public List<MessageVO> selectMessage(String sessionID);
	public void insertMessage(MessageVO vo);
	public List<Grade_2017VO> searchMessageMember(Grade_2017VO vo);
	public List<Grade_2017VO> searchDetailMessageMember(Grade_2017VO vo);
	public List<Grade_2017VO> selectTeacherMember();
	public List<Grade_2017VO> selectParentMember();

}
