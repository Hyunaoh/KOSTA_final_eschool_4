package com.kosta.th147_4group.admin.controller;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.th147_4group.admin.dao.AdminPageDao;
import com.kosta.th147_4group.vo.MemberVO;

@Controller
@RequestMapping(value ="/admin")
public class AdminPageController {
	
	@Autowired
	private AdminPageDao dao;
	
	/* 추후 메세지와 연동할 때 사용
	 * @Autowired
	private MessageDaoImpl mDao;*/
	
	@Autowired
	public void setDao(AdminPageDao dao){
		this.dao = dao;
	}
	
	@RequestMapping(value = "/adminForm.do")
	public String adminForm(Model model, MemberVO vo) throws SQLException, ClassNotFoundException{
		
		return "admin/adminForm";
		
	}
	
	@RequestMapping(value="/adminPro.do")
	public String adminPro(Model model, MemberVO vo, HttpServletRequest request) throws SQLException, ClassNotFoundException{

		MemberVO mvo = null;
		List<MemberVO> mvoList = new ArrayList<MemberVO>();

		mvoList = dao.getAllAdmin();
		// 모든 컬럼을 받아온다.
		int count = mvoList.size();

		// 모든 컬럼의 크기를 알아온다.
		int BLOCK = 10;

		List<Integer> countList = new ArrayList<Integer>();

		Map<String, Integer> parameterMap = new HashMap<String, Integer>();
		Map<Integer, List> nowPage = new HashMap<Integer, List>();
		
		// 예를들어, 총 100개의 게시물이라면, 100개를 20으로 나눈 값 (1~5 값)을 List 안에 넣습니다.
		for (int i = 1; i <= Math.ceil((double)count / BLOCK) ; i++) {
			countList.add(i);

			// countList와 BLOCK을 곱한 값을 nowPage(현재 페이지에 게시물 몇개를 보여줄건지) 에 넣는다.
			parameterMap.put("num1", i*BLOCK - BLOCK + 1 );
			System.out.println("parameter : " + parameterMap.get("num1"));

			// 전체 컬럼의 크기 (ex) 27개 게시물 이 (ex)30개 보다 작다면, 
			if (count < i + BLOCK) {
				parameterMap.put("num2", count);
				System.out.println("parameter3 : " + count);
				nowPage.put(i, dao.getNowPageAdmin(parameterMap));
				System.out.println(i);
				// nowPageList.put(i, nowPage);
			} else {
				parameterMap.put("num2", i * BLOCK);
				System.out.println("parameter2 : " + i * BLOCK);
				nowPage.put(i, dao.getNowPageAdmin(parameterMap));
				System.out.println(i);
				// nowPageList.put(i, nowPage);
			}
			
			System.out.println("nowPage.get("+i+") : " + nowPage.get(i));
			
			parameterMap.clear();
		}
		
		String page_index_start = "0";
		String page_index_end = "4";
		String s_pageNum = "1";
		
		if (request.getParameter("page_index_start") != null && request.getParameter("page_index_end") != null) {
			page_index_start = request.getParameter("page_index_start");
			page_index_end = request.getParameter("page_index_end");
		} else if(request.getParameter("s_pageNum") != null){
			s_pageNum = request.getParameter("s_pageNum");
		}
		
		// 총 페이지 블록 수(Map)
		model.addAttribute("s_nowPage", nowPage);
		// 총 페이지 블록 수(List)
		model.addAttribute("s_pageList", countList);
		
		// 총 게시물 개수 / BLOCK (다음, 이전을 위한 알고리즘)
		model.addAttribute("all_Cnt", ((double)count / BLOCK));

		System.out.println("총 컬럼수 : " + count);

		return "forward:adminForm.do?page_index_start=" + page_index_start + "&page_index_end=" + page_index_end + "&s_pageNum=" + s_pageNum;
	}
	
