package dto;

public class InterestDto {
	private String item_id, category_code, item_name;
	
	private String category_name;

	// INTEREST LIST
	// InterestList.java
	// MatchDao.java
	// getInterestList()
	public InterestDto(String item_id, String category_code, String item_name, String category_name) {
		super();
		this.item_id = item_id;
		this.category_code = category_code;
		this.item_name = item_name;
		this.category_name = category_name;
	}

	public String getItem_id() {
		return item_id;
	}

	public String getCategory_code() {
		return category_code;
	}

	public String getItem_name() {
		return item_name;
	}

	public String getCategory_name() {
		return category_name;
	}
	
}
