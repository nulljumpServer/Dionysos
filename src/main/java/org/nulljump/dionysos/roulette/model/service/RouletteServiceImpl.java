package org.nulljump.dionysos.roulette.model.service;

import java.util.ArrayList;

import org.nulljump.dionysos.roulette.model.dao.RouletteDao;
import org.nulljump.dionysos.roulette.model.vo.Roulette;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("rouletteService")
public class RouletteServiceImpl implements RouletteService{

	@Autowired
	private RouletteDao rouletteDao;

	@Override
	public Roulette selectRoulette(int pairing_id) {
		return rouletteDao.selectRoulette(pairing_id);
	}

	@Override
	public ArrayList<Roulette> selectRouletteList() {
		// TODO Auto-generated method stub
		return rouletteDao.selectRouletteList();
	}

}
