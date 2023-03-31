package org.nulljump.dionysos.faq.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.nulljump.dionysos.faq.model.vo.Faq;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("faqDao")
public class FaqDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	//�����
	//��ü ��� ����
	public ArrayList<Faq> selectFaq(){
		List<Faq> list = session.selectList("faqMapper.selectFaq");
		
		return (ArrayList<Faq>)list;
	}
	
	
	//������
	//�󼼺��� 
	public Faq selectList(int faq_no) {

		return session.selectOne("faqMapper.selectList", faq_no);
	}

	
	//�����ϴ� ���� ���
	public int insertFaq(Faq faq) {

		return session.insert("faqMapper.insertFaq", faq);
	}
	
	
	//�����ϴ� ���� ����
	public int deleteFaq(int faq_no) {

		return session.delete("faqMapper.deleteFaq", faq_no);
	}
	
	
	//�����ϴ� ���� ����
	public int updateFaq(Faq faq) {

		return session.update("faqMapper.updateFaq", faq);
	}
	
	
	
}
