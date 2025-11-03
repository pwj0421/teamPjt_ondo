package command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import common.CommonUtil;
import dao.MemberDao;

public class MemberDeleteAccount implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MemberDao dao = new MemberDao();
		
		HttpSession session = request.getSession();
        String id = (String) session.getAttribute("sessionId"); 
		String exit_date = CommonUtil.getTodayTime();
		int result = dao.memberDeleteAccount(id, exit_date);
		
		String msg = "";
		if(result == 1) {
		    msg = "회원 탈퇴가 정상적으로 이뤄졌습니다.";
		    session.invalidate();
		    request.setAttribute("t_msg", msg);
		    request.setAttribute("t_url", "Index");
		} else {
		    msg = "회원 탈퇴가 실패했습니다. 관리자에게 문의하세요.";
		    request.setAttribute("t_msg", msg);
		    request.setAttribute("t_url", "MyPage");
		}
	}

}
