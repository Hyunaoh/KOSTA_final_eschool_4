package com.kosta.th147_4group.attendance.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.th147_4group.vo.AttendanceVO;

@Repository
public class AttendanceDaoImpl implements AttendanceDao {

	@Autowired
	private SqlSession AttendanceSql;

	@Override
	public List selectClassAll(HashMap map) throws ClassNotFoundException, SQLException {
		return AttendanceSql.selectList("AttendanceSql.selectAll",map);
	}
	@Override
	public List selectatTeacher(HashMap map) throws ClassNotFoundException, SQLException {
		return AttendanceSql.selectList("AttendanceSql.selectatTeacher",map);
	}
	@Override
	public List dateSearch(HashMap map) throws ClassNotFoundException, SQLException {
		return AttendanceSql.selectList("AttendanceSql.dateSearch",map);
	}
	@Override
	public List dateSearchDetail(HashMap map) throws ClassNotFoundException, SQLException {
		return AttendanceSql.selectList("AttendanceSql.dateSearchDetail",map);
	}
	@Override
	public void insertPeople(HashMap map) throws ClassNotFoundException, SQLException {
		AttendanceSql.insert("AttendanceSql.insertPeople",map);
	}
	@Override
	public void insertPerson(AttendanceVO vo) throws ClassNotFoundException, SQLException {
		AttendanceSql.insert("AttendanceSql.insertPeople",vo);
		
	}
	@Override
	public void updatePeople(HashMap map) throws ClassNotFoundException, SQLException {
		AttendanceSql.update("AttendanceSql.updatePeople",map);
	}
	@Override
	public void deletePerson(HashMap map) throws ClassNotFoundException, SQLException {
		AttendanceSql.delete("AttendanceSql.deletePerson",map);
	}
	@Override
	public List attendanceSearch(HashMap map) throws ClassNotFoundException, SQLException {
		return AttendanceSql.selectList("AttendanceSql.attendanceSearch",map);
	}

}
