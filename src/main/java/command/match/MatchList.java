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
		
		ArrayList<MatchDto> dtos = dao.getMatchList(id);
		
		request.setAttribute("MatchDtos", dtos);
	}

}
