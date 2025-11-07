<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>  
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 / 비밀번호 찾기</title>

<link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/member_login.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
/* ✅ 두 박스를 가로로 배치 */
.find-container {
  display: flex;
  justify-content: center;
  align-items: flex-start;
  gap: 40px;
  margin-top: 50px;
  margin-bottom: 60px;
  flex-wrap: wrap; /* 화면 작을 땐 세로로 자동 전환 */
}

.find-box {
  background-color: #fff;
  border: 1px solid #ddd;
  border-radius: 20px;
  box-shadow: 0 4px 10px rgba(0,0,0,0.08);
  padding: 35px 45px;
  width: 380px;
  text-align: center;
}

.find-box h3 {
  font-family: 'Jua', sans-serif;
  color: #c89f6d;
  font-size: 1.5rem;
  margin-bottom: 20px;
}

.find-box input {
  width: 100%;
  padding: 12px;
  margin-bottom: 10px;
  border: 1px solid #ccc;
  border-radius: 8px;
  font-size: 15px;
}

.find-box .login-btn {
  width: 100%;
  margin-top: 10px;
}

.page-title {
  text-align: center;
  font-family: 'Jua', sans-serif;
  font-size: 2rem;
  color: #c89f6d;
  margin-top: 60px;
  margin-bottom: 20px;
}

#findIdResult {
  font-family: 'Jua', sans-serif;  /* 헤더랑 통일 */
  font-size: 16px;
  line-height: 1.5;
  color: #c89f6d; /* 포인트 컬러 */
  background-color: #fffaf5; /* 따뜻한 배경톤 */
  border: 1px solid #f0d9c5;
  border-radius: 10px;
  padding: 12px;
  margin-top: 15px;
  display: inline-block;
  width: 100%;
  box-sizing: border-box;
}
#auth-section {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 8px; /* 입력칸과 버튼 사이 여백 */
}

#auth-section input {
  flex: 1; /* 입력칸이 가능한 한 넓게 */
  margin-bottom: 0; /* 기존 여백 제거 */
}

#auth-section button {
  width: auto;
  padding: 10px 16px;
  margin-top: 0;
  white-space: nowrap; /* 버튼 텍스트 줄바꿈 방지 */
}

</style>
</head>
<script type="text/javascript">
function checkUser() {
	  const name = document.findIdForm.m_name.value.trim();
	  const email = document.findIdForm.m_email.value.trim();
	  if (!name || !email) {
	    alert("이름과 이메일을 모두 입력하세요.");
	    return;
	  }

	  $.ajax({
	    type: "POST",
	    url: "UserCheck",
	    data: { m_name: name, m_email: email },
	    success: function (data) {
	      const result = data.trim();
	      if (result === "EXIST") {
	    	$("#findIdResult")
		    	.html("회원 정보가 확인되었습니다.<br>이메일 인증을 진행해주세요.")
		    	.show();
	        // 인증 입력칸 & 전송버튼 표시
	        $("#auth-section").show();
	        $("#authCodeInput").show();
	        $("#sendBtn").show();
	        $("#verifyBtn").hide();

	      } else {
	        $("#findIdResult")
	        	.text("입력하신 정보와 일치하는 회원이 없습니다.")
	        	.show();
	        $("#auth-section").hide();
	      }
	    },
	    error: function () {
	      alert("서버 통신 오류");
	    }
	  });
	}


	function sendAuthCode() {
	  const email = document.findIdForm.m_email.value.trim();
	  if (!email) {
	    alert("이메일을 입력하세요.");
	    return;
	  }

	  $.ajax({
	    type: "POST",
	    url: "SendAuthCode",
	    data: { m_email: email },
	    success: function (data) {
	      const result = data.trim();
	      if (result === "SUCCESS") {
	        alert("인증번호가 이메일로 전송되었습니다.");
	        $("#findIdResult").text("메일로 전송된 인증번호를 입력하세요.").css("color", "#444");
	        // 버튼 전환
	        $("#sendBtn").hide();
	        $("#verifyBtn").show();
	      } else {
	        alert("인증번호 전송 중 문제가 발생했습니다. 관리자에게 문의하세요.");
	      }
	    },
	    error: function () {
	      alert("서버 통신 오류. 관리자에게 문의하세요.");
	    }
	  });
	}


	function verifyAuthCode() {
		  const email = document.findIdForm.m_email.value.trim();
		  const code = $("#authCodeInput").val().trim();

		  if (!code) {
		    alert("인증번호를 입력하세요.");
		    return;
		  }

		  $.ajax({
		    type: "POST",
		    url: "VerifyAuthCode",
		    data: { m_email: email, auth_code: code },
		    success: function (data) {
		      const result = data.trim();

		      // ✅ 기존 박스 아래 결과 표시 (부드럽게 등장)
		      $("#findIdResult").html(result).css({
		        color: "#333",
		        fontWeight: "600",
		        marginTop: "15px",
		        background: "#faf8f4",
		        borderRadius: "10px",
		        padding: "10px"
		      }).hide().fadeIn(300);
		      
		  	  // ✅ 인증 성공 시 입력칸/버튼 숨기기
		      if (result.includes("아이디") || result.includes("완료") || result.includes("성공")) {
		        $("#auth-section").hide();
		      }
		    },
		    error: function () {
		      $("#findIdResult").text("인증 확인 중 오류 발생").css("color", "red");
		    }
		  });
		}


