package command.match;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.MatchDao;
import dto.InterestDto;

public class InterestList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MatchDao dao = new MatchDao();
		
		ArrayList<InterestDto> dtos = dao.getInterestList();
		
		request.setAttribute("interest_dtos", dtos);
	}

}
