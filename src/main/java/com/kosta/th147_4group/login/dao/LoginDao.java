package com.kosta.th147_4group.login.dao;

import com.kosta.th147_4group.vo.AdminVO;
import com.kosta.th147_4group.vo.ParentsVO;
import com.kosta.th147_4group.vo.StudentVO;
import com.kosta.th147_4group.vo.TeacherVO;

public interface LoginDao {

	void insertStudentMember(StudentVO studentVO);

	void insertTeacherMember(TeacherVO teacherVO);

	void insertParentsMember(ParentsVO parentsVO);

	void insertAdminMember(AdminVO adminVO);

}
