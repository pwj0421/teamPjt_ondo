package dto;

public class MatchDto {

	private String match_id, match_nickname, match_tagline, match_introduction, match_status, match_reg_date, match_update_date;
	
	private String profile_image;

	// MATCH LIST
	// MatchDao.java
	// MatchList.java
	// getMatchList()
	public MatchDto(String match_id, String match_nickname, String match_tagline, String profile_image) {
		super();
		this.match_id = match_id;
		this.match_nickname = match_nickname;
		this.match_tagline = match_tagline;
		this.profile_image = profile_image;
	}

	public String getMatch_id() {
		return match_id;
	}

	public String getMatch_nickname() {
		return match_nickname;
	}

	public String getMatch_tagline() {
		return match_tagline;
	}

	public String getMatch_introduction() {
		return match_introduction;
	}

	public String getMatch_status() {
		return match_status;
	}

	public String getMatch_reg_date() {
		return match_reg_date;
	}

	public String getMatch_update_date() {
		return match_update_date;
	}

	public String getProfile_image() {
		return profile_image;
	}
	
}
