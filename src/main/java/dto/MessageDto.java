package dto;

public class MessageDto {
	private String senderId, receiverId, greetingMsg, sendDate, prifileImg, nickname, tagline;
	
	//receiveRequestList  mypage > request_list
	public MessageDto(String senderId, String receiverId, String greetingMsg, String sendDate, String prifileImg,
			String nickname, String tagline) {
		this.senderId = senderId;
		this.receiverId = receiverId;
		this.greetingMsg = greetingMsg;
		this.sendDate = sendDate;
		this.prifileImg = prifileImg;
		this.nickname = nickname;
		this.tagline = tagline;
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

	public String getPrifileImg() {
		return prifileImg;
	}

	public void setPrifileImg(String prifileImg) {
		this.prifileImg = prifileImg;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getTagline() {
		return tagline;
	}

	public void setTagline(String tagline) {
		this.tagline = tagline;
	}
	
	
	
	
	
}
