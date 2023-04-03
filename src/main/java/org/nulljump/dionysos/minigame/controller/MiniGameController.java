package org.nulljump.dionysos.minigame.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MiniGameController {
	private static final Logger logger = LoggerFactory.getLogger(MiniGameController.class);
	 
	
	//�������� �̵� ó���� ---------------------------------------------
	
	//miniGameView �̵�ó����
	@RequestMapping(value="minigame.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String moveMiniGameView() {  
		return "minigame/miniGameView";
	} 
}
