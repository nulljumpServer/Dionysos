package org.nulljump.dionysos.faq.model.service;

import java.util.ArrayList;

import org.nulljump.dionysos.faq.model.dao.FaqDao;
import org.nulljump.dionysos.faq.model.vo.Faq;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("faqService")
public class FaqServiceImpl implements FaqService {

	@Autowired
	private FaqDao faqdao;

	// �����
	//��ü ��� ����
	@Override
	public ArrayList<Faq> selectFaq() {
		
		return faqdao.selectFaq();
	}


	
	//������
	//��ü ��� ����
	@Override
	public Faq selectList(int faq_no) {
		
		return faqdao.selectList(faq_no);
	}

	//�����ϴ� ���� ���
	@Override
	public int insertFaq(Faq faq) {
		return 0;
	}

	//�����ϴ� ���� ����
	@Override
	public int deleteFaq(int faq_no) {
		return 0;
	}

	//�����ϴ� ���� ����
	@Override
	public int updateFaq(Faq faq) {
		return 0;
	}





}
