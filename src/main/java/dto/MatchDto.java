package dto;

import java.util.ArrayList;

public class MatchDto {

	private String memberId, image, nickname, tagline;

	private ArrayList<InterestDto> interestDto;
	
	// MATCH LIST
	// MatchDao.java
	// getMatchList()
	// MatchList.java
	public MatchDto(String memberId, String image, String nickname, String tagline,
			ArrayList<InterestDto> interestDto) {
		super();
		this.memberId = memberId;
		this.image = image;
		this.nickname = nickname;
		this.tagline = tagline;
		this.interestDto = interestDto;
	}
	
	public String getMemberId() {
		return memberId;
	}

	public String getImage() {
		return image;
	}

	public String getNickname() {
		return nickname;
	}

	public String getTagline() {
		return tagline;
	}

	public ArrayList<InterestDto> getInterestDto() {
		return interestDto;
	}
	
}
