package org.nulljump.dionysos.roulette.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.nulljump.dionysos.roulette.model.service.RouletteService;
import org.nulljump.dionysos.roulette.model.vo.Roulette;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RouletteController {

	Logger logger = LoggerFactory.getLogger(RouletteController.class);
	
	@Autowired
	private RouletteService rouletteService;
	
	//rouletteGameView 이동처리용
	@RequestMapping(value="moveRouletteGame.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String moveRouletteGameView() {  
		return "minigame/rouletteGameView";
	} 
	
	@RequestMapping(value="selectRoulette.do", method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String selectRouletteResult(HttpServletResponse response,
			String pairing_id) throws UnsupportedEncodingException {  

		logger.info("selectRoulette.do : " + pairing_id);

		Roulette roulette = rouletteService.selectRoulette(Integer.parseInt(pairing_id));

		response.setContentType("application/json; charset=utf-8");
		
		JSONObject job = new JSONObject();

		job.put("food_name", URLEncoder.encode(roulette.getFood_name(), "utf-8"));
		job.put("food_image", URLEncoder.encode(roulette.getFood_image(), "utf-8"));
		job.put("product_name", URLEncoder.encode(roulette.getProduct_name(), "utf-8"));
		job.put("product_image", URLEncoder.encode(roulette.getProduct_image(), "utf-8"));
		job.put("sweetness", roulette.getSweetness() );
		job.put("acidity", roulette.getAcidity());
		job.put("body", roulette.getBody());
		job.put("tannin", roulette.getTannin());  
		job.put("food_detail", URLEncoder.encode(roulette.getFood_detail(), "utf-8"));

		logger.info("job : " + job);

		return job.toJSONString();
	} 

}
