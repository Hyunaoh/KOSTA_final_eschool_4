package com.kosta.th147_4group.schedule.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.th147_4group.vo.PlanVO;


@Repository
public class ScheduleDaoImpl implements ScheduleDao {

	@Autowired
	private SqlSession ScheduleSql;
	
	@Override
	public void insertSchedule(PlanVO vo) throws ClassNotFoundException, SQLException {
		ScheduleSql.insert("ScheduleSql.insertSchedule",vo);
	}

	@Override
	public List<PlanVO> scheduleList(PlanVO vo) throws ClassNotFoundException, SQLException {
		return ScheduleSql.selectList("ScheduleSql.scheduleList",vo);
	}

	@Override
	public void deleteSchedule(PlanVO vo) throws ClassNotFoundException, SQLException {
		ScheduleSql.delete("ScheduleSql.deleteSchedule",vo);
		
	}

	@Override
	public List<PlanVO> scheduleDetail(HashMap map) throws ClassNotFoundException, SQLException {
		return ScheduleSql.selectList("ScheduleSql.scheduleDetail",map);
	}

	@Override
	public List<PlanVO> controllerSchedule(PlanVO vo) throws ClassNotFoundException, SQLException {
		return ScheduleSql.selectList("ScheduleSql.controllerSchedule",vo);
	}

	@Override
	public List<PlanVO> controllerScheduleDetail(HashMap map) throws ClassNotFoundException, SQLException {
		return ScheduleSql.selectList("ScheduleSql.controllerScheduleDetail",map);
	}

	@Override
	public void updateSchedule(PlanVO vo) throws ClassNotFoundException, SQLException {
		ScheduleSql.update("ScheduleSql.updateSchedule",vo);
	}


}
