package command.match;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.MatchDao;
import dto.MatchDto;

public class MatchView implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MatchDao dao = new MatchDao();
		
		String id = request.getParameter("memberId");
		
		MatchDto dto = dao.getMatchView(id);
		
		request.setAttribute("matchViewDto", dto);
	}

}
