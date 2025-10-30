package command.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.NoticeDao;
import dto.NoticeDto;

public class NoticeView implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		NoticeDao dao = new NoticeDao();
		String no = request.getParameter("n_no");
		
		int result = dao.setHitCount(no);
		if(result!=1) System.out.println("notice 조회수 증가 오류");
		
		NoticeDto dto = dao.getNoticeView(no);
		request.setAttribute("t_dto", dto);
		
		//최신글3개
		List<NoticeDto> recentList = dao.getRecentNoticeList();
		request.setAttribute("t_recentList", recentList);

//		갯수 출력
//		System.out.println("NoticeView -> recentList size: " + (recentList == null ? "null" : recentList.size()));


	}

}
