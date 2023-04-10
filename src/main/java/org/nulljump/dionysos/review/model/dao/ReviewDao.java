package org.nulljump.dionysos.review.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.notice.model.vo.Notice;
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

	

}
