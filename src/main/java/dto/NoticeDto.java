package dto;

public class NoticeDto {
	private String no, title, content, reg_id, reg_name, reg_date, update_date, important, type, attach_1, attach_2, attach_3;
	private int hit;
	
	//글 저장
	public NoticeDto(String no, String title, String content, String reg_id, String reg_date, String important,
			String type) {
		this.no = no;
		this.title = title;
		this.content = content;
		this.reg_id = reg_id;
		this.reg_date = reg_date;
		this.important = important;
		this.type = type;
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

	

	
	

}
