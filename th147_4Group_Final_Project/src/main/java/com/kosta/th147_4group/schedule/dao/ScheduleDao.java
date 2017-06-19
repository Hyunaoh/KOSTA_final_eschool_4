package com.kosta.th147_4group.schedule.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.kosta.th147_4group.vo.PlanVO;


@Repository
public interface ScheduleDao {
	

/*일정조회*/	
public List<PlanVO> scheduleList(PlanVO vo) throws ClassNotFoundException, SQLException;
/*public List<PlanVO> detailSchedule(PlanVO vo) throws ClassNotFoundException, SQLException;*/
public List<PlanVO> scheduleDetail(HashMap map) throws ClassNotFoundException, SQLException;
public List<PlanVO> controllerSchedule(PlanVO vo) throws ClassNotFoundException, SQLException;
public List<PlanVO> controllerScheduleDetail(HashMap map) throws ClassNotFoundException, SQLException;
/*일정입력*/
public void insertSchedule(PlanVO vo) throws ClassNotFoundException, SQLException;
/*일정삭제*/
public void deleteSchedule(PlanVO vo) throws ClassNotFoundException, SQLException;
/*일정수정*/
public void updateSchedule(PlanVO vo) throws ClassNotFoundException, SQLException;

}
