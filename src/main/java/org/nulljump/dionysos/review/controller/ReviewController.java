package org.nulljump.dionysos.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.product.model.service.ProductService;
import org.nulljump.dionysos.product.model.vo.Product;
import org.nulljump.dionysos.review.model.service.ReviewService;
import org.nulljump.dionysos.review.model.vo.Review;
import org.nulljump.dionysos.users.model.service.UsersService;
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
 
@Controller    //xml에 클래스를 controller로 자동 등록해 줌
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private UsersService usersService;
	
	public ReviewController(ReviewService reviewService, ProductService productService, UsersService usersService) {
	    this.reviewService = reviewService;
	    this.productService = productService;
	    this.usersService = usersService;
	  }


    // 리뷰 작성 페이지 이동
    @RequestMapping("rwriteForm.do")
    public String moveReviewWriteForm(
    		@RequestParam("product_id") int product_id,
    		@RequestParam("user_id") String user_id,
    		Model model, HttpSession session, HttpServletRequest request) {
    	
    	Users users = (Users) session.getAttribute("loginUsers");
    	Product product = productService.selectProduct(product_id);
    	
    	logger.info("product_id : " + product_id);
    	
    	if(users != null) {
    		//model.addAttribute("users", users);
    		model.addAttribute("product", product);
    		return "review/reviewWriteForm";
    	}else {
    		return "users/loginPage";
    	}
    	
    }
    
 // 관리자용 리뷰 관리 기능 페이지 이동 메소드(페이징)
 		@RequestMapping("adminReviewListView.do")
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
 			int listCount = reviewService.selectListCount();
 			String url = "adminReviewListView.do";
 			Paging paging = new Paging(listCount, currentPage, limit, url);
 			paging.calculator();

 			ArrayList<Review> list = reviewService.selectReviewList(paging);

 			if (list != null && list.size() > 0) {
 				mv.addObject("list", list);
 				mv.addObject("paging", paging);

 				mv.setViewName("product/AdminProductListView");
 			} else {
 				mv.addObject("message", currentPage + " 출력 실패");
 				mv.setViewName("common/error");
 			}

 			return mv;
 		}

    // 리뷰 작성 처리(/*파일 업로드 기능 사용*/)
    @RequestMapping(value = "rwrite.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String reviewMethod(Review review, Model model, HttpServletRequest request, HttpServletResponse response, 
    	@RequestParam(name = "upfile", required = false) MultipartFile mfile) throws IOException{
    		
    		if(reviewService.insertReview(review) > 0) {
    			//리뷰 등록 성공시 목록 보기 페이지로 이동
    			return "redirect:pdetail.do?product_id="+ review.getProduct_id();
    		}else {
    			model.addAttribute("message", review.getReview_id() + "새 리뷰 등록 실패!");
    			return "common/error";
    		}
    	}
    
    @RequestMapping(value="rdetail.do", method= {RequestMethod.GET, RequestMethod.POST})
    public String reviewDetailMethod(
    		@RequestParam("review_id") int review_id, Model model) {
    	logger.info("review_id : " + review_id);

    	
    	Review review = reviewService.selectReview(review_id);
    	logger.info("review : " + review);
    	
    	//조회수 1증가 처리
    	reviewService.updateReviewReadcount(review_id);

    	
    	if(review != null) {
    		model.addAttribute("review", review);
    		return "review/reviewDetailView";
    	}else {
    		model.addAttribute("message", "리뷰가 존재하지 않습니다.");
    		return "common/error";
    	}
    	
    }
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
//    	//해당 리뷰 조회
//    	Review review = reviewService.selectReview(review_id);
//    	
//    	if(review != null) {
//    		mv.addObject("review", review);
//    		mv.addObject("currentPage", currentPage);
//    		mv.setViewName("review/reviewDetailView");
//    	}else {
//    		mv.addObject("message", review_id +"번 리뷰 조회 실패!");
//    		mv.setViewName("common/error");
//    	}
//    	return mv;
//    }
    
    // 리뷰 수정 페이지 이동 처리용
    @RequestMapping("rupdateView.do")
    public String moveReviewUpdateView(@RequestParam("review_id") int review_id, @RequestParam("page") String currentPage, Model model) {
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
    		@RequestParam(name = "page", required = false) String page) {
    	
    	if(reviewService.updateReview(review) > 0) {
    		//리뷰 원글 수정시 상세보기 페이지로 이동
    		model.addAttribute("page", page);
    		model.addAttribute("review_id", review.getReview_id());
    		
    		return "redirect:pdetail.do?product_id="+ review.getProduct_id();
    	} else {
    		model.addAttribute("message", review.getReview_id() + "번 리뷰 수정 실패!");
    		return "common/error";
    		}
    	}
    	
    // 리뷰 삭제 처리
    @RequestMapping("rdelete.do")
    public String reviewDeleteMethod(Review review, Model model) {
    	if(reviewService.deleteReview(review) > 0) {
    			return "redirect:main.do";
    	}else {
    		model.addAttribute("message", review.getReview_id() + "번 글 삭제 실패!");
    		return "common/error";
    	}
    }
	  
}
