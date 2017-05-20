package com.kosta.th147_4group.parentboard.controller;

<<<<<<< HEAD
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/parentboard")
public class ParentBoardController {

	@RequestMapping("/parentboard.do")
	public void parentBoard(){
		
=======
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.th147_4group.parentboard.dao.ParentBaordDao;

@Controller
public class ParentBoardController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/parentboard.do")
	public String parentBoard(Model model){
		ParentBaordDao dao = sqlSession.getMapper(ParentBaordDao.class);
		model.addAttribute("list", dao.userList());
		return "parentboard/list";
>>>>>>> 0b4db116b6643780de43675333371159706cd6cd
	}
}
