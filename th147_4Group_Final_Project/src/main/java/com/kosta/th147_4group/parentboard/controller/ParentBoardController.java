package com.kosta.th147_4group.parentboard.controller;

import java.io.File;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosta.th147_4group.parentboard.commons.PagingHelper;
import com.kosta.th147_4group.parentboard.commons.WebContants;
import com.kosta.th147_4group.parentboard.dao.ParentBoardDao;
import com.kosta.th147_4group.vo.ParentBoardArticleVO;
import com.kosta.th147_4group.vo.ParentBoardAttachFileVO;
import com.kosta.th147_4group.vo.ParentBoardCommentVO;

@Controller
@RequestMapping("/parentboard")
public class ParentBoardController {

	@Autowired
	private ParentBoardDao parentBoardDao;

	@RequestMapping(value = "/list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String list(String boardCd, Integer curPage, String searchWord, Model model) throws Exception {

		if (boardCd == null)
			boardCd = "free";
		if (curPage == null)
			curPage = 1;
		if (searchWord == null)
			searchWord = "";

		int numPerPage = 7;// 페이지당 레코드 수 지정
		int pagePerBlock = 3;// 페이지 링크의 그룹(block)의 크기 지정

		int totalRecord = parentBoardDao.getTotalRecord(boardCd, searchWord);

		PagingHelper pagingHelper = new PagingHelper(totalRecord, curPage, numPerPage, pagePerBlock);
		parentBoardDao.setPagingHelper(pagingHelper);

		int start = pagingHelper.getStartRecord();
		int end = pagingHelper.getEndRecord();

		List<ParentBoardArticleVO> list = parentBoardDao.getArticleList(boardCd, searchWord, start, end);
		String boardNm = parentBoardDao.getBoardNm(boardCd);
		Integer no = parentBoardDao.getListNo();
		Integer prevLink = parentBoardDao.getPrevLink();
		Integer nextLink = parentBoardDao.getNextLink();
		Integer firstPage = parentBoardDao.getFirstPage();
		Integer lastPage = parentBoardDao.getLastPage();
		int[] pageLinks = parentBoardDao.getPageLinks();

		// 목록을 위한 데이터
		model.addAttribute("list", list);
		model.addAttribute("boardNm", boardNm);
		model.addAttribute("boardCd", boardCd);// boardCd는 null 값이면 free로 만들어야 하므로
		model.addAttribute("no", no);
		model.addAttribute("prevLink", prevLink);
		model.addAttribute("nextLink", nextLink);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("pageLinks", pageLinks);
		model.addAttribute("curPage", curPage);// curPage는 null 값이면 1로 만들어야 하므로
        model.addAttribute("totalRecord", totalRecord);

		return "parentboard/list";
	}

	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public String write(String boardCd, Model model) throws Exception {

		// 게시판 이름
		String boardNm = parentBoardDao.getBoardNm(boardCd);
		model.addAttribute("boardNm", boardNm);

		return "parentboard/writeform";
	}

	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public String write(ParentBoardArticleVO article, MultipartHttpServletRequest mpRequest, HttpServletRequest request) throws Exception {

        //article.setEmail((String) request.getSession().getAttribute("email")); 
		parentBoardDao.insert(article);
		article.setArticleNo(parentBoardDao.getNewArticle().getArticleNo());

		// 파일업로드

			List<MultipartFile> fileList = mpRequest.getFiles("upload");
			int size = fileList.size();
			boolean emp = fileList.isEmpty();
			fileList.get(0);
			System.out.println("fileList.isEmpty() :"+emp );
			System.out.println("file 업로드 갯수 : " + size);
			System.out.println("fileList 파일리스트 : " +fileList );
			if (null != fileList && fileList.size() > 0) {
					for (MultipartFile mf : fileList) {
						String filename = mf.getOriginalFilename();
						System.out.println("filename 업로드 : " + filename);
						if (filename != "") {
							System.out.println("파일첨부 최소 1개이상 ");
							mf.transferTo(new File(WebContants.BASE_PATH + filename));
						}else{
						System.out.println("파일첨부 0 경우");
						}
					}
			
					// 파일데이터 삽입
					for (int i = 0; i < size; i++) {
								MultipartFile mpFile = fileList.get(i);
								System.out.println("mpFile : "+mpFile+"~~["+i+"]");
								ParentBoardAttachFileVO attachFile = new ParentBoardAttachFileVO();
								String filename = mpFile.getOriginalFilename();
								System.out.println("filename 삽입 : " + filename );
								if (filename != "") {
									attachFile.setFilename(filename);
									attachFile.setFiletype(mpFile.getContentType());
									attachFile.setFilesize(mpFile.getSize());
									attachFile.setArticleNo(article.getArticleNo());
									attachFile.setUploader((String)request.getSession().getAttribute("id"));
									parentBoardDao.insertAttachFile(attachFile);
									}else{
									System.out.println("파일첨부 하나도 안한 경우 (DB저장 안함)");
									}
						}
		} else {
			System.out.println("업로드 파일이 없습니다.");
		}
//			// 파일업로드
//			
//			List<MultipartFile> fileList = mpRequest.getFiles("upload");
//			int size = fileList.size();
//			boolean emp = fileList.isEmpty();
//			fileList.get(0);
//			System.out.println("fileList.isEmpty() :"+emp );
//			System.out.println("file 업로드 갯수 : " + size);
//			System.out.println("fileList 파일리스트 : " +fileList );
//			if (null != fileList && fileList.size() > 0) {
//				for (MultipartFile mf : fileList) {
//					String filename = mf.getOriginalFilename();
//					System.out.println("filename 업로드 : " + filename);
//					if (filename == "") {
//						System.out.println("파일첨부 하나도 안한 경우");
//					}else if(filename != null){
//						System.out.println("파일첨부 최소 1개이상 ");
//						mf.transferTo(new File(WebContants.BASE_PATH + filename));
//					}
//				}
//				
//				// 파일데이터 삽입
//				for (int i = 0; i < size; i++) {
//					MultipartFile mpFile = fileList.get(i);
//					System.out.println("mpFile : "+mpFile+"~~["+i+"]");
//					ParentBoardAttachFileVO attachFile = new ParentBoardAttachFileVO();
//					String filename = mpFile.getOriginalFilename();
//					System.out.println("filename 삽입 : " + filename );
//					attachFile.setFilename(filename);
//					attachFile.setFiletype(mpFile.getContentType());
//					attachFile.setFilesize(mpFile.getSize());
//					attachFile.setArticleNo(article.getArticleNo());
//					attachFile.setUploader((String)request.getSession().getAttribute("id"));
//					if (filename != "") {
//						parentBoardDao.insertAttachFile(attachFile);
//					}
//					System.out.println("파일첨부 하나도 안한 경우 (DB저장 안함)");
//				}
//			} else {
//				System.out.println("업로드 파일이 없습니다.");
//			}


		return "redirect:/parentboard/list.do?boardCd=" + article.getBoardCd();
	}

