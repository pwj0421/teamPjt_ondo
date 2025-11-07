package dto;


public class MessageChatDto {
    private String roomId;
    private String requestId;
    private String partnerId;
    private String myId;

    private String messageId;
    private String content;
    private String senderId;
    private String sentAt;

    private String partnerNickname;
    private String partnerImage;

    // 기본 생성자
    public MessageChatDto() {}

    
    //메세지리스트
    public MessageChatDto(String roomId, String messageId, String content, String senderId, String sentAt) {
		super();
		this.roomId = roomId;
		this.messageId = messageId;
		this.content = content;
		this.senderId = senderId;
		this.sentAt = sentAt;
	}



	// getter & setter
    public String getRoomId() { return roomId; }
    public void setRoomId(String roomId) { this.roomId = roomId; }

    public String getRequestId() { return requestId; }
    public void setRequestId(String requestId) { this.requestId = requestId; }

    public String getPartnerId() { return partnerId; }
    public void setPartnerId(String partnerId) { this.partnerId = partnerId; }

    public String getMyId() { return myId; }
    public void setMyId(String myId) { this.myId = myId; }

    public String getMessageId() { return messageId; }
    public void setMessageId(String messageId) { this.messageId = messageId; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public String getSenderId() { return senderId; }
    public void setSenderId(String senderId) { this.senderId = senderId; }

    public String getSentAt() { return sentAt; }
    public void setSentAt(String sentAt) { this.sentAt = sentAt; }

    public String getPartnerNickname() { return partnerNickname; }
    public void setPartnerNickname(String partnerNickname) { this.partnerNickname = partnerNickname; }

    public String getPartnerImage() { return partnerImage; }
    public void setPartnerImage(String partnerImage) { this.partnerImage = partnerImage; }
}
