package com.kosta.th147_4group.login.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.th147_4group.login.dao.LoginDao;
import com.kosta.th147_4group.vo.StudentVO;

@Controller
@RequestMapping("/login/")
public class LoginController {
	
	@Autowired
	private LoginDao loginDao;
	
	// 학생페이지 로그인
	@RequestMapping(value = "StudentLogin.do", method = RequestMethod.GET)
	public String StudentLogin() {
		System.out.println("로그인 페이지 요청");
		return "StudentLogin.jsp";
	}

	// 학생 회원가입
	@RequestMapping(value = "StudentJoin.do", method = RequestMethod.POST)
	public String StudentJoin() {
		System.out.println("회원가입 페이지 요청");
		// Tiles 변경 전
		return "studentJoin.jsp";
	}
	
	// 학생 회원가입 성공
	@RequestMapping(value="studentJoin.do", method=RequestMethod.POST)
	public String StudentJoin(StudentVO studentVO) throws ClassNotFoundException, SQLException{
		memberDao.insertStudentMember(studentVO);
				
		return "redirect:../index.do";
		
	}

	// 학생페이지 로그인 에러
	@RequestMapping("/error.do")
	public void StudentError() {

	}

}
