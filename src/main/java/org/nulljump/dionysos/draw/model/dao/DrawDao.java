package org.nulljump.dionysos.draw.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.nulljump.dionysos.draw.model.vo.Draw;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("drawDao")
public class DrawDao {

	@Autowired
	private SqlSessionTemplate session;
	
	public ArrayList<Draw> selectDrawList() {
		// TODO Auto-generated method stub
		return null;
	}

	public String selectDraw(int product_id) {
		return session.selectOne("drawMapper.selectDraw", product_id);
	}
	public String createDrawCard() {
		// TODO Auto-generated method stub
		return null;
	}

	public String insertDraw() {
		// TODO Auto-generated method stub
		return null;
	}

	public String updateDraw() {
		// TODO Auto-generated method stub
		return null;
	}

	public String resetDraw() {
		// TODO Auto-generated method stub
		return null;
	}
}
