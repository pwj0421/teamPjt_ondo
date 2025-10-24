<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>	
<%@ include file="../menu/quickMenu.jsp" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
<div class="notice_board">
  <div class="notice_header">
    <h2 class="notice_title">공지사항</h2>
    <div class="notice_actions">
      <input type="text" class="notice_search" placeholder="검색어를 입력하세요">
      <button class="notice_write_btn">검색</button>
    </div>
  </div>

  <div class="notice_list">
    <div class="notice_item">
      <div class="notice_badge">공지</div>
      <div class="notice_content">
        <h3 class="notice_item_title">[안내] 사이트 이용약관 개정 공지</h3>
        <p class="notice_item_sub">관리자 · 2025-10-10 · 조회수 123</p>
      </div>
       <span class="notice_attach">📎</span> <!-- 첨부파일 있음 -->
    </div>

    <div class="notice_item">
      <div class="notice_badge update">업데이트</div>
      <div class="notice_content">
        <h3 class="notice_item_title">[공지] 친구 매칭 기능 업데이트 안내</h3>
        <p class="notice_item_sub">관리자 · 2025-09-22 · 조회수 214</p>
      </div>
       <span class="notice_attach">📎</span> <!-- 첨부파일 있음 -->
    </div>

    <div class="notice_item">
      <div class="notice_badge info">안내</div>
      <div class="notice_content">
        <h3 class="notice_item_title">[FAQ] 회원가입 관련 자주 묻는 질문</h3>
        <p class="notice_item_sub">관리자 · 2025-08-15 · 조회수 340</p>

      </div>
              <span class="notice_attach">-</span> <!-- 첨부파일 없음 -->
    </div>
    
    <div class="notice_item">
      <div class="notice_badge update">업데이트</div>
      <div class="notice_content">
        <h3 class="notice_item_title">[공지] 친구 매칭 기능 업데이트 안내</h3>
        <p class="notice_item_sub">관리자 · 2025-09-22 · 조회수 214</p>
      </div>
       <span class="notice_attach">📎</span> <!-- 첨부파일 있음 -->
    </div>
  </div>

  <div class="notice_pagination">
    <button>&lt;</button>
    <button class="active">1</button>
    <button>2</button>
    <button>3</button>
    <button>&gt;</button>
    
  </div>
  <button class="notice_write_btn">글쓰기</button>
</div>


</body>
</html>