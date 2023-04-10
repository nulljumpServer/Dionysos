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
		// Ȯ��
		// logger.info("test2.do : " + name + ", " + age);
		logger.info("drawResult.do : " + product_id);

		// response ��ü : ���񽺸� ��û�� Ŭ���̾�Ʈ ������ �������
		// request ��ü : Ŭ���̾�Ʈ�� ���� ���� ������ ���� ��ü��

		// @RequestParam("���ۿ��̸�")�ڷ��� ������
		// ������̼��� ���� ���� �ڵ��
		// String ������ = request.getParameter("���ۿ��̸�");

		// ����Ͻ� ���� ó���� Service �޼ҵ� ȣ���ϰ� ��� �ޱ�
		String result = drawService.selectDraw(product_id);

		// ��û�� Ŭ���̾�Ʈ���Է� ����� ������ : ��½�Ʈ���� �̿���
		// 1. �����ϴ� ������ ���� mimiType ������ (������)
		// ���ڰ� �ϳ� ����ÿ��� �����ص� ��
		response.setContentType("text/html; charset:utf-8");

		// 2. ��¿� ����� ��Ʈ�� ����
		PrintWriter out = response.getWriter();

		// 3. ó�� ����� ���� �����͸� ������
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
