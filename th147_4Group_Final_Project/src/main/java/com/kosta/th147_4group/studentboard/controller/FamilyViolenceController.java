package com.kosta.th147_4group.studentboard.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.th147_4group.studentboard.dao.FamilyViolenceDao;
import com.kosta.th147_4group.vo.FamilyViolenceVO;


@Controller
@RequestMapping(value = "/studentboard")
public class FamilyViolenceController {

	@Autowired
	private FamilyViolenceDao dao;

	@Autowired
	public void setDao(FamilyViolenceDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value = "/familyViolenceForm.do")
	public String familyViolenceForm(Model model, FamilyViolenceVO vo) throws SQLException, ClassNotFoundException {
		
		return "studentboard/familyViolenceForm";
	}

	// studentProposalForm*************** �떎吏덉쟻�쑝濡� �떎�뻾�릺�뒗 嫄댁쓽�궗�빆 寃뚯떆�뙋
	@RequestMapping(value = "/familyViolencePro.do")
	public String studentProposalPro(Model model, FamilyViolenceVO vo, HttpServletRequest request) throws SQLException, ClassNotFoundException {

		FamilyViolenceVO svo = null;
		List<FamilyViolenceVO> svoList = new ArrayList<FamilyViolenceVO>();

		svoList = dao.getAllFamilyViolence();
		// 모든 컬럼을 받아온다.
		int count = svoList.size();

		// 모든 컬럼의 크기를 알아온다.
		int BLOCK = 5;

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
				nowPage.put(i, dao.getNowPageFamilyViolence(parameterMap));
				System.out.println(i);
				// nowPageList.put(i, nowPage);
			} else {
				parameterMap.put("num2", i * BLOCK);
				System.out.println("parameter2 : " + i * BLOCK);
				nowPage.put(i, dao.getNowPageFamilyViolence(parameterMap));
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

		return "forward:familyViolenceForm.do?page_index_start=" + page_index_start + "&page_index_end=" + page_index_end+"&s_pageNum="+s_pageNum;

	}
	
	// 湲� �벑濡� Form�쑝濡� �씠�룞
	@RequestMapping("/insertFamilyViolenceForm.do")
	public String insertFamilyViolence() {

		return "studentboard/insertFamilyViolenceForm";

	}

	// 湲� �벑濡�**********************
	@RequestMapping("/insertFamilyViolence.do")
	public String insertFamilyViolence(Model model, FamilyViolenceVO vo) throws ClassNotFoundException, SQLException {

		dao.insertFamilyViolence(vo);

		return "redirect:insertFamilyViolencePro.do?s_pageNum=1";
	}

	// �긽�꽭 湲� 異쒕젰**********************
	@RequestMapping("/detailFamilyViolence.do")
	public String detailFamilyViolence(Model model, FamilyViolenceVO vo) throws ClassNotFoundException, SQLException {
		FamilyViolenceVO vo2 = dao.detailFamilyViolence(vo.getFvNum());

		model.addAttribute("fvVo", vo2);
		dao.updateFamilyViolenceHit(vo.getFvNum());
		return "studentboard/detailFamilyViolenceForm";
	}

	// 수정부분
	@RequestMapping("/updateFamilyViolence.do")
	public String updateFamilyViolence(Model model, FamilyViolenceVO vo, HttpServletRequest request) 
			throws ClassNotFoundException, SQLException {
		
		int fvNum = vo.getFvNum();
		String fvTitle = vo.getFvTitle();
		String fvMessage = vo.getFvMessage();
		String fvCategoly = vo.getFvCategoly();

		System.out.println("fvNum : " + fvNum);
		System.out.println("title : " + fvTitle);
		System.out.println("message : " + fvMessage);
		System.out.println("Categoly : " + fvCategoly);
		
		String s_nowPage = request.getParameter("s_nowPage");
		
		HashMap map = new HashMap();
		map.put("fvTitle", fvTitle);
		map.put("fvMessage", fvMessage);
		map.put("fvCategoly", fvCategoly);
		map.put("fvNum", fvNum);
		
		dao.updateFamilyViolence(map);

		return "redirect:familyViolencePro.do?s_pageNum=1";
	}

	@RequestMapping("/deleteFamilyViolence.do")
	public String deleteFamilyViolence(Model model, FamilyViolenceVO vo) throws ClassNotFoundException, SQLException{
		int fvNum = vo.getFvNum();
		System.out.println("fvNum : " + fvNum);
		
		dao.deleteFamilyViolence(fvNum);
		
		return "redirect:studentProposalPro.do?s_pageNum=1";
	}
	
}
