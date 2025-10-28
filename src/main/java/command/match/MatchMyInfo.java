package command.match;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.MatchDao;
import dto.MatchDto;

public class MatchMyInfo implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MatchDao dao = new MatchDao();
		
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("sessionId");
		
		MatchDto dto = dao.getMatchMyInfo(id);
		
		request.setAttribute("myInfoDto", dto);
	}

}
