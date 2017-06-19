package com.kosta.th147_4group.parentboard.dao;

import java.util.List;

import com.kosta.th147_4group.parentboard.commons.PagingHelper;
import com.kosta.th147_4group.vo.ParentBoardArticleVO;
import com.kosta.th147_4group.vo.ParentBoardAttachFileVO;
import com.kosta.th147_4group.vo.ParentBoardCommentVO;


public interface ParentBoardDao {
	 /*
	  * 게시판 목록
	  */
	 public List<ParentBoardArticleVO> getArticleList(String boardCd, String searchWord, int start, int end);
	 
	 /*
	  * 특정 게시판의 총 게시물 갯수 구하기
	  */
	 public int getTotalRecord(String boardCd, String searchWord);
	 
	 /*
	  * 새로운 게시글 추가
	  */
	 public int insert(ParentBoardArticleVO article);
	 
	 /*
	  * 게시글 수정
	  */
	 public void update(ParentBoardArticleVO article);
	 
	 /*
	  * 게시글 삭제
	  */
	 public void delete(int articleNo);

	 /*
	  * 게시판 이름(종류)
	  */
	 public String getBoardNm(String boardCd);

	 /*
	  * 게시판 조회수 증가
	  */
	 public void increaseHit(int articleNo);
	 
	 /*
	  * 게시판 객체 가져오기
	  */
	 public ParentBoardArticleVO getArticle(int articleNo);

	 /*
	  * 이전글 보기
	  */
	 public ParentBoardArticleVO getPrevArticle(int articleNo, String boardCd, String searchWord);

	 /*
	  * 다음글 보기
	  */
	 public ParentBoardArticleVO getNextArticle(int articleNo, String boardCd, String searchWord);
	 
	 /*
	  * 가장 최근 게시물 가져오기
	  */
	 public ParentBoardArticleVO getNewArticle();

	 /*
	  * 첨부파일 추가
	  */
	 public void insertAttachFile(ParentBoardAttachFileVO attachFile);
	 
	 /*
	  *  게시글의 첨부파일 리스트
	  */
	 public List<ParentBoardAttachFileVO> getAttachFileList(int articleNo);
	 /*
	  * 첨부 파일 삭제 
	  */
	 public void deleteFile(Integer attachFileNo);
	 
	 
	 /*
	  * 덧글쓰기
	  */
	 public void insertComment(ParentBoardCommentVO comment); 
	 
	 /*
	  * 덧글수정
	  */
	 public void updateComment(ParentBoardCommentVO comment);
	 
	 /*
	  * 덧글삭제
	  */
	 public void deleteComment(int commentNo);
	 
	 /*
	  * 덧글 가져오기
	  */
	 public ParentBoardCommentVO getComment(int commentNo);
	 
	 /*
	  * 게시글의 덧글리스트 구하기
	  */
	 public List<ParentBoardCommentVO> getCommentList(int articleNo);
	 
	 /*
	  * paging
	  */
	 public int getListNo();
	 
	 public int getPrevLink();
	 
	 public int getFirstPage();
	 
	 public int getLastPage();
	 
	 public int getNextLink();

	 public int[] getPageLinks();

	 public void setPagingHelper(PagingHelper pagingHelper);
	 
    
}
