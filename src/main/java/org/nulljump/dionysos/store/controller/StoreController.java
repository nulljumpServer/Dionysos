package org.nulljump.dionysos.store.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.store.model.service.StoreService;
import org.nulljump.dionysos.store.model.vo.Store;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StoreController {

	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);

	@Autowired
	private StoreService storeService;
	
	public StoreController(StoreService stroeService) {
		this.storeService = storeService;
	}
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@RequestMapping(value = "storeloginPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String moveStoreLoginPage() {
		return "store/storeloginPage";
	}
	
	//시작 페이지로 이동
	@RequestMapping("store.do")
	public String movestorePage() {
		return "store/store";
	}

	// 회원가입 페이지 내보내기
	@RequestMapping("storeenrollPage.do")
	public String moveEnrollPage() {
		return "store/storeenrollPage";
	}

	// 회원정보 수정페이지 내보내기
	@RequestMapping("storemoveup.do")
	public String moveUpdatePage(@RequestParam("store_id") String store_id, Model model) {
		Store Store = storeService.selectStore(store_id);

		if (Store != null) {
			model.addAttribute("Store", Store);
			return "store/storeupdatePage";
		} else {
			model.addAttribute("message", store_id + " : 회원 조회 실패!");
			return "common/error";
		}
	}

	@RequestMapping(value = "storelogin.do", method = RequestMethod.POST)
	public String sotreloginMethod(Store store, HttpSession session, SessionStatus status, Model model) {
	    logger.info("storelogin.do : " + store);

	    Store loginStore = storeService.selectStore(store.getStore_id());

	    if (loginStore == null) {
	        // 예외 처리
	        model.addAttribute("message", "로그인 실패 : 존재하지 않는 사용자입니다.");
	        return "common/error";
	    } else if (this.bcryptPasswordEncoder.matches(store.getPassword(), loginStore.getPassword())) {
	        if (loginStore.getLogin_ok().equals("Y")) {
	            session.setAttribute("loginStore", loginStore);
	            status.setComplete();
	            return "store/store";
	        } else {
	            model.addAttribute("message", "로그인 실패 : 로그인 승인 대기 중입니다.");
	            return "common/error";
	        }
	    } else {
	        model.addAttribute("message", "로그인 실패 : 아이디나 암호 확인하세요.");
	        return "common/error";
	    }
	}




	@RequestMapping("storelogout.do")
	public String storelogoutMethod(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession(false);
		logger.info("storelogout.do : " + session);

		if (session != null) {
			session.invalidate();
			return "common/main";
		} else {
			model.addAttribute("message", "로그인 세션이 존재하지 않습니다");
			return "common/error";
		}
	}

	// ajax 통신으로 아이디 중복확인 요청
	@RequestMapping(value = "storeidchk.do", method = RequestMethod.POST)
	public void storedupCheckIdMethod(String store_id, HttpServletResponse response)
			throws IOException {
		int idCount = storeService.selectDupCheckId(store_id);

		String returnStr = null;
		if (idCount == 0) {
			returnStr = "ok";
		} else {
			returnStr = "duple";
		}

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(returnStr);
		out.flush();
		out.close();
	}

	// 회원가입 요청
	@RequestMapping(value = "storeenroll.do", method = RequestMethod.POST)
	public String StoreInsertMethod(Store Store, Model model) {
		logger.info("storeenroll.do : " + Store);

		// 패스워드 암호화 처리
		Store.setPassword(bcryptPasswordEncoder.encode(Store.getPassword()));
		logger.info("after encode : " + Store.getPassword());
		logger.info("length : " + Store.getPassword().length());

		if (storeService.insertStore(Store) > 0) {
			// 회원 가입 성공
			return "common/main";
		} else {
			// 회원 가입 실패
			model.addAttribute("message", "회원 가입 실패!");
			return "common/error";
		}
	}

	@RequestMapping("storemyinfo.do")
	public ModelAndView memberDetailMethod(@RequestParam("store_id") String store_id, ModelAndView mv) {
		Store Store = storeService.selectStore(store_id);

		if (Store != null) {
			mv.addObject("Store", Store);
			mv.setViewName("store/storemyinfoPage");
		} else {
			mv.addObject("message", store_id + " : 회원 정보 조회 실패!");
			mv.setViewName("common/error");
		}

		return mv;
	}

	// 회원 탈퇴(삭제) 요청
	@RequestMapping("storemdel.do")
	public String StoreDeleteMethod(@RequestParam("store_id") String store_id, Model model) {
		logger.info("mdel.do : " + store_id);

		if (storeService.deleteStore(store_id) > 0) {
			return "redirect:logout.do";
		} else {
			model.addAttribute("message", store_id + " : 회원 삭제 실패!");
			return "common/error";
		}
	}

	// 회원 강제 탈퇴
	@RequestMapping("storeeviction.do")
	public String EvictionMethod(@RequestParam("store_id") String store_id, Model model) {
		if (storeService.evictionStore(store_id)>0) {
			return "redirect:storemlist.do";
		} else {
			model.addAttribute("message", store_id + " : 회원 삭제 실패!");
			return "common/error";
		}
	}

	// 회원정보 수정 처리
	@RequestMapping(value = "storemupdate.do", method = RequestMethod.POST)
	public String StoreUpdateMethod(Store Store, Model model, @RequestParam("origin_password") String originstorepwd) {
		logger.info("storemupdate.do : " + Store);

		String storepwd = Store.getPassword().trim();
		if (storepwd != null && storepwd.length() > 0) {
			if (!this.bcryptPasswordEncoder.matches(storepwd, originstorepwd)) {
				Store.setPassword(this.bcryptPasswordEncoder.encode(storepwd));
			} else {
				Store.setPassword(originstorepwd);
			}

		}
		if (storeService.updateStore(Store) > 0) {

			return "redirect:myinfo.do?store_id=" + Store.getStore_id();
		} else {
			model.addAttribute("message", Store.getStore_id() + " : 회원 정보 수정 실패!");
			return "common/error";
		}
	}

	// 회원관리용 조회 처리
	@RequestMapping("storemlist.do")
	public String StoreListViewMethod(Model model) {
		ArrayList<Store> list = storeService.selectList();

		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "store/storeListView";
		} else {
			model.addAttribute("message", "회원 정보가 존재하지 않습니다.");
			return "common/error";
		}
	}

	// 매장관리 클릭시 매장 정보 보기 요청 처리용 메소드
		@RequestMapping("storeinfo.do")
		public ModelAndView storeDetailMethod(@RequestParam("store_id") String store_id, ModelAndView mv) {
			// 서비스로 아이디 전달하고, 해당 매장 정보 받기
			Store store = storeService.selectStore(store_id);

			if (store != null) {
				mv.addObject("store", store);
				mv.setViewName("store/storelistView");
			} else {
				mv.addObject("message", store_id + " : 매장 정보 조회 실패!");
				mv.setViewName("store/store");
			}

			return mv;
		}
	// 관리자 매장검색기능 메소드 (페이징 적용)
			@RequestMapping(value = "storeSearch.do", method = { RequestMethod.GET, RequestMethod.POST })
			public ModelAndView adminstoreSearchMethod(ModelAndView mv, HttpServletRequest request,
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
				String url = "storeSearch.do";
				int limit = 10;
				int listCount = storeService.selectSearchStoreCount(action, keyword);
				logger.info("paging : " + listCount + ", " + currentPage + ", " + limit + ", " +  url);
				Paging paging = new Paging(listCount, currentPage, limit, url);
				
				paging.setListCount(listCount);
				paging.calculator();
				
				ArrayList<Store> list = storeService.selectSearchStore(action, keyword, paging);

				if (list != null && list.size() > 0) {
					mv.addObject("list", list);
					mv.addObject("action", action);
					mv.addObject("keyword", keyword);
					mv.addObject("paging", paging);
					mv.setViewName("store/adminStoreListView");
					
				} else {
					mv.addObject("message", action + " 검색 결과가 없습니다.");
					mv.setViewName("common/error");
				}
				return mv;
			}
		
		
		
		// 관리자용 매장 관리 기능 페이지 이동 메소드(페이징)
			@RequestMapping("adminStoreListView.do")
			public ModelAndView adminstoreListMethod(@RequestParam(name = "page", required = false) String page,
					ModelAndView mv) {

				int currentPage = 1;
				if (page != null) {
					currentPage = Integer.parseInt(page);
				}

				// 한 페이지에 게시글 10개씩 출력되게 하는 경우 :
				// 페이징 계산 처리 - 별도의 클래스로 작성해서 이용해도 됨
				int limit = 10;  // 한 페이지에 출력할 목록 갯수
				// 총 페이지 수 계산을 위해 게시글 총 갯수 조회해 옴
				int listCount = storeService.selectListCount();
				String url = "adminStoreListView.do";
				Paging paging = new Paging(listCount, currentPage, limit, url);
				paging.calculator();

				ArrayList<Store> list = storeService.selectStorePage(paging);

				if (list != null && list.size() > 0) {
					mv.addObject("list", list);
					mv.addObject("paging", paging);

					mv.setViewName("store/adminStoreListView");
				} else {
					mv.addObject("message", currentPage + " 출력 실패");
					mv.setViewName("common/error");
				}

				return mv;
			}
		
		// 매장 수정 페이지 요청
		@RequestMapping(value = "storeUpdateForm.do", method = { RequestMethod.GET, RequestMethod.POST })
		public String moveStoreUpdateView(@RequestParam("store_id") String store_id,
				@RequestParam("page") String currentPage, Model model) {
			//수정페이지로 보낼 store 객체 정보 조회함
			Store store = storeService.selectStore(store_id);

			if (store != null) {
				model.addAttribute("store", store);
				model.addAttribute("currentPage", currentPage);

				return "store/storeUpdateForm";
			} else {
				model.addAttribute("message", store_id + "번 매장 정보 수정 실패!");

				return "common/error";
			}
		}

		// 매장 정보 수정 처리
		@RequestMapping(value = "storeUpdate.do", method = { RequestMethod.GET, RequestMethod.POST })
		public String storeUpdateMethod(Store store, Model model, HttpServletRequest request,
				@RequestParam("page") int page) {

			

			if (storeService.updateStore(store) > 0) {
				// 매장 수정 성공시 수정한 매장이 포함된 매장관리 페이지로 이동
				model.addAttribute("page", page);
				model.addAttribute("store_id", store.getStore_id());

				return "redirect:adminStoreListView.do";
			} else {
				model.addAttribute("message", store.getStore_id() + "매장 수정 실패!");
				return "common/error";
			}
		}

		// 매장 삭제 처리
		@RequestMapping(value = "storeDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
		public String storeDeleteMethod(Store store, HttpServletRequest request, Model model) {
			if (storeService.deleteStore(store) > 0) {
				return "redirect:adminStoreListView.do?page=1";
			} else {
				model.addAttribute("message", store.getStore_id() + "매장 삭제 실패!");
				return "common/error";
			}
		}
	
}
