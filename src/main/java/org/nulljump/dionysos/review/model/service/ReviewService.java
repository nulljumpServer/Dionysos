package org.nulljump.dionysos.review.model.service;

import java.util.ArrayList;

import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.review.model.vo.Review;

public interface ReviewService { 
	ArrayList<Review> selectReviewList(Paging page);     //���� ��� ��ȸ
	Review selectReview(int review_id);      //���� ��ȸ
	int insertReview(Review review);   		 //���� �߰�
	int updateReview(Review review);         //���� ����
	int deleteReview(Review review);    	//���� ����  
	int getListCount();                     //���� ����� �� ������ ��ȸ
	int updateReviewReadcount(int review_id); //�󼼺���� ��ȸ�� 1���� ó����
}
