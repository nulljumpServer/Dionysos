package org.nulljump.dionysos.qna.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.nulljump.dionysos.common.FileNameChange;
import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.common.SearchDate;
import org.nulljump.dionysos.qna.model.service.QnaService;
import org.nulljump.dionysos.qna.model.vo.Qna;
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
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QnaController {
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);

	@Autowired
	private QnaService qnaservice;

	// 1:1���� ��ü ��� ���
	@RequestMapping("qalist.do")
	public String qnaAllListMethod(Model model) {
		ArrayList<Qna> list = qnaservice.selectAllList();

		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "qna/qnaListView";
		} else {
			model.addAttribute("message", "��ϵ� �������� ������ �����ϴ�.");
			return "common/error";
		}
	}
	
	// 1:1���� ������ ������ ��Ϻ��� 
	@RequestMapping("qlist.do")
	public ModelAndView qnaListMethod(@RequestParam(name = "page", required = false) String page, ModelAndView mv) {

		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		int limit = 10; // �� �������� ����� ��� ����
		// �� ������ �� ����� ���� �Խñ� �� ���� ��ȸ�� ��
		int listCount = qnaservice.selectListCount();
		Paging paging = new Paging(listCount, currentPage, limit);
		paging.calculator();

		ArrayList<Qna> list = qnaservice.selectList(paging);

		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("paging", paging);

			mv.setViewName("qna/qnaListView");
		} else {
			mv.addObject("message", currentPage + " ������ ��� ��ȸ ����!");
			mv.setViewName("common/error");
		}

		return mv;
	}
	
	// 1:1���� �󼼺���
	@RequestMapping("qdetail.do")
	public String qnaDetailMethod(@RequestParam("qnano") int qna_no, Model model, HttpSession session) {
		// �����ڿ� �󼼺��� �������� �Ϲ�ȸ�� �Ǵ� ��ȸ�� �󼼺��� ������ ����
		// HttpSession �� �Ű������� �߰�

		Qna qna = qnaservice.selectQna(qna_no);

		if (qna != null) {
			model.addAttribute("qna", qna);

			Users loginUsers = (Users) session.getAttribute("loginUsers");
			if (loginUsers != null && loginUsers.getAdmin().equals("Y")) {
				// �α����� �����ڰ� ��û�ߴٸ�
				return "qna/qnaAdminDetailView";
			} else {
				// �����ڰ� �ƴ� �Ǵ� �α������� ���� ���¿����� ��û�̶��
				return "qna/qnaDetailView";
			}
		} else {
			model.addAttribute("message", qna_no + "�� �󼼺��� ��ȸ ����");
			return "common/error";
		}
	}
	
	// �������� �˻�
	@RequestMapping(value = "qsearchTitle.do", method = RequestMethod.POST)
	public String qnaSearchTitleMethod(@RequestParam("title") String title, Model model) {

		ArrayList<Qna> list = qnaservice.selectTitleSearch(title);

		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "qna/qnaListView";
		} else {
			model.addAttribute("message", title + "�� �˻��� ������ �����ϴ�.");
			return "common/error";
		}

	}
	
	// ����� ���̵�� �˻�
	@RequestMapping(value = "qsearchId.do", method = RequestMethod.POST)
	public String qnaSearchIdMethod(String user_id, Model model) {

		ArrayList<Qna> list = qnaservice.selectIdSearch(user_id);

		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "qna/qnaListView";
		} else {
			model.addAttribute("message", "�ش� ��¥�� ��ϵ� ������ �����ϴ�.");
			return "common/error";
		}
	}
	
	// ��¥�� �˻�
	@RequestMapping(value = "qsearchDate.do", method = RequestMethod.POST)
	public String qnaSearchDateMethod(SearchDate date, Model model) {

		ArrayList<Qna> list = qnaservice.selectDateSearch(date);

		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "qna/qnaListView";
		} else {
			model.addAttribute("message", "�ش� ��¥�� ��ϵ� ������ �����ϴ�.");
			return "common/error";
		}
	}
	
	// 1:1���� ��� �������� �̵� 
	@RequestMapping("qwform.do")
	public String moveQnaWriteForm() {
		return "qna/qnaWriteForm";
	}
	
	
	// 1:1���� ���
	@RequestMapping(value = "qinsert.do", method = RequestMethod.POST)
	public String qnaInsertMethod(Qna qna, Model model, HttpServletRequest request,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile) {
		// ÷������ ���� ���� ��� ����
		String savePath = request.getSession().getServletContext().getRealPath("resources/qna_upfiles");

		// ÷�������� ���� ��
		if (!mfile.isEmpty()) {
			// ���� �� �����̸� ����
			String fileName = mfile.getOriginalFilename();

			// �ٸ� �������� ÷�����ϰ� ���ϸ��� �ߺ��Ǿ� ����� �Ǵ� ���� ���� ����
			// ���ϸ��� �����ؼ� ������ �����ϴ� ����� ����� �� ����
			// ���� ���ϸ� : ����Ͻú���.Ȯ����
			if (fileName != null && fileName.length() > 0) {
				// �ٲ� ���ϸ� ���� ���ڿ� �����

				String renameFileName = FileNameChange.change(fileName, "yyyyMMddHHmmss");

				logger.info("÷�� ���ϸ� Ȯ�� : " + fileName + ", " + renameFileName);

				// ���� ��ü �����
				File renameFile = new File(savePath + "\\" + renameFileName);

				// ������ ���� ó��
				try {
					mfile.transferTo(renameFile);
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "÷������ ���� ����");
					return "common/error";
				}

				// ��ü�� ÷������ ���� ��� ����
				qna.setQna_original_filename(fileName);
				qna.setQna_rename_filename(renameFileName);
			} // �̸� �ٲٱ�
		} // ���ο� ÷�������� ���� ��

		if (qnaservice.insertInquiry(qna) > 0) {
			// �Խñ� ��� ������ ��� ���� �������� �̵�
			return "redirect:qalist.do";
		} else {
			model.addAttribute("message", "�� �Խñ� ��� ����");
			return "common/error";
		}
	}
	
	
	
	// 1:1���� ����
	@RequestMapping("qupview.do")
	public String moveQnaUpdateView(@RequestParam("qnano") int qna_no, @RequestParam("page") int currentPage,
			Model model) {
		// ������������ ���� ��ü ���� ��ȸ
		Qna qna = qnaservice.selectQna(qna_no);

		if (qna != null) {
			model.addAttribute("qna", qna);
			model.addAttribute("currentPage", currentPage);

			return "qna/qnaUpdateForm";
		} else {
			model.addAttribute("message", qna_no + "�� �� ������������ �̵� ����");

			return "common/error";
		}
	}
	
	
	// 1:1���� ����
	@RequestMapping("qdel.do")
	public String qnaDeleteMethod(Qna qna, HttpServletRequest request, Model model) {

		if (qnaservice.deleteInquiry(qna) > 0) {
			// �ۻ����� �����ϸ� ���������� �ִ� ÷�����ϵ� ���� ó��
			if (qna.getQna_rename_filename() != null) {
				new File(request.getSession().getServletContext().getRealPath("resources/qna_upfiles") + "/"
						+ qna.getQna_rename_filename()).delete();
			}
			return "redirect:qalist.do?page=1";

		} else {
			model.addAttribute("message", qna.getQna_no() + "�� �� ���� ����");
			return "common/error";
		}
	}
	
	
	
	// �亯 ��� ������ �̵� 
	@RequestMapping("qreplyform.do")
	public String moveReplyForm(Model model, @RequestParam("qnano") int origin_num,
			@RequestParam("page") int currentPage) {

		model.addAttribute("qnano", origin_num);
		model.addAttribute("currentPage", currentPage);

		return "qna/qnaReplyForm";
	}
	
	// �亯 ���
	@RequestMapping(value = "qreply.do", method = RequestMethod.POST)
	public String replyInsertMethod(Qna reply, @RequestParam("page") int page, Model model) {
		// �ش� ��ۿ� ���� ������ ��ȸ
		Qna origin = qnaservice.selectQna(reply.getQna_ref());

		// ���� ����� ����� ������ ����
		reply.setQna_lev(origin.getQna_lev() + 1);

		// ��۰� ���� �ֽű��� board_reply_seq �� 1�� ����
		reply.setQna_reply_seq(1);
		// ������ ��� �Ǵ� ������ ������ ��� 1 ���� ó��
		qnaservice.updateReplySeq(reply);

		if (qnaservice.insertReply(reply) > 0) {
			return "redirect:qalist.do?page=" + page;
		} else {
			model.addAttribute("message", reply.getQna_ref() + "�� �ۿ� ���� ��� ��� ����");
			return "common/error";
		}
	}
	
	
	// �亯 ����
	
	
	// �亯 ����
	
	

	// �����
