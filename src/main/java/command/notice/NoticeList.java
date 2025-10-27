package command.notice;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.N_CommonUtil;
import dao.NoticeDao;
import dto.NoticeDto;

public class NoticeList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		NoticeDao dao = new NoticeDao();
		
		ArrayList<NoticeDto> dtos = dao.getNoticeList();
		request.setAttribute("dtos", dtos);
		
		

	}

}
