package org.nulljump.dionysos.stock.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.product.model.service.ProductService;
import org.nulljump.dionysos.product.model.vo.Product;
import org.nulljump.dionysos.stock.model.service.StockService;
import org.nulljump.dionysos.stock.model.vo.Stock;
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
public class StockController {
	
	private static final Logger logger = LoggerFactory.getLogger(StockController.class);
	
	@Autowired
	private StockService stockService;
	
	@Autowired
	private ProductService productService;
	
	// 매장관리자 재고검색기능 메소드 (페이징 적용)
				@RequestMapping(value = "stockSearch.do", method = { RequestMethod.GET, RequestMethod.POST })
				public ModelAndView adminstockSearchMethod(ModelAndView mv, HttpServletRequest request,
						@RequestParam(value = "page", required = false) String page,
						@RequestParam("store_id") String store_id) {
					String action = request.getParameter("action");
					logger.info("action : " + action);
					
					String keyword = null;
					keyword = request.getParameter("keyword");
					logger.info("keyword : " + keyword);
					logger.info("store_id : " + store_id);
					
					int currentPage = 1;
					if (page != null) {
						currentPage = Integer.parseInt(page);
					}
					String url = "stockSearch.do";
					int limit = 10;
					int listCount = stockService.selectSearchStockCount(action, keyword, store_id);
					logger.info("paging : " + listCount + ", " + currentPage + ", " + limit + ", " +  url);
					Paging paging = new Paging(listCount, currentPage, store_id, limit, url);  //미적용 상태
				
					
					paging.setListCount(listCount);
					paging.calculator();
					logger.info("paging : " + listCount + ", " + currentPage + ", " + limit + ", " +  url);
					
					ArrayList<Stock> list = stockService.selectSearchStock(action, keyword, paging, store_id);

					if (list != null && list.size() > 0) {
						mv.addObject("list", list);
						mv.addObject("action", action);
						mv.addObject("keyword", keyword);
						mv.addObject("paging", paging);
						mv.setViewName("stock/stockListView");
						
					} else {
						mv.addObject("message", action + " 검색 결과가 없습니다.");
						mv.setViewName("common/error");
					}
					return mv;
				}
				// 재고 추가화면 검색결과 페이징
				@RequestMapping(value = "insertstockSearch.do", method = { RequestMethod.GET, RequestMethod.POST })
				public ModelAndView insertstockSearchMethod(ModelAndView mv, HttpServletRequest request,
						@RequestParam(value = "page", required = false) String page,
						@RequestParam("store_id") String store_id) {
					String action = request.getParameter("action");
					logger.info("action : " + action);
					
					String keyword = null;
					keyword = request.getParameter("keyword");
					logger.info("keyword : " + keyword);
					logger.info("store_id : " + store_id);
					
					int currentPage = 1;
					if (page != null) {
						currentPage = Integer.parseInt(page);
					}
					String url = "insertstockSearch.do";
					int limit = 10;
					int listCount = stockService.selectSearchStockCount(action, keyword, store_id);
					logger.info("paging : " + listCount + ", " + currentPage + ", " + limit + ", " +  url);
					Paging paging = new Paging(listCount, currentPage, store_id, limit, url);  //미적용 상태
				
					
					paging.setListCount(listCount);
					paging.calculator();
					logger.info("paging : " + listCount + ", " + currentPage + ", " + limit + ", " +  url);
					
					ArrayList<Product> list = productService.selectSearchProduct(action, keyword, paging);

					if (list != null && list.size() > 0) {
						mv.addObject("list", list);
						mv.addObject("action", action);
						mv.addObject("keyword", keyword);
						mv.addObject("paging", paging);
						mv.addObject("store_id", store_id);
						mv.setViewName("stock/stockInsertForm");
						
					} else {
						mv.addObject("message", action + " 검색 결과가 없습니다.");
						mv.setViewName("common/error");
					}
					return mv;
				}
				
			
			
			
			// 매장관리자용 재고관리 기능 페이지 이동 메소드(페이징)
				@RequestMapping("adminStockListView.do")
				public ModelAndView adminStockListMethod(@RequestParam(name = "page", required = false) String page,
						@RequestParam("store_id") String store_id,
						ModelAndView mv) {

					int currentPage = 1;
					if (page != null) {
						currentPage = Integer.parseInt(page);
					}
						
					// 한 페이지에 게시글 10개씩 출력되게 하는 경우 :
					// 페이징 계산 처리 - 별도의 클래스로 작성해서 이용해도 됨
					int limit = 10;  // 한 페이지에 출력할 목록 갯수
					// 총 페이지 수 계산을 위해 게시글 총 갯수 조회해 옴
					int listCount = stockService.selectListCount(store_id);
					String url = "adminStockListView.do";
					Paging paging = new Paging(listCount, currentPage, store_id, limit, url); //미적용 상태
					paging.calculator();
					
					Map<String, Object> paramMap = new HashMap<String, Object>();
			    	paramMap.put("store_id", store_id);
					paramMap.put("paging", paging);
					

					ArrayList<Stock> list = stockService.selectStockPage(paramMap);

					if (list != null && list.size() > 0) {
						mv.addObject("list", list);
						mv.addObject("paging", paging);
						mv.addObject("store_id", store_id);

						mv.setViewName("stock/stockListView");
					} else {
						mv.addObject("message", currentPage + " 출력 실패");
						mv.setViewName("common/error");
					}

					return mv;
				}
				// 재고정보 추가 폼 이동
				@RequestMapping(value = "stinsertForm.do", method = { RequestMethod.GET, RequestMethod.POST })
				public ModelAndView moveStockInsert(@RequestParam(name = "page", required = false) String page, ModelAndView mv,
						@RequestParam("store_id") String store_id) {
					int currentPage = 1;
					if (page != null) {
						currentPage = Integer.parseInt(page);
					}
						logger.info("store_id : " + store_id);	
					int limit = 10;
					int listCount = productService.selectListCount();
					String url = "stinsertForm.do";
					Paging paging = new Paging(listCount, currentPage, limit, url);
					paging.calculator();

					ArrayList<Product> list = productService.selectProductList(paging);
					
					if (list != null && list.size() > 0) {
						mv.addObject("list", list);
						mv.addObject("listCount", listCount);
						mv.addObject("store_id", store_id);
						mv.addObject("paging", paging);
						mv.addObject("currentPage", currentPage);

						mv.setViewName("stock/stockInsertForm");
					} else {
						mv.addObject("message", currentPage + " 출력 실패!");
						mv.setViewName("common/error");
					}

					return mv;
				}
				
