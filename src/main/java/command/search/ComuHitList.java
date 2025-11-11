package command.search;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.ComuPostDao;
import dto.ComuPostDto;

public class ComuHitList implements CommonExecute {
	@Override
	public void execute(HttpServletRequest request) {
		ComuPostDao dao = new ComuPostDao();
		
		ArrayList<ComuPostDto> dtos = dao.selectIndexHitList();
		
		request.setAttribute("comuHitList", dtos);
	}
}
