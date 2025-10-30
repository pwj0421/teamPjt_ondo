package command.member;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.MemberDao;

public class MemberLogin implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MemberDao dao = new MemberDao();
		String id = request.getParameter("m_id");
		String password = request.getParameter("m_password");
		
//		try {
//			password = dao.encryptSHA256(password);
//		} catch (NoSuchAlgorithmException e) {
//			e.printStackTrace();
//		}
		
		String loginName = dao.memberLogin(id, password);
		String msg = "", url ="";
		if(loginName.equals("") ) {
			msg = "ID 혹은 비밀번호가 정확하지 않습니다.";
			url = "Member";
		} else {
			msg = loginName + "님 환영합니다.";
			url = "Index";
			
			HttpSession session = request.getSession();
			session.setAttribute("sessionId", id);
			session.setAttribute("sessionName", loginName);
			if(id.equals("master")) {
				session.setAttribute("sessionLevel", "admin");		
			} else {
				session.setAttribute("sessionLevel", "member");
			}
		}
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", url);
	}

}
