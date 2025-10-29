<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>  
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ONDO 로그인</title>

<!-- 기존 로그인 CSS 그대로 -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/member_login.css">
</head>
<body>

<!-- 로그인 폼 상단 고정 (헤더 아래) -->
<div class="login-container" style="display:flex; justify-content:center;">
  <div class="login-box">
    <h2>로그인</h2>
    <form name="loginForm">
      <input type="hidden" name="t_gubun">

      <input type="text" name="m_id" placeholder="아이디를 입력하세요" required>
      <input type="password" name="m_password" placeholder="비밀번호를 입력하세요" required>

      <button type="button" class="login-btn" onclick="memberLogin()">로그인</button>
    </form>

    <div class="sub-links">
      <a href="<%= request.getContextPath() %>/Member?t_gubun=join">회원가입</a> |
      <a href="#">비밀번호 찾기</a>
    </div>
  </div>
</div>

<script type="text/javascript">
  function memberLogin() {
    const loginForm = document.forms['loginForm'];
    loginForm.t_gubun.value = "memberLogin";
    loginForm.method="post";
    loginForm.action="Member";
    loginForm.submit();
  }
</script>
<%@ include file="../common_footer.jsp" %>   
</body>
</html>
