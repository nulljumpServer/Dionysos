package org.nulljump.dionysos.notice.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.nulljump.dionysos.common.FileNameChange;
import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.common.SearchDate;
import org.nulljump.dionysos.notice.model.service.NoticeService;
import org.nulljump.dionysos.notice.model.vo.Notice;
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
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Autowired
	private NoticeService noticeservice;

	// �������� ��ü ��� ���
	@RequestMapping("nlist.do")
	public String noticeAllListMethod(Model model) {
		ArrayList<Notice> list = noticeservice.selectAllList();
		
		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "notice/noticeListView";
		} else {
			model.addAttribute("message", "��ϵ� ������ �����ϴ�.");
			return "common/error";
		}
	}

	// �������� ������ ������ ��Ϻ��� ��û ó���� �޼ҵ�
	@RequestMapping("nplist.do")
	public ModelAndView noticeListMethod(@RequestParam(name = "page", required = false) String page, ModelAndView mv) {
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		int limit = 10; // �� �������� ����� ��� ����
		// �� ������ �� ����� ���� �Խñ� �� ���� ��ȸ�� ��
		int listCount = noticeservice.getListCount();
		Paging paging = new Paging(listCount, currentPage, limit);
		paging.calculator();

		ArrayList<Notice> list = noticeservice.selectList(paging);

		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("paging", paging);

			mv.setViewName("notice/noticeListView");
		} else {
			mv.addObject("message", currentPage + " ������ ��� ��ȸ ����!");
			mv.setViewName("common/error");
		}

		return mv;
	}

	// �������� �󼼺��� ó����
	@RequestMapping("ndetail.do")
	public String noticeDetailMethod(@RequestParam("noticeno") int notice_no, Model model, HttpSession session) {
		// �����ڿ� �󼼺��� �������� �Ϲ�ȸ�� �Ǵ� ��ȸ�� �󼼺��� ������ ����
		// HttpSession �� �Ű������� �߰�

		Notice notice = noticeservice.selectNotice(notice_no);

		if (notice != null) {
			model.addAttribute("notice", notice);

			Users loginUsers = (Users) session.getAttribute("loginUsers");
			if (loginUsers != null && loginUsers.getAdmin().equals("Y")) {
				// �α����� �����ڰ� ��û�ߴٸ�
				return "notice/noticeAdminDetailView";
			} else {
				// �����ڰ� �ƴ� �Ǵ� �α������� ���� ���¿����� ��û�̶��
				return "notice/noticeDetailView";
			}
		} else {
			model.addAttribute("message", notice_no + "�� ������ �󼼺��� ��ȸ ����");
			return "common/error";
		}
	}

	// ÷������ �ٿ�ε� ��û ó����
	@RequestMapping("nfdown.do")
	public ModelAndView fileDownMethod(ModelAndView mv, HttpServletRequest request,
			@RequestParam("ofile") String originalFileName, @RequestParam("rfile") String renameFileName) {
		// �������� ÷������ ���������� ���� ���(path) ����
		String savePath = request.getSession().getServletContext().getRealPath("resources/notice_upfiles");

		// ���� �������� ���� ���Ͽ� ���� ���� ��ü ����
		File renameFile = new File(savePath + "\\" + renameFileName);
		// ���� �ٿ�� ������ ���� �̸��� ���� ��ü ����
		File originFile = new File(originalFileName);

		// ���� �ٿ�ε� ��� ������ ���� ����
		mv.setViewName("filedown"); // ��ϵ� ���ϴٿ�ε� ���� id��
		mv.addObject("renameFile", renameFile);
		mv.addObject("originFile", originFile);

		return mv;
	}

	// ������ ������������ �̵� ��û ó����
	@RequestMapping("nmoveup.do")
	public String moveUpdatePage(@RequestParam("noticeno") int notice_no, Model model) {
		// ������������ ����� �ش� ������ �ٽ� ��ȸ
		Notice notice = noticeservice.selectNotice(notice_no);

		if (notice != null) {
			model.addAttribute("notice", notice);
			return "notice/noticeUpdateForm";
		} else {
			model.addAttribute("message", notice_no + "�� ������ ������������ �̵� ����");
			return "common/error";
		}
	}

	// ������ ���� �˻���
	@RequestMapping(value = "nsearchTitle.do", method = RequestMethod.POST)
	public String noticeSearchTitleMethod(@RequestParam("title") String title, Model model) {

		ArrayList<Notice> list = noticeservice.selectSearchTitle(title);

		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "notice/noticeListView";
		} else {
			model.addAttribute("message", title + "�� �˻��� ������ ������ �����ϴ�.");
			return "common/error";
		}

	}

	// ������ ��ϳ�¥ �˻���
	@RequestMapping(value = "nsearchDate.do", method = RequestMethod.POST)
	public String noticeSearchDateMethod(SearchDate date, Model model) {

		ArrayList<Notice> list = noticeservice.selectSearchDate(date);

		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "notice/noticeListView";
		} else {
			model.addAttribute("message", "�ش� ��¥�� ��ϵ� ������ ������ �����ϴ�.");
			return "common/error";
		}
	}
	
	

	// �� ������ ��� �������� �̵� ó����
	@RequestMapping("movewrite.do")
	public String moveWritePage() {

		return "notice/noticeWriteForm";
	}

	// ������ ��� ��û ó���� (���� ���ε� ��� ���)
	@RequestMapping(value = "ninsert.do", method = RequestMethod.POST)
	public String noticeInsertMethod(Notice notice, Model model, HttpServletRequest request,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile) {
		// �������� ÷������ ���� ���� ��� ����
		String savePath = request.getSession().getServletContext().getRealPath("resources/notice_upfiles");

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

				// notice ��ü�� ÷������ ���� ��� ����
				notice.setNotice_original_filename(fileName);
				notice.setNotice_rename_filename(renameFileName);
			} // �̸� �ٲٱ�
		} // ���ο� ÷�������� ���� ��

		if (noticeservice.insertNotice(notice) > 0) {
			// ������ ��� ������ ��� ���� �������� �̵�
			return "redirect:nlist.do";
		} else {
			model.addAttribute("message", "�� ���� ��� ����");
			return "common/error";
		}
	}

	// ������ ���� ��û ó���� (���� ���ε� ��� ���)
	@RequestMapping(value = "nupdate.do", method = RequestMethod.POST)
	public String noticeUpdateMethod(Notice notice, Model model, HttpServletRequest request,
			@RequestParam(name = "delflag", required = false) String delFlag,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile) {
		// �������� ÷������ ���� ���� ��� ����
		String savePath = request.getSession().getServletContext().getRealPath("resources/notice_upfiles");

		// ÷�������� ���� ó���� ��� -------------------------
		// 1. ���� ÷�������� �ִµ� '���ϻ���'�� ������ ���
		if (notice.getNotice_original_filename() != null && delFlag != null && delFlag.equals("yes")) {
			// ���� ������ �ִ� ������ ����
			new File(savePath + "\\" + notice.getNotice_rename_filename()).delete();
			// notice �� ���� ������ ����
			notice.setNotice_original_filename(null);
			notice.setNotice_rename_filename(null);
		}

		// 2. ������ ÷�������� 1���� ������ ���
		// ���ο� ÷�������� ���� ��
		if (!mfile.isEmpty()) {
			// 2-1. ���� ÷�������� ���� ��
			if (notice.getNotice_original_filename() != null) {
				// ���� ������ �ִ� ���� ������ ����
				new File(savePath + "\\" + notice.getNotice_rename_filename()).delete();
				// notice�� ���� ���� ���� ����
				notice.setNotice_original_filename(null);
				notice.setNotice_rename_filename(null);
			}

			// 2-2. ���� ÷�������� ���� ��
			// ���� �� �����̸� ����
			String fileName = mfile.getOriginalFilename();

			// �ٸ� �������� ÷�����ϰ� ���ϸ��� �ߺ��Ǿ� ����� �Ǵ� ���� ���� ����
			// ���ϸ��� �����ؼ� ������ �����ϴ� ����� ����� �� ����
			// ���� ���ϸ� : ����Ͻú���.Ȯ����
			if (fileName != null && fileName.length() > 0) {
				// �ٲ� ���ϸ� ���� ���ڿ� �����
				// ������ ��� �Ǵ� ���� ��û ������ ��¥�ð������� �̿�
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				// ������ ���ϸ� �����
				String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));

				// ���� ������ Ȯ���ڸ� �����ؼ� ���� ���ϸ� �ٿ���
				renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);

				logger.info("���� ���ϸ� : " + renameFileName);

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

				// notice ��ü�� ÷������ ���� ��� ����
				notice.setNotice_original_filename(fileName);
				notice.setNotice_rename_filename(renameFileName);
			} // �̸� �ٲٱ�
		} // ���ο� ÷�������� ���� ��

		if (noticeservice.updateNotice(notice) > 0) {
			// ������ ���� ������ ��� ���� �������� �̵�
			return "redirect:nlist.do";
		} else {
			model.addAttribute("message", notice.getNotice_no() + "�� ���� ���� ����");
			return "common/error";
		}
	}

	// ������ ���� ��û ó����
	@RequestMapping("ndel.do")
	public String noticeDeleteMethod(@RequestParam("noticeno") int notice_no,
			@RequestParam(name = "rfile", required = false) String renameFileName, Model model,
			HttpServletRequest request) {

		if (noticeservice.deleteNotice(notice_no) > 0) {
			// ÷�ε� ������ �ִ� ������ ���� ���� ������ �ִ� ÷�����ϵ� ����
			if (renameFileName != null) {
				// �������� ÷������ ���������� ���� ���(path) ����
				String savePath = request.getSession().getServletContext().getRealPath("resources/notice_upfiles");

				new File(savePath + "\\" + renameFileName).delete();
			}
			return "redirect:nlist.do";
		} else {
			model.addAttribute("message", notice_no + "�� ���� ���� ����");
			return "common/error";
		}
	}

