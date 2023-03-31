package org.nulljump.dionysos.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.common.SearchDate;
import org.nulljump.dionysos.notice.model.vo.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("noticeDao")
public class NoticeDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	//�����
	//�������� ��ü ��� ���
	public ArrayList<Notice> selectAllList(){
		List<Notice> list = session.selectList("noticeMapper.selectAllList");
		
		return (ArrayList<Notice>)list;
	}
	
	//����¡ó�� �߰�
	public ArrayList<Notice> selectList(Paging page) {
		
		List<Notice> list = session.selectList("noticeMapper.selectList", page);
		
		return (ArrayList<Notice>)list;
	}

	//�������� ��ȣ�� ��ȸ�ϱ�
	public Notice selectNotice(int notice_no) {
		
		return session.selectOne("noticeMapper.selectNotice", notice_no);
	}

	//�������� �˻�
	public ArrayList<Notice> selectSearchTitle(String title) {
		
		List<Notice> list = session.selectList("noticeMapper.selectSearchTitle", title);
		
		return (ArrayList<Notice>)list;
	}
	
	//��¥�� �˻�
	public ArrayList<Notice> selectSearchDate(SearchDate date) {
		
		List<Notice> list = session.selectList("noticeMapper.selectSearchDate", date);
		
		return (ArrayList<Notice>)list;
	}

	//��ȸ�� 1���� ó����
	public int addReadCount(int notice_no) {
		
		return session.update("noticeMapper.addReadCount", notice_no);
	}
	

	//������
	//�������� ���
	public int insertNotice(Notice notice) {
		
		return session.insert("noticeMapper.insertNotice", notice);
	}
	
	//�������� ����
	public int updateNotice(Notice notice) {
		
		return session.update("noticeMapper.updateNotice", notice);
	}
	
	//�������� ����
	public int deleteNotice(int notice_no) {

		return session.delete("noticeMapper.deleteNotice", notice_no);
	}
	
		
	//��ü �Խñ� ��� ���� �������� ()
	public int getListCount() {

		return session.selectOne("noticeMapper.getListCount");
	}
	
	

}
