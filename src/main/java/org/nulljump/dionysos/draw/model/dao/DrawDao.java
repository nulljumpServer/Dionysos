package org.nulljump.dionysos.draw.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.nulljump.dionysos.draw.model.vo.Draw;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("drawDao")
public class DrawDao {

	@Autowired
	private SqlSessionTemplate session;

	public Draw selectDraw(int product_id) {
		return session.selectOne("drawMapper.selectDraw", product_id);
	}
}
