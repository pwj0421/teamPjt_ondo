package dto;

public class NoticeDto {
	private String no, title, content, reg_id, profileImg,reg_name, reg_date, update_date, important, type, attach_1, attach_2, attach_3;
	private int hit;
	
	//글 저장
	public NoticeDto(String no, String title, String content, String reg_id, String reg_date, String important,
			String type, String attach_1, String attach_2, String attach_3) {
		this.no = no;
		this.title = title;
		this.content = content;
		this.reg_id = reg_id;
		this.reg_date = reg_date;
		this.important = important;
		this.type = type;
		this.attach_1 = attach_1;
		this.attach_2 = attach_2;
		this.attach_3 = attach_3;
	}
	
	//리스트
	public NoticeDto(String no, String title, String reg_name, String reg_date, String important, String type,
			String attach_1, String attach_2, String attach_3, int hit) {
		this.no = no;
		this.title = title;
		this.reg_name = reg_name;
		this.reg_date = reg_date;
		this.important = important;
		this.type = type;
		this.attach_1 = attach_1;
		this.attach_2 = attach_2;
		this.attach_3 = attach_3;
		this.hit = hit;
	}

	//상세보기
	public NoticeDto(String no, String title, String content, String reg_id, String profileImg, String reg_name, String reg_date,
			String type, String important, String attach_1, String attach_2, String attach_3, int hit) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.reg_id = reg_id;
		this.profileImg=profileImg;
		this.reg_name = reg_name;
		this.reg_date = reg_date;
		this.type = type;
		this.important = important;
		this.attach_1 = attach_1;
		this.attach_2 = attach_2;
		this.attach_3 = attach_3;
		this.hit = hit;
	}
	
	//최신글 3개
	public NoticeDto(String no, String title) {
		this.no = no;
		this.title = title;
	}
	
	//수정
	public NoticeDto(String no, String title, String content, String important, String type, String update_date, String attach_1,
			String attach_2, String attach_3) {
		this.no = no;
		this.title = title;
		this.content = content;
		this.important = important;
		this.type = type;
		this.update_date = update_date;
		this.attach_1 = attach_1;
		this.attach_2 = attach_2;
		this.attach_3 = attach_3;
	}
	
	//인덱스 공지
	public NoticeDto(String no, String title, String reg_name, String reg_date) {
		super();
		this.no = no;
		this.title = title;
		this.reg_name = reg_name;
		this.reg_date = reg_date;
	}
	
	//메인 통합 검색용 
	public NoticeDto(String no, String title, String content, String reg_name, String reg_date, int hit) {
		this.no = no;
		this.title = title;
		this.content = content;
		this.reg_name = reg_name;
		this.reg_date = reg_date;
		this.hit = hit;
	}

	public String getNo() {
			return no;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}

	public String getReg_id() {
		return reg_id;
	}

	public String getReg_name() {
		return reg_name;
	}

	public String getUpdate_date() {
		return update_date;
	}

	public String getImportant() {
		return important;
	}

	public int getHit() {
		return hit;
	}

	public String getType() {
		return type;
	}

	public String getReg_date() {
		return reg_date;
	}

	public String getAttach_1() {
		return attach_1;
	}

	public String getAttach_2() {
		return attach_2;
	}

	public String getAttach_3() {
		return attach_3;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	

	
	

}
