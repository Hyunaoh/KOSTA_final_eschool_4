package com.kosta.th147_4group.schoolinfo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.th147_4group.curriculum.dao.CurriculumDao;
import com.kosta.th147_4group.schoolinfo.dao.SchoolInfoDao;
import com.kosta.th147_4group.vo.MemberVO;


@Controller
@RequestMapping("/schoolinfo")
public class SchoolInfoController {
	
	@Autowired
	private SchoolInfoDao dao;

	@Autowired
	public void setDao(SchoolInfoDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value ="/schoolinfo.do" ,method = RequestMethod.GET)
	public String schoolInfo(){
	
		return "schoolinfo/schoolinfo";
	}
	@RequestMapping(value ="/schoolinfoDetail.do",method = RequestMethod.GET)
	public String schoolInfoDetail(){
		
		return "schoolinfo/schoolinfoDetail";
	}
	@RequestMapping(value ="/schoolinfoGreeting.do",method = RequestMethod.GET)
	public String schoolInfoGreeting(){
		
		return "schoolinfo/schoolinfoGreeting";
	}
	@RequestMapping(value ="/schoolinfoSearch.do",method = RequestMethod.GET)
	public String schoolInfoSearch(){
		
		return "schoolinfo/schoolinfoSearch";
	}
	@RequestMapping(value ="/schoolinfoTeacher.do",method = RequestMethod.GET)
	public String schoolInfoTeacher(Model model, MemberVO vo){
		System.out.println("여기는 옴");
		MemberVO mvo;
		List<MemberVO> list = new ArrayList<MemberVO>();
		try {
			list = dao.selectTeacher();
			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "schoolinfo/schoolinfoTeacher";
	}
}
