package com.kosta.th147_4group.curriculum.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.th147_4group.curriculum.dao.CurriculumDao;
import com.kosta.th147_4group.curriculum.dao.CurriculumDaoImpl;
import com.kosta.th147_4group.vo.KoreanVO;

@Controller
@RequestMapping("/curriculum")
public class CurriculumController {
	
	CurriculumDaoImpl dao;

	@RequestMapping("/curriculum.do")
	public void curriculum(KoreanVO vo) {
		
	}
	
	@RequestMapping("/curriForm.do")
	public ModelAndView curriculumForm(KoreanVO vo) {
		
		ModelAndView mav = new ModelAndView();
		KoreanVO kvo = dao.getKorean(vo.getKoGrade());
		mav.addObject("kvo", kvo);
		return mav;
		
	}

	@RequestMapping("/sign.do")
	public void sign() {

	}
}
