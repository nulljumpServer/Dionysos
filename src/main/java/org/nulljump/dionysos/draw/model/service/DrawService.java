package org.nulljump.dionysos.draw.model.service;

import java.util.ArrayList;

import org.nulljump.dionysos.draw.model.vo.Draw;

public interface DrawService {
	public ArrayList<Draw> selectDrawList();
	public String selectDraw(int product_id);
	public String createDrawCard();
	public String insertDraw();
	public String updateDraw();
	public String resetDraw();
}
