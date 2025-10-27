package dto;

public class PurposeDto {
	private String purpose_code, purpose_name;

	
	
	public PurposeDto(String purpose_code, String purpose_name) {
		this.purpose_code = purpose_code;
		this.purpose_name = purpose_name;
	}

	public String getPurpose_code() {
		return purpose_code;
	}

	public String getPurpose_name() {
		return purpose_name;
	}
	
	
}
