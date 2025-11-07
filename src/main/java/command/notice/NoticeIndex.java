package command.notice;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.NoticeDao;
import dto.NoticeDto;

public class NoticeIndex implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		NoticeDao dao = new NoticeDao();
		ArrayList<NoticeDto> dtos = dao.getNoticeIndex();
		request.setAttribute("NoticeIndex", dtos);

	}

}