//	// �Խÿ��� ��� ��û ó���� (���� ���ε� ��� ���)
//	@RequestMapping(value = "binsert.do", method = RequestMethod.POST)
//	public String boardInsertMethod(Board board, Model model, HttpServletRequest request,
//			@RequestParam(name = "upfile", required = false) MultipartFile mfile) {
//		// ÷������ ���� ���� ��� ����
//		String savePath = request.getSession().getServletContext().getRealPath("resources/board_upfiles");
//
//		// ÷�������� ���� ��
//		if (!mfile.isEmpty()) {
//			// ���� �� �����̸� ����
//			String fileName = mfile.getOriginalFilename();
//
//			// �ٸ� �������� ÷�����ϰ� ���ϸ��� �ߺ��Ǿ� ����� �Ǵ� ���� ���� ����
//			// ���ϸ��� �����ؼ� ������ �����ϴ� ����� ����� �� ����
//			// ���� ���ϸ� : ����Ͻú���.Ȯ����
//			if (fileName != null && fileName.length() > 0) {
//				// �ٲ� ���ϸ� ���� ���ڿ� �����
//
//				String renameFileName = FileNameChange.change(fileName, "yyyyMMddHHmmss");
//
//				logger.info("÷�� ���ϸ� Ȯ�� : " + fileName + ", " + renameFileName);
//
//				// ���� ��ü �����
//				File renameFile = new File(savePath + "\\" + renameFileName);
//
//				// ������ ���� ó��
//				try {
//					mfile.transferTo(renameFile);
//				} catch (Exception e) {
//					e.printStackTrace();
//					model.addAttribute("message", "÷������ ���� ����");
//					return "common/error";
//				}
//
//				// board ��ü�� ÷������ ���� ��� ����
//				board.setBoard_original_filename(fileName);
//				board.setBoard_rename_filename(renameFileName);
//			} // �̸� �ٲٱ�
//		} // ���ο� ÷�������� ���� ��
//
//		if (boardService.insertBoard(board) > 0) {
//			// �Խñ� ��� ������ ��� ���� �������� �̵�
//			return "redirect:blist.do";
//		} else {
//			model.addAttribute("message", "�� �Խñ� ��� ����");
//			return "common/error";
//		}
//	}
//
//	@RequestMapping("bdel.do")
//	public String boardDeleteMethod(Board board, HttpServletRequest request, Model model) {
//
//		if (boardService.deleteBoard(board) > 0) {
//			// �ۻ����� �����ϸ� ���������� �ִ� ÷�����ϵ� ���� ó��
//			if (board.getBoard_rename_filename() != null) {
//				new File(request.getSession().getServletContext().getRealPath("resources/board_upfiles") + "/"
//						+ board.getBoard_rename_filename()).delete();
//			}
//			return "redirect:blist.do?page=1";
//
//		} else {
//			model.addAttribute("message", board.getBoard_num() + "�� �� ���� ����");
//			return "common/error";
//		}
//	}
//
//	// ������������ �̵� ó����
//	@RequestMapping("bupview.do")
//	public String moveBoardUpdateView(@RequestParam("board_num") int board_num, @RequestParam("page") int currentPage,
//			Model model) {
//		// ������������ ���� board ��ü ���� ��ȸ
//		Board board = boardService.selectBoard(board_num);
//
//		if (board != null) {
//			model.addAttribute("board", board);
//			model.addAttribute("currentPage", currentPage);
//
//			return "board/boardUpdateForm";
//		} else {
//			model.addAttribute("message", board_num + "�� �� ������������ �̵� ����");
//
//			return "common/error";
//		}
//	}
//
//	// ������ ���� ��û ó���� (���� ���ε� ��� ���)
//	@RequestMapping(value = "boriginup.do", method = RequestMethod.POST)
//	public String boardUpdateMethod(Board board, Model model, HttpServletRequest request,
//			@RequestParam("page") int page, @RequestParam(name = "delflag", required = false) String delFlag,
//			@RequestParam(name = "upfile", required = false) MultipartFile mfile) {
//		// �������� ÷������ ���� ���� ��� ����
//		String savePath = request.getSession().getServletContext().getRealPath("resources/board_upfiles");
//
//		// ÷�������� ���� ó���� ��� -------------------------
//		// 1. ���� ÷�������� �ִµ� '���ϻ���'�� ������ ���
//		if (board.getBoard_original_filename() != null && delFlag != null && delFlag.equals("yes")) {
//			// ���� ������ �ִ� ������ ����
//			new File(savePath + "\\" + board.getBoard_rename_filename()).delete();
//			// notice �� ���� ������ ����
//			board.setBoard_original_filename(null);
//			board.setBoard_rename_filename(null);
//		}
//
//		// 2. ������ ÷�������� 1���� ������ ���
//		// ���ο� ÷�������� ���� ��
//		if (!mfile.isEmpty()) {
//			// 2-1. ���� ÷�������� ���� ��
//			if (board.getBoard_original_filename() != null) {
//				// ���� ������ �ִ� ���� ������ ����
//				new File(savePath + "\\" + board.getBoard_rename_filename()).delete();
//				// notice�� ���� ���� ���� ����
//				board.setBoard_original_filename(null);
//				board.setBoard_rename_filename(null);
//			}
//
//			// 2-2. ���� ÷�������� ���� ��
//			// ���� �� �����̸� ����
//			String fileName = mfile.getOriginalFilename();
//
//			// �ٸ� �������� ÷�����ϰ� ���ϸ��� �ߺ��Ǿ� ����� �Ǵ� ���� ���� ����
//			// ���ϸ��� �����ؼ� ������ �����ϴ� ����� ����� �� ����
//			// ���� ���ϸ� : ����Ͻú���.Ȯ����
//			if (fileName != null && fileName.length() > 0) {
//				// �ٲ� ���ϸ� ���� ���ڿ� �����
//				// ������ ��� �Ǵ� ���� ��û ������ ��¥�ð������� �̿�
//				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
//				// ������ ���ϸ� �����
//				String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
//
//				// ���� ������ Ȯ���ڸ� �����ؼ� ���� ���ϸ� �ٿ���
//				renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);
//
//				logger.info("���� ���ϸ� : " + renameFileName);
//
//				// ���� ��ü �����
//				File renameFile = new File(savePath + "/" + renameFileName);
//
//				// ������ ���� ó��
//				try {
//					mfile.transferTo(renameFile);
//				} catch (Exception e) {
//					e.printStackTrace();
//					model.addAttribute("message", "÷������ ���� ����");
//					return "common/error";
//				}
//
//				// notice ��ü�� ÷������ ���� ��� ����
//				board.setBoard_original_filename(fileName);
//				board.setBoard_rename_filename(renameFileName);
//			} // �̸� �ٲٱ�
//		} // ���ο� ÷�������� ���� ��
//
//		if (boardService.updateBoard(board) > 0) {
//			// �Խÿ��� ���� ������ �� ���� �������� �̵�
//			model.addAttribute("page", page);
//			model.addAttribute("board_num", board.getBoard_num());
//
//			return "redirect:bdetail.do";
//		} else {
//			model.addAttribute("message", board.getBoard_num() + "�� ���� ���� ����");
//			return "common/error";
//		}
//	}
//
//	// �����
//
//	public String moveListPage() {
//	}
//
//	public String moveFaqPage() {
//	}
//
//	public String moveQnAPage() {
//	}
//
//	// ������
//	public String moveWritePage() {
//	}
//
//	public String moveUpdatePage() {
//	}
//
//	public String noticeDeleteMethod(Notice notice, Model model, HttpServletRequest request) {
//	}
//
//	public String noticeUpdateMethod(Notice notice, Model model, HttpServletRequest request) {
//	}
//
//	public String noticeInsertMethod(Notice notice, Model model, HttpServletRequest request) {
//	}
//
//	public String noticeUpFileMethod(MultipartFile file, Notice notice, Model model, HttpServletRequest request) {
//	}
//
//	public String noticeDeleteFileMethod(MultipartFile file, Notice notice, Model model, HttpServletRequest request) {
//	}

}
