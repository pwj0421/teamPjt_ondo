<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>  
<%@ include file="../menu/quickMenu.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>친구 대화 목록</title>
<style>
/* 친구 리스트 원본 스타일 */
.friend_mail_list { display: flex; flex-direction: column; gap: 15px; }
.friend_mail_card { display: flex; align-items: center; gap: 15px; background: #fff; border: 1px solid #eee; border-radius: 12px; padding: 12px 15px; transition: 0.3s; cursor: pointer; }
.friend_mail_card:hover { box-shadow: 0 2px 10px rgba(0,0,0,0.08); }
.mail_status { width: 12px; height: 12px; border-radius: 50%; }
.mail_status.unread { background: #c89f6d; }
.mail_status.read { background: #eee; }
.friend_mail_card img { width: 50px; height: 50px; border-radius: 50%; object-fit: cover; }
.mail_info { flex-grow: 1; }
.friend_nickname { font-weight: 600; font-size: 16px; color: #c89f6d; }
.last_message { font-size: 14px; color: #555; margin-top: 3px; }
.mail_date { font-size: 13px; color: #777; width: 80px; text-align: right; }
.friend_mail_card button.friend_reject { padding: 5px 10px; border-radius: 8px; border: none; font-size: 13px; font-weight: 600; cursor: pointer; background: #eee; color: #555; }
.friend_mail_card button.friend_reject:hover { background: #ccc; }

/* 모달 스타일 유지 */
.chat_modal { 
  display: none; 
  position: fixed; 
  top: 50%; 
  left: 50%; 
  transform: translate(-50%, -50%); 
  width: 650px; 
  max-width: 95%; 
  height: 550px; 
  background: #fff; 
  border-radius: 12px; 
  box-shadow: 0 4px 15px rgba(0,0,0,0.2); 
  z-index: 1000; 
  padding: 20px; 
  flex-direction: column;
}
.chat_modal.active { display: flex; }

.chat_header { font-weight: 600; font-size: 18px; margin-bottom: 10px; color: #c89f6d; display: flex; justify-content: space-between; align-items: center; }
.chat_box { flex-grow: 1; overflow-y: auto; padding: 10px; border: 1px solid #eee; border-radius: 12px; background: #fafafa; margin-bottom: 10px; }
.chat_message { margin: 5px 0; padding: 8px 12px; border-radius: 12px; max-width: 70%; word-break: break-word; }
.chat_message.sent { background: #c89f6d; color: #fff; margin-left: auto; }
.chat_message.received { background: #eee; color: #333; margin-right: auto; }
.chat_time { display: block; font-size: 10px; color: #777; margin-top: 2px; text-align: right; }
.chat_input { display: flex; gap: 8px; }
.chat_input input { flex-grow: 1; padding: 8px; border-radius: 8px; border: 1px solid #ccc; }
.chat_input button { padding: 8px 14px; border-radius: 8px; border: none; background: #c89f6d; color: #fff; font-weight: 600; cursor: pointer; }
.chat_input button:hover { background: #b38a5a; }
.modal_close { cursor: pointer; font-size: 16px; color: #777; }
</style>
</head>
<body>

<div class="mp_mypage_container">
    <%@ include file="../menu/mypage_menu.jsp" %>

    <div class="mp_mypage_content">
        <h3>친구 대화 목록</h3>
        <div class="friend_mail_list">
            <c:forEach items="${r_dto}" var="dto">
                <div class="friend_mail_card" data-room="${dto.roomId}" data-name="${dto.nickname}">
                    <div class="mail_status unread"></div>
                    <img src="attach/member_profile/${dto.profileImg}" alt="">
                    <div class="mail_info">
                        <div class="friend_nickname">${dto.nickname}</div>
                        <div class="last_message">${dto.lastMsg}</div>
                    </div>
                    <div class="mail_date">${dto.lastTime}</div>
                    <button class="friend_reject">삭제</button>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<!-- 모달 내용 초기화 -->
<div class="chat_modal" id="chatModal">
  <div class="chat_header">
    <span id="chatFriendName">친구 이름</span>
    <span class="modal_close" id="closeModal">&times;</span>
  </div>
  <div class="chat_box" id="chatBox">
    <!-- 메시지 불러오기/전송은 내일 구현 -->
  </div>
  <div class="chat_input">
    <input type="text" id="chatInput" placeholder="메세지를 입력하세요" disabled>
    <button id="sendChat" disabled>전송</button>
  </div>
</div>

<script>
// 모달 열기/닫기
document.querySelectorAll('.friend_mail_card').forEach(card=>{
  card.addEventListener('click', ()=>{
    const name = card.dataset.name;
    document.getElementById('chatFriendName').textContent = name;
    document.getElementById('chatModal').classList.add('active');
  });
});

document.getElementById('closeModal').addEventListener('click', ()=>{
  document.getElementById('chatModal').classList.remove('active');
});
</script>
<%@ include file="../common_footer.jsp" %>  
</body>
</html>
