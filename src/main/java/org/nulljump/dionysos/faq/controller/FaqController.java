package org.nulljump.dionysos.faq.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.nulljump.dionysos.faq.model.service.FaqService;
import org.nulljump.dionysos.faq.model.vo.Faq;
import org.nulljump.dionysos.users.model.vo.Users;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FaqController {
	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);

	@Autowired
	private FaqService faqservice;

	// �����ϴ����� ��ü ��� ���
	@RequestMapping("flist.do")
	public String faqListMethod(Model model) {
		ArrayList<Faq> list = faqservice.selectFaq();

		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "faq/faqListView";
		} else {
			model.addAttribute("message", "��ϵ� ������ �����ϴ�.");
			return "common/error";
		}
	}
	
	
	// �����ϴ����� �󼼺��� 
	@RequestMapping("fdetail.do")
	public String faqDetailMethod(@RequestParam("faqno") int faq_no, Model model, HttpSession session) {
		// �����ڿ� �󼼺��� �������� �Ϲ�ȸ�� �Ǵ� ��ȸ�� �󼼺��� ������ ����
		// HttpSession �� �Ű������� �߰�

		Faq faq = faqservice.selectList(faq_no);

		if (faq != null) {
			model.addAttribute("faq", faq);

			Users loginUsers = (Users) session.getAttribute("loginUsers");
			if (loginUsers != null && loginUsers.getAdmin().equals("Y")) {
				// �α����� �����ڰ� ��û�ߴٸ�
				return "faq/faqAdminDetailView";
			} else {
				// �����ڰ� �ƴ� �Ǵ� �α������� ���� ���¿����� ��û�̶��
				return "faq/faqDetailView";
			}
		} else {
			model.addAttribute("message", faq_no + "�� �󼼺��� ��ȸ ����");
			return "common/error";
		}
	}
	
	//�����ϴ� ���� ��� �������� �̵� 
	@RequestMapping("fwform.do")
	public String moveFaqWriteForm() {
		return "faq/faqWriteForm";
	}
	
	//�����ϴ� ���� ���
	@RequestMapping(value = "finsert.do", method = RequestMethod.POST)
	public String faqInsertMethod(Faq faq, Model model, HttpServletRequest request,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile) {
		
		if (faqservice.insertFaq(faq) > 0) {
			// ������ ��� ������ ��� ���� �������� �̵�
			return "redirect:flist.do";
		} else {
			model.addAttribute("message", "�� ���� ��� ����");
			return "common/error";
		}
	}
	
	
	//�����ϴ� ���� ����
	
	
	//�����ϴ� ���� ����
	
	
	
	

	// �����
//	public String faqListMethod(String page, ModelAndView mv, Model model, HttpSession session) {}
//	
//	public String faqDetailMethod(Model model, int faq_no, HttpSession session) {}
//	
//	public String moveQnAPage() {}
//	
//	public String moveNoticePage() {}
//
//		
//	//������
//	public String moveWritePage() {}
//	
//	public String moveUpdatePage() {}
//	
//	public String AllListMethod(String page, ModelAndView mv, Model model, HttpSession session) {}
//		
//	public String faqDeleteMethod(Faq faq, Model model, HttpServletRequest request) {}
//		
//	public String faqUpdateMethod(Faq faq, Model model, HttpServletRequest request) {}
//
//	public String faqInsertMethod(Faq faq, Model model, HttpServletRequest request) {}
//
//	public String faqSearchMethod(String question, String answer, Model model) {}

}
