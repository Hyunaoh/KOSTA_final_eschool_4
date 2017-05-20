package com.kosta.th147_4group.curriculum.controller;

import java.util.ArrayList;
import java.util.List;

<<<<<<< HEAD
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
=======
import org.springframework.stereotype.Controller;
>>>>>>> 0b4db116b6643780de43675333371159706cd6cd
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.th147_4group.curriculum.dao.CurriculumDao;
import com.kosta.th147_4group.curriculum.dao.CurriculumDaoImpl;
import com.kosta.th147_4group.vo.KoreanVO;

@Controller
@RequestMapping("/curriculum")
public class CurriculumController {
	
<<<<<<< HEAD
	CurriculumDao dao;
	
/*	@Autowired
	public void setDao(CurriculumDao dao) {
		this.dao = dao;
	}*/

	@RequestMapping("/curriculum.do")
	public String curriculum(Model model, KoreanVO vo) {
		
		KoreanVO kvo = dao.getKorean(vo.getKoGrade());
		System.out.println("11111111111");
		
		model.addAttribute("kvo", kvo);
		model.addAttribute("test", "testest");

		return "curriculum/curriculum";
		
	}

	@RequestMapping("/curriForm.do")
	public String curriForm(Model model, KoreanVO vo) {

		return "curriculum/curriForm";
=======
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
>>>>>>> 0b4db116b6643780de43675333371159706cd6cd
		
	}

	@RequestMapping("/sign.do")
	public void sign() {

	}
}
