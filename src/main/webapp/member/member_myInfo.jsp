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
    <h3>개인정보</h3>

    <div class="info-row">
      <label>프로필 사진</label>
      <input type="file" accept="image/*">
    </div>

    <div class="info-row">
      <label>닉네임</label>
      <input type="text" placeholder="닉네임 입력">
    </div>

    <div class="info-row">
      <label>이름</label>
      <input type="text" placeholder="이름 입력">
    </div>

    <div class="info-row">
      <label>성별</label>
      <div class="gender-group">
        <label><input type="radio" name="gender" value="male"> 남</label>
        <label><input type="radio" name="gender" value="female"> 여</label>
      </div>
    </div>

    <div class="info-row">
      <label>국적</label>
      <select>
        <option>대한민국</option>
        <option>일본</option>
        <option>기타</option>
      </select>
    </div>

    <div class="info-row">
      <label>전화번호</label>
      <div class="phone-group">
        <select>
          <option>+82</option>
          <option>+81</option>
        </select>
        <select>
          <option>010</option>
          <option>011</option>
          <option>070</option>
        </select>
        <input type="text" maxlength="4" placeholder="1234">
        <input type="text" maxlength="4" placeholder="5678">
      </div>
    </div>

    <div class="info-row">
      <label>이메일</label>
      <div class="email-group">
        <input type="text" placeholder="example">
        <span>@</span>
        <input type="text" placeholder="domain.com">
      </div>
    </div>

    <div class="button-box">
      <button type="button">개인정보 수정하기</button>
    </div>
  </div>
</div>
</body>
</html>
