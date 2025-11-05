package command.member;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
import dao.MyInfoUpdateDao;

public class MatchInfoUpdate implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MyInfoUpdateDao dao = new MyInfoUpdateDao();
		
		String id = CommonUtil.getSessionInfo(request, "id");
		String nickName = request.getParameter("m_nickName");
		String tagline = request.getParameter("m_tagline");
		tagline = tagline.replaceAll("'", "&#39;");
		String introduction = request.getParameter("m_introduction");
		introduction = introduction.replaceAll("'", "&#39;");
		String updated = CommonUtil.getTodayTime();

		int result = dao.matchInfoUpdate(id, nickName, tagline, introduction, updated);
		String msg = "";
		if(result == 1) msg = "수정 되었습니다.";
		else msg = "수정 실패! 관리자에게 문의 바랍니다.";
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Member");
		request.setAttribute("t_gubun", "matchInfo");
	}

}
