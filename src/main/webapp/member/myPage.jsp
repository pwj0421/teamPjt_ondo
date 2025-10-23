<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>	
<%@ include file="../quickMenu.jsp" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="CSS/sub.css">
<script>
function showMessageContent(section, e) {
  e.preventDefault();
  document.querySelectorAll('.message_section').forEach(c => c.style.display = 'none');
  document.getElementById(section).style.display = 'block';
  document.querySelectorAll('.mypage_submenu li').forEach(li => li.classList.remove('active'));
  e.currentTarget.closest('li').classList.add('active');
}

function toggleSubMenu() {
  const subMenu = document.querySelector('.mypage_submenu');
  subMenu.style.display = subMenu.style.display === 'block' ? 'none' : 'block';
}

function openChatPopup(userId) {
  window.open(
    '../Messege/chat_room.jsp?user=' + userId,
    'chatRoom',
    'width=500,height=700,scrollbars=yes,resizable=yes'
  );
}

function acceptRequest(userId) {
  openChatPopup(userId);
}

function rejectRequest(userId) {
  const card = document.getElementById('request_' + userId);
  if(card) card.remove();
}

function showMoreCategories(button) {
  const parent = button.parentElement;
  const hiddenCategories = parent.querySelectorAll('.category_button.hidden');
  hiddenCategories.forEach(c => c.classList.remove('hidden'));
  button.style.display = 'none';
}
</script>
</head>
<body>
<main class="mypage_container">
<%@ include file="myPageMenu.jsp" %>
  <!-- 콘텐츠 -->
  <section class="mypage_content">

    <!-- 요청 목록 -->
    <div id="requestList" class="message_section" style="display:block;">
      <h3 class="content_title">요청목록</h3>

      <div class="request_card" id="request_hong">
        <div class="request_card_header">
          <img src="image/basic_profile.png" alt="김철수">
          <div>
            <div class="request_card_name">홍길동</div>
            <div class="request_card_gender">남</div>
          </div>
        </div>
        <div class="request_card_category">
          <button class="category_button">언어교환</button>
          <button class="category_button">여행</button>
          <button class="category_button">음악</button>
          <button class="category_button">영화</button>
          <button class="category_button hidden">요리</button>
          <button class="more_categories" onclick="showMoreCategories(this)">+ 더보기</button>
        </div>
        <div class="request_card_actions">
          <button class="accept_button" onclick="acceptRequest('hong')">수락</button>
          <button class="reject_button" onclick="rejectRequest('hong')">거절</button>
        </div>
      </div>

      <div class="request_card" id="request_kim">
        <div class="request_card_header">
          <img src="image/basic_profile.png" alt="김철수">
          <div>
            <div class="request_card_name">김철수</div>
            <div class="request_card_gender">남</div>
          </div>
        </div>
        <div class="request_card_category">
          <button class="category_button">언어교환</button>
          <button class="category_button">음악</button>
          <button class="category_button">영화</button>
          <button class="category_button">운동</button>
          <button class="category_button hidden">독서</button>
          <button class="more_categories" onclick="showMoreCategories(this)">+ 더보기</button>
        </div>
        <div class="request_card_actions">
          <button class="accept_button" onclick="acceptRequest('kim')">수락</button>
          <button class="reject_button" onclick="rejectRequest('kim')">거절</button>
        </div>
      </div>

    </div>

    <!-- 대화 내용 -->
    <div id="chatList" class="message_section" style="display:none;">
      <h3 class="content_title">대화내용</h3>
      <table class="request_table">
        <thead>
          <tr>
            <th>대화 상대</th>
            <th>마지막 메시지</th>
            <th>날짜</th>
            <th>보기</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>홍길동</td>
            <td>안녕하세요!</td>
            <td>2025-10-22</td>
            <td><button onclick="openChatPopup('hong')">열기</button></td>
          </tr>
          <tr>
            <td>김철수</td>
            <td>안녕, 만나서 반가워요.</td>
            <td>2025-10-21</td>
            <td><button onclick="openChatPopup('kim')">열기</button></td>
          </tr>
        </tbody>
      </table>
    </div>

  </section>
</main>
</body>
</html>
