package command.search;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.SearchDao;
import dto.SearchDto;

public class SearchList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		SearchDao dao = new  SearchDao();
		
		ArrayList<SearchDto> dtos = dao.selectSearchList();
		
		request.setAttribute("searchList", dtos);
	}

}
