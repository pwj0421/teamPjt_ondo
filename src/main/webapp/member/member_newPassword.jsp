<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>	
<%@ include file="../menu/quickMenu.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
body {
  background: #fff;
  font-family: 'Pretendard', sans-serif;
  color: #333; 
  margin: 0;
  padding: 0;
}


</style>
</head>

<body>
<%@ include file="../menu/quickMenu.jsp" %>
<div class="mypage-container">
  <%@ include file="../menu/mypage_menu.jsp" %>

  <div class="mypage-content">
    <h3>비밀번호 변경</h3>

    
    <div class="info-row" style="margin-top: 50px;"> 
      <label style="margin-left: 270px;">기존 비밀번호</label>
      <input type="text" placeholder="기존 비밀번호 입력">
    </div>
    <div class="info-row">
      <label style="margin-left: 270px;">새 비밀번호</label>
      <input type="text" placeholder="새 비밀번호 입력">
    </div>
	<div class="info-row">
      <label style="margin-left: 270px;">새 비밀번호 확인</label>
      <input type="text" placeholder="새 비밀번호 확인 입력">
    </div>
    <div class="button-box" style="margin-top:50px;">
      <button type="button">비밀번호 변경하기</button>
    </div>
  </div>
</div>
<%@ include file="../common_footer.jsp" %>
</body>
</html>
