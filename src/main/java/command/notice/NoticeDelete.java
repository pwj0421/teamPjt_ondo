package command.notice;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.N_CommonUtil;
import dao.NoticeDao;

public class NoticeDelete implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		NoticeDao dao = new NoticeDao();
		String no = request.getParameter("n_no");
		String delAttach1 = request.getParameter("n_del_attach_1");
		String delAttach2 = request.getParameter("n_del_attach_2");
		String delAttach3 = request.getParameter("n_del_attach_3");
		
		int result = dao.noticeDelete(no);
//		int result = 1;
		String msg = result == 1? "Notice가 삭제되었습니다":"Notice 삭제 실패!";
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Notice");
		request.setAttribute("t_gubun", "list");
//		if(delAttach1 == null) {
//			delAttach1 = "";
//		}
//		if(delAttach2 == null) {
//			delAttach2 = "";
//		}
//		if(delAttach3 == null) {
//			delAttach3 = "";
//		}
		if(result == 1) {
			if(!delAttach1.equals("")) {
				File file = new File(N_CommonUtil.getNoticeDir(request),delAttach1);
				boolean tf = file.delete();
				if(!tf) System.out.println("공지사항 게시글 삭제시 첨부파일1 삭제 오류");
			}
			if(!delAttach2.equals("")) {
				File file = new File(N_CommonUtil.getNoticeDir(request),delAttach2);
				boolean tf = file.delete();
				if(!tf) System.out.println("공지사항 게시글 삭제시 첨부파일2 삭제 오류");
			}
			if(!delAttach3.equals("")) {
				File file = new File(N_CommonUtil.getNoticeDir(request),delAttach3);
				boolean tf = file.delete();
				if(!tf) System.out.println("공지사항 게시글 삭제시 첨부파일3 삭제 오류");
			}
		}

	}

}
