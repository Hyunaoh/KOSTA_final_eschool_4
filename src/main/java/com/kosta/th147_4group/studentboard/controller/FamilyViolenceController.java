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

import com.kosta.th147_4group.studentboard.dao.FamilyViolenceDao;
import com.kosta.th147_4group.vo.FamilyViolenceVO;
import com.kosta.th147_4group.vo.MemberVO;

@Controller
//@RequestMapping("/studentboard")
public class FamilyViolenceController {
	
	@Autowired
	private FamilyViolenceDao dao;
	
	@Autowired
	public void setDao(FamilyViolenceDao dao){
		this.dao = dao;
	}
	
	//studentProposalForm*************** 실질적으로 실행되는 건의사항 게시판
	@RequestMapping(value = "/familyViolenceForm.do")
	public String studentProposalForm(Model model, FamilyViolenceVO vo) throws SQLException, ClassNotFoundException{
		
		FamilyViolenceVO fvo = null;
		List<FamilyViolenceVO> fvoList = new ArrayList<FamilyViolenceVO>();
		
		// 특정 컬럼명을 받아온다.
		//svo = dao.getStudentProposal(vo.getStGrade());
		// 모든 컬럼을 받아온다.
		fvoList = dao.getAllFamilyViolence();
		// 모든 컬럼의 크기를 알아온다.
		int count = fvoList.size();
		
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
				nowPage.put(i, dao.FamilyViolenceGetNowPage(parameterMap));
				System.out.println(i);
				//nowPageList.put(i, nowPage);
			} else{
				parameterMap.put("num2", i*BLOCK);
				System.out.println("parameter2 : " + i*BLOCK);
				nowPage.put(i, dao.FamilyViolenceGetNowPage(parameterMap));					
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
					
		model.addAttribute("fvo", fvo);
		model.addAttribute("fvoList", fvoList);
		
		return "studentboard/familyViolence/FamilyViolenceForm";
		
	}
	
//	@RequestMapping("/sign.do")
//	public void sign() {
//
//	}

	//글 등록 Form으로 이동
	@RequestMapping("/insertFamilyViolenceForm.do")
	public String insertStudentProposal(){
			
		return "studentboard/familyViolence/FamilyViolenceForm";
			
	}
	
	//글 등록**********************
	@RequestMapping("/insertFamilyViolence.do")
	public String insertStudentProposal(Model model, FamilyViolenceVO vo)
	throws ClassNotFoundException, SQLException{
		MemberVO mvo = null;
		
		dao.insertFamilyViolence(vo);
		
		model.addAttribute("mvo", mvo);
		return "main";
	}
	
	//상세 글 출력**********************
	@RequestMapping("/detailFamilyViolence.do")
	public String detailStudentProposal(Model model, FamilyViolenceVO vo)
	throws ClassNotFoundException, SQLException{
		FamilyViolenceVO vo2 = dao.detailFamilyViolence(vo.getFmNum());
		
		
		model.addAttribute("fmNum", vo2);
		
		return "studentboard/familyViolence/detailFamilyViolenceForm";
	}
	
	//상세 글 삭제
		@RequestMapping("/deleteFamilyViolence.do")
		public String deleteFamilyViolence(Model model, FamilyViolenceVO vo) 
				throws ClassNotFoundException, SQLException{
			dao.deleteFamilyViolence(vo.getFmNum());
			
			model.addAttribute("del", dao);
			return "studentboard/familyViolence/FamilyViolenceForm";
				
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
