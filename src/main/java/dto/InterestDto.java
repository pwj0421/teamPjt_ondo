package dto;

public class InterestDto {
	private int item_id;
    private String category_code;
    private String category_name;
    private String item_name;
    private String category_icon;
	
    // 매칭된 회원의 관심사 목록
    // MatchDao.java : getMatchList()
	public InterestDto(int item_id, String item_name) {
		super();
		this.item_id = item_id;
		this.item_name = item_name;
	}
	
	//회원가입시 관심사 목록 출력용
	public InterestDto(int item_id, String category_code, String category_name, String item_name, String category_icon) {
		this.item_id = item_id;
		this.category_code = category_code;
		this.category_name = category_name;
		this.item_name = item_name;
		this.category_icon = category_icon;
	}
	
	public String getCategory_icon() {
		return category_icon;
	}

	public String getCategory_code() {
		return category_code;
	}

	public String getCategory_name() {
		return category_name;
	}

	public int getItem_id() {
		return item_id;
	}
	
	public String getItem_name() {
		return item_name;
	}
	
}
