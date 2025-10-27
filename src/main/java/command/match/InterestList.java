package command.match;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.MatchDao;

public class InterestList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MatchDao dao = new MatchDao();
		
		String id = "user001";
		
		ArrayList<Integer> interestList = dao.getInterestList(id);
		
		request.setAttribute("interestList", interestList);
	}

}