	@RequestMapping(value = "/view.do", method = RequestMethod.GET)
	public String view(int articleNo, String boardCd, Integer curPage, String searchWord, Model model, HttpServletRequest request) throws Exception {

		int numPerPage = 7;// 페이지당 레코드 수 지정
		int pagePerBlock = 3;// 페이지 링크의 그룹(block)의 크기 지정
		if (searchWord == null)
			searchWord = ""; // 검색어가 null 이면 ""으로 변경

		// 목록보기
		int totalRecord = parentBoardDao.getTotalRecord(boardCd, searchWord);
		System.out.println(curPage);
		PagingHelper pagingHelper = new PagingHelper(totalRecord, curPage, numPerPage, pagePerBlock);
		parentBoardDao.setPagingHelper(pagingHelper);

		int start = pagingHelper.getStartRecord();
		int end = pagingHelper.getEndRecord();

		List<ParentBoardArticleVO> list = parentBoardDao.getArticleList(boardCd, searchWord, start, end);
		String boardNm = parentBoardDao.getBoardNm(boardCd);
		Integer no = parentBoardDao.getListNo();
		Integer prevLink = parentBoardDao.getPrevLink();
		Integer nextLink = parentBoardDao.getNextLink();
		Integer firstPage = parentBoardDao.getFirstPage();
		Integer lastPage = parentBoardDao.getLastPage();
		int[] pageLinks = parentBoardDao.getPageLinks();


		
		// 목록을 위한 데이터
		model.addAttribute("list", list);
		model.addAttribute("boardNm", boardNm);

		model.addAttribute("no", no);
		model.addAttribute("prevLink", prevLink);
		model.addAttribute("nextLink", nextLink);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("pageLinks", pageLinks);
		model.addAttribute("totalRecord", totalRecord);

		parentBoardDao.increaseHit(articleNo); // 게시글 조회수 증가

		// 상세보기
		ParentBoardArticleVO thisArticle = parentBoardDao.getArticle(articleNo);
		ParentBoardArticleVO prevArticle = parentBoardDao.getPrevArticle(articleNo, boardCd, searchWord);
		ParentBoardArticleVO nextArticle = parentBoardDao.getNextArticle(articleNo, boardCd, searchWord);
		List<ParentBoardAttachFileVO> attachFileList = parentBoardDao.getAttachFileList(articleNo);
		List<ParentBoardCommentVO> commentList = parentBoardDao.getCommentList(articleNo);
		
		model.addAttribute("thisArticle", thisArticle);
		model.addAttribute("prevArticle", prevArticle);
		model.addAttribute("nextArticle", nextArticle);
		model.addAttribute("attachFileList", attachFileList);
		model.addAttribute("commentList", commentList);

		
		return "parentboard/view";
	}
	
