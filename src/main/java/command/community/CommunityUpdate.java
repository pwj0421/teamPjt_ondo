package command.community;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
import dao.ComuDao;
import dto.ComuDto;

public class CommunityUpdate implements CommonExecute{

	@Override
	public void execute(HttpServletRequest request) {
		ComuDao dao = new ComuDao();
		
		int postId = Integer.parseInt(request.getParameter("postId"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String updatDt = CommonUtil.getTodayTime();
		
		ComuDto dto = new ComuDto("", title, content, "", updatDt, postId, 0);
		
		int result = dao.updatePost(dto);
		
		String msg = result == 1? "수정되었습니다." : "수정에 실패했습니다.";
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Community");
		request.setAttribute("t_no", postId);
	}
}
