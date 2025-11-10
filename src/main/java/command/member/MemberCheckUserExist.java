package command.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonExecute;
import dao.MemberDao;

public class MemberCheckUserExist implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		try {
			MemberDao dao = new MemberDao();
			
			String name = request.getParameter("m_name");
			String email = request.getParameter("m_email");
			
			boolean exist = dao.checkMemberByIdEmail(name, email);
			
			HttpServletResponse response = (HttpServletResponse) request.getAttribute("response");
			    
			//응답 본문에 텍스트를 직접 쓰기 위한 도구입니다.
	        PrintWriter out = response.getWriter();
	        out.print(exist ? "EXIST" : "NOT_EXIST");
	        out.close();
		} catch (Exception e) {
            e.printStackTrace();
		}
	}

}
