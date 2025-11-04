package dto;

import java.util.List;

public class MemberDto {
	private String m_id, m_password, m_name, m_nickname, 
					m_image, m_gender, m_country, m_zipcode, 
					m_address, m_address_detail, m_tel1, m_tel2,
					m_tel3, m_email1, m_email2, m_type, m_purpose, 
					m_recommender, m_reg, m_updated, m_quit, m_tel_country_code;
	private int m_age;
	private String m_tagline, m_introduction, m_interest;
	
	private List<String> purposeCode;
	
	// 탈퇴해원 체크용
	public MemberDto(String m_id, String m_name, String m_password, 
            String m_type, String m_quit, String m_image) {
			this.m_id = m_id;
			this.m_name = m_name;
			this.m_password = m_password;
			this.m_type = m_type;
			this.m_quit = m_quit;
			this.m_image = m_image;
			}
	
	
	
	//내정보 수정
	public MemberDto(String m_id, String m_name, String m_country, String m_zipcode, String m_address,
			String m_address_detail, String m_tel1, String m_tel2, String m_tel3, 
			String m_email1, String m_email2, String m_type, String m_tel_country_code, int m_age, 
			List<String> purposeCode, String m_updated, String m_gender, String m_image) {
		
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_country = m_country;
		this.m_zipcode = m_zipcode;
		this.m_address = m_address;
		this.m_address_detail = m_address_detail;
		this.m_tel1 = m_tel1;
		this.m_tel2 = m_tel2;
		this.m_tel3 = m_tel3;
		this.m_email1 = m_email1;
		this.m_email2 = m_email2;
		this.m_type = m_type;
		this.m_tel_country_code = m_tel_country_code;
		this.m_age = m_age;
		this.purposeCode = purposeCode;
		this.m_updated = m_updated;
		this.m_gender = m_gender;
		this.m_image = m_image;
	}
	
	
	
	//내정보 조회
	public MemberDto(String m_id, String m_name, String m_nickname, String m_image, String m_gender,
			String m_country, String m_zipcode, String m_address, String m_address_detail, String m_tel1, String m_tel2,
			String m_tel3, String m_email1, String m_email2, String m_type, String m_recommender,
			String m_reg, String m_updated, int m_age, String m_tel_country_code) {
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_nickname = m_nickname;
		this.m_image = m_image;
		this.m_gender = m_gender;
		this.m_country = m_country;
		this.m_zipcode = m_zipcode;
		this.m_address = m_address;
		this.m_address_detail = m_address_detail;
		this.m_tel1 = m_tel1;
		this.m_tel2 = m_tel2;
		this.m_tel3 = m_tel3;
		this.m_email1 = m_email1;
		this.m_email2 = m_email2;
		this.m_type = m_type;
		this.m_recommender = m_recommender;
		this.m_reg = m_reg;
		this.m_updated = m_updated;
		this.m_age = m_age;
		this.m_tel_country_code = m_tel_country_code;
	}

	

	//매칭내정보
	public MemberDto(String m_nickname, String m_tagline, String m_introduction) {
		this.m_nickname = m_nickname;
		this.m_tagline = m_tagline;
		this.m_introduction = m_introduction;
	}
	
	//회원가입
	public MemberDto(String m_id, String m_password, String m_name, String m_nickname, String m_image, String m_gender,
			String m_country, String m_zipcode, String m_address, String m_address_detail, String m_tel1, String m_tel2,
			String m_tel3, String m_email1, String m_email2, String m_type, String m_recommender,
			String m_reg, String m_updated, String m_quit, int m_age, String m_tel_country_code, String m_tagline, String m_introduction) {
		this.m_id = m_id;
		this.m_password = m_password;
		this.m_name = m_name;
		this.m_nickname = m_nickname;
		this.m_image = m_image;
		this.m_gender = m_gender;
		this.m_country = m_country;
		this.m_zipcode = m_zipcode;
		this.m_address = m_address;
		this.m_address_detail = m_address_detail;
		this.m_tel1 = m_tel1;
		this.m_tel2 = m_tel2;
		this.m_tel3 = m_tel3;
		this.m_email1 = m_email1;
		this.m_email2 = m_email2;
		this.m_type = m_type;
		this.m_recommender = m_recommender;
		this.m_reg = m_reg;
		this.m_updated = m_updated;
		this.m_quit = m_quit;
		this.m_age = m_age;
		this.m_tel_country_code = m_tel_country_code;
		this.m_tagline = m_tagline;
		this.m_introduction = m_introduction;
	}



	
	public List<String> getPurposeCode() {
		return purposeCode;
	}

