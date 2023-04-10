package org.nulljump.dionysos.draw.model.service;

import java.util.ArrayList;

import org.nulljump.dionysos.draw.model.dao.DrawDao;
import org.nulljump.dionysos.draw.model.vo.Draw;
import org.springframework.stereotype.Service;

@Service("drawService")
public class DrawServiceImpl  implements DrawService{

	DrawDao drawDao;
	
	@Override
	public ArrayList<Draw> selectDrawList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String selectDraw(int product_id) {
		// TODO Auto-generated method stub
		return drawDao.selectDraw(product_id);
	}

	@Override
	public String createDrawCard() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String insertDraw() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String updateDraw() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String resetDraw() {
		// TODO Auto-generated method stub
		return null;
	}

}
