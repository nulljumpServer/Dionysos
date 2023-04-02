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

	// ��ǰ ��� ó��
	@RequestMapping(value = "pinsert.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String productInsertMethod(Product product, Model model, HttpServletRequest request,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile) {
		
		//��ǰ ÷������ ���� ���� ��� ����
		String savePath = request.getSession().getServletContext().getRealPath("resources/product_upfiles");
		
		//÷������
		String fileName = mfile.getOriginalFilename();
		
		if(fileName != null && fileName.length() > 0) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			//������ ���ϸ� �����
		    String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
			
		    renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);
		    logger.info("÷�� ���ϸ� Ȯ�� : " + fileName + ", " + renameFileName);
		    
		    File renameFile = new File(savePath +"\\" + renameFileName);
		    
		    try {
		    	mfile.transferTo(renameFile);
		    }catch(Exception e){
		    	e.printStackTrace();
		    	model.addAttribute("message", "÷������ ���� ����!");
		    	return "common/error";
		    }
		}
		if(productService.insertProduct(product) > 0) {
			//��ǰ ��� ������ ��� ���� �������� �̵�
			return "redirect:plistView.do";
		}else {
			model.addAttribute("message", product.getProduct_id() + "�� ��ǰ ��� ����!");
			return "common/error";
		}
	}
	
	// ��ǰ ���� ������ ��û
	@RequestMapping(value="pupdateForm.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String moveProductUpdateView(@RequestParam("product_id") int product_id, @RequestParam("page") int currentPage, Model model) {
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

	// ��ǰ ���� ó��
	@RequestMapping(value = "pupdate.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String productUpdateMethod(Product product, Model model, HttpServletRequest request,
			@RequestParam(name = "delflag", required = false) String delFlag,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile,
			@RequestParam("page") int page) {
		
		//��ǰ ÷������ ���� ���� ��� ����
		String savePath = request.getSession().getServletContext().getRealPath("resources/product_upfiles");
		
		//÷�������� ���� ó���� ��� ------------------------------------------
		if(product.getProduct_image() != null && delFlag != null && delFlag.equals("yes")) {
			//���� ������ �ִ� ������ ������
			new File(savePath + "/" + product.getProduct_image()).delete();
		}
		//2.��ǰ ÷������ 1���� ������ ���
		//���ο� ÷������ ���� ��
		if(!mfile.isEmpty()) {
			//2-1. ���� ÷�������� ���� ��
			if(product.getProduct_image() != null) {
				//���� ������ �ִ� ���� ���� ������
				new File(savePath + "/" + product.getProduct_image()).delete();
			}
			//2-2. ���� ÷�������� ���� ��
			//���� �� �����̸� ������
			String fileName = mfile.getOriginalFilename();
			
			if(fileName != null && fileName.length() > 0) {
				String renameFileName = FileNameChange.change(fileName, "yyyyMMddHHmmss");
				
				renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);
				logger.info("÷�� ���ϸ� Ȯ�� : " + fileName + ", " + renameFileName);
				
				//���� ��ü �����
				File renameFile = new File(savePath + "/" + renameFileName);
				
				//������ ���� ó��
				try {
					mfile.transferTo(renameFile);
				}catch(Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "÷������ ���� ����!");
					return "common/error";
				}
			}
		}

		if(productService.updateProduct(product) > 0) {
			//��ǰ ���� ������ �󼼺��� �������� �̵�
			model.addAttribute("page", page);
			model.addAttribute("product_id", product.getProduct_id());
			
			return "redirect:pdetailView.do";
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
    			new File(request.getSession().getServletContext().getRealPath("resources/product_upfiles") + "/" + product.getProduct_image()).delete();
    			return "redirect:plistView.do?page=1";	
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
