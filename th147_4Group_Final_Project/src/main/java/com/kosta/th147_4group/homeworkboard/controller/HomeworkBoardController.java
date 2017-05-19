package com.kosta.th147_4group.homeworkboard.controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.kosta.th147_4group.homeworkboard.dao.HomeworkboardDao;
import com.kosta.th147_4group.vo.HomeworkVO;

@Controller
@RequestMapping("/homework")
public class HomeworkBoardController {
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/homework.do")
	public String homeworkVO(String pg, String f, String q, Model model) throws ClassNotFoundException, SQLException {
		// System.out.println(pg+"-"+f+"-"+q);
		int page = 1;
		String field = "hw_title";
		String query = "%%";

		if (pg != null && !pg.equals("")) {
			page = Integer.parseInt(pg);
		}
		if (f != null && !f.equals("")) {
			field = f;
		}
		if (q != null && !q.equals("")) {
			query = q;
		}
		System.out.println(page + "/" + field + "/" + query);

		HomeworkboardDao dao = sqlSession.getMapper(HomeworkboardDao.class);
		List<HomeworkVO> list = dao.getHomeworkVO(page, field, query);
		model.addAttribute("list", list);

		return "homeworkVO.jsp";

	}

	@RequestMapping("homeworkDetail.do")
	public String homeworkDetail(String seq, Model model) throws ClassNotFoundException, SQLException {

		HomeworkboardDao dao = sqlSession.getMapper(HomeworkboardDao.class);
		HomeworkVO vo = dao.getHomeworkVO(seq);

		model.addAttribute("HomeworkVO", vo);

		return "homeworkDetail.jsp";

	}

	// 글등록 화면 처리
	@RequestMapping(value = "homeworkReg.do", method = RequestMethod.GET)
	public String homeworkReg() {

		return "homeworkReg.jsp";
	}

	// 글등록 처리(실제 글등록 처리
	@RequestMapping(value="homeworkReg.do", method=RequestMethod.POST)
	public String homeworkReg(HomeworkVO vo, HttpServletRequest request, Principal principal)
			throws IOException, ClassNotFoundException,SQLException{
		
		List<CommonsMultipartFile> files =vo.getFiles();
		List<String> filenNames =new ArrayList<String>();
		if(files != null && files.size() > 0){
			//이 경우라면 최소 한개는 파일 첨부
			for(CommonsMultipartFile multipartFile : files){
				String fname = multipartFile.getOriginalFilename();
				 String path =request.getContextPath() + "/homework/upload";
				 String fullpath =path + "\\"+ fname;
			
				 if(!fname.equals("")){
					 //서버에 물리적 경로 파일쓰기작업
					 FileOutputStream fs =new FileOutputStream(fullpath);
					 fs.write(multipartFile.getBytes());
					 fs.close();
				 }
			filenNames.add(fname); //파일 이름 별도관리
				  
			}
			
		}
	//db insert(파일명)
		vo.setHw_filesrc(filenNames.get(0));
		vo.sethw_filesrc2(filenNames.get(1));
		
		//Spring Security 사용한 글쓰기(사용자 처리)
		//1단계
		//UserDetails user = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//Login ID 정보를 가지고 온다
		//n.setWriter(user.getUsername());
		
		//2단계
		//Principal principal; //함수의 파라메터
		//내부적으로 security 인증 사용자정보를 가지는 객체를 주소를 전달
		vo.setHw_writer(principal.getName());
		
		HomeworkboardDao dao= sqlSession.getMapper(HomeworkboardDao.class);
				dao.insert(vo);
		
		return "redirect:homeworkVO.do";
	}

	// 글삭제

	@RequestMapping("homeworkDel.do")
	public String homeworkDel(String seq) throws ClassNotFoundException, SQLException {

		HomeworkboardDao dao = sqlSession.getMapper(HomeworkboardDao.class);
		dao.delete(seq);

		return "redirect:homeworkVO.do";

	}

	@RequestMapping(value="howorkEdit.do", method =RequestMethod.GET)
	public String homeworkEdit(String seq, Model model)throws ClassNotFoundException, SQLException{
		
		HomeworkboardDao dao= sqlSession.getMapper(HomeworkboardDao.class);
				HomeworkVO vo= dao.getHomeworkVO(seq);
		
		model.addAttribute("HomeworkVO",vo );
		
		return "homeworkEdit.jsp";
	}
		@RequestMapping(value=("homeworkEdit.do"), method=RequestMethod.POST)
		public String homeworkEdit(HomeworkVO vo, HttpServletRequest request)throws ClassNotFoundException, SQLException, IOException{
		
			if(!vo.getFile().isEmpty()){
				String fname =vo.getFile().getOriginalFilename();
				String path =request.getContextPath()+"/HomeworkBoardController/upload";
				String fpath =path +"\\"+fname;
				
				//파일 쓰기
				FileOutputStream fs = new FileOutputStream(fpath);
				fs.write((vo.getFile().getBytes()));
				fs.close();
				vo.setHw_filesrc(fname); //파일 이름
			}
			
			HomeworkboardDao dao =sqlSession.getMapper(HomeworkboardDao.class);
			dao.update(vo);
			
			return "redirect:homeworkDetail.do?seq="+vo.getSeq();
								
			}
			
		@RequestMapping("downlod.do")
		public void download(String p, String f, HttpServletRequest request, HttpServletResponse response)throws IOException{
			String fname =new String(f.getBytes("UTF-8"),"8859_1");
			
			response.setHeader("Content-Disposition", "attachment;filename=" + fname +";");
			String fullpath = request.getContextPath()+"/customer/" + p + "/" + f;
		
			FileInputStream fin = new FileInputStream(fullpath);
		
			ServletOutputStream sout = response.getOutputStream();
			byte[] buf = new byte[1024]; //전체를 다읽지 않고 1204byte씩 읽어서
			int size = 0;
			while((size=fin.read(buf,0,buf.length)) != -1) //buffer 에 1024byte 담고
			{                                              //마지막 남아있는 byte 담고  그다음 없으면 탈출
				sout.write(buf, 0, size); //1kbyte씩 출력 
			}
			fin.close();
			sout.close();
		}
	}
