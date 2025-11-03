package command.match;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.MatchDao;

public class InterestList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MatchDao dao = new MatchDao();
		
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("sessionId");
		
		ArrayList<Integer> interestList = dao.getInterestList(id);
		
		request.setAttribute("interestList", interestList);
	}

}
