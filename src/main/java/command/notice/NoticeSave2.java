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

public class NoticeSave2 implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		NoticeDao dao = new NoticeDao();
		
		String attachDir = N_CommonUtil.getNoticeDir(request);
		int maxSize = 1024 * 1024 * 10; // 10MB
		
		MultipartRequest mpr = null;
		try {
			mpr = new MultipartRequest(request, attachDir, maxSize, 
									   "utf-8", new DefaultFileRenamePolicy());
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("NOTICE 첨부파일 업로드 오류!");
		}
		
		String no = dao.getNoticeNo();
//		System.out.println("번호:"+ no);
		
		String title = N_CommonUtil.setQuote(mpr.getParameter("title"));
		String content = N_CommonUtil.setQuote(mpr.getParameter("content"));
		String reg_id = N_CommonUtil.getSessionInfo(request, "id");
		String reg_date = N_CommonUtil.getTodayTime();
		
		String important = N_CommonUtil.setQuote(mpr.getParameter("important"));
		String type = N_CommonUtil.setQuote(mpr.getParameter("type"));
		
		String attach_1 = mpr.getFilesystemName("attach_1");
		String attach_2 = mpr.getFilesystemName("attach_2");
		String attach_3 = mpr.getFilesystemName("attach_3");
		
		if ((attach_1 == null || attach_1.isEmpty()) && attach_2 != null) {
		    attach_1 = attach_2;
		    attach_2 = "";
		}
		if ((attach_1 == null || attach_1.isEmpty()) && attach_3 != null) {
		    attach_1 = attach_3;
		    attach_3 = "";
		}
		if ((attach_2 == null || attach_2.isEmpty()) && attach_3 != null) {
		    attach_2 = attach_3;
		    attach_3 = "";
		}

		if (attach_1 == null) attach_1 = "";
		if (attach_2 == null) attach_2 = "";
		if (attach_3 == null) attach_3 = "";

		
		NoticeDto dto = new NoticeDto(no, title, content, reg_id, reg_date, important, type, attach_1, attach_2, attach_3);
		
		int result = dao.noticeSave(dto);
		String msg = result == 1? "공지사항 등록 되었습니다!" : "등록실패";
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Notice");
		request.setAttribute("t_gubun", "list");

	}

}
