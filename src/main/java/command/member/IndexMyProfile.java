package command.member;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
import dao.MemberDao;
import dto.MemberDto;
public class IndexMyProfile implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MemberDao dao  = new MemberDao();
		
		String sessionId = CommonUtil.getSessionInfo(request, "id");
		
		MemberDto dto = dao.getIndexMyInfo(sessionId);

		request.setAttribute("p_dto", dto);
	}

}
 