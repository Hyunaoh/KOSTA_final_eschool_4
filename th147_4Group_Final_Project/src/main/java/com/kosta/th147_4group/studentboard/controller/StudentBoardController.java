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

import com.kosta.th147_4group.message.dao.MessageDao;
import com.kosta.th147_4group.message.dao.MessageDaoImpl;
import com.kosta.th147_4group.studentboard.dao.StudentBoardDao;
import com.kosta.th147_4group.vo.Grade_2017VO;
import com.kosta.th147_4group.vo.MessageVO;
import com.kosta.th147_4group.vo.StudentProposalVO;

@Controller
@RequestMapping(value = "/studentboard")
public class StudentBoardController {

	@Autowired
	private StudentBoardDao dao;
	
	@Autowired
	private MessageDaoImpl mDao;

	@Autowired
	public void setDao(StudentBoardDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value = "/studentProposalForm.do")
	public String studentProposalForm(Model model, StudentProposalVO vo) throws SQLException, ClassNotFoundException {
		
		return "studentboard/studentProposalForm";
	}

	// studentProposalForm*************** �떎吏덉쟻�쑝濡� �떎�뻾�릺�뒗 嫄댁쓽�궗�빆 寃뚯떆�뙋
	@RequestMapping(value = "/studentProposalPro.do")
	public String studentProposalPro(Model model, StudentProposalVO vo, HttpServletRequest request) throws SQLException, ClassNotFoundException {

		StudentProposalVO svo = null;
		List<StudentProposalVO> svoList = new ArrayList<StudentProposalVO>();

		svoList = dao.getAllStudentProposal();
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
				nowPage.put(i, dao.getNowPageProposal(parameterMap));
				System.out.println(i);
				// nowPageList.put(i, nowPage);
			} else {
				parameterMap.put("num2", i * BLOCK);
				System.out.println("parameter2 : " + i * BLOCK);
				nowPage.put(i, dao.getNowPageProposal(parameterMap));
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

		return "forward:studentProposalForm.do?page_index_start=" + page_index_start + "&page_index_end=" + page_index_end+"&s_pageNum="+s_pageNum;

	}

	@RequestMapping("/sign.do")
	public void sign() {

	}

	// 湲� �벑濡� Form�쑝濡� �씠�룞
	@RequestMapping("/insertStudentProposalForm.do")
	public String insertStudentProposal() {

		return "studentboard/insertStudentProposalForm";

	}

	// 湲� �벑濡�**********************
	@RequestMapping("/insertStudentProposal.do")
	public String insertStudentProposal(Model model, StudentProposalVO vo) throws ClassNotFoundException, SQLException {
		
		Grade_2017VO gVo = new Grade_2017VO();
		MessageVO mVo = new MessageVO();
		
		// student 게시판에 값을 넣은 뒤,
		dao.insertStudentProposal(vo);
		
		// 학년, 반 을 이용하여 그 담임에게 메세지를 쪽지함으로 보낸다.
		String cClass = vo.getStSchoolClass();
		String cGrade = vo.getStGrade();
		System.out.print(cGrade + "학년 / " + cClass + "반" );
		
		gVo.setGrClass(cClass);
		gVo.setGrGrade(cGrade);
		
//		gVo.setGrId("test");
//		gVo.setGrName("test");
//		gVo.setGrNo("test");
		
		List<Grade_2017VO> list= mDao.searchMessageMember(gVo);

		// id값을 추출한 뒤 (해당 반의 담임 ID) 쪽지함으로 값을 보낸다.
		String id = list.get(0).getGrId();
		String student = "2017010101";
		
		mVo.setMeGet(id);
		mVo.setMeMessage("건의사항 게시판에 " + student + " 학번의 학생이 다음 글을 남겼습니다. \n " + vo.getStMessage());
		mVo.setMeSend(student);
		
		mDao.insertMessage(mVo);

		return "redirect:studentProposalPro.do?s_pageNum=1";
	}

	// �긽�꽭 湲� 異쒕젰**********************
	@RequestMapping("/detailStudentProposal.do")
	public String detailStudentProposal(Model model, StudentProposalVO vo) throws ClassNotFoundException, SQLException {
		StudentProposalVO vo2 = dao.detailStudentProposal(vo.getStNum());

		model.addAttribute("stVo", vo2);
		dao.updateStudentHit(vo.getStNum());
		return "studentboard/detailStudentProposalForm";
	}

	// 수정부분
	@RequestMapping("/updateStudentProposal.do")
	public String updateStudentProposal(Model model, StudentProposalVO vo, HttpServletRequest request) 
			throws ClassNotFoundException, SQLException {
		
		int stNum = vo.getStNum();
		String stTitle = vo.getStTitle();
		String stMessage = vo.getStMessage();
		String stCategoly = vo.getStCategoly();

		System.out.println("stNum : " + stNum);
		System.out.println("title : " + stTitle);
		System.out.println("message : " + stMessage);
		System.out.println("Categoly : " + stCategoly);
		
		String s_nowPage = request.getParameter("s_nowPage");
		
		HashMap map = new HashMap();
		map.put("stTitle", stTitle);
		map.put("stMessage", stMessage);
		map.put("stCategoly", stCategoly);
		map.put("stNum", stNum);
		
		dao.updateStudent(map);

		return "redirect:studentProposalPro.do?s_pageNum=1";
	}

	@RequestMapping("/deleteStudentProposal.do")
	public String deleteStudentProposal(Model model, StudentProposalVO vo) throws ClassNotFoundException, SQLException{
		int stNum = vo.getStNum();
		System.out.println("stNum : " + stNum);
		
		dao.deleteStudentProposal(stNum);
		
		return "redirect:studentProposalPro.do?s_pageNum=1";
	}
	
		
	
}
