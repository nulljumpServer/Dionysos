package org.nulljump.dionysos.draw.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.nulljump.dionysos.draw.model.service.DrawService;
import org.nulljump.dionysos.draw.model.vo.Draw;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DrawController {
	
	private static final Logger logger = LoggerFactory.getLogger(DrawController.class);
	
	@Autowired
	private DrawService drawService;

	@RequestMapping(value = "moveDrawGame.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String moveRouletteGameView() {
		return "minigame/drawGameView";
	}
	
	@RequestMapping(value = "drawResult.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String drawResultMethod(HttpServletResponse response, String product_id) throws IOException {

		logger.info("drawResult.do : " + product_id);

		Draw draw = drawService.selectDraw(Integer.parseInt(product_id));

		response.setContentType("application/json; charset=utf-8");
		
		JSONObject job = new JSONObject();

		job.put("product_name", URLEncoder.encode(draw.getProduct_name(), "utf-8"));
		job.put("product_image", URLEncoder.encode(draw.getProduct_image(), "utf-8"));
		job.put("product_price", draw.getProduct_price());
		job.put("sweetness", draw.getSweetness());
		job.put("acidity", draw.getAcidity());
		job.put("body", draw.getBody());
		job.put("tannin", draw.getTannin());

		logger.info("job : " + job);

		return job.toJSONString();
	}
}