	public void setPurposeCode(List<String> purposeCode) {
		this.purposeCode = purposeCode;
	}

	public String getM_interest() {
		return m_interest;
	}

	public void setM_interest(String m_interest) {
		this.m_interest = m_interest;
	}

	public String getM_tel_country_code() {
		return m_tel_country_code;
	}

	public void setM_tel_country_code(String m_tel_country_code) {
		this.m_tel_country_code = m_tel_country_code;
	}

	public void setM_recommender(String m_recommender) {
		this.m_recommender = m_recommender;
	}

	public String getM_tagline() {
		return m_tagline;
	}

	public void setM_tagline(String m_tagline) {
		this.m_tagline = m_tagline;
	}

	public String getM_introduction() {
		return m_introduction;
	}

	public void setM_introduction(String m_introduction) {
		this.m_introduction = m_introduction;
	}

	public String getM_nickname() {
		return m_nickname;
	}
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	public String getM_image() {
		return m_image;
	}
	public void setM_image(String m_image) {
		this.m_image = m_image;
	}
	public String getM_tel1() {
		return m_tel1;
	}
	public void setM_tel1(String m_tel1) {
		this.m_tel1 = m_tel1;
	}
	public String getM_tel2() {
		return m_tel2;
	}
	public void setM_tel2(String m_tel2) {
		this.m_tel2 = m_tel2;
	}
	public String getM_tel3() {
		return m_tel3;
	}
	public void setM_tel3(String m_tel3) {
		this.m_tel3 = m_tel3;
	}
	public String getM_email1() {
		return m_email1;
	}
	public void setM_email1(String m_email1) {
		this.m_email1 = m_email1;
	}
	public String getM_email2() {
		return m_email2;
	}
	public void setM_email2(String m_email2) {
		this.m_email2 = m_email2;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_password() {
		return m_password;
	}
	public void setM_password(String m_password) {
		this.m_password = m_password;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public String getM_country() {
		return m_country;
	}
	public void setM_country(String m_country) {
		this.m_country = m_country;
	}
	public String getM_zipcode() {
		return m_zipcode;
	}
	public void setM_zipcode(String m_zipcode) {
		this.m_zipcode = m_zipcode;
	}
	public String getM_address() {
		return m_address;
	}
	public void setM_address(String m_address) {
		this.m_address = m_address;
	}
	public String getM_address_detail() {
		return m_address_detail;
	}
	public void setM_address_detail(String m_address_detail) {
		this.m_address_detail = m_address_detail;
	}
	
	public String getM_type() {
		return m_type;
	}
	public void setM_type(String m_type) {
		this.m_type = m_type;
	}
	public String getM_purpose() {
		return m_purpose;
	}
	public void setM_purpose(String m_purpose) {
		this.m_purpose = m_purpose;
	}
	public String getM_recommender() {
		return m_recommender;
	}
	public void setM_recommend(String m_recommender) {
		this.m_recommender = m_recommender;
	}
	public String getM_reg() {
		return m_reg;
	}
	public void setM_reg(String m_reg) {
		this.m_reg = m_reg;
	}
	public String getM_updated() {
		return m_updated;
	}
	public void setM_updated(String m_updated) {
		this.m_updated = m_updated;
	}
	public String getM_quit() {
		return m_quit;
	}
	public void setM_quit(String m_quit) {
		this.m_quit = m_quit;
	}
	public int getM_age() {
		return m_age;
	}
	public void setM_age(int m_age) {
		this.m_age = m_age;
	}
	
	
}
