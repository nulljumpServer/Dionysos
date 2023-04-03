package org.nulljump.dionysos.product.controller;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.nulljump.dionysos.common.FileNameChange;
import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.product.model.service.ProductService;
import org.nulljump.dionysos.product.model.vo.Product;
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

@Controller   //xml�� Ŭ������ controller�� �ڵ� ����� ��
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductController(ProductService productService) {
		this.productService = productService;
	}
	
	//��ǰ ����� �� ���� ������
	@RequestMapping("pcount.do")
	public int getProductListCountMethod(@RequestParam(required = false) Integer product_id) {
	    int count;
	    if (product_id != null) {
	        count = productService.selectListCount();
	    } else {
	        count = productService.selectListCount(); // get count of all products
	    }
	    return count;
	}
	
//	@RequestMapping("plist.do")
//	public String moveProductlistView() {
//		return "product/productListView";
//	}
	
//	//��ǰ ��� ������ ������
//	@GetMapping
//	public ArrayList<Product> selectPrductsList() {
//		return productService.selectProductList();
//	}
	
	//��� ������ ������ ��Ϻ��� ��û ó���� �޼ҵ�
	@RequestMapping("plistView.do")
	 public ModelAndView productListMethod(@RequestParam(name = "page", required = false) String page, ModelAndView mv) {

		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// �� �������� �Խñ� 10���� ��µǰ� �ϴ� ��� :
		// ����¡ ��� ó�� - ������ Ŭ������ �ۼ��ؼ� �̿��ص� ��
		int limit = 10; // �� �������� ����� ��� ����
		// �� ������ �� ����� ���� �Խñ� �� ���� ��ȸ�� ��
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
	
	@RequestMapping("adminplistView.do")
	 public ModelAndView adminProductListMethod(@RequestParam(name = "page", required = false) String page, ModelAndView mv) {

		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// �� �������� �Խñ� 10���� ��µǰ� �ϴ� ��� :
		// ����¡ ��� ó�� - ������ Ŭ������ �ۼ��ؼ� �̿��ص� ��
		int limit = 10; // �� �������� ����� ��� ����
		// �� ������ �� ����� ���� �Խñ� �� ���� ��ȸ�� ��
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
//	public ModelAndView productListMethod(@RequestParam(name = "page", required = false) String page, ModelAndView mv) {
//		
//		int currentPage = 1;
//		if(page != null) {
//			currentPage = Integer.parseInt(page);
//		}
//		//�� �������� ��ǰ 10���� ��µǰ� ��
//		int limit = 10;
//		int listCount = productService.getListCount();
//		int maxPage = (int)((double)listCount / limit + 0.9);
//		int startPage = ((currentPage - 1) / 10) * 10 + 1;
//		int endPage = startPage + 10 - 1;
//		
//		if(maxPage < endPage) {
//			endPage = maxPage;
//		}
//		
//		//�������� ������ ���� �������� ����� ����� ������� ������ ���
//		int startRow = (currentPage - 1) * limit + 1;
//		int endRow = startRow + limit - 1;
//		Paging paging = new Paging(startRow, endRow);
//		
//		ArrayList<Product> list = productService.selectProductList(paging);
//		
//		if(list != null && list.size() > 0) {
//			mv.addObject("list", list);
//			mv.addObject("listCount", listCount);
//			mv.addObject("maxPage", maxPage);
//			mv.addObject("currentPage", currentPage);
//			mv.addObject("startPage", startPage);
//			mv.addObject("endPage", endPage);
//			mv.addObject("limit", limit);
//			
//			mv.setViewName("product/productListView");
//		}else {
//			mv.addObject("message", currentPage + "������ ��� ��ȸ ����!");
//			mv.setViewName("common/error");
//		}
//		return mv;
//	}
	
	// ��ǰ ����Ʈ ������ ��û ó��
//	@RequestMapping(value = "plistView.do", method = RequestMethod.GET)
//	public String productListMethod(Model model, HttpServletRequest request, HttpServletResponse response) {
//		ArrayList<Product> selectProductList = productService.selectProductList(Paging page);
//		model.addAttribute("selectProductList", selectProductList);
//		return "product/productListView";
//	}
	
//	//��ǰ ����Ʈ ����
//	@RequestMapping(value="pfilterList.do", method = RequestMethod.POST)
//	public String productFilterListMethod() {
//		ArrayList<Product> selectFilterProductList = productService.selectFilterProductList();
//		return "product/productListView";
//	}
	
	//�ֱ� �� ��ǰ 3��
	@RequestMapping(value="platest3.do", method=RequestMethod.POST)
	public String productLatest3Method() {
		return null;
	}
	
	
//	//�Ż�ǰ ��ǰ 3��
//	@RequestMapping(value="pnew3.do", method=RequestMethod.POST)
//	@ResponseBody
//	public String productNew3Method() throws UnsupportedEncodingException {
//		ArrayList<Product> list = productService.selectNew3();
//		logger.info("pnew3.do : " + list.size());
//		
//		JSONObject sendJson = new JSONObject();
//		JSONArray jarr = new JSONArray();
//		
//		for(Product product : list) {
//			JSONObject job = new JSONObject();
//			
//			job.put("product_name", URLEncoder.encode(product.getProduct_name(), "utf-8"));
//			job.put("product_ename", product.getProduct_ename());
//			job.put("product_price",  product.getProduct_price());
//			job.put("product_image",  product.getProduct_image());
//			
//			jarr.add(job);
//		}
//		sendJson.put("list", jarr);
//		
//		return sendJson.toJSONString();
//		
//	}
//	
//	@RequestMapping(value = "ptop5.do", method = RequestMethod.POST)
//	@ResponseBody
//	public String productTop5Method() throws UnsupportedEncodingException {
//		// ajax�� ��û�� ���� ����� ���������� ����
//		// response ��ü �̿��
//		// 1. ��½�Ʈ������ �����ϴ� ��� (��: ���̵� �ߺ�üũ)
//		// 2. �丮������ �����ϴ� ��� : response body�� ���� ����
//
//		// ��ȸ�� ���� �α� �Խñ� 5�� ��ȸ�� ��
//		ArrayList<Product> list = productService.selectTop5();
//		logger.info("ptop5.do : " + list.size()); // 5�� ��� Ȯ��
//
//		// ���ۿ� json ��ü �غ�
//		JSONObject sendJson = new JSONObject();
//		// ����Ʈ ������ json �迭 ��ü �غ�
//		JSONArray jarr = new JSONArray();
//
//		// list�� jarr�� �ű�� (����)
//		for (Product product : list) {
//			// notice �� �� �ʵ尪 ������ json ��ü ����
//			JSONObject job = new JSONObject();
//
//			job.put("product_image", product.getProduct_image());
//			// �ѱۿ� ���ؼ��� ���ڵ��ؼ� json�� �㵵�� �� (�ѱ۱��� ����)
//			job.put("product_name", URLEncoder.encode(product.getProduct_name(), "utf-8"));
//			// ��¥�� �ݵ�� toString() ���� ���ڿ��� �ٲ㼭 json�� ��ƾ� ��
//			job.put("product_price", product.getProduct_price());
//
//			jarr.add(job); // job�� jarr�� �߰���
//		}
//
//		// ���ۿ� ��ü�� jarr �� ����
//		sendJson.put("list", jarr);
//
//		// json�� json string Ÿ������ �ٲ㼭 ���۵ǰ� ��
//		return sendJson.toJSONString(); // �丮������ ����
//		// servlet-context.xml �� json string �������� JsonView ��� �丮������ �߰� ����ؾ� ��
//
//	}
	
//	//��ǰ �󼼺��� ������ ���������
//	@RequestMapping("pdetail.do")
//	public String moveProductDetailView() {
//		return "product/productDetailView";
//	}
	
//	// ��ǰ �󼼺��� ������ ��û ó��
//	@RequestMapping("pdetailView.do")
//	public ModelAndView productDetailMethod(ModelAndView mv, @RequestParam("product_id") int product_id,
//			@RequestParam(name = "page", required = false) String page) {
//		int currentPage = 1;
//		if (page != null) {
//			currentPage = Integer.parseInt(page);
//		}
//
////		// ��ȸ�� 1 ���� ó��
////		boardService.updateBoardReadcount(board_num);
//
//		// �ش� �Խñ� ��ȸ
//		Product product = productService.selectProduct(product_id);
//
//		if (product != null) {
//			mv.addObject("product", product);
//			mv.addObject("currentPage", currentPage);
//
//			mv.setViewName("product/productDetailView");
//		} else {
//			mv.addObject("message", product_id + "�� �Խñ� ��ȸ ����!");
//			mv.setViewName("common/error");
//		}
//
//		return mv;
//	}
	@RequestMapping("pdetail.do")
	public String productDetailMethod(
			@RequestParam("product_id") int product_id, Model model) {
		Product product = productService.selectProduct(product_id);
		if(product != null) {
			model.addAttribute("product", product);
			
			return "product/productDetailView";
		}else {
			model.addAttribute("message", product + " ��ǰ�� ǰ�� Ȥ�� �������� �ʽ��ϴ�.");
			return "common/error";
		}
	}

//	//���� ������ ���������
//	@RequestMapping(value="paymentPage.do", method= {RequestMethod.GET, RequestMethod.POST})
//	public String movePaymentPage() {
//		return "payment/paymentPage";
//	}
//	
//	//��ٱ��� ������ ���������
//	@RequestMapping(value="cartsPage.do", method= {RequestMethod.GET, RequestMethod.POST})
//	public String moveCartsPage() {
//		return "carts/cartsPage";
//	}
	
	//��ǰ �˻� ��ȸ
	@RequestMapping(value="psearch.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String productSearchMethod(HttpServletRequest request, Model model) {
		String action = request.getParameter("action");
		logger.info(action);
		String keyword = null;
		keyword = request.getParameter("keyword");
		ArrayList<Product> list = null;
		
		switch(action) {
		
//		case "id": list = productService.selectSearchProductId(Integer.parseInt(keyword));
//					break;
		case "product_name": list = productService.selectSearchProductName(keyword);
					break;
		case "product_ename": list = productService.selectSearchProductEname(keyword);
					break;
		case "product_price": list = productService.selectSearchProductPrice(Integer.parseInt(keyword));
					break;
		case "product_acidity": list = productService.selectSearchProductAcidity(Integer.parseInt(keyword));
					break;
		case "product_alcohol": list = productService.selectSearchProductAlcohol(Float.parseFloat(keyword));
					break;
		case "product_sweetness": list = productService.selectSearchProductSweetness(Integer.parseInt(keyword));
					break;
		case "product_body": list = productService.selectSearchProductBody(Integer.parseInt(keyword));
					break;
		case "product_tannin": list = productService.selectSearchProductTannin(Integer.parseInt(keyword));
					break;
		case "product_origin": list = productService.selectSearchProductOrigin(keyword);
					break;
		case "wine_type": list = productService.selectSearchProductType(keyword);
					break;
		}  //switch
		
		if(list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "product/productListView";
		}else {
			model.addAttribute("message", action + " ��ǰ�� ǰ�� Ȥ�� �������� �ʽ��ϴ�.");
			return "common/error";
		}
	}
	
	//������ ���
	
	//������ Ȯ�ο� �޼ҵ�
	
	// ��ǰ ��� ������ ��û
	@RequestMapping(value="pinsertForm.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String moveProductInsert() {
		return "product/productInsertForm";
	}

	// 상품 등록 처리
	@RequestMapping(value = "pinsert.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String productInsertMethod(Product product, Model model, HttpServletRequest request,
	        @RequestParam(value="upfile1", required= false) MultipartFile mfile1,
	        @RequestParam(value="upfile2", required= false) MultipartFile mfile2) {

	    // 상품 첨부파일 저장 폴더 경로 지정
	    String savePath1 = request.getSession().getServletContext().getRealPath("resources/images/product_single");
	    String savePath2 = request.getSession().getServletContext().getRealPath("resources/images/product_detail");

	    // 첨부파일1
	    String fileName1 = mfile1.getOriginalFilename();

	    if (fileName1 != null && fileName1.length() > 0) {
//	        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	        // 변경할 파일명 만들기
	        String renameFileName1 = "wine_single_" + (productService.selectLastProductId() + 1) ;

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
//	        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	        // 변경할 파일명 만들기
	        String renameFileName2 = "wine_detail_" + (productService.selectLastProductId() + 1) ;

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
	        product.setWine_detail("/resources/images/product_detail/" +  renameFileName2);
	    }
	   
	    
	    if (productService.insertProduct(product) > 0) {
	        // 상품 등록 성공시 목록 보기 페이지로 이동
	        return "redirect:adminplistView.do";
	    } else {
	        model.addAttribute("message", product.getProduct_id() + "새 상품 등록 실패!");
	        return "common/error";
	    }
	}
	
		// 상품 수정 페이지 요청
	@RequestMapping(value="pupdateForm.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String moveProductUpdateView(@RequestParam("product_id") int product_id, @RequestParam("page") String currentPage, Model model) {
		//������������ ���� product ��ü ���� ��ȸ��
		Product product = productService.selectProduct(product_id);
		
		if(product != null) {
			model.addAttribute("product", product);
//			model.addAttribute("currentPage", currentPage);
			
			return "product/productUpdateForm";
		}else {
			model.addAttribute("message", product_id +"��ǰ ������������ �̵� ����!");
			
			return "common/error";
		}
	}

	// 상품 삭제 처리
	@RequestMapping(value = "pupdate.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String productUpdateMethod(Product product, Model model, HttpServletRequest request,
			@RequestParam(name = "upfile1", required = false) MultipartFile mfile1,
			@RequestParam(name = "upfile2", required = false) MultipartFile mfile2,
			@RequestParam("page") String page) {
		
		// 원본 첨부파일 저장 폴더 경로 지정
		String savePath1 = request.getSession().getServletContext().getRealPath("resources/images/product_single");
		String savePath2 = request.getSession().getServletContext().getRealPath("resources/images/product_detail");

		
	// 새로운 첨부파일이 있을때
		if(!mfile1.isEmpty()) {
			// 이전 첨부파일이 있을 때
			if(product.getProduct_image() != null) {
				// 저장 폴더에 있는 이전 파일을 삭제함
				new File(product.getProduct_image()).delete();
			}
			
			// 첨부파일1
		    String fileName1 = mfile1.getOriginalFilename();

		    if (fileName1 != null && fileName1.length() > 0) {
//		        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		        // 변경할 파일명 만들기
		        String renameFileName1 = "wine_single_" + (product.getProduct_image()) ;

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
		if(!mfile2.isEmpty()) {
			// 이전 첨부파일이 있을 때
			if(product.getWine_detail() != null) {
				// 저장 폴더에 있는 이전 파일을 삭제함
				new File(product.getWine_detail()).delete();
			}
			String fileName2 = mfile2.getOriginalFilename();

		    if (fileName2 != null && fileName2.length() > 0) {
//		        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		        // 변경할 파일명 만들기
		        String renameFileName2 = "wine_detail_" + (product.getWine_detail()) ;

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
		        product.setWine_detail("/resources/images/product_detail/" +  renameFileName2);
		    }
		}

		if(productService.updateProduct(product) > 0) {
			//��ǰ ���� ������ �󼼺��� �������� �̵�
			model.addAttribute("page", page);
			model.addAttribute("product_id", product.getProduct_id());
			
			return "redirect:adminplistView.do";
		} else {
			model.addAttribute("message", product.getProduct_id() + "��ǰ ���� ����!");
			return "common/error";
		}
	}


	// ��ǰ ���� ó��
	@RequestMapping(value = "pdelete.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String productDeleteMethod(Product product, HttpServletRequest request, Model model) {
    	if(productService.deleteProduct(product) > 0) {
    		//�� ������ �����ϸ�, ���������� �ִ� ÷�����ϵ� ���� ó��
    			new File(request.getSession().getServletContext().getRealPath("resources/images/product_single") + "/" + product.getProduct_image()).delete();
    			new File(request.getSession().getServletContext().getRealPath("resources/images/product_detail") + "/" + product.getWine_detail()).delete();
    			return "redirect:adminplistView.do?page=1";	
    	}else {
    		model.addAttribute("message", product.getProduct_id() + "��ǰ ���� ����!");
    		return "common/error";
    	}
    }
	
	 @RequestMapping(value="advsearch.do", method=RequestMethod.POST) 
	 public String advancedSearchMethod(@RequestParam("wine_type") List<String> wine_type, 
			 						     @RequestParam("wine_origin") List<String> wine_origin,
			 						    @RequestParam("product_price") List<String> product_price,
			 						   @RequestParam("sweetness") int sweetness,
			 						  @RequestParam("acidity") int acidity,
			 						 @RequestParam("body") int body,
			 						@RequestParam("tannin") int tannin, Model model) {
		 
		 return "redirect:product/productList";
	 }	
		

	
	
		
		
		
}
