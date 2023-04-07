package org.nulljump.dionysos.review.controller;

import java.io.File;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.nulljump.dionysos.common.FileNameChange;
import org.nulljump.dionysos.product.model.service.ProductService;
import org.nulljump.dionysos.product.model.vo.Product;
import org.nulljump.dionysos.review.model.service.ReviewService;
import org.nulljump.dionysos.review.model.vo.Review;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
 
@Controller    //xml에 클래스를 controller로 자동 등록해 줌
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private ProductService productService;
	
	public ReviewController(ReviewService reviewService, ProductService productService) {
	    this.reviewService = reviewService;
	    this.productService = productService;
	  }


    // 리뷰 작성 페이지 이동
    @RequestMapping("rwriteForm.do")
    public String moveReviewWriteForm(
    		@RequestParam("product_id") int product_id, Model model) {
    	
    	Product product = productService.selectProduct(product_id);
    	
    	if(product != null) {
    		model.addAttribute("product", product);
    		return "review/reviewWriteForm";
    	}else {
    		model.addAttribute("message", "리뷰를 작성할 수 없습니다.");
			return "common/error";
    	}
    	
    }

    // 리뷰 작성 처리(/*파일 업로드 기능 사용*/)
    @RequestMapping(value = "rwrite.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String reviewMethod(Review review, Model model, HttpServletRequest request, 
    	@RequestParam(name = "upfile", required = false) MultipartFile mfile){
    		
    		//리뷰 첨부파일 저장 폴더 경로 지정 
    		String savePath = request.getSession().getServletContext().getRealPath("resources/review_upfiles");
    		
    		//첨부파일 있을 때
    		if(!mfile.isEmpty()) {
    			
    			String fileName = mfile.getOriginalFilename();
    			
    			if(fileName != null && fileName.length() > 0) {
    				//바꿀 파일명에 대한 문자열 만들기 
    				//공지글 등록 | 수정 요청시점의 날짜시간정보를 이용함
    				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
    				//변경할 파일명 만들기
    				String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
    				
    				//원본 파일의 확장자를 추출해서, 변경 파일명에 붙여줌
    				renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);
    				logger.info("첨부 파일명 확인 : " + fileName + ", " + renameFileName);
    				
    				//폴더에 저장 처리
    				try {
    					mfile.transferTo(new File(savePath + "/" + renameFileName));
    				}catch(Exception e){
    					e.printStackTrace();
    					model.addAttribute("message", "첨부파일 저장 실패!");
    					return "common/error";
    				}
    			}  
    		} //새로운 첨부파일이 있을 때
    		
    		if(reviewService.insertReview(review) > 0) {
    			//리뷰 등록 성공시 목록 보기 페이지로 이동
    			return "redirect:main.do";
    		}else {
    			model.addAttribute("message", review.getReview_id() + "새 리뷰 등록 실패!");
    			return "common/error";
    		}
    	}

    //리뷰 상세 페이지 이동
    @RequestMapping("rdetailView.do")
    public String moveReviewDetailView() {
    	return "review/reviewDetailView";
    }
    
