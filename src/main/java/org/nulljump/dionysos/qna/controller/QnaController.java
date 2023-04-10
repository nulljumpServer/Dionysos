package org.nulljump.dionysos.qna.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.nulljump.dionysos.common.FileNameChange;
import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.common.SearchDate;
import org.nulljump.dionysos.notice.model.vo.Notice;
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
	public ModelAndView qnaListMethod(@RequestParam(name = "page", required = false) String page, 
			HttpSession session, ModelAndView mv) {

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
			Users loginUsers = (Users) session.getAttribute("loginUsers");
			if (loginUsers != null && loginUsers.getAdmin().equals("Y")) {
				// 로그인한 관리자가 요청했다면
				mv.addObject("list", list);
				mv.addObject("paging", paging);
				mv.setViewName("qna/qnaAdminListView");
			}else {
				// 관리자가 아닌 또는 로그인하지 않은 상태에서의 요청이라면
				mv.addObject("list", list);
				mv.addObject("paging", paging);
				mv.setViewName("qna/qnaListView");
			}		
		} else {
			mv.addObject("message", currentPage + " 페이지 목록 조회 실패!");
			mv.setViewName("common/error");
		}

		return mv;
	}

	// 1:1문의 상세보기
	@RequestMapping("qdetail.do")
	public ModelAndView qnaDetailMethod(ModelAndView mv, HttpSession session, @RequestParam("qna_no") int qna_no,
			@RequestParam(name = "page", required = false) String page) {

		int currentPage = 1;
//		if (page != null) {
//			currentPage = Integer.parseInt(page);
//		}

		// 해당 게시글 조회
		Qna qna = qnaservice.selectQna(qna_no);

		// 컨트롤러에서 여러개의 서비스 호출해서 모델에 한번에 담아서 뷰에 보여주면 됨

		if (qna != null) {
			Users loginUsers = (Users) session.getAttribute("loginUsers");
			if (loginUsers != null && loginUsers.getAdmin().equals("Y")) {
				// 로그인한 관리자가 요청했다면
				mv.addObject("qna", qna);
				mv.addObject("currentPage", currentPage);
				mv.setViewName("qna/qnaAdminDetailView");
			} else {
				// 관리자가 아닌 또는 로그인하지 않은 상태에서의 요청이라면
				mv.addObject("qna", qna);
				mv.addObject("currentPage", currentPage);
				mv.setViewName("qna/qnaDetailView");
			}

		} else {
			mv.addObject("message", qna_no + "번 게시글 조회 실패");
			mv.setViewName("common/error");
		}

		return mv;
	}

	// 첨부파일 다운로드 요청 처리용
	@RequestMapping("qfdown.do")
	public ModelAndView fileDownMethod(ModelAndView mv, HttpServletRequest request,
			@RequestParam("ofile") String originalFileName, @RequestParam("rfile") String renameFileName) {
		// 공지사항 첨부파일 저장폴더에 대한 경로(path) 지정
		String savePath = request.getSession().getServletContext().getRealPath("resources/qna_upfiles");

		// 저장 폴더에서 읽을 파일에 대한 파일 객체 생성
		File renameFile = new File(savePath + "\\" + renameFileName);
		// 파일 다운시 내보낼 원래 이름의 파일 객체 생성
		File originFile = new File(originalFileName);

		// 파일 다운로드 뷰로 전달할 정보 저장
		mv.setViewName("filedown"); // 등록된 파일다운로드 뷰의 id명
		mv.addObject("renameFile", renameFile);
		mv.addObject("originFile", originFile);

		return mv;
	}
	
	// 검색기능 메소드 (페이징 적용)
			@RequestMapping(value = "qsearch.do", method = { RequestMethod.GET, RequestMethod.POST })
			public ModelAndView qnaSearchMethod(ModelAndView mv, HttpServletRequest request, HttpSession session,
					@RequestParam(value = "page", required = false) String page) {
				String action = request.getParameter("action");
				logger.info("action : " + action);
				
				String keyword = null;
				keyword = request.getParameter("keyword");
				logger.info("keyword : " + keyword);
				
				
				int currentPage = 1;
				if (page != null) {
					currentPage = Integer.parseInt(page);
				}
				String url = "qsearch.do";
				int limit = 10;
				int listCount = qnaservice.selectSearchQnaCount(action, keyword);
				logger.info("paging : " + listCount + ", " + currentPage + ", " + limit + ", " +  url);
				Paging paging = new Paging(listCount, currentPage, limit, url);
				
				paging.setListCount(listCount);
				paging.calculator();
				
				ArrayList<Qna> list = qnaservice.selectSearchQna(action, keyword, paging);

				if (list != null && list.size() > 0) {
					Users loginUsers = (Users)session.getAttribute("loginUsers");
					if (loginUsers != null && loginUsers.getAdmin().equals("Y")) {
						// 로그인한 관리자가 요청했다면
						mv.addObject("list", list);
						mv.addObject("action", action);
						mv.addObject("listCount", listCount);
						mv.addObject("keyword", keyword);
						mv.addObject("paging", paging);
						mv.setViewName("qna/qnaAdminListView");
						
					}else {
						// 관리자가 아닌 또는 로그인하지 않은 상태에서의 요청이라면
						mv.addObject("list", list);
						mv.addObject("action", action);
						mv.addObject("listCount", listCount);
						mv.addObject("keyword", keyword);
						mv.addObject("paging", paging);
						mv.setViewName("qna/qnaListView");
					}
				} else {
					mv.addObject("message", action + " 검색 결과가 없습니다.");
					mv.setViewName("common/error");
				}
				return mv;
			}

	// 제목으로 검색
	@RequestMapping(value = "qsearchTitle.do", method = RequestMethod.POST)
	public String qnaSearchTitleMethod(@RequestParam("title") String title, Model model, HttpSession session) {

		ArrayList<Qna> list = qnaservice.selectTitleSearch(title);
		
		logger.info(title);

		if (list != null && list.size() > 0) {
			Users loginUsers = (Users) session.getAttribute("loginUsers");
			if (loginUsers != null && loginUsers.getAdmin().equals("Y")) {
				// 로그인한 관리자가 요청했다면
				model.addAttribute("list", list);
				return "qna/qnaAdminListView";
			}else {
				model.addAttribute("list", list);
				return "qna/qnaListView";
			}
		} else {
			model.addAttribute("message", title + "로 검색된 정보가 없습니다.");
			return "common/error";
		}

	}

	// 사용자 아이디로 검색
	@RequestMapping(value = "qsearchId.do", method = RequestMethod.POST)
	public String qnaSearchIdMethod(String user_id, Model model, HttpSession session) {

		ArrayList<Qna> list = qnaservice.selectIdSearch(user_id);

		if (list != null && list.size() > 0) {
			Users loginUsers = (Users) session.getAttribute("loginUsers");
			if (loginUsers != null && loginUsers.getAdmin().equals("Y")) {
				// 로그인한 관리자가 요청했다면
				model.addAttribute("list", list);
				return "qna/qnaAdminListView";
			}else {
				model.addAttribute("list", list);
				return "qna/qnaListView";
			}
		} else {
			model.addAttribute("message", "해당 날짜로 등록된 정보가 없습니다.");
			return "common/error";
		}
	}

	// 날짜로 검색
	@RequestMapping(value = "qsearchDate.do", method = RequestMethod.POST)
	public String qnaSearchDateMethod(SearchDate date, Model model, HttpSession session) {

		ArrayList<Qna> list = qnaservice.selectDateSearch(date);

		if (list != null && list.size() > 0) {
			Users loginUsers = (Users) session.getAttribute("loginUsers");
			if (loginUsers != null && loginUsers.getAdmin().equals("Y")) {
				// 로그인한 관리자가 요청했다면
				model.addAttribute("list", list);
				return "qna/qnaAdminListView";
			}else {
				model.addAttribute("list", list);
				return "qna/qnaListView";
			}
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
			return "redirect:qlist.do";
		} else {
			model.addAttribute("message", "새 게시글 등록 실패");
			return "common/error";
		}
	}

	// 1:1문의 수정 이동
	@RequestMapping("qupview.do")
	public String moveQnaUpdateView(@RequestParam("qna_no") int qna_no, Model model) {
		// 수정페이지로 보낼 객체 정보 조회
		Qna qna = qnaservice.selectQna(qna_no);

		if (qna != null) {
			model.addAttribute("qna", qna);

			return "qna/qnaUpdateForm";
		} else {
			model.addAttribute("message", qna_no + "번 글 수정페이지로 이동 실패");

			return "common/error";
		}
	}

	// 1:1문의 수정 요청 처리용 (파일 업로드 기능 사용)
	@RequestMapping(value = "qoriginup.do", method = RequestMethod.POST)
	public String qnaUpdateMethod(Qna qna, Model model, HttpServletRequest request, 
			@RequestParam(name = "page", required = false) String page,
			@RequestParam(name = "delflag", required = false) String delFlag,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile) {
		// 공지사항 첨부파일 저장 폴더 경로 지정
		String savePath = request.getSession().getServletContext().getRealPath("resources/qna_upfiles");

		// 첨부파일이 수정 처리된 경우 -------------------------
		// 1. 원래 첨부파일이 있는데 '파일삭제'를 선택한 경우
		if (qna.getQna_original_filename() != null && delFlag != null && delFlag.equals("yes")) {
			// 저장 폴더에 있는 파일을 삭제
			new File(savePath + "\\" + qna.getQna_rename_filename()).delete();
			// notice 의 파일 정보도 제거
			qna.setQna_original_filename(null);
			qna.setQna_rename_filename(null);
		}

		// 2. 공지글 첨부파일은 1개만 가능한 경우
		// 새로운 첨부파일이 있을 때
		if (!mfile.isEmpty()) {
			// 2-1. 이전 첨부파일이 있을 때
			if (qna.getQna_original_filename() != null) {
				// 저장 폴더에 있는 이전 파일을 삭제
				new File(savePath + "\\" + qna.getQna_rename_filename()).delete();
				// notice의 이전 파일 정보 제거
				qna.setQna_original_filename(null);
				qna.setQna_rename_filename(null);
			}

			// 2-2. 이전 첨부파일이 없을 때
			// 전송 온 파일이름 추출
			String fileName = mfile.getOriginalFilename();

			// 다른 공지글의 첨부파일과 파일명이 중복되어 덮어쓰기 되는 것을 막기 위해
			// 파일명을 변경해서 폴더에 저장하는 방식을 사용할 수 있음
			// 변경 파일명 : 년월일시분초.확장자
			if (fileName != null && fileName.length() > 0) {
				String renameFileName = FileNameChange.change(fileName, "yyyyMMddHHmmss");

				logger.info("첨부 파일명 확인 : " + fileName + ", " + renameFileName);

				// 폴더에 저장 처리
				try {
					mfile.transferTo(new File(savePath + "/" + renameFileName));
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "첨부파일 저장 실패!");
					return "common/error";
				}

				// notice 객체에 첨부파일 정보 기록 저장
				qna.setQna_original_filename(fileName);
				qna.setQna_rename_filename(renameFileName);
			} // 이름 바꾸기
		} // 새로운 첨부파일이 있을 때
		
		logger.info("qna : " + qna);

		if (qnaservice.updateInquiry(qna) > 0) {
			model.addAttribute("page", page);
			model.addAttribute("qna_no", qna.getQna_no());

			return "redirect:qlist.do";
		} else {
			model.addAttribute("message", qna.getQna_no() + "번 공지 수정 실패");
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
			return "redirect:qlist.do";

		} else {
			model.addAttribute("message", qna.getQna_no() + "번 글 삭제 실패");
			return "common/error";
		}
	}

	// 답변 등록 페이지 이동
	@RequestMapping("qreplyform.do")
	public String moveReplyForm(Model model, @RequestParam("qna_no") int origin_num,
			@RequestParam("page") int currentPage) {

		model.addAttribute("qna_no", origin_num);
		model.addAttribute("currentPage", currentPage);

		return "qna/qnaReplyForm";
	}

	// 답변 등록
	@RequestMapping(value = "qreply.do", method = RequestMethod.POST)
	public String replyInsertMethod(Qna reply, Model model) {
		// 해당 댓글에 대한 원글을 조회

		Qna origin = qnaservice.selectQna(reply.getQna_no());

		// 현재 등록할 댓글의 레벨을 설정
		reply.setQna_lev(origin.getQna_lev() + 1);
		
		// 댓글일 때는 board_reply_ref(참조하는 댓글번호) 값 지정
		if (reply.getQna_lev() == 2) {
		// 참조 원글번호
		reply.setQna_ref(origin.getQna_ref());
		// 참조 댓글번호
		reply.setQna_reply_ref(origin.getQna_no());
		}

		// 댓글과 대댓글 최신글을 board_reply_seq 를 1로 지정
		reply.setQna_reply_seq(1);
		// 기존의 댓글 또는 대댓글의 순번을 모두 1 증가 처리
		qnaservice.updateReplySeq(reply);
		// 문의상태 1증가처리해서 처리완료로 상태 변경
		qnaservice.updateState(origin);

		if (qnaservice.insertReply(reply) > 0) {
			return "redirect:qlist.do";
		} else {
			model.addAttribute("message", reply.getQna_ref() + "번 글에 대한 댓글 등록 실패");
			return "common/error";
		}
	}

	// 답변 수정 이동
	@RequestMapping("qreplyupview.do")
	public String moveReplyUpdateView(@RequestParam("qna_no") int qna_no,
			@RequestParam("page") int currentPage, Model model) {
		// 수정페이지로 보낼 객체 정보 조회
		Qna qna = qnaservice.selectQna(qna_no);

		if (qna != null) {
			model.addAttribute("qna", qna);
			model.addAttribute("currentPage", currentPage);

			return "qna/qnaReplyUpdateForm";
		} else {
			model.addAttribute("message", qna_no + "번 글 답변 수정페이지로 이동 실패");

			return "common/error";
		}
	}

	// 답변 수정
	@RequestMapping(value = "qreplyup.do", method = RequestMethod.POST)
	public String replyUpdateMethod(Qna reply, @RequestParam("page") String page, Model model) {

		logger.info("reply : " + reply);
		
		if (qnaservice.updateReply(reply) > 0) {
			// 댓글, 대댓글 수정 성공시 다시 상세보기 페이지가 보여지게 한다면
			model.addAttribute("qna_no", reply.getQna_no());
			model.addAttribute("page", page);

			return "redirect:qdetail.do";
		} else {
			model.addAttribute("message", reply.getQna_no() + "번 글 수정실패");

			return "common/error";
		}
	}

	// 답변 삭제
	@RequestMapping("qreplydel.do")
	public String qnaReplyDeleteMethod(Qna qna, HttpServletRequest request, Model model) {

		if (qnaservice.deleteReply(qna) > 0) {
			return "redirect:qlist.do";

		} else {
			model.addAttribute("message", qna.getQna_no() + "번 글 삭제 실패");
			return "common/error";
		}
	}

	// 사용자
//	
//	public String moveNoticePage() {}
//	
//	public String moveFaqPage() {}

}
