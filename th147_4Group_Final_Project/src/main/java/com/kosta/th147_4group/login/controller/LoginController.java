package com.kosta.th147_4group.login.controller;

import java.security.Principal;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.th147_4group.curriculum.dao.CurriculumDao;
import com.kosta.th147_4group.login.dao.MemberDAO;
import com.kosta.th147_4group.message.dao.MessageDao;
import com.kosta.th147_4group.vo.MemberVO;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private SqlSession sqlSession;
	
	// 선생 로그인
	@RequestMapping(value = "/loginMain.do", method = RequestMethod.GET)
	public String LoginMain(Model model, MemberVO memberVO, Principal principal,  Authentication authentication, HttpServletRequest request) throws ClassNotFoundException, SQLException {
	
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		
		System.out.println("로그인 요청");
		
		String sId = principal.getName();
		System.out.println("id : " + sId);
		
		MemberVO mVo = dao.getMember(sId);
		
		String name = mVo.getName();	
		String grade = mVo.getGrade();
		String mClass = mVo.getSchoolClass();
		String level = mVo.getLevel();
		String ip = request.getRemoteAddr();
		String email = mVo.getEmail();
		
		System.out.println(mVo);
		HttpSession session = request.getSession();
		
		session.setAttribute("id", sId);
		session.setAttribute("name", name);
		session.setAttribute("grade", grade);
		session.setAttribute("mClass", mClass);
		session.setAttribute("level", level);
		session.setAttribute("ip", ip);
		session.setAttribute("email", email);
		
		if(sId.equals("principal")){
			session.setAttribute("t_level", "2");
		} else if (sId.equals("submaster")){
			session.setAttribute("t_level", "1");			
		}

		return "forward:/";
	}

	@RequestMapping(value = "/loginForm.do", method = RequestMethod.GET)
	public String Login() {
		System.out.println("로그인 페이지 요청");

		return "login/loginForm";
	}

	// 회원가입
	@RequestMapping(value = "/joinForm.do", method = RequestMethod.GET)
	public String Join() {
		System.out.println("회원가입 페이지 요청");

		return "login/joinForm";
	}

	// 회원가입 성공
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String Join(Model model, MemberVO memberVO, HttpServletRequest request) throws ClassNotFoundException, SQLException {
		// memberVO.setDate(date);
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		CurriculumDao cDao;
		MessageDao mDao;
		
		dao.insertMember(memberVO);

		System.out.println("회원가입 요청");

		return "forward:/";
	}

	@RequestMapping(value = "/list.do")
	public ModelAndView viewMember(String id) throws ClassNotFoundException, SQLException {

		ModelAndView mav = new ModelAndView();
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class); 
		// interface를 꼭 쓰고싶으면 이 한줄을 써야함

		MemberVO vo = dao.getMember(id);

		// user => jsp에서 사용되는 이름
		// vp => 자바코드에서 데이터를 담고있는 변수

		mav.addObject("user", vo);
		mav.setViewName("viewMember");

		return mav;

	}

	// ID / PWD 찾기
	@RequestMapping(value = "/searchForm.do", method = RequestMethod.GET)
	public String search() {
		System.out.println("로그인 페이지 요청");

		return "login/search";
	}

	// 로그인 에러
	@RequestMapping("/error.do")
	public String Error() {

		return "login/error";
	}

	@RequestMapping("/student/test.do")
	public String teststt() {

		return "login/student";
	}

	// 회원 정보 뿌리기
	@RequestMapping("/loginUpdateForm.do")
	public String UpdateForm(Model model, HttpServletRequest request) throws ClassNotFoundException, SQLException {
		
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class); 
		// interface를 꼭 쓰고싶으면 이 한줄을 써야함

		MemberVO vo = dao.getMember(request.getParameter("id"));

		System.out.println("회원정보 : " + vo);
		model.addAttribute("vo", vo);

		return "login/loginUpdateForm";

	}
	
	@RequestMapping("/loginUpdatePro.do")
	public String loginUpdatePro(MemberVO memberVO, Model model, HttpServletRequest request) throws ClassNotFoundException, SQLException {
		
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class); 
		// interface를 꼭 쓰고싶으면 이 한줄을 써야함
		
		int res = dao.updateMember(memberVO);
		System.out.println("login 정보 수정 결과 : " + res);
		
		return "redirect:/";
		
	}

}
