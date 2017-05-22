package com.kosta.th147_4group.login.controller;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.th147_4group.login.dao.MemberDAO;
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
		//memberVO.setDate(date);
		MemberDAO dao =sqlSession.getMapper(MemberDAO.class);
		
		dao.insertMember(memberVO);
		//#{date}
		System.out.println("회원가입 요청");
		return "loginMain.do";
	}
	
	@RequestMapping("회원목록출력.do")
	public ModelAndView viewMember(String id) throws ClassNotFoundException, SQLException {
		
		ModelAndView mav = new ModelAndView();
		MemberDAO dao =sqlSession.getMapper(MemberDAO.class); //interface를 꼭 쓰고싶으면 이 한줄을 써야함
		
		MemberVO vo = dao.getMember(id);
		
		// user => jsp에서 사용되는 이름
		// vp => 자바코드에서 데이터를 담고있는 변수
		
		mav.addObject("user", vo);
		mav.setViewName("viewMember");
		
		return mav;
		
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
