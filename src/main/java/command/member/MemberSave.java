package command.member;


import java.io.File;
import java.security.NoSuchAlgorithmException;
import java.text.Normalizer;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.CommonExecute;
import common.CommonUtil;
import dao.MemberDao;
import dto.MemberDto;

public class MemberSave implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		
			MemberDao dao = new MemberDao();
			
			String savePath = request.getSession().getServletContext().getRealPath("/") + "image/";
			
			
			File dir = new File(savePath);
			if (!dir.exists()) dir.mkdirs();
			
			int sizeLimit = 10 * 1024 * 1024; // 10MB
			MultipartRequest mprTemp = null;
			try {
				mprTemp = new MultipartRequest(
						request, 
						savePath, 
						sizeLimit, 
						"UTF-8", 
						new DefaultFileRenamePolicy()
				);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("MemberSave() 첨부파일 업로드 오류");
				
			}
			
			String id = mprTemp.getParameter("m_id");
			String password = mprTemp.getParameter("m_password");
			
			try {
				password = dao.encryptSHA256(password);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
			
			String name = mprTemp.getParameter("m_name");
			String age = mprTemp.getParameter("m_age");
			String nickname = mprTemp.getParameter("m_nickname");
			String gender = mprTemp.getParameter("m_gender");
			String country = mprTemp.getParameter("m_country");
			String zipcode = mprTemp.getParameter("m_zipcode");
			String address = mprTemp.getParameter("m_address");
			String address_detail = mprTemp.getParameter("m_address_detail");
			String tel_country_code = mprTemp.getParameter("m_tel_country_code");
			String tel1 = mprTemp.getParameter("m_tel1");
			String tel2 = mprTemp.getParameter("m_tel2");
			String tel3 = mprTemp.getParameter("m_tel3");
			String email1 = mprTemp.getParameter("m_email1");
			String email2 = mprTemp.getParameter("m_email2");
			String type = mprTemp.getParameter("m_type");
			String recommender = mprTemp.getParameter("m_recommender");
			String reg = CommonUtil.getTodayTime();
			String fileName = mprTemp.getFilesystemName("m_image");
			String image = "";
			if (fileName != null) {
				image = Normalizer.normalize(fileName, Normalizer.Form.NFC);
			}
			System.out.println("📁 파일 저장 경로: " + savePath);
			System.out.println("🖼 업로드된 파일명: " + fileName);
			
			String[] purpose = mprTemp.getParameterValues("m_purpose_code");
			String[] interestItem = mprTemp.getParameterValues("m_interest");
	 		MemberDto dto = new MemberDto(
				    id, password, name, nickname, image, gender,
				    country, zipcode, address, address_detail,
				    tel1, tel2, tel3,
				    email1, email2, type, recommender,
				    reg, "", "", Integer.parseInt(age), tel_country_code
				);
			
			
			int result = dao.memberSave(dto, interestItem);
			String msg = "";
			
			//가입목적 저장
			
			if(result == 1) {
				if(purpose != null) {
					for(String code : purpose) {
						dao.insertMemberPurpose(id, code);
					}
				}
				msg = name+"님 회원가입이 완료되었습니다.";
			}else msg = "회원가입 실패! 관리자에게 문의해주세요.";
			
	
			
			request.setAttribute("t_msg", msg);
			request.setAttribute("t_url", "Index");
		
	}
	
}
