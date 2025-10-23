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
  <div class="request_cards_container">
    
    <!-- 카드형 요청 예제 1 -->
    <div class="request_card" id="request_hong">
      <div class="request_card_header">
        <img src="image/basic_profile.png" alt="홍길동">
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
        <button class="category_button hidden">운동</button>
        <button class="category_button hidden">독서</button>
        <button class="category_button hidden">게임</button>
        <button class="more_categories" onclick="toggleCategories(this)">+ 더보기</button>
      </div>
      <div class="request_card_actions">
        <button class="accept_button" onclick="acceptRequest('hong')">수락</button>
        <button class="reject_button" onclick="rejectRequest('hong')">거절</button>
      </div>
    </div>

    <!-- 카드형 요청 예제 2 -->
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
        <button class="category_button hidden">요리</button>
        <button class="category_button hidden">사진</button>
        <button class="category_button hidden">여행</button>
        <button class="more_categories" onclick="toggleCategories(this)">+ 더보기</button>
      </div>
      <div class="request_card_actions">
        <button class="accept_button" onclick="acceptRequest('kim')">수락</button>
        <button class="reject_button" onclick="rejectRequest('kim')">거절</button>
      </div>
    </div>

    <!-- 카드형 요청 예제 3 -->
    <div class="request_card" id="request_lee">
      <div class="request_card_header">
        <img src="image/basic_profile.png" alt="이영희">
        <div>
          <div class="request_card_name">이영희</div>
          <div class="request_card_gender">여</div>
        </div>
      </div>
      <div class="request_card_category">
        <button class="category_button">영화</button>
        <button class="category_button">음악</button>
        <button class="category_button">독서</button>
        <button class="category_button">요리</button>
        <button class="category_button hidden">여행</button>
        <button class="category_button hidden">운동</button>
        <button class="category_button hidden">게임</button>
        <button class="category_button hidden">사진</button>
        <button class="more_categories" onclick="toggleCategories(this)">+ 더보기</button>
      </div>
      <div class="request_card_actions">
        <button class="accept_button" onclick="acceptRequest('lee')">수락</button>
        <button class="reject_button" onclick="rejectRequest('lee')">거절</button>
      </div>
    </div>

    <!-- 카드형 요청 예제 4 -->
    <div class="request_card" id="request_park">
      <div class="request_card_header">
        <img src="image/basic_profile.png" alt="박민수">
        <div>
          <div class="request_card_name">박민수</div>
          <div class="request_card_gender">남</div>
        </div>
      </div>
      <div class="request_card_category">
        <button class="category_button">운동</button>
        <button class="category_button">여행</button>
        <button class="category_button">음악</button>
        <button class="category_button">요리</button>
        <button class="category_button hidden">언어교환</button>
        <button class="category_button hidden">독서</button>
        <button class="category_button hidden">영화</button>
        <button class="category_button hidden">게임</button>
        <button class="more_categories" onclick="toggleCategories(this)">+ 더보기</button>
      </div>
      <div class="request_card_actions">
        <button class="accept_button" onclick="acceptRequest('park')">수락</button>
        <button class="reject_button" onclick="rejectRequest('park')">거절</button>
      </div>
    </div>

    <!-- 카드형 요청 예제 5 -->
    <div class="request_card" id="request_choi">
      <div class="request_card_header">
        <img src="image/basic_profile.png" alt="최지훈">
        <div>
          <div class="request_card_name">최지훈</div>
          <div class="request_card_gender">남</div>
        </div>
      </div>
      <div class="request_card_category">
        <button class="category_button">언어교환</button>
        <button class="category_button">음악</button>
        <button class="category_button">게임</button>
        <button class="category_button">독서</button>
        <button class="category_button hidden">운동</button>
        <button class="category_button hidden">영화</button>
        <button class="category_button hidden">여행</button>
        <button class="category_button hidden">사진</button>
        <button class="more_categories" onclick="toggleCategories(this)">+ 더보기</button>
      </div>
      <div class="request_card_actions">
        <button class="accept_button" onclick="acceptRequest('choi')">수락</button>
        <button class="reject_button" onclick="rejectRequest('choi')">거절</button>
      </div>
    </div>

  </div>
</div>
   function toggleCategories(button) {
  const parent = button.parentElement;
  const hiddenCategories = parent.querySelectorAll('.category_button.hidden');
  if(hiddenCategories[0].style.display === 'inline-block') {
    hiddenCategories.forEach(c => c.style.display = 'none');
    button.textContent = '+ 더보기';
  } else {
    hiddenCategories.forEach(c => c.style.display = 'inline-block');
    button.textContent = '− 접기';
  }
}
   

  </section>
</main>
</body>
</html>
