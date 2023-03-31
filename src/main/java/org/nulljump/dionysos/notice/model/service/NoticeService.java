package org.nulljump.dionysos.notice.model.service;

import java.util.ArrayList;

import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.common.SearchDate;
import org.nulljump.dionysos.notice.model.vo.Notice;

public interface NoticeService {
	
	//�������� ��ü ��� ���
	ArrayList<Notice> selectAllList();
	
	//����¡ó�� �߰�
	ArrayList<Notice> selectList(Paging page);
	
	//�������� ��ȣ�� ��ȸ�ϱ�
	Notice selectNotice(int notice_no);
	
	//�������� �˻�
	ArrayList<Notice> selectSearchTitle(String title);
	
	//��¥�� �˻�
	ArrayList<Notice> selectSearchDate(SearchDate date);
	
	//��ȸ�� 1���� ó����
	int addReadCount(int notice_no);
	
	//�������� ���
	int insertNotice(Notice notice);
	
	//�������� ����
	int updateNotice(Notice notice);
	
	//�������� ����
	int deleteNotice(int notice_no);
	
	//��ü �Խñ� ��� ���� ��������
	int getListCount();
	

		

}
