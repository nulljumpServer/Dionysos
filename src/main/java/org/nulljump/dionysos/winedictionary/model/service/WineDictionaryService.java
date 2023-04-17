package org.nulljump.dionysos.winedictionary.model.service;

import java.util.ArrayList;
import java.util.List;

import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.winedictionary.model.vo.WineDictionary;

public interface WineDictionaryService {
	public ArrayList<WineDictionary> selectList(Paging paging);
	public WineDictionary selectWineDictionary(String grape_type);
	public int insertWineDictionary(WineDictionary wineDictionary);
	public int updateWineDictionary(WineDictionary wineDictionary);
	public int deleteWineDictionary(WineDictionary wineDictionary);
	public ArrayList<WineDictionary> selectSearchTitle(String keyword);
	int selectListCount(); //총 게시글 갯수 조회용 (페이지 수 계산용)

}
