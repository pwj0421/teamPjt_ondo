package dto;

public class SearchDto {
	String s_id, s_keyword, s_recentDate, s_snipKeyword;
	int s_hit;

	public SearchDto(String s_id, String s_keyword, String s_recentDate, String s_snipKeyword, int s_hit) {
		this.s_id = s_id;
		this.s_keyword = s_keyword;
		this.s_recentDate = s_recentDate;
		this.s_snipKeyword = s_snipKeyword;
		this.s_hit = s_hit;
	}
	public String getS_snipKeyword() {
		return s_snipKeyword;
	}
	public void setS_snipKeyword(String s_snipKeyword) {
		this.s_snipKeyword = s_snipKeyword;
	}
	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	public String getS_keyword() {
		return s_keyword;
	}
	public void setS_keyword(String s_keyword) {
		this.s_keyword = s_keyword;
	}
	public String getS_recentDate() {
		return s_recentDate;
	}
	public void setS_recentDate(String s_recentDate) {
		this.s_recentDate = s_recentDate;
	}
	public int getS_hit() {
		return s_hit;
	}
	public void setS_hit(int s_hit) {
		this.s_hit = s_hit;
	}
	
}
