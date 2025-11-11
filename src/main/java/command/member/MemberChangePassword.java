package command.member;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.MemberDao;

public class MemberChangePassword implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MemberDao dao = new MemberDao();
		
		String id = request.getParameter("m_id");
		String password = request.getParameter("m_password");
		String newPassword = request.getParameter("m_newPassword");
		String newPassword_confirm = request.getParameter("m_newPassword_confirm");
		
		
		
		
		String msg = "";
        String url = "Member?t_gubun=newPassword"; 
		
		if(newPassword == null || !newPassword.equals(newPassword_confirm)) {
			msg="입력하신 비밀번호와 재입력 비밀번호가 일치하지 않습니다. 다시 입력해주세요.";
		} else {
			try {
				password = dao.encryptSHA256(password);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
			boolean checkPassword = dao.checkPassword(id, password);
			
			if(!checkPassword) {
				msg = "기존 비밀번호가 올바르지 않습니다. 다시입력해주세요.";
			} else {
				//새 비밀번호 업데이스
				try {
					newPassword = dao.encryptSHA256(newPassword);
				} catch (NoSuchAlgorithmException e) {
					e.printStackTrace();
				}
				int result = dao.updatePassword(id, newPassword);
				if(result == 1) {
					msg="비밀번호가 성공적으로 변경되었습니다.";
					url="Member?t_gubun=myInfo";
				} else {
					msg="비밀번호 변경이 실패하였습니다. 관리자에게 문의하세요";
				}
			}
		}
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", url);
		
	}

}
