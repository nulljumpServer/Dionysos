package org.nulljump.dionysos.review.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.product.model.vo.Product;
import org.nulljump.dionysos.review.model.vo.Review;

public interface ReviewService { 

	ArrayList<Review> selectReviewList(Paging page);     //상세페이지 리뷰 목록 페이지 조회
	Review selectReview(int review_id);      //리뷰 조회
	int insertReview(Review review);   		 //리뷰 추가
	int updateReview(Review review);         //리뷰 수정
	int deleteReview(Review review);    	//리뷰 삭제  
	int getListCount(int product_id);                     //리뷰 목록의 총 갯수를 조회
	int updateReviewReadcount(int review_id); //상세보기시 조회수 1증가 처리용
	int reviewScoreAVG(int product_id);   //리뷰 평점 평균
	ArrayList<Review> reviewMyList(Map<String, Object> paramMap); //마이페이지 내가 작성한 리뷰 목록 조회
	int selectreviewListCount();            //리뷰 갯수 확인
	int selectMyreviewListCount(String user_id); 
	ArrayList<Review> selectRevList(Paging page);    //관리자페이지 리뷰 목록 페이지 조회
	int selectSearchRevCount(String action, String keyword);
	ArrayList<Review> selectSearchRev(String action, String keyword, Paging page); //상품 번호 기준 조회
}
