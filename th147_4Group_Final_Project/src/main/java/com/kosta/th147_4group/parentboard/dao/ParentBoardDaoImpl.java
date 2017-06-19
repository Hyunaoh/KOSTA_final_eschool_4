package com.kosta.th147_4group.parentboard.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.th147_4group.parentboard.commons.PagingHelper;
import com.kosta.th147_4group.vo.ParentBoardArticleVO;
import com.kosta.th147_4group.vo.ParentBoardAttachFileVO;
import com.kosta.th147_4group.vo.ParentBoardCommentVO;

@Repository
public class ParentBoardDaoImpl implements ParentBoardDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	private PagingHelper pagingHelper; //페이징 처리 유틸리티 클래스
	 
	 
	 /*
	  * 게시판 목록
	  */
	 public List<ParentBoardArticleVO> getArticleList(String boardCd, String searchWord, int start, int end) {
	  Integer startRownum = start;
	  Integer endRownum = end;
	  
	  HashMap<String, String> hashmap = new HashMap<String, String>();
	  hashmap.put("boardCd", boardCd);
	  hashmap.put("searchWord", searchWord);
	  hashmap.put("start", startRownum.toString());
	  hashmap.put("end", endRownum.toString());
	  
	  return sqlSession.selectList("Parent.BoardMapper.getArticleList", hashmap);
	  
	 }
	 
	 /*
	  * 특정 게시판의 총 게시물 갯수 구하기
	  */
	 public int getTotalRecord(String boardCd, String searchWord) {
	  HashMap<String,String> hashmap = new HashMap<String,String>();
	  hashmap.put("boardCd", boardCd);
	  hashmap.put("searchWord", searchWord);

	  return (Integer)sqlSession.selectOne("Parent.BoardMapper.getTotalRecord", hashmap);
//	  return boardMapper.getTotalRecord(hashmap);
	 }
	 
	 /*
	  * 새로운 게시글  추가
	  */
	 public int insert(ParentBoardArticleVO article) {
		 return sqlSession.insert("Parent.BoardMapper.insert", article);
//	  return boardMapper.insert(article);
	 }
	 
	 /*
	  * 게시글 수정
	  */
	 public void update(ParentBoardArticleVO article) {
		  sqlSession.update("Parent.BoardMapper.update", article);
//		 boardMapper.update(article);
	 }
	 
	 /*
	  * 게시글 삭제
	  */
	 public void delete(int articleNo) {
		 sqlSession.delete("Parent.BoardMapper.delete", articleNo);
//		 boardMapper.delete(articleNo);
	 }
	 
	 /*
	  * 게시판 이름(종류)
	  */
	 public String getBoardNm(String boardCd){
		 return sqlSession.selectOne("Parent.BoardMapper.getBoardNm", boardCd);
//	  return boardMapper.getBoardNm(boardCd);
	 }
	 
	 /*
	  * 게시판 조회수 증가
	  */
	 public void increaseHit(int articleNo){
		  sqlSession.update("Parent.BoardMapper.increaseHit", articleNo);
//		 boardMapper.increaseHit(articleNo);
	 }

	 /*
	  * 게시판 객체 가져오기
	  */
	 public ParentBoardArticleVO getArticle(int articleNo){
		 return sqlSession.selectOne("Parent.BoardMapper.getArticle", articleNo);
//	  return boardMapper.getArticle(articleNo);
	 }
	 
	 /*
	  * 이전글 보기
	  */
	 public ParentBoardArticleVO getPrevArticle(int articleNo, String boardCd, String searchWord) {
	  HashMap<String, String> hashmap = new HashMap<String, String>();
	  Integer no = articleNo;
	  hashmap.put("articleNo", no.toString());
	  hashmap.put("boardCd", boardCd);
	  hashmap.put("searchWord", searchWord);
	  return sqlSession.selectOne("Parent.BoardMapper.getPrevArticle", hashmap);
//	  return boardMapper.getPrevArticle(hashmap);
	 }

	 /*
	  * 다음글 보기
	  */
	 public ParentBoardArticleVO getNextArticle(int articleNo, String boardCd, String searchWord) {
	  HashMap<String, String> hashmap = new HashMap<String, String>();
	  Integer no = articleNo;
	  hashmap.put("articleNo", no.toString());
	  hashmap.put("boardCd", boardCd);
	  hashmap.put("searchWord", searchWord);
	  return sqlSession.selectOne("Parent.BoardMapper.getNextArticle", hashmap);
//	  return boardMapper.getNextArticle(hashmap);
	 }
	 
	 /*
	  * paging
	  */
	 public int getListNo() {
	  return pagingHelper.getListNo(); 
	 }
	 
	 public int getPrevLink() {
	  return pagingHelper.getPrevLink();
	 }
	 
	 public int getFirstPage() {
	  return pagingHelper.getFirstPage();
	 }
	 
	 public int getLastPage() {
	  return pagingHelper.getLastPage();
	 }
	 
	 public int getNextLink() {
	  return pagingHelper.getNextLink();
	 }

	 public int[] getPageLinks() {
	  return pagingHelper.getPageLinks();
	 }

	 public PagingHelper getPagingHelper() {
	  return pagingHelper;
	 }

	 public void setPagingHelper(PagingHelper pagingHelper) {
	  this.pagingHelper = pagingHelper;
	 }

	 /*
	  * 가장 최근 게시물 가져오기
	  */
	 public ParentBoardArticleVO getNewArticle() {
		 return sqlSession.selectOne("Parent.BoardMapper.getNewArticle");
	 }
	 
	 /*
	  * 첨부파일 추가
	  */
	 public void insertAttachFile(ParentBoardAttachFileVO attachFile) {
		  sqlSession.insert("Parent.BoardMapper.insertAttachFile", attachFile);
//		 boardMapper.insertAttachFile(attachFile);
	 }
	 
	 /*
	  *  게시글의 첨부파일 리스트
	  */
	 public List<ParentBoardAttachFileVO> getAttachFileList(int articleNo) {
		 return  sqlSession.selectList("Parent.BoardMapper.getAttachFileList", articleNo);
//	  return boardMapper.getAttachFileList(articleNo);  
	 }
	 
	 /*
	  * 첨부 파일 삭제 
	  */
	@Override
	public void deleteFile(Integer attachFileNo) {
		 sqlSession.delete("Parent.BoardMapper.deleteFile", attachFileNo);
//		boardMapper.deleteFile(attachFileNo);		
	}

	/*
	 * 덧글쓰기
	 */
	public void insertComment(ParentBoardCommentVO comment) {
		 sqlSession.insert("Parent.BoardMapper.insertComment", comment);
//		boardMapper.insertComment(comment);
	}

	/*
	 * 덧글수정
	 */
	public void updateComment(ParentBoardCommentVO comment) {
		 sqlSession.update("Parent.BoardMapper.updateComment", comment);
//		boardMapper.updateComment(comment);
	}

	/*
	 * 덧글삭제
	 */
	public void deleteComment(int commentNo) {
		 sqlSession.delete("Parent.BoardMapper.deleteComment", commentNo);
//		boardMapper.deleteComment(commentNo);
	}

	/*
	 * 덧글가져오기
	 */
	public ParentBoardCommentVO getComment(int commentNo) {
		 return sqlSession.selectOne("Parent.BoardMapper.getComment", commentNo);
//		return boardMapper.getComment(commentNo);
	}

	/*
	 * 게시글의 덧글리스트 구하기
	 */
	public List<ParentBoardCommentVO> getCommentList(int articleNo) {
		 return sqlSession.selectList("Parent.BoardMapper.getCommentList", articleNo);
//		return boardMapper.getCommentList(articleNo);
	}

}
