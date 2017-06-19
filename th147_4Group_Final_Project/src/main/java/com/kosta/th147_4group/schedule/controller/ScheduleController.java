package com.kosta.th147_4group.schedule.controller;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.th147_4group.vo.MemberVO;
import com.kosta.th147_4group.vo.PlanVO;
import com.kosta.th147_4group.attendance.dao.AttendanceDao;
import com.kosta.th147_4group.schedule.dao.ScheduleDao;



@Controller
@RequestMapping("/schedule")
public class ScheduleController {

@Autowired
private ScheduleDao dao;
@Autowired
public void setDao(ScheduleDao dao) {
		this.dao = dao;
	}


@RequestMapping(value ="/schedule.do")
public String home() {

return "schedule/schedule";

			}

@RequestMapping(value ="/controllerSchedule.do")
public ModelAndView controllerSchedule(PlanVO vo,HttpServletRequest request) throws ClassNotFoundException, SQLException {
	String name =(String)request.getSession().getAttribute("name"); 
	System.out.println("Name : " + name);
	List<PlanVO> Info = dao.controllerSchedule(vo);
	
	ModelAndView m = new ModelAndView();
	
	m.addObject("Info",Info);
	m.addObject("name",name);
	
	System.out.println("Info : " + Info);
	return m;

			}
@RequestMapping(value="/controllerScheduleDetail.do")
public ModelAndView controllerScheduleDetail(HttpServletRequest request, HashMap map,PlanVO vo,HttpSession session) throws ClassNotFoundException, SQLException {
	
	String title = request.getParameter("title");
	String start = request.getParameter("start");
	
	map.put("title", title);
	map.put("start", start);
	
	System.out.println("controllerScheduleDetail start : " + start);
	System.out.println("controllerScheduleDetail title : " + title);
	
	List<PlanVO> detail = dao.controllerScheduleDetail(map);
	List<PlanVO> Info = dao.controllerSchedule(vo);
	
	ModelAndView m = new ModelAndView();
	m.addObject("detail",detail);
	m.addObject("Info",Info);
	
	
return m;

			}


@RequestMapping(value ="/detailSchedule.do")
public ModelAndView scheduleDetail(HttpServletRequest request,HashMap map) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
	
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String start = request.getParameter("start");
	
	map.put("title",title);
	map.put("start",start);

	
	System.out.println("Title : " + title);
	System.out.println("Start ; " + start);
	
	
	/*List<PlanVO> Info = dao.detailSchedule(vo);*/
	List<PlanVO> detail = dao.scheduleDetail(map);
	ModelAndView m = new ModelAndView();
	System.out.println("List Detail : " + detail);
	
	m.addObject("detail",detail);
	System.out.println("Info Detail : " + detail);
	
	return m;

			}


@RequestMapping(value ="/insertSchedule.do")
public String insertSchedule(PlanVO vo, HttpServletRequest request) throws ClassNotFoundException, SQLException {
		
		System.out.println("VO : " + vo);
		
		dao.insertSchedule(vo);
		
		return "redirect:/schedule/controllerSchedule.do";
			}

@RequestMapping(value="/updateSchedule.do")
public String updateSchedule(PlanVO vo,HttpServletRequest request) throws ClassNotFoundException, SQLException{
		
		String start = request.getParameter("start");
		String title = request.getParameter("title");
		
		System.out.println("Update Title : " + title);
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		System.out.println("UPdate VO : " + vo);
		
		dao.updateSchedule(vo);
		
	/*return "redirect:/schedule/controllerScheduleDetail.do?title="+title+"&start="+start;*/
		return "forward:/schedule/controllerScheduleDetail.do?title="+title+"&start="+start;
		

}

@RequestMapping(value ="/deleteSchedule.do")
public String deleteSchedule(PlanVO vo) throws ClassNotFoundException, SQLException {
		System.out.println("�뿬湲곕뱾�뼱�샂");
		System.out.println("VO : " + vo);
		dao.deleteSchedule(vo);
		
		return "redirect:/schedule/controllerSchedule.do";
			}

@RequestMapping(value="/selectAll.do")
public ModelAndView selectAll(PlanVO vo) throws ClassNotFoundException, SQLException{
	
	List<PlanVO> Info = dao.scheduleList(vo);
	
	ModelAndView m = new ModelAndView();
	
	m.addObject("Info",Info);
	System.out.println("Info : " + Info);
	return m;
}


}
		
	




