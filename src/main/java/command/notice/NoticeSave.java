package command.notice;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

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
		
		String saveDir = N_CommonUtil.getNoticeDir(request);
		int maxSize = 1024 * 1024 * 10; // 10MB
		
		String no = dao.getNoticeNo();
//		System.out.println("번호:"+ no);

		File curretDir = new File(saveDir);
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(curretDir);
		factory.setSizeThreshold(maxSize);
		
		ServletFileUpload upload = new ServletFileUpload(factory);	
		String title="", content="", important="", type="", attach_1="", attach_2="", attach_3="";
		
//		String title = N_CommonUtil.setQuote(mpr.getParameter("title"));
//		String content = N_CommonUtil.setQuote(mpr.getParameter("content"));		
		String reg_id = N_CommonUtil.getSessionInfo(request, "id");
		String reg_date = N_CommonUtil.getTodayTime();
//		String important = N_CommonUtil.setQuote(mpr.getParameter("important"));
//		String type = N_CommonUtil.setQuote(mpr.getParameter("type"));
		int order =1;
		try {
			List<FileItem> items = upload.parseRequest(request);
			for(FileItem fi : items) {
				if(fi.isFormField() ) {
					if(fi.getFieldName().equals("title")) title = N_CommonUtil.setQuote(fi.getString("utf-8"));
					if(fi.getFieldName().equals("content")) content = N_CommonUtil.setQuote(fi.getString("utf-8"));
					if(fi.getFieldName().equals("important")) important = fi.getString("utf-8");
					if(fi.getFieldName().equals("type")) type = fi.getString("utf-8");
				}
				else {
					String origin = fi.getName();
					String ext = origin.substring(origin.lastIndexOf(".")); // 확장자 가져오기 
					
					UUID uuid = UUID.randomUUID(); // 단점 보완! 이름 고유값 줌으로써!
//					String attachName = uuid + ext;  //
					String attachName = origin;
					if(order == 1) attach_1=attachName;
					if(order == 2) attach_2=attachName;
					if(order == 3) attach_3=attachName;
					
					
					System.out.println("attach_1:"+attach_1);
					System.out.println("attach_2:"+attach_2);
					System.out.println("attach_3:"+attach_3);
					
					order++;
					fi.write(new File(saveDir, attachName));

				}                                       
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
//		String title = N_CommonUtil.setQuote(mpr.getParameter("title"));
//		String content = N_CommonUtil.setQuote(mpr.getParameter("content"));
//		String reg_id = N_CommonUtil.getSessionInfo(request, "id");
//		String reg_date = N_CommonUtil.getTodayTime();
//		
//		String important = N_CommonUtil.setQuote(mpr.getParameter("important"));
//		String type = N_CommonUtil.setQuote(mpr.getParameter("type"));
		
		
		NoticeDto dto = new NoticeDto(no, title, content, reg_id, reg_date, important, type, attach_1, attach_2, attach_3);
		
		int result = dao.noticeSave(dto);
		String msg = result == 1? "공지사항 등록 되었습니다!" : "등록실패";
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Notice");
		request.setAttribute("t_gubun", "list");

	}

}
