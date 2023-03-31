package org.nulljump.dionysos.review.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.nulljump.dionysos.common.FileNameChange;
import org.nulljump.dionysos.common.Paging;
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
import org.springframework.web.servlet.ModelAndView;
 
@Controller    //xml�� Ŭ������ controller�� �ڵ� ����� ��
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewService reviewService;
	
	
	public ReviewController(ReviewService reviewService) {
	    this.reviewService = reviewService;
	  }

    // ���� ��� ����
    @RequestMapping("rlistView.do")
    public ModelAndView reviewListMethod(@RequestParam(name = "page", required = false) String page, ModelAndView mv) {

		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// �� �������� �Խñ� 10���� ��µǰ� �ϴ� ��� :
		// ����¡ ��� ó�� - ������ Ŭ������ �ۼ��ؼ� �̿��ص� ��
		int limit = 10; // �� �������� ����� ��� ����
		// �� ������ �� ����� ���� �Խñ� �� ���� ��ȸ�� ��
		int listCount = reviewService.getListCount();
		Paging paging = new Paging(listCount, currentPage, limit);
		paging.calculator();

		ArrayList<Review> list = reviewService.selectReviewList(paging);

		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("paging", paging);

			mv.setViewName("review/reviewListView");
		} else {
			mv.addObject("message", currentPage + " ������ ��� ��ȸ ����!");
			mv.setViewName("common/error");
		}

		return mv;
	}
