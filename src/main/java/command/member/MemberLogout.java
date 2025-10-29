package command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;

public class MemberLogout implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String loginName = (String) session.getAttribute("sessionName");
		
		session.invalidate();
		String msg = loginName + "님 로그아웃 되었습니다.";
		//세션 유지시간 초과시 자동으로 세션정보는 null이 된다.
		if(loginName == null) {
			msg = "로그아웃 되었습니다!";
		}
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Index");
	}

}
