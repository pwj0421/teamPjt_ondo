package command.search;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import common.CommonUtil;
import dao.SearchDao;
import dto.ComuPostDto;
import dto.NoticeDto;

public class SerachTotalList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		String search = request.getParameter("indexHeaderSearch");
		//검색어 세션에 저장 --> 검색화면에서 무언가 클릭시 세션값 빈칸으로하는게 좋을까?
		//그럴려면 수 많은 화면에서 세션 값(headerSearchTxt = "") 건드리는 코드를 넣어야하는데...
		HttpSession session = request.getSession();
		session.setAttribute("headerSearchTxt", search);
		
		SearchDao dao = new SearchDao();
		
		//검색어 이력 저장 또는 저장된 이력의 검색수(hit) 증가
		String nowDate = CommonUtil.getTodayTime();
		int result = dao.mergeSearchTxt(search, nowDate);
		if(result < 1) {
			System.out.println("검색어 저장 오류!");
		}
		
		//공지사항 검색
		ArrayList<NoticeDto> notiDtos = dao.selectNoticeHeaderSearchList(search);
		request.setAttribute("notiDtos", notiDtos);
		
		//자유게시판 검색
		ArrayList<ComuPostDto> comuDtos = dao.selectComuHeaderSearchList(search);
		request.setAttribute("comuDtos", comuDtos);
		
		//매칭 회원 검색
		//ArrayList<MemberDto> MemDtos = dao.selectMemHeaderSearchList(search);
		
	}

}
