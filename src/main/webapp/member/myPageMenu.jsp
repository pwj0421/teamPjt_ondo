<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<aside class="mypage_sidebar">
  <h2 class="mypage_title">마이페이지</h2>
  <ul class="mypage_menu">
    <li><a href="myInfo.jsp">내 정보 수정</a></li>
    <li><a href="category.jsp">매칭 카테고리 수정</a></li>
    <li class="mypage_has_sub">
      <div class="mypage_main_item" onclick="toggleSubMenu()">메시지 로그 ▾</div>
      <ul class="mypage_submenu">
        <li class="active">
          <a href="#" onclick="showMessageContent('requestList', event)">요청목록</a>
        </li>
        <li>
          <a href="#" onclick="showMessageContent('chatList', event)">대화내용</a>
        </li>
      </ul>
    </li>
  </ul>
</aside>