	@RequestMapping(value = "/commentAdd.do", method = RequestMethod.POST)
	public String commentAdd(Integer articleNo, String boardCd, Integer curPage, String searchWord, String memo, HttpServletRequest request) throws Exception {

		ParentBoardCommentVO comment = new ParentBoardCommentVO();
		comment.setMemo(memo);
		comment.setArticleNo(articleNo);
		comment.setEmail((String)request.getSession().getAttribute("email"));
		comment.setUip((String)request.getSession().getAttribute("ip"));
		comment.setUser((String)request.getSession().getAttribute("id"));
		comment.setUname((String)request.getSession().getAttribute("name"));
		
		parentBoardDao.insertComment(comment);

		// searchWord = URLEncoder.encode(searchWord,"UTF-8");

		return "redirect:/parentboard/view.do?articleNo=" + articleNo + "&boardCd=" + boardCd + "&curPage=" + curPage + "&searchWord=" + searchWord;

	}

	@RequestMapping(value = "/commentUpdate.do", method = RequestMethod.POST)
	public String commentUpdate(Integer commentNo, Integer articleNo, String boardCd, Integer curPage, String searchWord, String memo) throws Exception {

		ParentBoardCommentVO comment = parentBoardDao.getComment(commentNo);
		comment.setMemo(memo);
		parentBoardDao.updateComment(comment);
		// searchWord = URLEncoder.encode(searchWord, "UTF-8");

		return "redirect:/parentboard/view.do?articleNo=" + articleNo + "&boardCd=" + boardCd + "&curPage=" + curPage + "&searchWord=" + searchWord;

	}

	@RequestMapping(value = "/commentDel.do", method = RequestMethod.POST)
	public String commentDel(Integer commentNo, Integer articleNo, String boardCd, Integer curPage, String searchWord) throws Exception {

		parentBoardDao.deleteComment(commentNo);

		// searchWord = URLEncoder.encode(searchWord,"UTF-8");

		return "redirect:/parentboard/view.do?articleNo=" + articleNo + "&boardCd=" + boardCd + "&curPage=" + curPage + "&searchWord=" + searchWord;

	}

	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public String delete(int articleNo, String boardCd, Integer curPage, String searchWord) throws Exception {

		parentBoardDao.delete(articleNo);

		return "redirect:/parentboard/list.do?boardCd=" + boardCd + "&curPage=" + curPage + "&searchWord=" + searchWord;
	}

