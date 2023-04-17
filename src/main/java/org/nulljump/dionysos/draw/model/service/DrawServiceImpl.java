package org.nulljump.dionysos.draw.model.service;

import org.nulljump.dionysos.draw.model.dao.DrawDao;
import org.nulljump.dionysos.draw.model.vo.Draw;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("drawService")
public class DrawServiceImpl  implements DrawService{

	@Autowired
	DrawDao drawDao;

	@Override
	public Draw selectDraw(int product_id) {
		// TODO Auto-generated method stub
		return drawDao.selectDraw(product_id);
	}

}
