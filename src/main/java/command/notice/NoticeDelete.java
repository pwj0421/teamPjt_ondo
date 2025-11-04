package command.notice;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.NoticeDao;

public class NoticeDelete implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		NoticeDao dao = new NoticeDao();
		String no = request.getParameter("n_no");
//		String delAttach = request.getParameter("t_del_attach");
		
		int result = dao.noticeDelete(no);
		String msg = result == 1? "Notice가 삭제되었습니다":"Notice 삭제 실패!";
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Notice");
//		request.setAttribute("t_gubun", "list");
//		if(result == 1) {
//			if(delAttach.equals("")) {
//				File file = new File(CommonUtil.getNoticeDir(request),delAttach);
//				boolean tf = file.delete();
//				if(!tf) System.out.println("공지사항 게시글 삭제시 첨부파일 삭제 오류");
//			}
//		}

	}

}
