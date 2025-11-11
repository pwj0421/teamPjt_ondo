package command.member;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.PurposeDao;
import dto.PurposeDto;

public class PurposeList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		PurposeDao dao = new PurposeDao();
		List<PurposeDto> dtos = dao.getPurposeList();
		//System.out.println("데이터 갯수: " + dtos.size());

		request.setAttribute("purposeList", dtos);
		

	}

}
