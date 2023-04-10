package org.nulljump.dionysos.store.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.store.model.service.StoreService;
import org.nulljump.dionysos.store.model.vo.Store;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StoreController {

	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);

	@Autowired
	private StoreService storeService;
	
	public StoreController(StoreService stroeService) {
		this.storeService = storeService;
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
		
//		//매장 등록 form 이동 메소드
//		@RequestMapping(value = "storeInsertForm.do", method = { RequestMethod.GET, RequestMethod.POST })
//		public String movestoreInsert() {
//			return "store/storeInsertForm";
//		}

//		// 매장 등록 처리 메소드
//		@RequestMapping(value = "storeInsert.do", method = { RequestMethod.GET, RequestMethod.POST })
//		public String storeInsertMethod(Store store, Model model, HttpServletRequest request) {
//
//			
//			if (storeService.insertStore(store) > 0) {
//				// 매장 등록 성공시 매장관리 - 목록 보기 페이지로 이동
//				return "redirect:adminplistView.do";
//			} else {
//				model.addAttribute("message", store.getStore_id() + "새 매장 등록 실패!");
//				return "common/error";
//			}
//		}

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