</script>
<body>

<div class="page-title">아이디 / 비밀번호 찾기</div>

<div class="find-container">
  <!-- ✅ 아이디 찾기 -->
	<div class="find-box">
	  <h3>아이디 찾기</h3>
	  <form name="findIdForm" id="findIdForm" onkeydown="if(event.key==='Enter'){ checkUser(); return false; }">
	    <input type="hidden" name="t_gubun" value="findId">
	    <input type="text" name="m_name" placeholder="가입 시 등록한 이름" required>
	    <input type="text" name="m_email" placeholder="가입 시 등록한 이메일" required>
	
	    <!-- ① 아이디 존재 여부 확인 버튼 -->
	    <button type="button" class="login-btn" onclick="checkUser()">아이디 확인</button>
	
	    <!-- ② 인증번호 입력 영역 (처음엔 숨김) -->
		<div id="auth-section" style="display:none; margin-top:15px;">
		  <input type="text" id="authCodeInput" placeholder="인증번호 입력" style="display:none;">
		  <button type="button" id="sendBtn" class="login-btn" onclick="sendAuthCode()" style="display:none;">인증번호 전송</button>
		  <button type="button" id="verifyBtn" class="login-btn" onclick="verifyAuthCode()" style="display:none;">인증번호 확인</button>
		</div>



	    <!-- ③ 결과 메시지 표시 영역 -->
	    <p id="findIdResult" style="margin-top:10px; color:#444; display:none;"></p>
	  </form>
	</div>
	
  <!-- ✅ 비밀번호 찾기 -->
  <div class="find-box">
    <h3>비밀번호 찾기</h3>
    <form name="findPwForm" onkeydown="if(event.key==='Enter'){ findPassword(); return false; }">
      <input type="hidden" name="t_gubun" value="findPassword">
      <input type="text" name="m_id" placeholder="아이디를 입력하세요" required>
      <input type="text" name="m_email" placeholder="가입 시 등록한 이메일" required>
      <button type="button" class="login-btn" onclick="findPassword()">비밀번호 찾기</button>
    </form>
  </div>
</div>



<script>
function findId() {
  const form = document.forms['findIdForm'];
  if (!form.m_name.value.trim()) {
    alert("이름을 입력하세요.");
    form.m_name.focus();
    return;
  }
  if (!form.m_email.value.trim()) {
    alert("이메일을 입력하세요.");
    form.m_email.focus();
    return;
  }
  form.method = "post";
  form.action = "Member";
  form.submit();
}

function findPassword() {
  const form = document.forms['findPwForm'];
  if (!form.m_id.value.trim()) {
    alert("아이디를 입력하세요.");
    form.m_id.focus();
    return;
  }
  if (!form.m_email.value.trim()) {
    alert("이메일을 입력하세요.");
    form.m_email.focus();
    return;
  }
  form.method = "post";
  form.action = "Member";
  form.submit();
}
</script>

<%@ include file="../common_footer.jsp" %>  
</body>
</html>
