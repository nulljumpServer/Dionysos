package org.nulljump.dionysos.roulette.model.service;

import java.util.ArrayList;

import org.nulljump.dionysos.roulette.model.vo.Roulette;

public interface RouletteService {

	public Roulette selectRoulette(int pairing_id);
	public ArrayList<Roulette> selectRouletteList();
}
