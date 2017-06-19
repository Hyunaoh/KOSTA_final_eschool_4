package com.kosta.th147_4group.homeworkboard.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionException;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.kosta.th147_4group.common.FileVO;
import com.kosta.th147_4group.common.SearchVO;
import com.kosta.th147_4group.vo.HomeworkVO;
import com.kosta.th147_4group.vo.HwBoardReplyVO;
import com.kosta.th147_4group.vo.PageVO;


@Service
public class HomeworkBoardService {
    @Autowired
    private SqlSessionTemplate sqlSession;    
    @Autowired
    private DataSourceTransactionManager txManager;
        
    public Integer selectBoardCount(SearchVO param) {
        return sqlSession.selectOne("homeworkboard.selectBoardCount", param);
    }
    
    public List<?> selectBoardList(SearchVO param) {
        return sqlSession.selectList("homeworkboard.selectBoardList", param);
    }
    
    /**
     * 글 저장.
     */
    public void insertBoard(HomeworkVO param, List<FileVO> filelist, String[] fileno) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);
        
        try {
            if (param.getBrdno() == null || "".equals(param.getBrdno())) {
                 sqlSession.insert("homeworkboard.insertBoard", param);
            } else {
                sqlSession.update("homeworkboard.updateBoard", param);
            }
            
            if (fileno != null) {
                HashMap<String, String[]> fparam = new HashMap<String, String[]>();
                fparam.put("fileno", fileno);
                sqlSession.insert("homeworkboard.deleteBoardFile", fparam);
            }
            
            for (FileVO f : filelist) {
                f.setParentPK(param.getBrdno());
                sqlSession.insert("homeworkboard.insertBoardFile", f);
            }
            txManager.commit(status);
        } catch (TransactionException ex) {
            txManager.rollback(status);
            System.out.println("데이터 저장 오류: " + ex.toString());
        }            
    }
 
    public HomeworkVO selectBoardOne(String param) {
        return sqlSession.selectOne("homeworkboard.selectBoardOne", param);
    }
    
    public void updateBoardRead(String param) {
        sqlSession.insert("homeworkboard.updateBoardRead", param);
    }
    
    public void deleteBoardOne(String param) {
        sqlSession.delete("homeworkboard.deleteBoardOne", param);
    }
    
    public List<?> selectBoardFileList(String param) {
        return sqlSession.selectList("homeworkboard.selectBoardFileList", param);
    }
    
    
    /**
     * 댓글. 
     */
    public List<?> selectBoardReplyList(String param) {
        return sqlSession.selectList("homeworkboard.selectBoardReplyList", param);
    }
    
    public void insertBoardReply(HwBoardReplyVO param) {
        if (param.getReno()==null || "".equals(param.getReno())) {
            sqlSession.insert("homeworkboard.insertBoardReply", param);
        } else {
            sqlSession.insert("homeworkboard.updateBoardReply", param);
        }
    }   
    
    public void deleteBoardReply(String param) {
        sqlSession.delete("homeworkboard.deleteBoardReply", param);
    }
}
