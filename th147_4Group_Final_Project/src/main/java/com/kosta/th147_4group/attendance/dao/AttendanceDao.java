package com.kosta.th147_4group.attendance.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.kosta.th147_4group.vo.AttendanceVO;

@Repository
public interface AttendanceDao {
/*1�г�*/
/*��ȸ*/
public List selectClassAll(HashMap map)throws ClassNotFoundException, SQLException;
public List selectatTeacher(HashMap map)throws ClassNotFoundException, SQLException;
/*�л���ȸ*/
public List dateSearch(HashMap map) throws ClassNotFoundException, SQLException;
/*�л���ȸ ������*/
public List dateSearchDetail(HashMap map) throws ClassNotFoundException, SQLException;
/*���� �л� ���*/
public List attendanceSearch(HashMap map) throws ClassNotFoundException, SQLException;
/*�⼮���Է�*/
/*�����⼮��*/
public void insertPeople(HashMap map) throws ClassNotFoundException, SQLException;
/*���л��Է�*/
public void insertPerson(AttendanceVO vo) throws ClassNotFoundException, SQLException;
/*�⼮�� ����*/
public void updatePeople(HashMap map) throws ClassNotFoundException, SQLException;
/*public void updatePeople(HashMap map) throws ClassNotFoundException, SQLException;*/
/*�⼮�� ����*/
public void deletePerson(HashMap map) throws ClassNotFoundException, SQLException;

/*����ȸ*/
/*public void updatePeople(HashMap map) throws ClassNotFoundException, SQLException;*/



}
