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

import com.kosta.th147_4group.studentboard.dao.SchoolViolenceDao;
import com.kosta.th147_4group.vo.SchoolViolenceVO;

@Controller
@RequestMapping(value="/studentboard")
public class SchoolViolenceController {
	@Autowired
	private SchoolViolenceDao dao;

	@Autowired
	public void setDao(SchoolViolenceDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value = "/schoolViolenceForm.do")
	public String schoolViolenceForm(Model model, SchoolViolenceVO vo) throws SQLException, ClassNotFoundException {
		
		return "studentboard/schoolViolenceForm";
	}

	// schoolViolenceForm*************** �떎吏덉쟻�쑝濡� �떎�뻾�릺�뒗 嫄댁쓽�궗�빆 寃뚯떆�뙋
	@RequestMapping(value = "/schoolViolencePro.do")
	public String schoolViolencePro(Model model, SchoolViolenceVO vo, HttpServletRequest request) throws SQLException, ClassNotFoundException {

		SchoolViolenceVO svo = null;
		List<SchoolViolenceVO> svoList = new ArrayList<SchoolViolenceVO>();

		svoList = dao.getAllSchoolViolence();
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
				nowPage.put(i, dao.getNowPageSchoolViolence(parameterMap));
				System.out.println(i);
				// nowPageList.put(i, nowPage);
			} else {
				parameterMap.put("num2", i * BLOCK);
				System.out.println("parameter2 : " + i * BLOCK);
				nowPage.put(i, dao.getNowPageSchoolViolence(parameterMap));
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

		return "forward:schoolViolenceForm.do?page_index_start=" + page_index_start + "&page_index_end=" + page_index_end+"&s_pageNum="+s_pageNum;

	}
 

	// 湲� �벑濡� Form�쑝濡� �씠�룞
	@RequestMapping("/insertSchoolViolenceForm.do")
	public String insertSchoolViolence() {

		return "studentboard/insertSchoolViolenceForm";

	}

	// 湲� �벑濡�**********************
	@RequestMapping("/insertSchoolViolence.do")
	public String insertSchoolViolence(Model model, SchoolViolenceVO vo) throws ClassNotFoundException, SQLException {

		dao.insertSchoolViolence(vo);

		return "redirect:schoolViolencePro.do?s_pageNum=1";
	}

	// �긽�꽭 湲� 異쒕젰**********************
	@RequestMapping("/detailSchoolViolence.do")
	public String detailStudentProposal(Model model, SchoolViolenceVO vo) throws ClassNotFoundException, SQLException {
		SchoolViolenceVO vo2 = dao.detailSchoolViolence(vo.getSvNum());

		model.addAttribute("svVo", vo2);
		dao.updateSchoolViolenceHit(vo.getSvNum());
		return "studentboard/detailSchoolViolenceForm";
	}

	// 수정부분
	@RequestMapping("/updateSchoolViolence.do")
	public String updateSchoolViolence(Model model, SchoolViolenceVO vo, HttpServletRequest request) 
			throws ClassNotFoundException, SQLException {
		
		int svNum = vo.getSvNum();
		String svTitle = vo.getSvTitle();
		String svMessage = vo.getSvMessage();
		String svCategoly = vo.getSvCategoly();

		System.out.println("stNum : " + svNum);
		System.out.println("title : " + svTitle);
		System.out.println("message : " + svMessage);
		System.out.println("Categoly : " + svCategoly);
		
		String s_nowPage = request.getParameter("s_nowPage");
		
		HashMap map = new HashMap();
		map.put("svTitle", svTitle);
		map.put("svMessage", svMessage);
		map.put("svCategoly", svCategoly);
		map.put("svNum", svNum);
		
		dao.updateSchoolViolence(map);

		return "redirect:schoolViolencePro.do?s_pageNum=1";
	}

	@RequestMapping("/deleteSchoolViolence.do")
	public String deleteSchoolViolence(Model model, SchoolViolenceVO vo) throws ClassNotFoundException, SQLException{
		int svNum = vo.getSvNum();
		System.out.println("svNum : " + svNum);
		
		dao.deleteSchoolViolence(svNum);
		
		return "redirect:schoolViolencePro.do?s_pageNum=1";
	}
}
