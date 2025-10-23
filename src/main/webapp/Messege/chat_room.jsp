<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>대화방</title>
<link rel="stylesheet" href="../CSS/chatRoom.css">
<script>
  function sendMessage() {
    const input = document.getElementById('chatInput');
    const message = input.value.trim();
    if (!message) return;

    const chatBox = document.querySelector('.chat_messages');

    const wrapper = document.createElement('div');
    wrapper.className = 'chat_message_wrapper';

    const divMsg = document.createElement('div');
    divMsg.className = 'chat_message me';
    divMsg.textContent = message;

    const divTime = document.createElement('div');
    divTime.className = 'chat_time me_time';
    const now = new Date();
    divTime.textContent = now.getHours().toString().padStart(2,'0') + ':' + now.getMinutes().toString().padStart(2,'0');

    wrapper.appendChild(divMsg);
    wrapper.appendChild(divTime);

    chatBox.appendChild(wrapper);
    input.value = '';
    chatBox.scrollTop = chatBox.scrollHeight;
  }

  function refreshChat() {
    location.reload();
  }
</script>
</head>
<body>
<div class="chat_container">

  <!-- 상단 헤더 -->
  <div class="chat_header">
    <div class="chat_user">홍길동님과의 대화</div>
    <button class="refresh_btn" onclick="refreshChat()">⟳</button>
  </div>

  <!-- 메시지 영역 -->
  <div class="chat_messages">
    <div class="chat_message_wrapper">
      <div class="chat_message user">안녕하세요!</div>
      <div class="chat_time user_time">10:00</div>
    </div>
    <div class="chat_message_wrapper">
      <div class="chat_message me">안녕하세요! 만나서 반가워요.</div>
      <div class="chat_time me_time">10:01</div>
    </div>
    <div class="chat_message_wrapper">
      <div class="chat_message user">오늘 시간 괜찮으세요?</div>
      <div class="chat_time user_time">10:02</div>
    </div>
    <div class="chat_message_wrapper">
      <div class="chat_message me">네, 오후 3시 이후 가능해요.</div>
      <div class="chat_time me_time">10:03</div>
    </div>
    <div class="chat_message_wrapper">
      <div class="chat_message user">좋아요, 그럼 오후 3시에 온라인에서 만나죠!</div>
      <div class="chat_time user_time">10:04</div>
    </div>
    <div class="chat_message_wrapper">
      <div class="chat_message me">네, 알겠습니다!</div>
      <div class="chat_time me_time">10:05</div>
    </div>

    <!-- 추가 대화 샘플 더 넣기 가능 -->
  </div>

  <!-- 입력창 -->
  <div class="chat_input_area">
    <input type="text" id="chatInput" placeholder="메시지를 입력하세요">
    <button onclick="sendMessage()">전송</button>
  </div>

</div>
</body>
</html>
