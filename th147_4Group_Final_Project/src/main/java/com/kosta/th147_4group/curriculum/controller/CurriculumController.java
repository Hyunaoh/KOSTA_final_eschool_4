package com.kosta.th147_4group.curriculum.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@RequestMapping(value = "/curriculum.do")
	public String curriculum(ModelAndView mav, KoreanVO vo) {

		try {
			KoreanVO kvo;
			List<KoreanVO> kvoList = new ArrayList<KoreanVO>();

			kvo = dao.getKorean(vo.getKoGrade());
			kvoList = dao.getAllKorean();
			int count = kvoList.size();
			
			List<Integer> countList = new ArrayList<Integer>();
			mav.addObject("count", 20);
			
			// 예를들어, 총 100개의 게시물이라면, 100개를 20으로 나눈 값 (1~5 값)을 List 안에 넣습니다.
			for(int i = 1; i <= count; i++){
				countList.add((i/20)+1);
			}
			
			// 게시물 쪽수 (1~5값)을 view로 보낸뒤,
			mav.addObject("pageList" ,countList);

			
			if ((count / 20) == 0) {
				mav.addObject("left", "0");
				mav.addObject("right", "0");
			} else if ((count / 20) == 1) {
				mav.addObject("left", "0");
				mav.addObject("right", "0");
			} else if ((count / 20) % 5 == 0) {
				mav.addObject("left", "0");
				mav.addObject("right", "1");
			} else if ((count / 20) % 5 == 1) {
				mav.addObject("left", "1");
				mav.addObject("right", "0");
			}

			mav.addObject("kvo", kvo);
			mav.addObject("kvoList", kvoList);
			mav.addObject("test", "testest");

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return "curriculum/curriculum";

	}

	@RequestMapping(value = "/curriForm.do")
	public String curriForm(Model model, KoreanVO vo) {

		try {
			KoreanVO kvo;
			List<KoreanVO> kvoList = new ArrayList<KoreanVO>();

			// 특정 컬럼명을 받아온다.
			kvo = dao.getKorean(vo.getKoGrade());
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
			for(int i = 1; i <= (count/BLOCK)+1; i++){
				countList.add(i);
				
				// countList와 BLOCK을 곱한 값을 nowPage(현재 페이지에 게시물 몇개를 보여줄건지) 에 넣는다.
				parameterMap.put("num1", i*BLOCK+1 - BLOCK);
				System.out.println("parameter : " + parameterMap.get("num1"));
				
				// 전체 컬럼의 크기 (ex) 27개 게시물 이 (ex)30개 보다 작다면, 
				if(count < i*BLOCK) {
					parameterMap.put("num2", count);
					System.out.println("parameter3 : " + count);
					nowPage.put(i, dao.getNowPage(parameterMap));
					System.out.println(i);
					//nowPageList.put(i, nowPage);
					
				} else {
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
			
//			if ((count / 20) == 0) {
//				model.addAttribute("left", "0");
//				model.addAttribute("right", "0");
//			} else if ((count / 20) == 1) {
//				model.addAttribute("left", "0");
//				model.addAttribute("right", "0");
//			} else if ((count / 20) % 5 == 0) {
//				model.addAttribute("left", "0");
//				model.addAttribute("right", "1");
//			} else if ((count / 20) % 5 == 1) {
//				model.addAttribute("left", "1");
//				model.addAttribute("right", "0");
//			}

			model.addAttribute("kvo", kvo);
			model.addAttribute("kvoList", kvoList);
			model.addAttribute("test", "testest");

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return "curriculum/curriForm";

	}

	@RequestMapping("/sign.do")
	public void sign() {

	}
}
