package org.nulljump.dionysos.users.model.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.nulljump.dionysos.common.SearchDate;
import org.nulljump.dionysos.common.Searchs;
import org.nulljump.dionysos.users.model.vo.Users;

public interface UsersService {
	Users selectLogin(Users users);
	int selectDupCheckId(String user_id);
	Users selectUsers(String user_id);
	ArrayList<Users> selectList();
	int insertUsers(Users users);
	int updateUsers(Users users);
	int evictionUsers(String user_id);
	int deleteUsers(String user_id);
	String find_id(String email);// ���̵� ã��
	int update_pw(Users users);// ��й�ȣ ã�� 2
	int pwdsearch(Users user); // ��й�ȣ ã��
	// �˻�
	ArrayList<Users> selectSearchUserid(Searchs searchs); // ���̵��
	ArrayList<Users> selectSearchEmail(Searchs searchs); // �̸��Ϸ�
	ArrayList<Users> selectSearchBirthday(SearchDate searchDate); // ������Ϸ�
	
}
