package org.nulljump.dionysos.users.model.service;

import java.util.ArrayList;

import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.common.SearchDate;
import org.nulljump.dionysos.common.Searchs;
import org.nulljump.dionysos.users.model.dao.UsersDao;
import org.nulljump.dionysos.users.model.vo.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service("usersService")
public class UsersServiceImpl implements UsersService {

	@Autowired
	UsersDao usersDao;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@Override
	public Users selectLogin(Users users) {
		return usersDao.selectLogin(users);
	}

	@Override
	public int selectDupCheckId(String user_id) {
		return usersDao.selectDupCheckId(user_id);

	}

	@Override
	public Users selectUsers(String user_id) {
		return usersDao.selectUsers(user_id);

	}

	@Override
	public ArrayList<Users> selectList() {
		return usersDao.selectList();

	}

	@Override
	public int insertUsers(Users users) {
		return usersDao.insertUsers(users);

	}

	@Override
	public int updateUsers(Users users) {
		return usersDao.updateUsers(users);

	}

	@Override
	public int deleteUsers(String user_id) {
		return usersDao.deleteUsers(user_id);

	}

	
	// ���̵� ã��
	@Override
	public String find_id(String email){
		return usersDao.find_id(email);
	}

		
	@Override
	public int update_pw(Users users) {
		return usersDao.update_pw(users);
	}

	@Override
	public int pwdsearch(Users user) {
		return usersDao.find_pwd(user);
	}

	
	@Override
	public int selectListCount() {
		return usersDao.selectListCount();
	}
	
	@Override
	public ArrayList<Users> selectUsersPage(Paging paging) {
		return usersDao.selectUsersPage(paging);
	}

	@Override
	public int selectSearchUsersCount(String action, String keyword) {
		return usersDao.selectSearchUsersCount(action, keyword);
	}

	@Override
	public ArrayList<Users> selectSearchUsers(String action, String keyword, Paging paging) {
		return usersDao.selectSearchUsers(action, keyword, paging);
	}

	



}