				// 재고 정보 추가 처리
				@RequestMapping(value = "stockInsert.do", method = { RequestMethod.GET, RequestMethod.POST })
				public String stockInsertMethod(Stock stock, Model model, HttpServletRequest request,
						@RequestParam("store_id") String store_id,
						@RequestParam(value= "page", required= false) String page) {
					logger.info("page : " + page);
					if (stockService.insertStock(stock) > 0) {
		
						model.addAttribute("page", page);
						model.addAttribute("store_id", store_id);

						return "redirect:adminStockListView.do";
					} else {
						model.addAttribute("message", stock.getProduct_name() + "재고 추가 실패!");
						return "common/error";
					}
				}
			
			// 재고 수정 페이지 요청
			@RequestMapping(value = "stockUpdateForm.do", method = { RequestMethod.GET, RequestMethod.POST })
			public String moveStockUpdateView(@RequestParam("stock_id") String stock_id,
					@RequestParam("page") String page, Model model) {
				//수정페이지로 보낼 stock 객체 정보 조회함
				Stock stock = stockService.selectStock(stock_id);
				logger.info("stock : " + stock);
				if (stock != null) {
					model.addAttribute("stock", stock);
					model.addAttribute("currentPage", page);

					return "stock/stockUpdateForm";
				} else {
					model.addAttribute("message", stock_id + "번 재고 정보 수정 실패!");

					return "common/error";
				}
			}

			// 재고 정보 수정 처리
			@RequestMapping(value = "stockUpdate.do", method = { RequestMethod.GET, RequestMethod.POST })
			public String stockUpdateMethod(Stock stock, Model model, HttpServletRequest request,
					@RequestParam(value = "store_id", required = false) String store_id,
					@RequestParam("page") int page) {
				
				if (stockService.updateStock(stock) > 0) {
					// 매장 수정 성공시 수정한 매장이 포함된 매장관리 페이지로 이동
					model.addAttribute("page", page);
					model.addAttribute("store_id", store_id);

					return "redirect:adminStockListView.do";
				} else {
					model.addAttribute("message", stock.getProduct_name() + "재고 수정 실패!");
					return "common/error";
				}
			}

			// 재고 삭제 처리
			@RequestMapping(value = "stockDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
			public String stockDeleteMethod(Stock stock, HttpServletRequest request, Model model,
					@RequestParam(value = "store_id", required = false) String store_id) {
				if (stockService.deleteStock(stock) > 0) {
					model.addAttribute("store_id", store_id);
					return "redirect:adminStockListView.do?page=1";
				} else {
					model.addAttribute("message", stock.getStock_id() + "재고 삭제 실패!");
					return "common/error";
				}
			}
}
