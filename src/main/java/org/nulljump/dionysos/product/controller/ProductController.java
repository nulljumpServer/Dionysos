package org.nulljump.dionysos.product.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.product.model.service.ProductService;
import org.nulljump.dionysos.product.model.vo.Product;
import org.nulljump.dionysos.review.model.service.ReviewService;
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

public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Autowired
	private ProductService productService;

	@Autowired
	private ReviewService reviewService;

//	@Autowired
//	private StoreService storeService;

//	// 페이지 카운트
//	@RequestMapping("pcount.do")
//	public int getProductListCountMethod(@RequestParam(required = false) Integer product_id) {
//		int count;
//		if (product_id != null) {
//			count = productService.selectListCount();
//		} else {
//			count = productService.selectListCount(); // get count of all products
//		}
//		return count;
//	}

	// 목록 페이지 단위로 목록보기 요청 처리용 메소드
	@RequestMapping("plistView.do")
	public ModelAndView productListMethod(@RequestParam(name = "page", required = false) String page, ModelAndView mv) {

		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 한 페이지에 게시글 10개씩 출력되게 하는 경우 :
		// 페이징 계산 처리 - 별도의 클래스로 작성해서 이용해도 됨
		int limit = 10; // 한 페이지에 출력할 목록 갯수
		// 총 페이지 수 계산을 위해 게시글 총 갯수 조회해 옴
		int listCount = productService.selectListCount();
		Paging paging = new Paging(listCount, currentPage, limit);
		paging.calculator();

		ArrayList<Product> list = productService.selectProductList(paging);

		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("paging", paging);

			mv.setViewName("product/productListView");
		} else {
			mv.addObject("message", currentPage + " ������ ��� ��ȸ ����!");
			mv.setViewName("common/error");
		}

		return mv;
	}

	

	
	// 상품 상세목록페이지 이동 메소드
	@RequestMapping("pdetail.do")
	public String productDetailMethod(HttpSession session, @RequestParam("product_id") int product_id, Model model) {
		Product product = productService.selectProduct(product_id);

		// HttpSession에 최근 본 상품 정보를 저장(최근 본 상품 노출용)
		List<Product> recentProducts = (List<Product>) session.getAttribute("recentProducts");
		if (recentProducts == null) {
			recentProducts = new ArrayList<Product>();
		}
		Iterator<Product> it = recentProducts.iterator();
		while (it.hasNext()) {
			Product p = it.next();
			if (p.getProduct_id() == product_id) {
				it.remove();
			}
		}
		recentProducts.add(0, product);
		if (recentProducts.size() > 3) {
			recentProducts.remove(3);
		}
		if (product != null) {
			model.addAttribute("product", product);
			session.setAttribute("recentProducts", recentProducts);
			return "product/productDetailView";
		} else {
			model.addAttribute("message", product + " ��ǰ�� ǰ�� Ȥ�� �������� �ʽ��ϴ�.");
			return "common/error";
		}
	}

	// 상품 검색기능 메소드(현재 상품 이름 검색 기능만 사용중)
	@RequestMapping(value = "psearch.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String productSearchMethod(HttpServletRequest request, Model model) {
		String action = request.getParameter("action");
		logger.info(action);
		String keyword = null;
		keyword = request.getParameter("keyword");
		ArrayList<Product> list = null;

		switch (action) {

//		case "id": list = productService.selectSearchProductId(Integer.parseInt(keyword));
//					break;
		case "product_name":
			list = productService.selectSearchProductName(keyword);
			break;
		case "product_ename":
			list = productService.selectSearchProductEname(keyword);
			break;
		case "product_price":
			list = productService.selectSearchProductPrice(Integer.parseInt(keyword));
			break;
		case "product_acidity":
			list = productService.selectSearchProductAcidity(Integer.parseInt(keyword));
			break;
		case "product_alcohol":
			list = productService.selectSearchProductAlcohol(Float.parseFloat(keyword));
			break;
		case "product_sweetness":
			list = productService.selectSearchProductSweetness(Integer.parseInt(keyword));
			break;
		case "product_body":
			list = productService.selectSearchProductBody(Integer.parseInt(keyword));
			break;
		case "product_tannin":
			list = productService.selectSearchProductTannin(Integer.parseInt(keyword));
			break;
		case "product_origin":
			list = productService.selectSearchProductOrigin(keyword);
			break;
		case "wine_type":
			list = productService.selectSearchProductType(keyword);
			break;
		} // switch

		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "product/productListView";
		} else {
			model.addAttribute("message", action + " 검색 결과가 없습니다.");
			return "common/error";
		}
	}
	
	//필터링 검색 기능
	@RequestMapping(value = "advsearch.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String advancedSearchMethod(@RequestParam(value = "wine_type", required = false) List<String> wine_type,
			@RequestParam(value = "wine_origin", required = false) List<String> wine_origin,
			@RequestParam(value = "product_price", required = false) String pr,
			@RequestParam(value = "sweetness", required = false) String sw,
			@RequestParam(value = "acidity", required = false) String ac,
			@RequestParam(value = "body", required = false) String bd,
			@RequestParam(value = "tannin", required = false) String ta,
			@RequestParam(value = "page", required = false) String page, Model model) {
//		int currentPage = 1;
//		if (page != null) {
//			currentPage = Integer.parseInt(page);
//		}
//
//		int limit = 10;
//
//		int listCount = productService.selectListCount();
//		Paging paging = new Paging(listCount, currentPage, limit);
//		paging.calculator();
		//RequestParam으로 int 값을 받을 때 해당 값이 존재하지 않으면 null로 인식하지 못해 에러 발생
		// 그래서 아래 별도 처리 사용
		int product_price = -1;
		int sweetness = -1;
		int body = -1;
		int tannin = -1;
		int acidity = -1;
		if (pr != null) {
			product_price = Integer.parseInt(pr);
		}
		if (sw != null) {
			sweetness = Integer.parseInt(sw);
		}
		if (bd != null) {
			body = Integer.parseInt(bd);
		}
		if (ta != null) {
			tannin = Integer.parseInt(ta);
		}
		if (ac != null) {
			acidity = Integer.parseInt(ac);
		}
		ArrayList<Product> list = productService.selectFilter(wine_type, wine_origin, product_price, sweetness, acidity,
				body, tannin);

		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
//			model.addAttribute("paging", paging);
			return "product/productListView";
		} else {
			model.addAttribute("message", "검색 결과가 없거나 실패");
			return "common/error";
		}
	}
	
	
	
	

	//관리자 기능
	
	
	
	// 관리자용 상품 관리 기능 페이지 이동 메소드(페이징)
		@RequestMapping("adminplistView.do")
		public ModelAndView adminProductListMethod(@RequestParam(name = "page", required = false) String page,
				ModelAndView mv) {

			int currentPage = 1;
			if (page != null) {
				currentPage = Integer.parseInt(page);
			}

			// 한 페이지에 게시글 10개씩 출력되게 하는 경우 :
			// 페이징 계산 처리 - 별도의 클래스로 작성해서 이용해도 됨
			int limit = 10;  // 한 페이지에 출력할 목록 갯수
			// 총 페이지 수 계산을 위해 게시글 총 갯수 조회해 옴
			int listCount = productService.selectListCount();
			Paging paging = new Paging(listCount, currentPage, limit);
			paging.calculator();

			ArrayList<Product> list = productService.selectProductList(paging);

			if (list != null && list.size() > 0) {
				mv.addObject("list", list);
				mv.addObject("paging", paging);

				mv.setViewName("admin/productListView");
			} else {
				mv.addObject("message", currentPage + " ������ ��� ��ȸ ����!");
				mv.setViewName("common/error");
			}

			return mv;
		}
	
	//상품 등록 form 이동 메소드
	@RequestMapping(value = "pinsertForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String moveProductInsert() {
		return "product/productInsertForm";
	}

	// 상품 등록 처리 메소드
	@RequestMapping(value = "pinsert.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String productInsertMethod(Product product, Model model, HttpServletRequest request,
			@RequestParam(value = "upfile1", required = false) MultipartFile mfile1,
			@RequestParam(value = "upfile2", required = false) MultipartFile mfile2) {

		// 상품 첨부파일 저장 폴더 경로 지정
		String savePath1 = request.getSession().getServletContext().getRealPath("resources/images/product_single");
		String savePath2 = request.getSession().getServletContext().getRealPath("resources/images/product_detail");

		// 첨부파일1
		String fileName1 = mfile1.getOriginalFilename();

		if (fileName1 != null && fileName1.length() > 0) {

			// 변경할 파일명 만들기
			String renameFileName1 = "wine_single_" + (productService.selectLastProductId() + 1);

			renameFileName1 += "." + fileName1.substring(fileName1.lastIndexOf(".") + 1);
			logger.info("첨부 파일명 확인 : " + fileName1 + ", " + renameFileName1);

			File renameFile1 = new File(savePath1 + "\\" + renameFileName1);

			try {
				mfile1.transferTo(renameFile1);
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("message", "첨부파일1 저장 실패!");
				return "common/error";
			}
			product.setProduct_image("/resources/images/product_single/" + renameFileName1);
		}

		// 첨부파일2
		String fileName2 = mfile2.getOriginalFilename();

		if (fileName2 != null && fileName2.length() > 0) {
			// 변경할 파일명 만들기
			String renameFileName2 = "wine_detail_" + (productService.selectLastProductId() + 1);

			renameFileName2 += "." + fileName2.substring(fileName2.lastIndexOf(".") + 1);
			logger.info("첨부 파일명 확인 : " + fileName2 + ", " + renameFileName2);

			File renameFile2 = new File(savePath2 + "\\" + renameFileName2);

			try {
				mfile2.transferTo(renameFile2);
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("message", "첨부파일2 저장 실패!");
				return "common/error";
			}
			product.setWine_detail("/resources/images/product_detail/" + renameFileName2);
		}

		if (productService.insertProduct(product) > 0) {
			// 상품 등록 성공시 상품관리 - 목록 보기 페이지로 이동
			return "redirect:adminplistView.do";
		} else {
			model.addAttribute("message", product.getProduct_id() + "새 상품 등록 실패!");
			return "common/error";
		}
	}

	// 상품 수정 페이지 요청
	@RequestMapping(value = "pupdateForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String moveProductUpdateView(@RequestParam("product_id") int product_id,
			@RequestParam("page") String currentPage, Model model) {
		//수정페이지로 보낼 product 객체 정보 조회함
		Product product = productService.selectProduct(product_id);

		if (product != null) {
			model.addAttribute("product", product);
			model.addAttribute("currentPage", currentPage);

			return "product/productUpdateForm";
		} else {
			model.addAttribute("message", product_id + "��ǰ ������������ �̵� ����!");

			return "common/error";
		}
	}

	// 상품 정보 수정 처리
	@RequestMapping(value = "pupdate.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String productUpdateMethod(Product product, Model model, HttpServletRequest request,
			@RequestParam(name = "upfile1", required = false) MultipartFile mfile1,
			@RequestParam(name = "upfile2", required = false) MultipartFile mfile2, @RequestParam("page") int page) {

		// 원본 첨부파일 저장 폴더 경로 지정
		String savePath1 = request.getSession().getServletContext().getRealPath("resources/images/product_single");
		String savePath2 = request.getSession().getServletContext().getRealPath("resources/images/product_detail");

		// 새로운 첨부파일이 있을때
		if (!mfile1.isEmpty()) {
			// 이전 첨부파일이 있을 때
			if (product.getProduct_image() != null) {
				// 저장 폴더에 있는 이전 파일을 삭제함
				new File(product.getProduct_image()).delete();
			}

			// 첨부파일1 파일명설정
			String fileName1 = mfile1.getOriginalFilename();

			if (fileName1 != null && fileName1.length() > 0) {
				// 변경할 파일명 만들기
				String renameFileName1 = "wine_single_" + (product.getProduct_id());

				renameFileName1 += "." + fileName1.substring(fileName1.lastIndexOf(".") + 1);
				logger.info("첨부 파일명 확인 : " + fileName1 + ", " + renameFileName1);

				File renameFile1 = new File(savePath1 + "\\" + renameFileName1);

				try {
					mfile1.transferTo(renameFile1);
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "첨부파일1 저장 실패!");
					return "common/error";
				}
				product.setProduct_image("/resources/images/product_single/" + renameFileName1);
			}

		}
		if (!mfile2.isEmpty()) {
			// 이전 첨부파일이 있을 때
			if (product.getWine_detail() != null) {
				// 저장 폴더에 있는 이전 파일을 삭제함
				new File(product.getWine_detail()).delete();
			}
			String fileName2 = mfile2.getOriginalFilename();

			if (fileName2 != null && fileName2.length() > 0) {
				// 변경할 파일명 만들기
				String renameFileName2 = "wine_detail_" + (product.getProduct_id());

				renameFileName2 += "." + fileName2.substring(fileName2.lastIndexOf(".") + 1);
				logger.info("첨부 파일명 확인 : " + fileName2 + ", " + renameFileName2);

				File renameFile2 = new File(savePath2 + "\\" + renameFileName2);

				try {
					mfile2.transferTo(renameFile2);
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "첨부파일2 저장 실패!");
					return "common/error";
				}
				product.setWine_detail("/resources/images/product_detail/" + renameFileName2);
			}
		}

		if (productService.updateProduct(product) > 0) {
			// 상품 수정 성공시 수정한 상품이 포함된 상품관리 페이지로 이동
			model.addAttribute("page", page);
			model.addAttribute("product_id", product.getProduct_id());

			return "redirect:adminplistView.do";
		} else {
			model.addAttribute("message", product.getProduct_id() + "상품 수정 실패!");
			return "common/error";
		}
	}

	// 상품 삭제 처리
	@RequestMapping(value = "pdelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String productDeleteMethod(Product product, HttpServletRequest request, Model model) {
		if (productService.deleteProduct(product) > 0) {
			// 상품 삭제에 성공하면, 저장 폴더에 있는 첨부파일도 같이 삭제 처리
			new File(request.getSession().getServletContext().getRealPath("resources/images/product_single") + "/"
					+ product.getProduct_image()).delete();
			new File(request.getSession().getServletContext().getRealPath("resources/images/product_detail") + "/"
					+ product.getWine_detail()).delete();
			return "redirect:adminplistView.do?page=1";
		} else {
			model.addAttribute("message", product.getProduct_id() + "상품 삭제 실패!");
			return "common/error";
		}
	}
	
	

}
