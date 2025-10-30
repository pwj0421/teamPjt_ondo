package command.notice;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.N_CommonUtil;
import dao.NoticeDao;
import dto.NoticeDto;

public class NoticeUpdate implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		NoticeDao dao = new NoticeDao();
		
		String no = request.getParameter("n_no");
		String title = request.getParameter("title");
		title = N_CommonUtil.setQuote(title);
		String content = request.getParameter("content");
		content = N_CommonUtil.setQuote(content);
		String important = request.getParameter("important");
		String type = request.getParameter("type");
		String update_date = request.getParameter("update_date");
		
		NoticeDto dto = new NoticeDto(no, title, content, important, type, update_date, "", "", "");
		
		int result = dao.noticeUpdate(dto);
		String msg = result == 1? "Notice 수정되었습니다":"수정 실패";
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Notice");
		request.setAttribute("t_gubun", "view");
		request.setAttribute("n_no", no); //뷰로 돌아갈때 번호가 필요함 & alertview랑 이름 맞추기

	}

}
