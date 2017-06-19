package com.kosta.th147_4group.attendance.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.th147_4group.attendance.dao.AttendanceDao;
import com.kosta.th147_4group.schoolinfo.dao.SchoolInfoDao;
import com.kosta.th147_4group.vo.AttendanceVO;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {
	
	@Autowired
	private AttendanceDao dao;

	@Autowired
	public void setDao(AttendanceDao dao) {
		this.dao = dao;
	}
	
	/*�⼮�� �ε���*/
	@RequestMapping(value ="/attendanceBasic.do",method = RequestMethod.GET)
	public String attendanceBasic(){
		
		return "attendance/attendanceBasic";
	}
	/*�⼮�� �����ε���*/
	@RequestMapping(value ="/classGrade.do",method = RequestMethod.GET)
	public String classTeacher(HttpServletRequest request,Model model){
		
		String atGrade =(String)request.getSession().getAttribute("grade"); 
		String atClass = (String)request.getSession().getAttribute("mClass");
		
		System.out.println("atGrade : " + atGrade);
		System.out.println("atClass : " + atClass);

		model.addAttribute("atGrade",atGrade);
		model.addAttribute("atClass",atClass);
		
		return "attendance/classGrade/attendanceClass";
	}
	
	/*��¥�� �⼮�� ��ȸ*/
	@RequestMapping(value="/dateSearch.do")
	public String dateSearch(HttpServletRequest request,Model model,HashMap map) throws ClassNotFoundException, SQLException{
		
		String atGrade = request.getParameter("atGrade");
		String atName = request.getParameter("atName");
		String atDate = request.getParameter("atDate");
		
		map.put("atGrade", atGrade);
		map.put("atName", atName);
		map.put("atDate", atDate);
		
		List info = dao.dateSearch(map);
		model.addAttribute("Info",info);
	
		return "attendance/class/classSearch";
	}
	/*��¥�� �⼮�� ��ȸ*/
	@RequestMapping(value="/dateSearchDetail.do")
	public String dateSearchDetail(HttpServletRequest request,Model model,HashMap map) throws ClassNotFoundException, SQLException{
		
		String atGrade = request.getParameter("atGrade");
		String atName = request.getParameter("atName");
		String atDate1 = request.getParameter("atDate1");
		String atDate2 = request.getParameter("atDate2");
		
		map.put("atGrade", atGrade);
		map.put("atName", atName);
		map.put("atDate1", atDate1);
		map.put("atDate2", atDate2);
		
		List info = dao.dateSearchDetail(map);
		model.addAttribute("Info",info);
	
		return "attendance/class/classSearch";
	}	

	
	
	/*�г����� �˻�*/
	/*�г��� ������ 1,2,3���� ����*/
	@RequestMapping(value ="/attendance.do",method = RequestMethod.GET)
	public String attendance(Model model, HttpServletRequest request){
		String atGrade = request.getParameter("atGrade");
		System.out.println(atGrade);
		model.addAttribute("atGrade",atGrade);
		return "attendance/studentGrade/studentGrade"+atGrade;
	}
	
	
	/*�г����� �˻� �� ���� ������ �󼼰˻� - ������ */
	@RequestMapping(value ="/class.do",method = RequestMethod.GET)
	public String ClassTeacher(Model model, HttpServletRequest request){

		HashMap map = new HashMap();
		
		String atGrade =request.getParameter("atGrade");
		String atClass =request.getParameter("atClass");
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		
		map.put("atGrade", atGrade);
		map.put("atClass", atClass);
		map.put("atDate", today);
		
		System.out.println(map.toString());
		
		List<AttendanceVO> list = new ArrayList<AttendanceVO>();
		
		try {
			list = dao.attendanceSearch(map);
			model.addAttribute("list",list);
			model.addAttribute("today",today);
			
			System.out.println("list ������ "+list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "attendance/class/class";
	}
	/*�г����� �˻� �� ���� ������ �󼼰˻� - �л�/�θ��*/
	@RequestMapping(value ="/studentView.do",method = RequestMethod.GET)
	public String studentView(Model model, HttpServletRequest request){

		HashMap map = new HashMap();
		
		String atGrade =request.getParameter("atGrade");
		String atClass =request.getParameter("atClass");
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		
		map.put("atGrade", atGrade);
		map.put("atClass", atClass);
		map.put("atDate", today);
		
		System.out.println(map.toString());
		
		List<AttendanceVO> list = new ArrayList<AttendanceVO>();
		
		try {
			list = dao.attendanceSearch(map);
			model.addAttribute("list",list);
			System.out.println("list ������ "+list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "attendance/studentGrade/studentView";
	}
	
	/*�⼮�� ���� �⼮�� �Է���*/
	@RequestMapping(value ="/classInsertForm.do",method = RequestMethod.GET)
	public String classInsertForm(HttpServletRequest request,Model model){

		HashMap map = new HashMap();
		
		String atGrade =(String)request.getSession().getAttribute("grade"); 
		String atClass = (String)request.getSession().getAttribute("mClass");
		
		System.out.println("atGrade : " + atGrade);
		System.out.println("atClass : " + atClass);

		map.put("atGrade", atGrade);
		map.put("atClass", atClass);

		System.out.println(map.toString());
		
		List<AttendanceVO> list = new ArrayList<AttendanceVO>();

		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		
		System.out.println("Today : " + today);
		
		map.put("atDate", today);
		
		try {
			list = dao.attendanceSearch(map);
			
			model.addAttribute("list",list);
			model.addAttribute("today",today);
			System.out.println("list ������ "+list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "attendance/class/classInsertForm";
	}
	
	/*���л��߰� ��*/
	@RequestMapping(value ="/classInsertNewForm.do",method = RequestMethod.GET)
	public String classInsertNewForm(HttpServletRequest request,HashMap map) throws ClassNotFoundException, SQLException{
		
		return "attendance/class/classInsertNewForm";
		
	}	
	
	
	/*�⼮�ο� �߰�*/
	@RequestMapping(value ="/insertPeople.do")
	public String insertPeople(HttpServletRequest request,HashMap map,AttendanceVO vo) throws ClassNotFoundException, SQLException{
		
		
		String[] atNames = vo.getAtName().split(",");
		String[] atAttendances = vo.getAtAttendance().split(",");
		String[] atAttendances2 = vo.getAtAttendance2().split(",");
		String[] atDates = vo.getAtDate().split(",");
		String[] atGrades = vo.getAtGrade().split(",");
		String[] atClasss = vo.getAtClass().split(",");
		String[] atNums = vo.getAtNum().split(",");
		String[] atLevels = vo.getAtLevel().split(",");
		String atTeacher = vo.getAtTeacher().split(",")[0].trim();
		String[] atFlags = vo.getAtFlag().split(",");

		for (int i=0; i<atNames.length; i++){
			
			map.put("atName", atNames[i].trim());
			map.put("atAttendance", atAttendances[i].trim());
			map.put("atAttendance2", atAttendances2[i].trim());
			map.put("atDate", atDates[i].trim());
			map.put("atGrade", atGrades[i].trim());
			map.put("atClass", atClasss[i].trim());
			map.put("atNum", atNums[i].trim());
			map.put("atLevel", atLevels[i].trim());
			map.put("atTeacher", atTeacher);
			map.put("atFlags", atFlags[i].trim());

			System.out.println("InsertPeople Map : " + map);
			System.out.println("InsertPeople Map.toString : " + map.toString());
			dao.insertPeople(map);

		}
		
		return "redirect:/attendance/classGrade.do";
		
	}
	
	/*���л��߰�*/
	@RequestMapping(value ="/insertPerson.do",method = RequestMethod.GET)
	public String insertPerson(HttpServletRequest request,HashMap map,AttendanceVO vo) throws ClassNotFoundException, SQLException{
		System.out.println("InsertPerson : " + vo);
		
		dao.insertPerson(vo);
		return "redirect:/attendance/classGrade.do";
	}
	
	/*�г�/�ݿ� �´� �⼮�� ������*/
	@RequestMapping(value ="/attendanceInput.do",method = RequestMethod.GET)
	public String attendanceclass(){
		
		return "attendance/class/class";
	}
	

	/*�μ�Ʈ ��*/
	@RequestMapping(value ="attendanceInsertForm.do",method = RequestMethod.GET)
	public String insertForm(){
		return "/attendance/class/classInsertForm";
	}
	
	
	/*�⼮�� ���� ��*/
	@RequestMapping(value ="updatePeopleForm.do",method = RequestMethod.GET)
	public String updateForm(Model model,HashMap map,HttpServletRequest request){
		
		String atTeacher = (String)request.getSession().getAttribute("name");
		String atDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		
		List<AttendanceVO> list = new ArrayList<AttendanceVO>();
		map.put("atTeacher", atTeacher);
		map.put("atDate", atDate);
		try {
			list = dao.selectatTeacher(map);
			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/attendance/class/classUpdateForm";
	}
	
	
	/*�⼮�� ������Ʈ*/
	@RequestMapping(value ="/updatePeople.do",method = RequestMethod.GET)
	public String updatePeople(HttpServletRequest request,HashMap map,AttendanceVO vo) throws ClassNotFoundException, SQLException{
		
		System.out.println("----------------------------------");
		System.out.println(vo.getAtName());
		System.out.println(vo.getAtAttendance());
		System.out.println(vo.getAtAttendance2());
		System.out.println("vo.getAtClass : " + vo.getAtClass());
		System.out.println("----------------------------------");
	
		String[] attendances = vo.getAtAttendance().split(",");
		String[] attendances2 = vo.getAtAttendance2().split(",");
		String atTeacher = vo.getAtTeacher().split(",")[0].trim();
		String[] atNum = vo.getAtNum().split(",");
		String[] atFlag = vo.getAtFlag().split(",");
		
		String atGrade = vo.getAtGrade().split(",")[0].trim();
		String atClass = vo.getAtClass().split(",")[0].trim();
		
		System.out.println("atGrade : " + atGrade);
		System.out.println("atClass : " + atClass);
		
		for (int i=0; i<attendances.length; i++){
			
			System.out.println("Attendances : " + attendances[i]);
			System.out.println("Attendances2 : " + attendances2[i]);
			System.out.println("atTeacher : " + atTeacher);
			System.out.println("atNum : " + atNum[i]);
			System.out.println("atFalg : " + atFlag[i]);
			
			map.put("atAttendance", attendances[i].trim());
			map.put("atAttendance2", attendances2[i].trim());
			map.put("atTeacher",atTeacher);
			map.put("atNum",atNum[i].trim());
			map.put("atFlag", atFlag[i].trim());
			
			System.out.println("Map : " + map.toString());
			dao.updatePeople(map);

		}
		
		/*return "redirect:/attendance/class.do?atGrade="+atGrade+"&atClass="+atClass;*/
		return "redirect:/attendance/classGrade.do?atGrade="+atGrade+"&atClass="+atClass;
		
	}
	/*�⼮�� Flag���� ��*/
	@RequestMapping(value ="/classFlagForm.do",method = RequestMethod.GET)
	public String deletePersonForm(HttpServletRequest request,HashMap map,AttendanceVO vo) throws ClassNotFoundException, SQLException{
		
		return "attendance/class/classFlagForm";
		
	}
	/*�⼮�� Flag����*/
	@RequestMapping(value ="/updateDelete.do",method = RequestMethod.GET)
	public String deletePerson(HttpServletRequest request,HashMap map,AttendanceVO vo) throws ClassNotFoundException, SQLException{
		
		
		System.out.println("Map : " + map.toString());
		
		dao.updatePeople(map);
		System.out.println("VO : " + vo.toString());
		return "redirect:/attendance/attendanceBasic.do";
		
	}	
	

}	
