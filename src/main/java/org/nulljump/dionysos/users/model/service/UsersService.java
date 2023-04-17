package org.nulljump.dionysos.users.model.service;

import java.util.ArrayList;

import org.nulljump.dionysos.common.Paging;
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
	int deleteUsers(String user_id);
	String find_id(String email);// 아이디 찾기
	int update_pw(Users users);// 비밀번호 수정
	int pwdsearch(Users user); // 비밀번호 찾기
	// 검색
	
	
	int selectListCount();
	
	ArrayList<Users> selectUsersPage(Paging paging); // 관리자페이지, 사용자 리스트 페이징 조회
	
	int selectSearchUsersCount(String action, String keyword); // 사용자 검색결과 갯수 조회(검색 페이징)

	ArrayList<Users> selectSearchUsers(String action, String keyword, Paging paging); // 사용자 검색(페이징)
	
}
