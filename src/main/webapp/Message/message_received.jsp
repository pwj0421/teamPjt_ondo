<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common_header.jsp" %>  
<%@ include file="../menu/quickMenu.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>받은 친구 요청</title>
<style>
/* 전체 레이아웃 */
.mp_mypage_container {
  display: flex;
  width: 100%;
  min-height: 85vh;
  padding: 40px 70px;
  gap: 40px;
  background: #fff;
}


/* 메인 콘텐츠 */
.chat_main_content {
  flex: 1;
}

/* chatRoom/리스트 스타일 감싸는 기본 박스 */
.chat_room_wrapper {
  background: #fff;
  border: 1px solid #e0e0e0;
  border-radius: 16px;
  box-shadow: 0 3px 10px rgba(0,0,0,0.05);
  padding: 30px;
  transition: 0.3s;
  min-height: 400px;
}

.chat_room_wrapper:hover {
  box-shadow: 0 4px 14px rgba(0,0,0,0.08);
}

/* 요청 없을 때 문구 */
.no_request_box {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 300px;
  font-size: 18px;
  color: #777;
  font-weight: 500;
}

/* 카드 스타일 */
.friend_card_container {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 25px;
  margin-top: 20px;
}

.friend_card {
  background: #fff;
  border: 1px solid #eee;
  border-radius: 12px;
  padding: 15px;
  text-align: center;
  transition: 0.3s;
}

.friend_card:hover {
  box-shadow: 0 3px 12px rgba(0,0,0,0.08);
}

.friend_card img {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  object-fit: cover;
}

.friend_nickname {
  font-weight: 600;
  color: #c89f6d;
  font-size: 16px;
  margin-top: 8px;
}

.friend_intro {
  font-size: 14px;
  color: #555;
}

.friend_subinfo {
  font-size: 13px;
  color: #777;
  margin: 5px 0 10px;
}

.friend_button_box {
  display: flex;
  justify-content: center;
  gap: 10px;
}

.friend_button_box button {
  border: none;
  padding: 6px 14px;
  border-radius: 8px;
  font-weight: 600;
  cursor: pointer;
  font-size: 13px;
  transition: 0.2s;
}

.friend_accept {
  background: #c89f6d;
  color: #fff;
}
.friend_accept:hover {
  background: #b38a5a;
}

.friend_reject {
  background: #eee;
  color: #555;
}
.friend_reject:hover {
  background: #ccc;
}

/* 페이징 */
.friend_paging {
  display: flex;
  justify-content: center;
  gap: 8px;
  margin-top: 30px;
}
.friend_paging span {
  display: inline-block;
  width: 28px;
  height: 28px;
  line-height: 28px;
  border-radius: 50%;
  background: #eee;
  text-align: center;
  cursor: pointer;
  font-weight: 600;
}
.friend_paging span.active {
  background: #c89f6d;
  color: #fff;
}
</style>
</head>
<body>
<div class="mp_mypage_container">
    <!-- 왼쪽 메뉴 -->
    <div class="chat_side_menu">
        <%@ include file="../menu/chat_menu.jsp" %>
    </div>

    <!-- 메인 콘텐츠 -->
    <div class="chat_main_content chat_room_wrapper">
        <!-- ✅ 요청이 없을 경우 -->
        <c:if test="${empty r_dtos}">
            <div class="no_request_box">받은 요청이 없습니다.</div>
        </c:if>

        <!-- ✅ 요청이 있을 경우 -->
        <c:if test="${not empty r_dtos}">
            <div class="friend_card_container">
                <c:forEach items="${r_dtos}" var="dto">
                    <div class="friend_card">
                        <img src="attach/member_profile/${dto.getProfileImg()}" alt="프로필">
                        <div class="friend_nickname">${dto.getNickname()}</div>
                        <div class="friend_intro">${dto.getGreetingMsg()}</div>
                        <div class="friend_subinfo">${dto.getCountry()} | ${dto.getGender()} | ${dto.getAge()}</div>
                        <div class="friend_button_box">
                            <button type="button" class="friend_accept"
                                onclick="updateState('${dto.getRequest_id()}','${dto.getSender_id()}','accepted','stateUpdate','${dto.getGreetingMsg()}')">수락</button>
                            <button type="button" class="friend_reject"
                                onclick="updateState('${dto.getRequest_id()}','','rejected','stateUpdate','')">거절</button>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- 페이징 -->
            <div class="friend_paging">
                <span class="active">1</span>
                <span>2</span>
                <span>3</span>
            </div>
        </c:if>
    </div>
</div>
<form name="msgReqList">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="state">
	<input type="hidden" name="partnerId">
	<input type="hidden" name="requestId">
	<input type="hidden" name="greetingMsg">
	<input type="hidden" name="locate" value="chatReceived">
</form>
<script>
function updateState(requestId, senderId, state, gubun, greetingMsg) {
    if (state == "rejected") {
        if (confirm("거절 시 해당 회원은 나에게 다시 요청을 보낼 수 없습니다. 정말 거절하시겠습니까?")) {
            msgReqList.t_gubun.value = gubun;
            msgReqList.state.value = state;
            msgReqList.partnerId.value = senderId;
            msgReqList.requestId.value = requestId;
            msgReqList.greetingMsg.value = greetingMsg;
            msgReqList.method = "post";
            msgReqList.action = "Chat";
            msgReqList.submit();
        } 
    } else {
    	msgReqList.t_gubun.value = gubun;
        msgReqList.state.value = state;
        msgReqList.partnerId.value = senderId;
        msgReqList.requestId.value = requestId;
        msgReqList.greetingMsg.value = greetingMsg;
        msgReqList.method = "post";
        msgReqList.action = "Chat";
        msgReqList.submit();
    }
}
</script>

<%@ include file="../common_footer.jsp" %>
</body>
</html>
