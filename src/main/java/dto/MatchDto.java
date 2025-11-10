package dto;

import java.util.ArrayList;

public class MatchDto {

	private String memberId, image, nickname, tagline;

	private ArrayList<InterestDto> interestDto;
	
	private String gender, country, introduction;
	
	// MATCH MAIN
	// MatchDao.java : getMatchMyInfo()
	// MatchMyInfo.java
	
	// MATCH LIST
	// MatchDao.java : getMatchList()
	// MatchList.java
	public MatchDto(String memberId, String image, String country, String nickname, String tagline,
			ArrayList<InterestDto> interestDto) {
		super();
		this.memberId = memberId;
		this.image = image;
		this.country = country;
		this.nickname = nickname;
		this.tagline = tagline;
		this.interestDto = interestDto;
	}
	
	// MATCH VIEW
	// MatchDao.java : getMatchView()
	// MatchView.java
	public MatchDto(String memberId, String image, String nickname, String gender, String country, String tagline, String introduction, ArrayList<InterestDto> interestDto) {
		super();
		this.memberId = memberId;
		this.image = image;
		this.nickname = nickname;
		this.gender = gender;
		this.country = country;
		this.tagline = tagline;
		this.introduction = introduction;
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

	public String getGender() {
		return gender;
	}

	public String getCountry() {
		return country;
	}

	public String getIntroduction() {
		return introduction;
	}
}
