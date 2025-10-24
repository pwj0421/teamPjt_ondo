package dto;

public class InterestDto {
	private int item_id;
	private String item_name;
	
	public InterestDto(int item_id, String item_name) {
		super();
		this.item_id = item_id;
		this.item_name = item_name;
	}
	
	public int getItem_id() {
		return item_id;
	}
	
	public String getItem_name() {
		return item_name;
	}
	
}
