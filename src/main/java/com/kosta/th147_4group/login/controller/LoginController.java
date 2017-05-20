package com.kosta.th147_4group.login.controller;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.th147_4group.login.dao.LoginDAO;
import com.kosta.th147_4group.vo.MemberVO;

@Controller
//@RequestMapping("/login/")
//@Repository
public class LoginController {

	@Autowired
	private SqlSession sqlSession;

	// 선생 로그인
	@RequestMapping(value = "loginform.do", method = RequestMethod.GET)
	public String Login() {
		System.out.println("로그인 페이지 요청");

		return "/login/login";
	}

	// 회원가입
	@RequestMapping(value = "joinform.do", method = RequestMethod.GET)
	public String Join() {
		System.out.println("회원가입 페이지 요청");

		return "/login/join";
	}

	// 회원가입 성공
	@RequestMapping(value = "join.do", method = RequestMethod.POST)
	public String Join(MemberVO memberVO) throws ClassNotFoundException, SQLException {
		//loginDao.insertTeacherMember(teacherVO);

		return "redirect:../index.do";
	}
	
	// ID / PWD 찾기
	@RequestMapping(value = "searchform.do", method = RequestMethod.GET)
	public String search() {
		System.out.println("로그인 페이지 요청");

		return "/login/search";
	}


	// 로그인 에러
	@RequestMapping("/error.do")
	public void Error() {
		
	}
	
	@RequestMapping("/student/test.do")
	public String teststt(){
		
		return "login/student";
	}

}
