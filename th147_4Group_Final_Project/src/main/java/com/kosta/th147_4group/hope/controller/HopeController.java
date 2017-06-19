package com.kosta.th147_4group.hope.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.th147_4group.common.SearchVO;
import com.kosta.th147_4group.hope.dao.HopeService;
import com.kosta.th147_4group.vo.HopeVO;



@Controller
@RequestMapping("/hope")
public class HopeController {

	    @Autowired
	    private HopeService boardSvc;
	    
	    // 리스트
	    @RequestMapping(value = "/boardList.do")
	   	public String boardList(SearchVO searchVO, ModelMap modelMap) throws Exception {

	    	searchVO.pageCalculate( boardSvc.selectBoardCount(searchVO) ); 

	    	List<SearchVO> listview   = boardSvc.selectBoardList(searchVO);
	        
	    	modelMap.addAttribute("listview", listview);
			modelMap.addAttribute("searchVO", searchVO);
	        return "hope/boardList";
	    }
	    
	    // 글 쓰기 
	    @RequestMapping(value = "/boardForm.do")
	   	public String boardForm(HttpServletRequest request, ModelMap modelMap) throws Exception {
	    	String brdno = request.getParameter("brdno");
	    	if (brdno!=null) {
	    		HopeVO boardInfo = boardSvc.selectBoardOne(brdno);
	        
	    		modelMap.addAttribute("boardInfo", boardInfo);
	    	}
	    	
	        return "hope/boardForm";
	    }
	    
	    @RequestMapping(value = "/boardSave.do")
	   	public String boardSave(HopeVO boardInfo) throws Exception {
	    	
	  		boardSvc.insertBoard(boardInfo);

	        return "redirect:boardList.do";
	    }

	    // 글 읽기
	    @RequestMapping(value = "/boardRead.do")
	   	public String boardSave(HttpServletRequest request, ModelMap modelMap) throws Exception {
	    	
	    	String brdno = request.getParameter("brdno");
	    	
	    	
	    	boardSvc.updateBoardRead(brdno);
	    	HopeVO boardInfo = boardSvc.selectBoardOne(brdno);
	        
	    	modelMap.addAttribute("boardInfo", boardInfo);
	    	
	        return "hope/boardRead";
	    }
	    
	    // 글 삭제
	    @RequestMapping(value = "/boardDelete.do")
	   	public String boardDelete(HttpServletRequest request) throws Exception {
	    	
	    	String brdno = request.getParameter("brdno");
	    	
	    	boardSvc.deleteBoardOne(brdno);
	        
	        return "redirect:boardList.do";
	    }

	}
