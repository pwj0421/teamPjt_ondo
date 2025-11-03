package dto;

public class MessageDto {
	private String requestNo, senderId, receiverId, greetingMsg, sendDate, 
					profileImg, r_nickname, r_tagline,
					r_gender, r_country, r_age;
	
	
	
	//receiveRequestList  mypage > request_list
	public MessageDto(String requestNo, String senderId, String receiverId, String greetingMsg, String sendDate, String profileImg,
			String r_nickname,String r_gender, String r_country, String r_age) {
		this.requestNo = requestNo;
		this.senderId = senderId;
		this.receiverId = receiverId;
		this.greetingMsg = greetingMsg;
		this.sendDate = sendDate;
		this.profileImg = profileImg;
		this.r_nickname = r_nickname;
		this.r_gender = r_gender;
		this.r_country = r_country;
		this.r_age = r_age;
	}

	public String getRequestNo() {
		return requestNo;
	}

	public void setRequestNo(String requestNo) {
		this.requestNo = requestNo;
	}

	public String getSenderId() {
		return senderId;
	}

	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}

	public String getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}

	public String getGreetingMsg() {
		return greetingMsg;
	}

	public void setGreetingMsg(String greetingMsg) {
		this.greetingMsg = greetingMsg;
	}

	public String getSendDate() {
		return sendDate;
	}

	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}


	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public String getR_nickname() {
		return r_nickname;
	}

	public void setR_nickname(String r_nickname) {
		this.r_nickname = r_nickname;
	}

	public String getR_tagline() {
		return r_tagline;
	}

	public void setR_tagline(String r_tagline) {
		this.r_tagline = r_tagline;
	}

	public String getR_gender() {
		return r_gender;
	}

	public void setR_gender(String r_gender) {
		this.r_gender = r_gender;
	}

	public String getR_country() {
		return r_country;
	}

	public void setR_country(String r_country) {
		this.r_country = r_country;
	}

	public String getR_age() {
		return r_age;
	}

	public void setR_age(String r_age) {
		this.r_age = r_age;
		
	}
	
	
	
}
