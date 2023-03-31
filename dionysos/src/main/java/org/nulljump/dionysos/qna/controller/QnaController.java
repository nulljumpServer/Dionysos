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

	// 1:1문의 전체 목록 출력
	@RequestMapping("qalist.do")
	public String qnaAllListMethod(Model model) {
		ArrayList<Qna> list = qnaservice.selectAllList();

		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "qna/qnaListView";
		} else {
			model.addAttribute("message", "등록된 공지사항 정보가 없습니다.");
			return "common/error";
		}
	}
	
	// 1:1문의 페이지 단위로 목록보기 
	@RequestMapping("qlist.do")
	public ModelAndView qnaListMethod(@RequestParam(name = "page", required = false) String page, ModelAndView mv) {

		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		int limit = 10; // 한 페이지에 출력할 목록 갯수
		// 총 페이지 수 계산을 위해 게시글 총 갯수 조회해 옴
		int listCount = qnaservice.selectListCount();
		Paging paging = new Paging(listCount, currentPage, limit);
		paging.calculator();

		ArrayList<Qna> list = qnaservice.selectList(paging);

		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("paging", paging);

			mv.setViewName("qna/qnaListView");
		} else {
			mv.addObject("message", currentPage + " 페이지 목록 조회 실패!");
			mv.setViewName("common/error");
		}

		return mv;
	}
	
	// 1:1문의 상세보기
	@RequestMapping("qdetail.do")
	public String qnaDetailMethod(@RequestParam("qnano") int qna_no, Model model, HttpSession session) {
		// 관리자용 상세보기 페이지와 일반회원 또는 비회원 상세보기 페이지 구분
		// HttpSession 을 매개변수에 추가

		Qna qna = qnaservice.selectQna(qna_no);

		if (qna != null) {
			model.addAttribute("qna", qna);

			Users loginUsers = (Users) session.getAttribute("loginUsers");
			if (loginUsers != null && loginUsers.getAdmin().equals("Y")) {
				// 로그인한 관리자가 요청했다면
				return "qna/qnaAdminDetailView";
			} else {
				// 관리자가 아닌 또는 로그인하지 않은 상태에서의 요청이라면
				return "qna/qnaDetailView";
			}
		} else {
			model.addAttribute("message", qna_no + "번 상세보기 조회 실패");
			return "common/error";
		}
	}
	
	// 제목으로 검색
	@RequestMapping(value = "qsearchTitle.do", method = RequestMethod.POST)
	public String qnaSearchTitleMethod(@RequestParam("title") String title, Model model) {

		ArrayList<Qna> list = qnaservice.selectTitleSearch(title);

		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "qna/qnaListView";
		} else {
			model.addAttribute("message", title + "로 검색된 정보가 없습니다.");
			return "common/error";
		}

	}
	
	// 사용자 아이디로 검색
	@RequestMapping(value = "qsearchId.do", method = RequestMethod.POST)
	public String qnaSearchIdMethod(String user_id, Model model) {

		ArrayList<Qna> list = qnaservice.selectIdSearch(user_id);

		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "qna/qnaListView";
		} else {
			model.addAttribute("message", "해당 날짜로 등록된 정보가 없습니다.");
			return "common/error";
		}
	}
	
	// 날짜로 검색
	@RequestMapping(value = "qsearchDate.do", method = RequestMethod.POST)
	public String qnaSearchDateMethod(SearchDate date, Model model) {

		ArrayList<Qna> list = qnaservice.selectDateSearch(date);

		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "qna/qnaListView";
		} else {
			model.addAttribute("message", "해당 날짜로 등록된 정보가 없습니다.");
			return "common/error";
		}
	}
	
	// 1:1문의 등록 페이지로 이동 
	@RequestMapping("qwform.do")
	public String moveQnaWriteForm() {
		return "qna/qnaWriteForm";
	}
	
	
	// 1:1문의 등록
	@RequestMapping(value = "qinsert.do", method = RequestMethod.POST)
	public String qnaInsertMethod(Qna qna, Model model, HttpServletRequest request,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile) {
		// 첨부파일 저장 폴더 경로 지정
		String savePath = request.getSession().getServletContext().getRealPath("resources/qna_upfiles");

		// 첨부파일이 있을 때
		if (!mfile.isEmpty()) {
			// 전송 온 파일이름 추출
			String fileName = mfile.getOriginalFilename();

			// 다른 공지글의 첨부파일과 파일명이 중복되어 덮어쓰기 되는 것을 막기 위해
			// 파일명을 변경해서 폴더에 저장하는 방식을 사용할 수 있음
			// 변경 파일명 : 년월일시분초.확장자
			if (fileName != null && fileName.length() > 0) {
				// 바꿀 파일명에 대한 문자열 만들기

				String renameFileName = FileNameChange.change(fileName, "yyyyMMddHHmmss");

				logger.info("첨부 파일명 확인 : " + fileName + ", " + renameFileName);

				// 파일 객체 만들기
				File renameFile = new File(savePath + "\\" + renameFileName);

				// 폴더에 저장 처리
				try {
					mfile.transferTo(renameFile);
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "첨부파일 저장 실패");
					return "common/error";
				}

				// 객체에 첨부파일 정보 기록 저장
				qna.setQna_original_filename(fileName);
				qna.setQna_rename_filename(renameFileName);
			} // 이름 바꾸기
		} // 새로운 첨부파일이 있을 때

		if (qnaservice.insertInquiry(qna) > 0) {
			// 게시글 등록 성공시 목록 보기 페이지로 이동
			return "redirect:qalist.do";
		} else {
			model.addAttribute("message", "새 게시글 등록 실패");
			return "common/error";
		}
	}
	
	
	
	// 1:1문의 수정
	@RequestMapping("qupview.do")
	public String moveQnaUpdateView(@RequestParam("qnano") int qna_no, @RequestParam("page") int currentPage,
			Model model) {
		// 수정페이지로 보낼 객체 정보 조회
		Qna qna = qnaservice.selectQna(qna_no);

		if (qna != null) {
			model.addAttribute("qna", qna);
			model.addAttribute("currentPage", currentPage);

			return "qna/qnaUpdateForm";
		} else {
			model.addAttribute("message", qna_no + "번 글 수정페이지로 이동 실패");

			return "common/error";
		}
	}
	
	
	// 1:1문의 삭제
	@RequestMapping("qdel.do")
	public String qnaDeleteMethod(Qna qna, HttpServletRequest request, Model model) {

		if (qnaservice.deleteInquiry(qna) > 0) {
			// 글삭제가 성공하면 저장폴더에 있는 첨부파일도 삭제 처리
			if (qna.getQna_rename_filename() != null) {
				new File(request.getSession().getServletContext().getRealPath("resources/qna_upfiles") + "/"
						+ qna.getQna_rename_filename()).delete();
			}
			return "redirect:qalist.do?page=1";

		} else {
			model.addAttribute("message", qna.getQna_no() + "번 글 삭제 실패");
			return "common/error";
		}
	}
	
	
	
	// 답변 등록 페이지 이동 
	@RequestMapping("qreplyform.do")
	public String moveReplyForm(Model model, @RequestParam("qnano") int origin_num,
			@RequestParam("page") int currentPage) {

		model.addAttribute("qnano", origin_num);
		model.addAttribute("currentPage", currentPage);

		return "qna/qnaReplyForm";
	}
	
	// 답변 등록
	@RequestMapping(value = "qreply.do", method = RequestMethod.POST)
	public String replyInsertMethod(Qna reply, @RequestParam("page") int page, Model model) {
		// 해당 댓글에 대한 원글을 조회
		Qna origin = qnaservice.selectQna(reply.getQna_ref());

		// 현재 등록할 댓글의 레벨을 설정
		reply.setQna_lev(origin.getQna_lev() + 1);

		// 댓글과 대댓글 최신글을 board_reply_seq 를 1로 지정
		reply.setQna_reply_seq(1);
		// 기존의 댓글 또는 대댓글의 순번을 모두 1 증가 처리
		qnaservice.updateReplySeq(reply);

		if (qnaservice.insertReply(reply) > 0) {
			return "redirect:qalist.do?page=" + page;
		} else {
			model.addAttribute("message", reply.getQna_ref() + "번 글에 대한 댓글 등록 실패");
			return "common/error";
		}
	}
	
	
	// 답변 수정
	
	
	// 답변 삭제
	
	

	// 사용자
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
//	//관리자
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
//	//쓸지말지?
//	public String moveAnswerDetailPage(Model model, int answer_no, int inquiry_no, HttpSession session) {}

}
