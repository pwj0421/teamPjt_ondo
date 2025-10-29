package command.member;


import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
import dao.MemberDao;
import dto.MemberDto;

public class MemberSave implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MemberDao dao = new MemberDao();
		
		String id = request.getParameter("m_id");
		String password = request.getParameter("m_password");
		
//		try {
//			password = dao.encryptSHA256(password);
//		} catch (NoSuchAlgorithmException e) {
//			e.printStackTrace();
//		}
		
		String name = request.getParameter("m_name");
		String age = request.getParameter("m_age");
		String nickname = request.getParameter("m_nickname");
		String gender = request.getParameter("m_gender");
		String country = request.getParameter("m_country");
		String zipcode = request.getParameter("m_zipcode");
		String address = request.getParameter("m_address");
		String address_detail = request.getParameter("m_address_detail");
		String tel1 = request.getParameter("m_tel1");
		String tel2 = request.getParameter("m_tel2");
		String tel3 = request.getParameter("m_tel3");
		String email1 = request.getParameter("m_email1");
		String email2 = request.getParameter("m_email2");
		String type = request.getParameter("m_type");
		String purpose = request.getParameter("m_purpose");
		String recommender = request.getParameter("m_recommender");
		String reg = CommonUtil.getTodayTime();
		String image = request.getParameter("m_image");
		
		MemberDto dto = new MemberDto(
			    id, password, name, nickname, image, gender,
			    country, zipcode, address, address_detail,
			    tel1, tel2, tel3,
			    email1, email2, type, purpose, recommender,
			    reg, "", "", Integer.parseInt(age)
			);
		
		int result = dao.memberSave(dto);
		String msg = "";
		if(result == 1) msg = name+"님 회원가입이 완료되었습니다.";
		else msg = "회원가입 실패! 관리자에게 문의해주세요.";
		
		request.setAttribute("t_msg", msg);
		
		request.setAttribute("t_url", "Index");
	}
	
}