	@RequestMapping(value = "/modify.do", method = RequestMethod.GET)
	public String update(int articleNo, String boardCd, Model model) throws Exception {

		ParentBoardArticleVO thisArticle = parentBoardDao.getArticle(articleNo);
		String boardNm = parentBoardDao.getBoardNm(boardCd);

		// 수정페이지에서 보일 게시글 정보
		model.addAttribute("thisArticle", thisArticle);
		model.addAttribute("boardNm", boardNm);

		return "parentboard/modifyForm";
	}

	@RequestMapping(value = "/modify.do", method = RequestMethod.POST)
	public String update(ParentBoardArticleVO article, Integer curPage, String boardCd, String searchWord, Model model, MultipartHttpServletRequest mpRequest, HttpServletRequest request) throws Exception {

		parentBoardDao.update(article);
		// 파일업로드

		List<MultipartFile> fileList = mpRequest.getFiles("upload");
		int size = fileList.size();
		boolean emp = fileList.isEmpty();
		fileList.get(0);
		System.out.println("fileList.isEmpty() :"+emp );
		System.out.println("file 업로드 갯수 : " + size);
		System.out.println("fileList 파일리스트 : " +fileList );
		if (null != fileList && fileList.size() > 0) {
				for (MultipartFile mf : fileList) {
					String filename = mf.getOriginalFilename();
					System.out.println("filename 업로드 : " + filename);
					if (filename != "") {
						System.out.println("파일첨부 최소 1개이상 ");
						mf.transferTo(new File(WebContants.BASE_PATH + filename));
					}else{
					System.out.println("파일첨부 0 경우");
					}
				}
		
				// 파일데이터 삽입
				for (int i = 0; i < size; i++) {
							MultipartFile mpFile = fileList.get(i);
							System.out.println("mpFile : "+mpFile+"~~["+i+"]");
							ParentBoardAttachFileVO attachFile = new ParentBoardAttachFileVO();
							String filename = mpFile.getOriginalFilename();
							System.out.println("filename 삽입 : " + filename );
							if (filename != "") {
								attachFile.setFilename(filename);
								attachFile.setFiletype(mpFile.getContentType());
								attachFile.setFilesize(mpFile.getSize()/1024); 
								attachFile.setArticleNo(article.getArticleNo());
								attachFile.setUploader((String)request.getSession().getAttribute("id"));
								parentBoardDao.insertAttachFile(attachFile);
								}else{
								System.out.println("파일첨부 하나도 안한 경우 (DB저장 안함)");
								}
					}
	} else {
		System.out.println("업로드 파일이 없습니다.");
	}

		return "redirect:/parentboard/view.do?articleNo=" + article.getArticleNo() + "&boardCd=" + article.getBoardCd() + "&curPage=" + curPage + "&searchWord=" + searchWord;
	}

	@RequestMapping(value = "/download.do", method = RequestMethod.POST)
	public String download(String filename, Model model) {
		model.addAttribute("filename", filename);
		return "parentboard/download";
	}

	@RequestMapping(value = "/attachFileDel.do", method = RequestMethod.POST)
	public String attachFileDel(Integer attachFileNo, Integer articleNo, String boardCd, Integer curPage, String searchWord) throws Exception {

		parentBoardDao.deleteFile(attachFileNo);

		// searchWord = URLEncoder.encode(searchWord,"UTF-8");

		return "redirect:/parentboard/view.do?articleNo=" + articleNo + "&boardCd=" + boardCd + "&curPage=" + curPage + "&searchWord=" + searchWord;

	}

}