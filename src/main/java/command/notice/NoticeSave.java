package command.notice;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.CommonExecute;
import common.N_CommonUtil;
import dao.NoticeFileDao;
import dao.NoticeDao;
import dto.NoticeDto;

public class NoticeSave implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		NoticeDao dao = new NoticeDao();
//		NoticeFileDao fdao = new NoticeFileDao();
//		
//		String attachDir = N_CommonUtil.getNoticeDir(request);
////		String attachDir = request.getSession().getServletContext().getRealPath("/") + "attach/notice/";
//		int maxSize = 1024 * 1024 * 10; // 10MB
//		
//		MultipartRequest mpr = null;
//		try {
//			mpr = new MultipartRequest(request, attachDir, maxSize, 
//									   "utf-8", new DefaultFileRenamePolicy());
//		} catch (IOException e) {
//			e.printStackTrace();
//			System.out.println("NOTICE 첨부파일 업로드 오류!");
//		}
		
		String no = dao.getNoticeNo();
		System.out.println("번호:"+ no);
//		String title = mpr.getParameter("t_title");
		String title = request.getParameter("title");
		title = N_CommonUtil.setQuote(title);
//		String content = mpr.getParameter("t_content");
		String content = request.getParameter("content");
		content = N_CommonUtil.setQuote(content);
		
//		String attach = mpr.getFilesystemName("t_attach");
//		if(attach == null) attach = "";
		
		String reg_id = N_CommonUtil.getSessionInfo(request, "id");
		String reg_date = N_CommonUtil.getTodayTime();
		String important = request.getParameter("important");
		important = N_CommonUtil.setQuote(important);
		String type = request.getParameter("type");
		type = N_CommonUtil.setQuote(type);

		
		NoticeDto dto = new NoticeDto(no, title, content, reg_id, reg_date, important, type);
		
		int result = dao.noticeSave(dto);
		String msg = result == 1? "공지사항 등록 되었습니다!" : "등록실패";
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Notice");
		request.setAttribute("t_gubun", "list");

	}

}
