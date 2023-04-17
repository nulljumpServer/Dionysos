package org.nulljump.dionysos.roulette.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.nulljump.dionysos.roulette.model.vo.Roulette;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("rouletteDao")
public class RouletteDao {
	@Autowired
	private SqlSessionTemplate session;

	public Roulette selectRoulette(int pairing_id) {
		return session.selectOne("rouletteMapper.selectRoulette", pairing_id);
	}
	
	public ArrayList<Roulette> selectRouletteList() {
		List<Roulette> list = session.selectList("rouletteMapper.selectRouletteList");
		return (ArrayList<Roulette>) list;
	}
}