//    // 리뷰 상세 보기 처리용
//    @RequestMapping("rdetail.do")
//    public ModelAndView reviewDetailMethod(ModelAndView mv, @RequestParam("review_id") int review_id,
//    		@RequestParam(name = "page", required = false) String page) {
//    	int currentPage = 1;
//    	if(page != null) {
//    		currentPage = Integer.parseInt(page);
//    	}
//    	
//    	//조회수 1증가 처리
//    	reviewService.updateReviewReadcount(review_id);
//    	
//    	//해당 게시글 조회 
//    	Review review = reviewService.selectReview(review_id);
//    	
//    	if(review != null) {
//    		mv.addObject("review", review);
//    		mv.addObject("currentPage", currentPage);
//    		mv.setViewName("review/reviewDetailView");
//    	}else {
//    		mv.addObject("message", review_id + "번 게시글 조회 실패!");
//    		mv.setViewName("common/error");
//    	}
//    	return mv;
//    }
    
    @RequestMapping("updateView.do")
    public String moveReviewUpdateForm() {
    	return "review/reviewUpdateForm";
    }

    // 리뷰 수정 페이지 이동 처리용
    @RequestMapping("rupdate.do")
    public String moveReviewUpdateView(@RequestParam("review_id") int review_id, @RequestParam("page") int currentPage, Model model) {
        //수정페이지로 보낼 reivew 객체 정보 조회함
    	Review review = reviewService.selectReview(review_id);
    	
    	if(review != null) {
    		model.addAttribute("review", review);
    		model.addAttribute("currentPage", currentPage);
    		
    		return "review/reviewUpdateForm";
    	}else {
    		model.addAttribute("message", review_id + "번 글 수정페이지로 이동 실패!");
    		
    		return "common/error";
    	}
    }

    // 리뷰 수정 처리 (파일 업로드 기능 사용)
    @RequestMapping(value = "rupdate.do", method = RequestMethod.POST)
    public String reviewUpdateMethod(Review review, Model model, HttpServletRequest request,
    		@RequestParam(name = "delflag", required = false) String delFlag,
    		@RequestParam(name = "upfile", required = false) MultipartFile mfile,
    		@RequestParam("page") int page) {
        //리뷰 첨부파일 저장 폴더 경로 지정
    	String savePath = request.getSession().getServletContext().getRealPath("resources/review_upfiles");
    	//1. 원래 첨부파일이 있는데, '파일삭제'를 선택한 경우
    	if(review.getReview_image() != null && delFlag!= null && delFlag.equals("yes")) {
    		//저장 폴더에 있는 파일을 삭제함 
    		new File(savePath + "/" + review.getReview_image()).delete();

    	}
    	//2. 리뷰 첨부파일 1개만 가능한 경우
    	//새로운 첨부파일이 있을 때 
    	if(!mfile.isEmpty()) {
    		//2-1. 이전 첨부파일이 있을 때
    		if(review.getReview_image() != null) {
    			//저장 폴더 안에 있는 이전 파일을 삭제함
    			new File(savePath + "/" + review.getReview_image()).delete();

    		}
    		//2-2. 이전 첨부파일이 없을 때
    		//전송 온 파일이름 추출함
    		String fileName = mfile.getOriginalFilename();
    		
    		if(fileName != null && fileName.length() > 0) {
    			//바꿀 파일명에 대한 문자열 만들기 
    			//공지글 등록 | 수정 요청시점의 날짜시간정보를 이용함
    			String renameFileName = FileNameChange.change(fileName, "yyyyMMddHHmmss");
    			
    			//원본 파일의 확장자를 추출해서, 변경 파일명에 붙여줌
    			renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);
    			logger.info("첨부 파일명 확인 : " + fileName + ", " + renameFileName);
    			
    			//파일 객체 만들기
    			File renameFile = new File(savePath + "/" + renameFileName);
    			
    			//폴더에 저장 처리 
    			try {
    				mfile.transferTo(renameFile);
    			}catch(Exception e) {
    				e.printStackTrace();
    				model.addAttribute("message", "첨부파일 저장 실패!");
    				return "common/error";
    			}
    		} //이름 바꾸기
    	} //새로운 첨부파일이 있을 때
    	
    	if(reviewService.updateReview(review) > 0) {
    		//리뷰 원글 수정시 상세보기 페이지로 이동
    		model.addAttribute("page", page);
    		model.addAttribute("review_id", review.getReview_id());
    		
    		return "redirect:rdetail.do";
    	} else {
    		model.addAttribute("message", review.getReview_id() + "번 리뷰 수정 실패!");
    		return "common/error";
    	}
    }

    // 리뷰 삭제 처리
    @RequestMapping("rdelete.do")
    public String reviewDeleteMethod(Review review, HttpServletRequest request, Model model) {
    	if(reviewService.deleteReview(review) > 0) {
    		//글 삭제가 성공하면, 저장폴더에 있는 첨부파일도 삭제 처리
    			new File(request.getSession().getServletContext().getRealPath("resources/review_upfiles") + "/" + review.getReview_image()).delete();
    			return "redirect:rlist.do?page=1";	
    	}else {
    		model.addAttribute("message", review.getReview_id() + "번 글 삭제 실패!");
    		return "common/error";
    	}
    }
	  
}
