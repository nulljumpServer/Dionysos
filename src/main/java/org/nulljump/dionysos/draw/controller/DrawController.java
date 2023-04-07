package org.nulljump.dionysos.draw.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.nulljump.dionysos.draw.model.service.DrawService;
import org.nulljump.dionysos.draw.model.vo.Draw;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public void drawResultMethod(HttpServletResponse response, int product_id) throws IOException {
		// 확인
		// logger.info("test2.do : " + name + ", " + age);
		logger.info("drawResult.do : " + product_id);

		// response 객체 : 서비스를 요청한 클라이언트 정보가 들어있음
		// request 객체 : 클라이언트가 보낸 값을 가지고 오는 객체임

		// @RequestParam("전송온이름")자료형 변수명
		// 어노테이션의 실제 구동 코드는
		// String 변수명 = request.getParameter("전송온이름");

		// 비즈니스 로직 처리용 Service 메소드 호출하고 결과 받기
		String result = drawService.selectDraw(product_id);

		// 요청한 클라이언트에게로 결과를 전송함 : 출력스트림을 이용함
		// 1. 응답하는 정보에 대한 mimiType 설정함 (권장함)
		// 문자값 하나 응답시에는 생략해도 됨
		response.setContentType("text/html; charset:utf-8");

		// 2. 출력에 사용할 스트림 생성
		PrintWriter out = response.getWriter();

		// 3. 처리 결과에 대한 데이터를 전송함
		if (result != null) {
			out.append("ok");
			out.flush();
		} else {
			out.append("no drawData");
			out.flush();
		}

		out.close();
	}
}
