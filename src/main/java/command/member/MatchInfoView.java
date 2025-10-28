package command.member;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
import dao.MyInfoUpdateDao;
import dto.MemberDto;

public class MatchInfoView implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MyInfoUpdateDao dao = new MyInfoUpdateDao();
		
		String id = CommonUtil.getSessionInfo(request, "id");
		
		MemberDto dto = dao.getMatchInfo(id);
		request.setAttribute("m_dto", dto);
	}

}
