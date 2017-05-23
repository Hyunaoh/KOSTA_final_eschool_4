package com.kosta.th147_4group.parentboard.controller;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.th147_4group.parentboard.dao.ParentBaordDao;
import com.kosta.th147_4group.vo.ParentsVO;

@Controller
@RequestMapping("/parentboard")
public class ParentBoardController {

	@Autowired
	private SqlSession sqlSession;
	
	@Resource
	private ParentBaordDao dao;

	//전체 리스트 가져오기
	@RequestMapping("/list.do")
	public String listAll(Model model){
		dao = sqlSession.getMapper(ParentBaordDao.class);
		model.addAttribute("list", dao.paListAll());
		return "parentboard/list";
	}
	
	//글쓰기 Form 이동
	@RequestMapping("/write_view.do")
	public String writeWiew() {
		return "parentboard/write_view";
	}
	
	//글쓰기 DB입력
	@RequestMapping("/write.do")
	public String write(ParentsVO parentsVO) {
		dao = sqlSession.getMapper(ParentBaordDao.class);
		dao.paWrite(parentsVO);
		return "redirect:list.do";
	}
	
	//글 내용 보기(읽기)
	@RequestMapping("/content_view.do")
	public String contentView(Model model) {
		ParentBaordDao dao = sqlSession.getMapper(ParentBaordDao.class);
		return "parentboard/content_view";
	}
	
	//수정하기
	@RequestMapping("/modify.do")
	public String modify(Model model) {
		ParentBaordDao dao = sqlSession.getMapper(ParentBaordDao.class);
		return "list.do";
	}
	
	//삭제하기
	@RequestMapping("/delete.do")
	public String delete(Model model) {
		
		return "redirect:/list.do";
	}
	
	//댓글 보기
	@RequestMapping("/reply_view.do")
	public String replyView(Model model) {
		ParentBaordDao dao = sqlSession.getMapper(ParentBaordDao.class);
		return "parentboard/reply_view";
	}
	
	//댓글쓰기
	@RequestMapping("/reply.do")
	public String reply(Model model) {
		ParentBaordDao dao = sqlSession.getMapper(ParentBaordDao.class);
		return "/list.do";
	}
	
	//게시글 상세보기
	@RequestMapping("/detail_view.do")
	public String detailView(Model model) {
		ParentBaordDao dao = sqlSession.getMapper(ParentBaordDao.class);
		return "parentboard/detail_view";
	}
	
	//검색하기
	@RequestMapping("/search.do")
	public String search(Model model) {
		ParentBaordDao dao = sqlSession.getMapper(ParentBaordDao.class);
		return "parentboard/serarch_view";
	}
	
	//메인 TOP 5 홈페이지 삽입기능
	@RequestMapping("/mainTop.do")
	public String mainTop(Model model) {
		ParentBaordDao dao = sqlSession.getMapper(ParentBaordDao.class);
		return "parentboard/mainTop";
	}
}
