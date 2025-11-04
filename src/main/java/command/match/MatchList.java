package command.match;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.MatchDao;
import dto.MatchDto;

public class MatchList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MatchDao dao = new MatchDao();
	
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("sessionId");
		
		ArrayList<Integer> searches = new ArrayList<Integer>();
		
		for(int i=0; i<31; i++){
		    String interest = request.getParameter("t_interest_" + (i+1));
		    
		    if(interest != null) searches.add(Integer.parseInt(interest));
		}
		
		ArrayList<MatchDto> dtos = dao.getMatchList(id, searches);
		
		request.setAttribute("match_dtos", dtos);
		request.setAttribute("interestList", searches);
	}

}
