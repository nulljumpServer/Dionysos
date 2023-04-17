package org.nulljump.dionysos.review.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.review.model.dao.ReviewDao;
import org.nulljump.dionysos.review.model.vo.Review;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	ReviewDao reviewDao;
	
	@Override
	public ArrayList<Review> selectReviewList(Paging page) {
		return reviewDao.selectReviewList(page);
	}

	@Override
	public Review selectReview(int review_id) {
		return reviewDao.selectReview(review_id);
	}

	@Override
	public int insertReview(Review review) {
		return reviewDao.insertReview(review);
	}

	@Override
	public int updateReview(Review review) {
		return reviewDao.updateReview(review);
	}

	@Override
	public int deleteReview(Review review) {
		return reviewDao.deleteReview(review);
	}

	@Override
	public int getListCount(int product_id) {
		return reviewDao.getListCount(product_id);
	}

	@Override
	public int updateReviewReadcount(int review_id) {
	return reviewDao.updateReviewReadcount(review_id);
	}

	@Override
	public int reviewScoreAVG(int product_id) {
		return reviewDao.reviewScoreAVG(product_id);
	}

	@Override
	public ArrayList<Review> reviewMyList(Map<String, Object> paramMap) {
		return reviewDao.reviewMyList(paramMap);
	}

	@Override
	public int selectreviewListCount() {
		return reviewDao.selectreviewListCount();
	}
	
	@Override
	public int selectMyreviewListCount(String user_id) {
		return reviewDao.selectMyreviewListCount(user_id);
	}

	@Override
	public ArrayList<Review> selectRevList(Paging page) {
		return reviewDao.selectRevList(page);
	}

	@Override
	public int selectSearchRevCount(String action, String keyword) {
		return reviewDao.selectSearchRevCount(action, keyword);
	}

	@Override
	public ArrayList<Review> selectSearchRev(String action, String keyword, Paging page) {
		return reviewDao.selectSearchRev(action, keyword, page);
	}



}
