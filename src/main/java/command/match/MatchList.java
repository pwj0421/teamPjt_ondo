package command.match;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.MatchDao;
import dto.MatchDto;

public class MatchList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MatchDao dao = new MatchDao();
		
		String id = "user001";
		
		String[] interests = new String[31];
		
		ArrayList<String> searches = new ArrayList<String>();
		ArrayList<Integer> interestList = new ArrayList<Integer>();
		for (int i=0; i<31; i++) {
			interestList.add(0);
		}
		
		for(int i=0; i<31; i++){
		    interests[i] = request.getParameter("t_interest_" + (i+1));
		    if(interests[i] != null) {
		    	searches.add(Integer.toString(i+1));
		    	
		    	interestList.set(i, i+1);
		    } 
		}
		
		ArrayList<MatchDto> dtos = dao.getMatchList(id, searches);
		
		request.setAttribute("match_dtos", dtos);
		request.setAttribute("interestList", interestList);
	}

}
