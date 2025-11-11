package command.member;


import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.CommonExecute;
import common.CommonUtil;
import dao.MemberDao;
import dto.MemberDto;

public class MemberUpdate implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MemberDao dao = new MemberDao();
		String savePath = request.getServletContext().getRealPath("/image/");

        
        int sizeLimit = 20 * 1024 * 1024; // 10MB
        MultipartRequest multi = null;
        
        try {
            multi = new MultipartRequest(
                request,
                savePath,
                sizeLimit,
                "UTF-8",
                new DefaultFileRenamePolicy()
            );
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("MemberUpdate() 파일 업로드 오류!");
            System.out.println("savePath: " + savePath);

        }
		
		String fileName = multi.getFilesystemName("m_image");
		String originImage = multi.getParameter("origin_image");

		String image = null;
		if (fileName != null) {
			image = Normalizer.normalize(fileName, Normalizer.Form.NFC); // 새 파일 업로드한 경우
		} else if (originImage != null && !originImage.equals("")) {
		    image = originImage; // 기존 이미지 유지
		}
		
		System.out.println("✅ 업로드된 파일명: " + fileName);
		System.out.println("✅ 기존 파일명: " + originImage);
		System.out.println("✅ 최종 DB에 저장될 파일명: " + image);
		
		String id = multi.getParameter("m_id");
		String name = multi.getParameter("m_name");
		HttpSession session = request.getSession();
		session.setAttribute("sessionId", id);
		session.setAttribute("sessionName", name);
		
		String gender = multi.getParameter("m_gender");
		String age = multi.getParameter("m_age");
		
		String country = multi.getParameter("m_country");
		String tel_country_code = multi.getParameter("m_tel_country_code");
		String tel1 = multi.getParameter("m_tel1");
		String tel2 = multi.getParameter("m_tel2");
		String tel3 = multi.getParameter("m_tel3");
		
		String zipcode = multi.getParameter("m_zipcode");
		String address = multi.getParameter("m_address");
		String address_detail = multi.getParameter("m_address_detail");
		
		String email1 = multi.getParameter("m_email1");
		String email2 = multi.getParameter("m_email2");
		String type = multi.getParameter("m_type");
		
		String[] purposeList = multi.getParameterValues("m_purpose_code");
		String update_date = CommonUtil.getTodayTime();
		
		List<String> purpose = (purposeList != null) ? Arrays.asList(purposeList) : new ArrayList<>();
		MemberDto dto = new MemberDto(id, name, country, zipcode, address, address_detail, 
										tel1, tel2, tel3, email1, email2, 
										type, tel_country_code, Integer.parseInt(age), 
										purpose, update_date, gender, image);
		              
		int result = dao.memberUpdate(dto);
		
		String msg = result > 0 ? "회원정보가 성공적으로 수정되었습니다." : "회원정보 수정 실패! 관리자에게 문의하세요.";
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Member");
		request.setAttribute("t_gubun", "myInfo");
	}

}
