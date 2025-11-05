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

.mypage-container {
  display: flex;
  justify-content: center;
  align-items: flex-start;
  padding: 60px 0;
}

.mypage-content {
  width: 450px;
}

h3 {
  font-size: 28px;
  font-weight: 700;
  color: #c89f6d;
  border-bottom: 2px solid #c89f6d;
  padding-bottom: 10px;
  margin-bottom: 40px;
}

.info-row {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 25px;
}

.info-row label {
  width: 140px;
  font-weight: 600;
  text-align: right;
  margin-right: 20px;
}

.info-row input {
  flex: 1;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 6px;
}

.button-box {
  display: flex;
  justify-content: center;
  margin-top: 40px;
}

.button-box button {
  background: #c89f6d;
  color: #fff;
  border: none;
  padding: 14px 30px;
  border-radius: 10px;
  font-size: 16px;
  cursor: pointer;
}

.button-box button:hover {
  background: #b18557;
}
</style>

</head>
<script type="text/javascript">
	function changePassword() {
		if (checkValue(new_Password.m_password, "기존 비밀번호를 입력하세요.")) return false;
		if (checkValue(new_Password.m_newPassword, "새 비밀번호를 입력하세요.")) return false;
		if(checkLength(new_Password.m_newPassword, 5, 20, "비밀번호는 최소 5자 이상 20자 이하 입니다!")) return false;
		if(checkValue(new_Password.m_newPassword_confirm, "비밀번호를 재입력 하세요.")) return false;
		if(new_Password.m_newPassword.value != new_Password.m_newPassword_confirm.value) {
			alert("비밀번호가 같지 않습니다. 다시 입력해 주세요.");
			new_Password.m_newPassword_confirm.focus();
			return false;
		}
		
		new_Password.t_gubun.value="changePassword";
		new_Password.method="post";
		new_Password.action="Member";
		new_Password.submit();
	}
</script>
<body>
<%@ include file="../menu/quickMenu.jsp" %>
<div class="mypage-container">
  <%@ include file="../menu/mypage_menu.jsp" %>
		<input type="hidden" name="m_id" value="${sessionId}">
		<input type="hidden" name="t_gubun">
		<div class="mypage-container">
		  <form name="new_Password" class="mypage-content">
		    <h3>비밀번호 변경</h3>
		    
		    <input type="hidden" name="m_id" value="${sessionId}">
		    <input type="hidden" name="t_gubun">
		
		    <div class="info-row">
		      <label>기존 비밀번호</label>
		      <input type="password" name="m_password" placeholder="기존 비밀번호 입력">
		    </div>
		
		    <div class="info-row">
		      <label>새 비밀번호</label>
		      <input type="password" name="m_newPassword" placeholder="새 비밀번호 입력">
		    </div>
		
		    <div class="info-row">
		      <label>새 비밀번호 확인</label>
		      <input type="password" name="m_newPassword_confirm" placeholder="새 비밀번호 확인 입력">
		    </div>
		
		    <div class="button-box">
		      <button type="button" onclick="changePassword()">비밀번호 변경하기</button>
		    </div>
		  </form>
		</div>
</div>

<%@ include file="../common_footer.jsp" %>
</body>
</html>
