package dto;

public class MessageDto {

	private String request_id, sender_id, receiver_id, greetingMsg, request_date, gender,age,country,nickname,profileImg;

	//receiveRequestList  mypage > request_list
	public MessageDto(String request_id, String sender_id, String receiver_id, String greetingMsg, String request_date,
			String gender, String age, String country, String nickname, String profileImg) {
		super();
		this.request_id = request_id;
		this.sender_id = sender_id;
		this.receiver_id = receiver_id;
		this.greetingMsg = greetingMsg;
		this.request_date = request_date;
		this.gender = gender;
		this.age = age;
		this.country = country;
		this.nickname = nickname;
		this.profileImg = profileImg;
	}

	public String getRequest_id() {
		return request_id;
	}

	public void setRequest_id(String request_id) {
		this.request_id = request_id;
	}

	public String getSender_id() {
		return sender_id;
	}

	public void setSender_id(String sender_id) {
		this.sender_id = sender_id;
	}

	public String getReceiver_id() {
		return receiver_id;
	}

	public void setReceiver_id(String receiver_id) {
		this.receiver_id = receiver_id;
	}

	public String getGreetingMsg() {
		return greetingMsg;
	}

	public void setGreetingMsg(String greetingMsg) {
		this.greetingMsg = greetingMsg;
	}

	public String getRequest_date() {
		return request_date;
	}

	public void setRequest_date(String request_date) {
		this.request_date = request_date;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}


	
	
}