//    public ModelAndView reviewListMethod(@RequestParam(name ="page", required = false) String page, ModelAndView mv) {
//      
//    	int currentPage = 1;
//    	if(page != null) {
//    		currentPage = Integer.parseInt(page);
//    	}
//    	//�� �������� ���� �Խñ� 10���� ��µǰ� �ϴ� ���
//    	//����¡ ��� ó�� - ������ Ŭ������ �ۼ��ؼ� �̿��ص� ��
//    	int limit = 10;  //�� �������� ����� ��� ����
//    	//�� ������ �� ����� ���� �Խñ� �� ���� ��ȸ�� ��
//    	int listCount = reviewService.getListCount();
//    	//������ �� ���
//    	int maxPage = (int)((double) listCount / limit + 0.9);
//    	
//    	int startPage = ((currentPage - 1) / 10) * 10 + 1;
//    	int endPage = startPage + 10 - 1;
//    	
//    	if(maxPage < endPage) {
//    		endPage = maxPage;
//    	}
//    	
//    	//�������� ������ ���� �������� Ǯ���� ����� ������� ������ ���
//    	int startRow = (currentPage - 1) * limit + 1;
//    	int endRow = startRow + limit - 1;
//    	Paging paging = new Paging(startRow, endRow);
//    	
//    	ArrayList<Review> list = reviewService.selectReviewList(paging);
//    	
//    	if(list != null && list.size() > 0) {
//    		mv.addObject("list", list);
//    		mv.addObject("listCount", listCount);
//    		mv.addObject("maxPage", maxPage);
//    		mv.addObject("currentPage", currentPage);
//    		mv.addObject("startPage", startPage);
//    		mv.addObject("endPage", endPage);
//    		mv.addObject("limit", limit);
//    		
//    		mv.setViewName("review/reviewListView");
//    	}else{
//    		mv.addObject("message", currentPage + "������ ��� ��ȸ ����!");
//    		mv.setViewName("common/error");
//    	}
//    	
//        return mv;
//    }

    // ���� �ۼ� ������ �̵�
    @RequestMapping("rwriteForm.do")
    public String moveReviewWriteForm() {
    	return "review/reviewWriteForm";
    }

    // ���� �ۼ� ó��(/*���� ���ε� ��� ���*/)
    @RequestMapping(value = "rwrite.do", method = RequestMethod.POST)
    public String reviewMethod(Review review, Model model, HttpServletRequest request,
    	@RequestParam(name = "upfile", required = false) MultipartFile mfile){
    		
    		//���� ÷������ ���� ���� ��� ���� 
    		String savePath = request.getSession().getServletContext().getRealPath("resources/review_upfiles");
    		
    		//÷������ ���� ��
    		if(!mfile.isEmpty()) {
    			
    			String fileName = mfile.getOriginalFilename();
    			
    			if(fileName != null && fileName.length() > 0) {
    				//�ٲ� ���ϸ� ���� ���ڿ� ����� 
    				//������ ��� | ���� ��û������ ��¥�ð������� �̿���
    				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
    				//������ ���ϸ� �����
    				String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
    				
    				//���� ������ Ȯ���ڸ� �����ؼ�, ���� ���ϸ� �ٿ���
    				renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);
    				logger.info("÷�� ���ϸ� Ȯ�� : " + fileName + ", " + renameFileName);
    				
    				//������ ���� ó��
    				try {
    					mfile.transferTo(new File(savePath + "\\" + renameFileName));
    				}catch(Exception e){
    					e.printStackTrace();
    					model.addAttribute("message", "÷������ ���� ����!");
    					return "common/error";
    				}
    				
//    				//reivew ��ü�� ÷������ ���� ��� ���� 
//    				review.setReview_original_filename(fileName);
//    				review.setReview_rename_filename(renameFileName);
    			}  //�̸� �ٲٱ�
    		} //���ο� ÷�������� ���� ��
    		
    		if(reviewService.insertReview(review) > 0) {
    			//���� ��� ������ ��� ���� �������� �̵�
    			return "redirect:rlist.do";
    		}else {
    			model.addAttribute("message", review.getReview_id() + "�� ���� ��� ����!");
    			return "common/error";
    		}
    	}

    //���� �� ������ �̵�
    @RequestMapping("rdetailView.do")
    public String moveReviewDetailView() {
    	return "review/reviewDetailView";
    }
    
    // ���� �� ���� ó����
    @RequestMapping("rdetail.do")
    public ModelAndView reviewDetailMethod(ModelAndView mv, @RequestParam("review_id") int review_id,
    		@RequestParam(name = "page", required = false) String page) {
    	int currentPage = 1;
    	if(page != null) {
    		currentPage = Integer.parseInt(page);
    	}
    	
    	//��ȸ�� 1���� ó��
    	reviewService.updateReviewReadcount(review_id);
    	
    	//�ش� �Խñ� ��ȸ 
    	Review review = reviewService.selectReview(review_id);
    	
    	if(review != null) {
    		mv.addObject("review", review);
    		mv.addObject("currentPage", currentPage);
    		mv.setViewName("review/reviewDetailView");
    	}else {
    		mv.addObject("message", review_id + "�� �Խñ� ��ȸ ����!");
    		mv.setViewName("common/error");
    	}
    	return mv;
    }

    // ���� ���� ������ �̵� ó����
    @RequestMapping("rupdateForm.do")
    public String moveReviewUpdateView(@RequestParam("review_id") int review_id, @RequestParam("page") int currentPage, Model model) {
        //������������ ���� reivew ��ü ���� ��ȸ��
    	Review review = reviewService.selectReview(review_id);
    	
    	if(review != null) {
    		model.addAttribute("review", review);
    		model.addAttribute("currentPage", currentPage);
    		
    		return "review/reviewUpdateForm";
    	}else {
    		model.addAttribute("message", review_id + "�� �� ������������ �̵� ����!");
    		
    		return "common/error";
    	}
    }

    // ���� ���� ó�� (���� ���ε� ��� ���)
    @RequestMapping(value = "rupdate.do", method = RequestMethod.POST)
    public String reviewUpdateMethod(Review review, Model model, HttpServletRequest request,
    		@RequestParam(name = "delflag", required = false) String delFlag,
    		@RequestParam(name = "upfile", required = false) MultipartFile mfile,
    		@RequestParam("page") int page) {
        //���� ÷������ ���� ���� ��� ����
    	String savePath = request.getSession().getServletContext().getRealPath("resources/review_upfiles");
    	//1. ���� ÷�������� �ִµ�, '���ϻ���'�� ������ ���
    	if(review.getReview_image() != null && delFlag!= null && delFlag.equals("yes")) {
    		//���� ������ �ִ� ������ ������ 
    		new File(savePath + "/" + review.getReview_image()).delete();

    	}
    	//2. ���� ÷������ 1���� ������ ���
    	//���ο� ÷�������� ���� �� 
    	if(!mfile.isEmpty()) {
    		//2-1. ���� ÷�������� ���� ��
    		if(review.getReview_image() != null) {
    			//���� ���� �ȿ� �ִ� ���� ������ ������
    			new File(savePath + "/" + review.getReview_image()).delete();

    		}
    		//2-2. ���� ÷�������� ���� ��
    		//���� �� �����̸� ������
    		String fileName = mfile.getOriginalFilename();
    		
    		if(fileName != null && fileName.length() > 0) {
    			//�ٲ� ���ϸ� ���� ���ڿ� ����� 
    			//������ ��� | ���� ��û������ ��¥�ð������� �̿���
    			String renameFileName = FileNameChange.change(fileName, "yyyyMMddHHmmss");
    			
    			//���� ������ Ȯ���ڸ� �����ؼ�, ���� ���ϸ� �ٿ���
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
    		} //�̸� �ٲٱ�
    	} //���ο� ÷�������� ���� ��
    	
    	if(reviewService.updateReview(review) > 0) {
    		//���� ���� ������ �󼼺��� �������� �̵�
    		model.addAttribute("page", page);
    		model.addAttribute("review_id", review.getReview_id());
    		
    		return "redirect:rdetail.do";
    	} else {
    		model.addAttribute("message", review.getReview_id() + "�� ���� ���� ����!");
    		return "common/error";
    	}
    }

    // ���� ���� ó��
    @RequestMapping("rdelete.do")
    public String reviewDeleteMethod(Review review, HttpServletRequest request, Model model) {
    	if(reviewService.deleteReview(review) > 0) {
    		//�� ������ �����ϸ�, ���������� �ִ� ÷�����ϵ� ���� ó��
    			new File(request.getSession().getServletContext().getRealPath("resources/review_upfiles") + "/" + review.getReview_image()).delete();
    			return "redirect:rlist.do?page=1";	
    	}else {
    		model.addAttribute("message", review.getReview_id() + "�� �� ���� ����!");
    		return "common/error";
    	}
    }
	  
}
