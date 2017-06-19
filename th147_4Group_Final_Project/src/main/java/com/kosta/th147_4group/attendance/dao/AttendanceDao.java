package com.kosta.th147_4group.attendance.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.kosta.th147_4group.vo.AttendanceVO;

@Repository
public interface AttendanceDao {
/*1학년*/
/*조회*/
public List selectClassAll(HashMap map)throws ClassNotFoundException, SQLException;
public List selectatTeacher(HashMap map)throws ClassNotFoundException, SQLException;
/*학생조회*/
public List dateSearch(HashMap map) throws ClassNotFoundException, SQLException;
/*학생조회 디테일*/
public List dateSearchDetail(HashMap map) throws ClassNotFoundException, SQLException;
/*당일 학생 목록*/
public List attendanceSearch(HashMap map) throws ClassNotFoundException, SQLException;
/*출석부입력*/
/*당일출석부*/
public void insertPeople(HashMap map) throws ClassNotFoundException, SQLException;
/*전학생입력*/
public void insertPerson(AttendanceVO vo) throws ClassNotFoundException, SQLException;
/*출석부 수정*/
public void updatePeople(HashMap map) throws ClassNotFoundException, SQLException;
/*public void updatePeople(HashMap map) throws ClassNotFoundException, SQLException;*/
/*출석부 삭제*/
public void deletePerson(HashMap map) throws ClassNotFoundException, SQLException;

/*상세조회*/
/*public void updatePeople(HashMap map) throws ClassNotFoundException, SQLException;*/



}
