package org.nulljump.dionysos.users.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.users.model.vo.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("usersDao")
public class UsersDao {

	@Autowired
	private SqlSessionTemplate session;

	public Users selectLogin(Users users) {
		Users loginUser = session.selectOne("usersMapper.selectLogin", users);
		if (loginUser != null && loginUser.getEmail() == null) {
			loginUser = null;
		}
		return loginUser;
	}

	public int selectDupCheckId(String user_id) {
		return session.selectOne("usersMapper.selectDupCheckId", user_id);

	}

	public int deleteUsers(String user_id) {
		return session.delete("usersMapper.deleteUsers", user_id);
	}

	public ArrayList<Users> selectList() {
		List<Users> list = session.selectList("usersMapper.selectList");
		return (ArrayList<Users>) list;
	}

	public int insertUsers(Users users) {
		return session.insert("usersMapper.insertUsers", users);

	}

	public int updateUsers(Users users) {
		return session.update("usersMapper.updateUsers", users);
	}

	public Users selectUsers(String user_id) {
		return session.selectOne("usersMapper.selectUsers", user_id);

	}

	

	public int find_pwd(Users user) {
		return session.selectOne("usersMapper.pwdsearch", user);
	}

	@Transactional
	public int update_pw(Users users) {
		return session.update("usersMapper.update_pw", users);

	}

	public String find_id(String email){
		return session.selectOne("usersMapper.find_id", email);
	}

	public int selectSearchUsersCount(String action, String keyword) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("action", action);
		paramMap.put("keyword", keyword);
		List<Users> list = session.selectList("usersMapper.selectSearchUsersCount", paramMap);
		return list.size();
	}

	public ArrayList<Users> selectSearchUsers(String action, String keyword, Paging paging) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("action", action);
		paramMap.put("keyword", keyword);
		paramMap.put("page", paging);
		List<Users> list = session.selectList("usersMapper.selectSearchUsers", paramMap);
		return (ArrayList<Users>) list;
	}

	public int selectListCount() {
		return session.selectOne("usersMapper.selectListCount");
	}
	
	public ArrayList<Users> selectUsersPage(Paging paging) {
		List<Users> list = session.selectList("usersMapper.selectUsersPage", paging);
		return (ArrayList<Users>)list;
	}
	
}
