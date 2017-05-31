package com.kosta.th147_4group.curriculum.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.kosta.th147_4group.curriculum.dao.CurriculumDao;
import com.kosta.th147_4group.curriculum.dao.CurriculumDaoImpl;
import com.kosta.th147_4group.vo.KoreanVO;

@Controller
@RequestMapping("/curriculum")
public class CurriculumController {

	@Autowired
	private CurriculumDao dao;

	@Autowired
	public void setDao(CurriculumDao dao) {
		this.dao = dao;
	}

	@RequestMapping(value = "/curriForm.do")
	public String curriculum(ModelAndView mav, KoreanVO vo) {

		return "curriculum/curriForm";

	}

	@RequestMapping(value = "/curriPro.do")
	public String curriForm(Model model, KoreanVO vo, HttpServletRequest request)
			throws SQLException, ClassNotFoundException {

		List<KoreanVO> kvoList = new ArrayList<KoreanVO>();

		// 모든 컬럼을 받아온다.
		kvoList = dao.getAllKorean();
		// 모든 컬럼의 크기를 알아온다.
		int count = kvoList.size();

		// 페이지당 원하는 게시물 개수
		int BLOCK = 5;

		List<Integer> countList = new ArrayList<Integer>();

		Map<String, Integer> parameterMap = new HashMap<String, Integer>();
		Map<Integer, List> nowPage = new HashMap<Integer, List>();

		// 예를들어, 총 100개의 게시물이라면, 100개를 20으로 나눈 값 (1~5 값)을 List 안에 넣습니다.
		for (int i = 1; i <= Math.ceil((double) count / BLOCK); i++) {
			countList.add(i);

			// countList와 BLOCK을 곱한 값을 nowPage(현재 페이지에 게시물 몇개를 보여줄건지) 에 넣는다.
			parameterMap.put("num1", i * BLOCK - BLOCK + 1);
			System.out.println("parameter : " + parameterMap.get("num1"));

			// 전체 컬럼의 크기 (ex) 27개 게시물 이 (ex)30개 보다 작다면,
			if (count < i + BLOCK) {
				parameterMap.put("num2", count);
				System.out.println("parameter3 : " + count);
				nowPage.put(i, dao.getNowPageKorean(parameterMap));
				System.out.println(i);
				// nowPageList.put(i, nowPage);
			} else {
				parameterMap.put("num2", i * BLOCK);
				System.out.println("parameter2 : " + i * BLOCK);
				nowPage.put(i, dao.getNowPageKorean(parameterMap));
				System.out.println(i);
				// nowPageList.put(i, nowPage);
			}

			System.out.println("nowPage.get(" + i + ") : " + nowPage.get(i));

			parameterMap.clear();
		}

		String page_index_start = "0";
		String page_index_end = "4";
		String ko_pageNum = "1";

		if (request.getParameter("page_index_start") != null && request.getParameter("page_index_end") != null) {
			page_index_start = request.getParameter("page_index_start");
			page_index_end = request.getParameter("page_index_end");
		} else if (request.getParameter("ko_pageNum") != null) {
			ko_pageNum = request.getParameter("ko_pageNum");
		}

		// 총 페이지 블록 수(Map)
		model.addAttribute("ko_nowPage", nowPage);
		// 총 페이지 블록 수(List)
		model.addAttribute("ko_pageList", countList);

		// 총 게시물 개수 / BLOCK (다음, 이전을 위한 알고리즘)
		model.addAttribute("ko_all_Cnt", ((double) count / BLOCK));

		System.out.println("총 컬럼수 : " + count);

		return "forward:curriForm.do?page_index_start=" + page_index_start + "&page_index_end=" + page_index_end
				+ "&ko_pageNum=" + ko_pageNum;

	}

	@RequestMapping(value = "/searchPro.do")
	public String searchPro(Model model, HttpServletRequest request) throws SQLException, ClassNotFoundException {

		List<KoreanVO> kvoSelectList = new ArrayList<KoreanVO>();
		HashMap map = new HashMap();
		
		System.out.println("컬럼  : " + request.getParameter("search") + " / 값 : " + request.getParameter("searchText"));

		kvoSelectList = dao.getSearchKorean(request.getParameter("searchText"));
		int count = kvoSelectList.size();

		// 페이지당 원하는 게시물 개수
		int BLOCK = 5;

		List<Integer> countList = new ArrayList<Integer>();

		Map<String, Integer> parameterMap = new HashMap<String, Integer>();
		Map<Integer, List> nowPage = new HashMap<Integer, List>();

		// 예를들어, 총 100개의 게시물이라면, 100개를 20으로 나눈 값 (1~5 값)을 List 안에 넣습니다.
		for (int i = 1; i <= Math.ceil((double) count / BLOCK); i++) {
			countList.add(i);

			// countList와 BLOCK을 곱한 값을 nowPage(현재 페이지에 게시물 몇개를 보여줄건지) 에 넣는다.
			parameterMap.put("num1", i * BLOCK - BLOCK + 1);
			System.out.println("parameter : " + parameterMap.get("num1"));

			// 전체 컬럼의 크기 (ex) 27개 게시물 이 (ex)30개 보다 작다면,
			if (count < i + BLOCK) {
				parameterMap.put("num2", count);
				System.out.println("parameter3 : " + count);
				nowPage.put(i, dao.getNowPageKorean(parameterMap));
				System.out.println(i);
				// nowPageList.put(i, nowPage);
			} else {
				parameterMap.put("num2", i * BLOCK);
				System.out.println("parameter2 : " + i * BLOCK);
				nowPage.put(i, dao.getNowPageKorean(parameterMap));
				System.out.println(i);
				// nowPageList.put(i, nowPage);
			}

			System.out.println("nowPage.get(" + i + ") : " + nowPage.get(i));

			parameterMap.clear();
		}

		String page_index_start = "0";
		String page_index_end = "4";
		String ko_pageNum = "1";

		if (request.getParameter("page_index_start") != null && request.getParameter("page_index_end") != null) {
			page_index_start = request.getParameter("page_index_start");
			page_index_end = request.getParameter("page_index_end");
		} else if (request.getParameter("ko_pageNum") != null) {
			ko_pageNum = request.getParameter("ko_pageNum");
		}

		// 총 페이지 블록 수(Map)
		model.addAttribute("ko_nowPage", nowPage);
		// 총 페이지 블록 수(List)
		model.addAttribute("ko_pageList", countList);

		// 총 게시물 개수 / BLOCK (다음, 이전을 위한 알고리즘)
		model.addAttribute("ko_all_Cnt", ((double) count / BLOCK));

		System.out.println("총 컬럼수 : " + count);

		return "forward:curriForm.do?page_index_start=" + page_index_start + "&page_index_end=" + page_index_end
				+ "&ko_pageNum=" + ko_pageNum;

	}
}
