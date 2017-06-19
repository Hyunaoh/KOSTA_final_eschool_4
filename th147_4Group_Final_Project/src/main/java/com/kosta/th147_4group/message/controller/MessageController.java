package com.kosta.th147_4group.message.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.th147_4group.message.dao.MessageDao;
import com.kosta.th147_4group.vo.Grade_2017VO;
import com.kosta.th147_4group.vo.MessageVO;

@Controller
@RequestMapping("/message")
public class MessageController {

	@Autowired
	private MessageDao dao;

	@RequestMapping("/messageForm.do")
	public String messageForm() {

		return "message/messageForm";
	}

	@RequestMapping("/messageGetForm.do")
	public String messageGetForm() {

		return "message/messageGetForm";
	}

	@RequestMapping("/searchGradeAndClass.do")
	public String searchGradeAndClass(Model model, Grade_2017VO vo) {

		String grGrade = vo.getGrGrade();
		String grClass = vo.getGrClass();

		System.out.println("학년/반/학번 : " + vo);

		List<Grade_2017VO> list = dao.searchMessageMember(vo);

		System.out.println(list);
		model.addAttribute("slist", list);

		return "message/messageForm";
	}

	@RequestMapping("/choiceGradeAndClass.do")
	public String choiceGradeAndClass(Model model, Grade_2017VO gVo, MessageVO mVo, HttpServletRequest request) {

		System.out.println("학년/반/학번 : " + gVo);

		if (request.getParameter("all_t") != null) {

			String all_t = request.getParameter("all_t");
			System.out.println("all_t : " + all_t);
			// 전체 강사 List를 가져온다.
			List<Grade_2017VO> allMemberList = dao.selectTeacherMember();
			int cnt = 0;

			for (int i = 0; i < allMemberList.size(); i++) {
				// 받는사람 메세지 아이디를 가져온다.
				String meGet = allMemberList.get(i).getGrId();
				// 보내는사람 메세지 아이디를 가져온다.
				String meSend = (String)request.getSession().getAttribute("id");

				mVo.setMeGet(meGet);
				mVo.setMeSend(meSend);

				dao.insertMessage(mVo);
				cnt++;
			}
			System.out.println("선생님 쪽지를 받은 총 명수 : " + cnt);
		}

		// 학부모 select
		if (request.getParameter("all_p") != null) {
			// 전체 사람 List를 가져온다.
			
			String all_p = request.getParameter("all_p");
			System.out.println("all_p : " + all_p);
			
			List<Grade_2017VO> allMemberList2 = dao.selectParentMember();
			int cnt2 = 0;

			for (int i = 0; i < allMemberList2.size(); i++) {
				// 받는사람 메세지 아이디를 가져온다.
				String meGet = allMemberList2.get(i).getGrId();
				// 보내는사람 메세지 아이디를 가져온다.
				String meSend = (String)request.getSession().getAttribute("id");
				
				mVo.setMeGet(meGet);
				mVo.setMeSend(meSend);

				dao.insertMessage(mVo);
				cnt2++;
			}
			System.out.println("학부모 쪽지를 받은 총 명수 : " + cnt2);
		} 
		
		if(request.getParameter("all_t") == null && request.getParameter("all_p") == null ){
			
			System.out.println("메세지 넘겨온 값 : " + mVo);
			dao.insertMessage(mVo);

		}
		
		model.addAttribute("msgRes", "1");
		
		return "message/messageForm";
	}

	@RequestMapping("/getMessage.do")
	public String getMessage(Model model, Grade_2017VO vo, HttpServletRequest request) {
		List<MessageVO> mList = dao.selectMessage((String)request.getSession().getAttribute("id"));

		System.out.println(mList);
		model.addAttribute("mList", mList);

		return "message/messageGetForm";
	}

}
