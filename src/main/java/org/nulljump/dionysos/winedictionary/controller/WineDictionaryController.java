package org.nulljump.dionysos.winedictionary.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.winedictionary.model.service.WineDictionaryService;
import org.nulljump.dionysos.winedictionary.model.vo.WineDictionary;
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
public class WineDictionaryController {

	public static final Logger logger = LoggerFactory.getLogger(WineDictionaryController.class);

	@Autowired
	private WineDictionaryService wineDictionaryService;

	// 와인사전 전체 목록보기 요청 처리용
	@RequestMapping("wdlist.do")
	public ModelAndView wineDictionaryListMethod(@RequestParam(name = "page", required = false) String page, ModelAndView mv) {
		
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		int limit = 10; // 한 체이지에 출력할 목록 갯수
		// 총 페이지 수 계산을 위해 게시글 총 갯수 조회해 옴
		int listCount = wineDictionaryService.selectListCount();
		// 페이지 수 계산
		// 주의 : 목록이 11개이면 페이지 수는 2페이지가 됨
		// 나머지 목록 1개도 한 페이지가 필요함
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 시작값과 끝값 계산
		// => 뷰 페이지 아래쪽에 표시할 페이지 숫자를 10개 한다면
		// 현재 페이지가 95라면 91과 100 을 계산해 냄
		int startPage = ((currentPage - 1) / 10) * 10 + 1;
		int endPage = startPage + 10 - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		// 쿼리문에 전달할 현재 페이지에 출력할 목록의 시작행과
		// 끝행을 계산
		String url = "wdlist.do";
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		Paging paging = new Paging(listCount, startRow, endRow, url);
		paging.calculator();

		// 페이징 계산 끝 : new Paging(limit, currentPage)-------------------------

		ArrayList<WineDictionary> list = wineDictionaryService.selectList(paging);

		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("listCount", listCount);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("limit", limit);

			mv.setViewName("wineDictionary/wineDictionaryListView");
		} else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패!");
			mv.setViewName("common/error");
		}

		return mv;
	}

	// 와인사전 품종 검색용
	@RequestMapping(value = "wdsearchTitle.do", method = RequestMethod.POST)
	public String wineDictionarySearchTitleMethod(@RequestParam("keyword") String keyword, Model model) {

		ArrayList<WineDictionary> list = wineDictionaryService.selectSearchTitle(keyword);
		logger.info(keyword);

		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "wineDictionary/wineDictionaryListView";
		} else {
			model.addAttribute("message", keyword + "으로 검색된 와인품종 정보가 없습니다.");
			return "common/error";
		}
	}

	// 와인사전 상세보기
	@RequestMapping("wddetail.do")
	public String wineDictionaryDetailMethod(@RequestParam("wine") String wine, Model model, HttpSession session) {

		WineDictionary wineDictionary = wineDictionaryService.selectWineDictionary(wine);
		logger.info(wine);

		if (wineDictionary != null) {
			model.addAttribute("wineDictionary", wineDictionary);
			return "wineDictionary/wineDictionaryDetailView";
		} else {
			model.addAttribute("message", "해당 데이터가 존재하지 않습니다.");
			return "common/error";
		}

	}
	
}
