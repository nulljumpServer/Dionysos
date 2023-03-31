package org.nulljump.dionysos.qna.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.common.SearchDate;
import org.nulljump.dionysos.qna.model.vo.Qna;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("qnaDao")
public class QnaDao {

	@Autowired
	private SqlSessionTemplate session;

	// �����
	// 1:1���� ��ü ��� ���
	public ArrayList<Qna> selectAllList() {
		List<Qna> list = session.selectList("qnaMapper.selectAllList");

		return (ArrayList<Qna>) list;
	}

	// ����¡ó�� �߰�
	public ArrayList<Qna> selectList(Paging page) {
		List<Qna> list = session.selectList("qnaMapper.selectList", page);

		return (ArrayList<Qna>) list;
	}

	// 1:1���� �󼼺��� 
	public Qna selectQna(int qna_no) {

		return session.selectOne("qnaMapper.selectQna", qna_no);
	}

	// �������� �˻�
	public ArrayList<Qna> selectTitleSearch(String title) {
		List<Qna> list = session.selectList("qnaMapper.selectTitleSearch", title);
		
		return (ArrayList<Qna>)list;
	}

	// ����� ���̵�� �˻�
	public ArrayList<Qna> selectIdSearch(String user_id) {
		List<Qna> list = session.selectList("qnaMapper.selectIdSearch", user_id);
		
		return (ArrayList<Qna>)list;
	}

	// ��¥�� �˻�
	public ArrayList<Qna> selectDateSearch(SearchDate date) {
		List<Qna> list = session.selectList("qnaMapper.selectDateSearch", date);
		
		return (ArrayList<Qna>)list;
	}
	
	
	// 1:1���� ���
	public int insertInquiry(Qna qna) {
		
		return session.insert("qnaMapper.insertInquiry", qna);
	}

	// 1:1���� ����
	public int updateInquiry(Qna qna) {
		
		return session.update("qnaMapper.updateInquiry", qna);
	}

	// 1:1���� ����
	public int deleteInquiry(Qna qna) {
		
		return session.delete("qnaMapper.deleteInquiry", qna);
	}

	// ������
	// �亯 ���
	public int insertReply(Qna reply) {
		
		return session.insert("qnaMapper.insertReply", reply);
	}

	// �亯 ����
	public int updateReply(Qna reply) {
		
		return session.update("qnaMapper.updateReply", reply);
	}

	// �亯 ����
	public int deleteReply(Qna reply) {
		
		return session.delete("qnaMapper.deleteReply", reply);
	}

	// ��ü �Խñ� ��� ���� ��������
	public int selectListCount() {
		
		return session.selectOne("qnaMapper.selectListCount");
	}

	//��� ���� ������Ű��
	public int updateReplySeq(Qna reply) {
		
		return session.update("qnaMapper.updateReplySeq", reply);
	}

	

	

	

}
