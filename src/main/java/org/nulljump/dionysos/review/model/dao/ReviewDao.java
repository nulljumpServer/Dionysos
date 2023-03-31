package org.nulljump.dionysos.review.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.review.model.vo.Review;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("reviewDao")   //xml�� �ڵ� ��ϵ�
public class ReviewDao {

	@Autowired
	private SqlSessionTemplate session;   //������ ����
	
	public ArrayList<Review> selectReviewList(Paging page) {
		List<Review> list = session.selectList("reviewMapper.selectReviewList", page);
		return (ArrayList<Review>)list;
	}

	public Review selectReview(int review_id) {
		return session.selectOne("reviewMapper.selectReview",review_id);
	}

	public int insertReview(Review review) {
		return session.insert("reviewMapper.insertReview", review);
	}

	public int updateReview(Review review) {
		return session.insert("reviewMapper.updateReview", review);
	}

	public int deleteReview(Review review) {
		return session.insert("reviewMapper.deleteReview", review);
	}

	//���� ����� �� ������ ��ȸ
	public int getListCount() {
		return session.selectOne("reviewMapper.getListCount");
	}

	public int updateReviewReadcount(int review_id) {
		return session.selectOne("reviewMapper.updateReviewReadcount", review_id);
	}

}
