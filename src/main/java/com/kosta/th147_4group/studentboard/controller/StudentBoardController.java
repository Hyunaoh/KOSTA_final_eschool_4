package com.kosta.th147_4group.studentboard.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.kosta.th147_4group.studentboard.dao.StudentBoardDao;
import com.kosta.th147_4group.vo.MemberVO;
import com.kosta.th147_4group.vo.StudentProposalVO;

@Controller
//@RequestMapping("/studentboard")
public class StudentBoardController {
	
	@Autowired
	private StudentBoardDao dao;
	
	@Autowired
	public void setDao(StudentBoardDao dao){
		this.dao = dao;
	}
	
	//StudentProposal*************** 건의사항 게시판 실시
	/*@RequestMapping(value = "/studentProposal.do")
	public String studentProposal(ModelAndView mav, StudentProposalVO vo) throws SQLException, ClassNotFoundException{ 
		StudentProposalVO svo;
		List<StudentProposalVO> svoList = new ArrayList<StudentProposalVO>();
		
		svo = dao.getStudentProposal(vo.getStNum());
		svoList = dao.getAllStudentProposal();
		int count = svoList.size();
		
		List<Integer> countList = new ArrayList<Integer>();
		mav.addObject("count", 20);
		
		//100개를 20으로 나눈 값 (1~5값)을 List 안에 넣는다
		for(int i=1; i<= count; i++){
			countList.add((i/20)+1);
		}
		
		//게시물 쪽수(1~5값)을 view로 보낸 뒤,
		mav.addObject("pageList", countList);
		
		if((count /20) ==0){
			mav.addObject("left", "0");
			mav.addObject("right", "0");
		} else if ((count/20) ==1){
			mav.addObject("left", "0");
			mav.addObject("right", "0");
		} else if((count/20) % 5 == 0){
			mav.addObject("left", "0");
			mav.addObject("right", "1");
		} else if ((count/20) % 5==1){
			mav.addObject("left", "1");
			mav.addObject("right", "0");
		}
		mav.addObject("svo", svo);
		mav.addObject("svoList", svoList);
		
		
		return "studentboard/studentboard";
	}*/
	
	//studentProposalForm*************** 실질적으로 실행되는 건의사항 게시판
	@RequestMapping(value = "/studentProposalForm.do")
	public String studentProposalForm(Model model, StudentProposalVO vo) throws SQLException, ClassNotFoundException{
		
		StudentProposalVO svo = null;
		List<StudentProposalVO> svoList = new ArrayList<StudentProposalVO>();
		
		// 특정 컬럼명을 받아온다.
		//svo = dao.getStudentProposal(vo.getStGrade());
		// 모든 컬럼을 받아온다.
		svoList = dao.getAllStudentProposal();
		// 모든 컬럼의 크기를 알아온다.
		int count = svoList.size();
		
		// 페이지당 원하는 게시물 개수
		int BLOCK = 5;
		
		
		//****************** 페이지 처리하는 것들
		List<Integer> countList = new ArrayList<Integer>();
		
		Map<String, Integer> parameterMap = new HashMap<String, Integer>();
		Map<Integer, List> nowPage = new HashMap<Integer, List>();
		
		// 예를들어, 총 100개의 게시물이라면, 100개를 20으로 나눈 값 (1~5 값)을 List 안에 넣습니다.
		for(int i = 1; i <= (count/BLOCK)+1; i++){
			countList.add(i);
			
			// countList와 BLOCK을 곱한 값을 nowPage(현재 페이지에 게시물 몇개를 보여줄건지) 에 넣는다.
			parameterMap.put("num1", i+BLOCK - BLOCK);
			System.out.println("parameter : " + parameterMap.get("num1"));
		
			// 전체 컬럼의 크기  (ex) 27개 게시물 이 (ex)30개 보다 작다면, 
			if(count < i+BLOCK){
				parameterMap.put("num2", count);
				System.out.println("parameter3 : " + count);
				nowPage.put(i, dao.getNowPage(parameterMap));
				System.out.println(i);
				//nowPageList.put(i, nowPage);
			} else{
				parameterMap.put("num2", i*BLOCK);
				System.out.println("parameter2 : " + i*BLOCK);
				nowPage.put(i, dao.getNowPage(parameterMap));					
				System.out.println(i);
				//nowPageList.put(i, nowPage);
			}
		
			System.out.println("nowPage.get(1)" + nowPage.get(1));
			System.out.println("nowPage.get(2)" + nowPage.get(2));
			System.out.println("nowPage.get(3)" + nowPage.get(3));
			
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("pageNum", "1");
			//model.addAttribute("nowPageList", nowPageList);
			// 파라미터 맵을 클리어 합니다.
			parameterMap.clear();
			// 현재 페이지 (ex)1~10 / 11~20 값을 Map에 넣는다.
		}
		// 게시물 쪽수 (1~5값)을 view로 보낸뒤,
		model.addAttribute("pageList", countList);
					
		/*if ((count / 20) == 0) {
			model.addAttribute("left", "0");
		model.addAttribute("right", "0");
		} else if ((count / 20) == 1) {
			model.addAttribute("left", "0");
			model.addAttribute("right", "0");
		} else if ((count / 20) % 5 == 0) {
			model.addAttribute("left", "0");
			model.addAttribute("right", "1");
		} else if ((count / 20) % 5 == 1) {
			model.addAttribute("left", "1");
			model.addAttribute("right", "0");
		}*/

		model.addAttribute("svo", svo);
		model.addAttribute("svoList", svoList);
		model.addAttribute("test", "testest");
		
		return "studentboard/studentProposalForm";
		
	}
	
	@RequestMapping("/sign.do")
	public void sign() {

	}

	//글 등록 Form으로 이동
	@RequestMapping("/insertStudentProposalForm.do")
	public String insertStudentProposal(){
			
		return "studentboard/insertStudentProposalForm";
			
	}
	
	//글 등록**********************
	@RequestMapping("/insertStudentProposal.do")
	public String insertStudentProposal(Model model, StudentProposalVO vo)
	throws ClassNotFoundException, SQLException{
		MemberVO mvo = null;
		
		dao.insertStudentProposal(vo);
		
		model.addAttribute("mvo", mvo);
		return "main";
	}
	
	//상세 글 Form으로 이동
	@RequestMapping("/detailStudentProposalForm.do")
	public String detailStudentProposal(){
			
		return "studentboard/detailStudentProposalForm";
			
	}
	
	//상세 글 출력**********************
	@RequestMapping("/detailStudentProposal.do")
	public String detailStudentProposal(Model model, StudentProposalVO vo)
	throws ClassNotFoundException, SQLException{
		StudentProposalVO vo2 = dao.detailStudentProposal(vo.getStNum());
		
		model.addAttribute("stNum", vo2);
		return "studentboard/detailStudentProposalForm";
	}
	
	/*//글 수정**********************
		@RequestMapping("/updateStudentProposal.do")
		public String updateStudentProposal(int stNum)
		throws ClassNotFoundException, SQLException{
			
			dao.insertStudentProposal(vo);
			
			return "main";
		}
		
	//글 삭제**********************
	@RequestMapping("/insertStudentProposal.do")
	public String deleteStudentProposal(int stNum)
	throws ClassNotFoundException, SQLException{
			
		dao.insertStudentProposal(vo);
			
		return "main";
	}*/
}
