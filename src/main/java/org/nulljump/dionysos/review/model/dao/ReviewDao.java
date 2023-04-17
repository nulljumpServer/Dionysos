package org.nulljump.dionysos.review.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.review.model.vo.Review;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("reviewDao")   //xml에 자동 등록됨
public class ReviewDao {

	@Autowired
	private SqlSessionTemplate session;   //의존성 주입

	
	public ArrayList<Review> selectReviewList(Paging page) {
		List<Review> list = session.selectList("reviewMapper.selectReviewList",page);
		return (ArrayList<Review>)list;
	}

	public Review selectReview(int review_id) {
		return session.selectOne("reviewMapper.selectReview",review_id);
	}

	public int insertReview(Review review) {
		return session.insert("reviewMapper.insertReview", review);
	}

	public int updateReview(Review review) {
		return session.update("reviewMapper.updateReview", review);
	}

	public int deleteReview(Review review) {
		return session.delete("reviewMapper.deleteReview", review);
	}

	//리뷰 목록의 총 갯수를 조회
	public int getListCount(int product_id) {
		return session.selectOne("reviewMapper.getListCount",product_id);
	}

	public int updateReviewReadcount(int review_id) {
		return session.update("reviewMapper.updateReviewReadcount", review_id);
	}

	public int reviewScoreAVG(int product_id) {
		return session.selectOne("reviewMapper.reviewScoreAVG", product_id);
	}

	public ArrayList<Review> reviewMyList(Map<String, Object> paramMap) {
		List<Review> list = session.selectList("reviewMapper.reviewMyList", paramMap);
		return (ArrayList<Review>)list;
	}

	public int selectreviewListCount() {
		return session.selectOne("reviewMapper.selectreviewListCount");
	}
	
	public int selectMyreviewListCount(String user_id) {
		return session.selectOne("reviewMapper.selectMyreviewListCount", user_id);
	}

	public ArrayList<Review> selectRevList(Paging page) {
		List<Review> list = session.selectList("reviewMapper.selectRevList", page);
		return (ArrayList<Review>)list;
	}

	public int selectSearchRevCount(String action, String keyword) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("action", action);
		paramMap.put("keyword", keyword);
		List<Review> list = session.selectList("reviewMapper.selectSearchRevCount", paramMap);
		return list.size();
		
	}

	public ArrayList<Review> selectSearchRev(String action, String keyword, Paging page) {
		Map<String,Object> paramMap = new HashMap<String, Object>();
		paramMap.put("action", action);
		paramMap.put("keyword", keyword);
		paramMap.put("page", page);
		List<Review> list = session.selectList("reviewMapper.selectSearchRev", paramMap);
		return (ArrayList<Review>) list;
	}

}
