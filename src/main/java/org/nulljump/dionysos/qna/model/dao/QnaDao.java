package org.nulljump.dionysos.qna.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	//신규문의 5개 출력
	public ArrayList<Qna> selectTop5() {

		List<Qna> list = session.selectList("qnaMapper.selectTop5");
		
		return (ArrayList<Qna>)list;
	}

	// 사용자
	// 마이페이지에서 내 문의목록 출력
	public ArrayList<Qna> selectMyList(Map<String, Object> paramMap) {
		List<Qna> list = session.selectList("qnaMapper.selectMyList", paramMap);

		return (ArrayList<Qna>) list;
	}

	// 마이페이지에서 내 문의 상세보기
	public Qna selectMyQna(int qna_no) {
		return session.selectOne("qnaMapper.selectMyQna", qna_no);
	}
	
	public int selectMyQnaListCount(String user_id) {
		return session.selectOne("qnaMapper.selectMyQnaListCount", user_id);
	}

	// 페이징처리 추가
	public ArrayList<Qna> selectList(Paging page) {
		List<Qna> list = session.selectList("qnaMapper.selectList", page);

		return (ArrayList<Qna>) list;
	}

	// 1:1문의 상세보기
	public Qna selectQna(int qna_no) {

		return session.selectOne("qnaMapper.selectQna", qna_no);
	}

	// 제목으로 검색
	public ArrayList<Qna> selectTitleSearch(String title) {
		List<Qna> list = session.selectList("qnaMapper.selectTitleSearch", title);

		return (ArrayList<Qna>) list;
	}

	// 사용자 아이디로 검색
	public ArrayList<Qna> selectIdSearch(String user_id) {
		List<Qna> list = session.selectList("qnaMapper.selectIdSearch", user_id);

		return (ArrayList<Qna>) list;
	}

	// 날짜로 검색
	public ArrayList<Qna> selectDateSearch(SearchDate date) {
		List<Qna> list = session.selectList("qnaMapper.selectDateSearch", date);

		return (ArrayList<Qna>) list;
	}

	// 1:1문의 등록
	public int insertInquiry(Qna qna) {

		return session.insert("qnaMapper.insertInquiry", qna);
	}

	// 1:1문의 수정
	public int updateInquiry(Qna qna) {

		return session.update("qnaMapper.updateInquiry", qna);
	}

	// 1:1문의 삭제
	public int deleteInquiry(Qna qna) {

		return session.delete("qnaMapper.deleteInquiry", qna);
	}

	// 관리자
	// 답변 등록
	public int insertReply(Qna reply) {

		return session.insert("qnaMapper.insertReply", reply);
	}

	// 답변 수정
	public int updateReply(Qna reply) {

		return session.update("qnaMapper.updateReply", reply);
	}

	// 답변 삭제
	public int deleteReply(Qna reply) {

		return session.delete("qnaMapper.deleteReply", reply);
	}

	// 전체 게시글 목록 갯수 가져오기
	public int selectListCount() {

		return session.selectOne("qnaMapper.selectListCount");
	}

	// 댓글 레벨 증가시키기
	public int updateReplySeq(Qna reply) {

		return session.update("qnaMapper.updateReplySeq", reply);
	}

	// 문의상태 증가시키기
	public int updateState(Qna qna) {

		return session.update("qnaMapper.updateState", qna);
	}

	public int selectSearchQnaCount(String action, String keyword) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("action", action);
		paramMap.put("keyword", keyword);
		List<Qna> list = session.selectList("qnaMapper.selectSearchQnaCount", paramMap);
		
		return list.size();
	}

	public ArrayList<Qna> selectSearchQna(String action, String keyword, Paging paging) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("action", action);
		paramMap.put("keyword", keyword);
		paramMap.put("paging", paging);
		List<Qna> list = session.selectList("qnaMapper.selectSearchQna", paramMap);
		
		return (ArrayList<Qna>) list;
	}

}
