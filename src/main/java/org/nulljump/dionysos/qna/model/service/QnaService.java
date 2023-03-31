package org.nulljump.dionysos.qna.model.service;

import java.util.ArrayList;

import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.common.SearchDate;
import org.nulljump.dionysos.qna.model.vo.Qna;


public interface QnaService {
	
	// 1:1���� ��ü ��� ���
	ArrayList<Qna> selectAllList();
	
	//�� �������� ����� �Խñ� ��ȸ��
	ArrayList<Qna> selectList(Paging page);
	
	//�ش� �Խñ� ��ȣ�� ���� �Խñ� �� ��ȸ��
	Qna selectQna(int qna_no);
	
	// �������� �˻�
	ArrayList<Qna> selectTitleSearch(String title);
	
	// ����� ���̵�� �˻�
	ArrayList<Qna> selectIdSearch(String user_id);
	
	// ��¥�� �˻�
	ArrayList<Qna> selectDateSearch(SearchDate date);
	
	//���� ��Ͽ�
	int insertInquiry(Qna qna);
	
	//���� ������
	int updateInquiry(Qna qna);
	
	//�Խñ� ������(���� ������ ���� ��� ���� ����)
	int deleteInquiry(Qna qna);
	
	//��� ��Ͽ�
	int insertReply(Qna reply);
	
	//��� ������
	int updateReply(Qna reply);
	
	// �亯 ����
	int deleteReply(Qna reply);
	
		
	//�� �Խñ� ���� ��ȸ�� (������ �� ����)
	int selectListCount();
	

	//��� ��Ͻ� ���� ����� ������ 1���� ó��(�ֽ� ����� ���� 1�� �ǰ���)
	int updateReplySeq(Qna reply);
		
	


}