//	public String insertInquiryMethod(Inquiry inquiry, Model model, HttpServletRequest request) {}
//	
//	public String deleteInquiryMethod(Inquiry inquiry, Model model, HttpServletRequest request) {}
//	
//	public String myInquiryListMethod(String page, ModelAndView mv, Model model, HttpSession session) {}
//	
//	public String moveInquiryViewMethod(Model model, int inquiry_no, int answer_no, HttpSession session) {}
//	
//	public String moveMyInquiryListPage(String page, ModelAndView mv, Model model, HttpSession session) {}
//	
//	public String moveWriteFormPage() {}
//	
//	public String moveNoticePage() {}
//	
//	public String moveFaqPage() {}
//	
//	
//	//������
//	public String getInquiryAllListMethod(String page, ModelAndView mv, Model model, HttpSession session) {}
//	
//	public String moveInquiryDetailMethod(Model model, int inquiry_no, String title, HttpSession session) {}
//	
//	public String searchInquiryMethod(String title, String content, String inquiry_type, String inquiry_state, Model model) {}
//				
//	public String moveInquiryListPage(String page, ModelAndView mv, Model model, HttpSession session) {}
//	
//	public String insertAnswerMethod(Answer answer, Model model, HttpServletRequest request) {}
//
//	public String deleteAnswerMethod(Answer answer, Model model, HttpServletRequest request) {}
//			
//	public String updateAnswerMethod(Answer answer, Model model, HttpServletRequest request) {}
//	
//	//��������?
//	public String moveAnswerDetailPage(Model model, int answer_no, int inquiry_no, HttpSession session) {}

}
