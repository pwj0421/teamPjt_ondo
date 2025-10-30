package command.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.NoticeDao;
import dto.NoticeDto;

public class NoticeUpdateView implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		NoticeDao dao = new NoticeDao();
		String no = request.getParameter("n_no");
		
		
		NoticeDto dto = dao.getNoticeView(no);
		request.setAttribute("t_dto", dto);
	}

}