	@RequestMapping("/insertAdminForm.do")
	public String insertAdmin(){
		
		return "admin/insertAdminForm";
		
	}
	
	@RequestMapping(value = "/insertAdminPro.do")
	public String insertAdmin(Model model, MemberVO vo) throws ClassNotFoundException, SQLException {
		
		dao.insertAdmin(vo);

		System.out.println("관리자 회원가입");

		return "redirect:adminPro.do?s_pageNum=1";
	}
	
	
	@RequestMapping("/detailAdmin.do")
	public String detailStudentProposal(Model model, MemberVO vo) throws ClassNotFoundException, SQLException {
		MemberVO vo2 = dao.detailAdmin(vo.getNum());

		model.addAttribute("smVo", vo2);
		/*dao.updateAdminHit(vo.getNum());*/
		
		return "admin/detailAdminForm";
	}
	
	@RequestMapping("/idCheckForm.do")
	public String idcheckForm(){
		return "admin/idCheck";
	}
	
	//회원 id체크
	@RequestMapping("/idCheckAdmin.do")
	public String idCheckAdmin(Model model, MemberVO vo) throws ClassNotFoundException, SQLException{
		MemberVO vo2 = dao.idCheckAdmin(vo.getId());

		model.addAttribute("idVo", vo2);
		
		return "admin/idCheck";
	}
	
	// 수정부분
		@RequestMapping("/updateAdmin.do")
		public String updateAdmin(Model model, MemberVO vo, HttpServletRequest request) 
				throws ClassNotFoundException, SQLException {
			
			int num = vo.getNum();
			String id = vo.getId();
			String pw = vo.getPw();
			String name = vo.getName();
			String gender = vo.getGender();	// 성별
			String tel = vo.getTel();
			String postcode = vo.getPostcode();
			String roadAddress = vo.getRoadAddress();
			String jibunAddress = vo.getJibunAddress();
			String email = vo.getEmail(); 	// email
			String stName = vo.getStName();	// 자녀의 이름		***
			String grade = vo.getGrade();	// 학년
			String schoolClass = vo.getSchoolClass();  	// 반
			String level = vo.getLevel(); 	// 직급 
			String sms = vo.getSms();		// sms 동의 여부
			
			
			System.out.println("num : " + num);
			System.out.println("id : " + id);
			System.out.println("pw : " + pw);
			System.out.println("name : " + name);
			System.out.println("gender : " + gender);
			System.out.println("tel : " + tel);
			System.out.println("postcode : " + postcode);
			System.out.println("roadAddress : " + roadAddress);
			System.out.println("jibunAddress : " + jibunAddress);
			System.out.println("email : " + email);
			System.out.println("stName : " + stName);
			System.out.println("grade : " + grade);
			System.out.println("schoolClass : " + schoolClass);
			System.out.println("level : " + level);
			System.out.println("sms : " + sms);
			
			String s_nowPage = request.getParameter("s_nowPage");
			
			HashMap map = new HashMap();
			map.put("num", num);
			map.put("id", id);
			map.put("pw", pw);
			map.put("name", name);
			map.put("gender", gender);
			map.put("tel", tel);
			map.put("postcode", postcode);
			map.put("roadAddress", roadAddress);
			map.put("jibunAddress", jibunAddress);
			map.put("email", email);
			map.put("stName", stName);
			map.put("grade", grade);
			map.put("schoolClass", schoolClass);
			map.put("level", level);
			map.put("sms", sms);
			
			dao.updateAdmin(map);

			return "redirect:adminPro.do?s_pageNum=1";
		}
	
		@RequestMapping("/deleteAdmin.do")
		public String deleteAdmin(Model model, MemberVO vo) throws ClassNotFoundException, SQLException{
			int num = vo.getNum();
			System.out.println("num : " + num);
			
			dao.deleteAdmin(num);
			
			return "redirect:adminPro.do?s_pageNum=1";
		}
		
}