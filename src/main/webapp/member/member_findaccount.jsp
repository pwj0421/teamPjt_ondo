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

.result-box {
  font-family: 'Jua', sans-serif;
  font-size: 16px;
  line-height: 1.5;
  color: #333;
  background-color: #fffaf5;
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
		    Swal.fire("입력 오류", "이름과 이메일을 모두 입력하세요.", "warning");
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
	
		        // ✅ 올바른 영역만 표시
		        $("#auth-section-id").fadeIn();
		        $("#authCodeInputId").show();
		        $("#sendBtnId").show();
		        $("#verifyBtnId").hide();
	
		      } else {
		        $("#findIdResult")
		          .text("입력하신 정보와 일치하는 회원이 없습니다.")
		          .show();
		        $("#auth-section-id").hide();
		      }
		    },
		    error: function () {
		      Swal.fire("서버 오류", "회원 확인 중 문제가 발생했습니다.", "error");
		    }
		  });
		}

	// ✅ 통합형 인증번호 전송 함수 (아이디/비밀번호 공용)
	function sendAuthCode(mode) {
	  let name = "", id = "", email = "";
	
	  if (mode === "id") {
	    name = document.findIdForm.m_name.value.trim();
	    email = document.findIdForm.m_email.value.trim();
	    if (!name || !email) {
	      Swal.fire("입력 오류", "이름과 이메일을 모두 입력하세요.", "warning");
	      return;
	    }
	  } else if (mode === "password") {
	    id = document.findPwForm.m_id.value.trim();
	    email = document.findPwForm.m_email.value.trim();
	    if (!id || !email) {
	      Swal.fire("입력 오류", "아이디와 이메일을 모두 입력하세요.", "warning");
	      return;
	    }
	  }
	
	  $.ajax({
	    type: "POST",
	    url: "SendAuthCode",
	    data: mode === "id"
	      ? { m_name: name, m_email: email, mode: "id" }
	      : { m_id: id, m_email: email, mode: "password" },
	    success: function (data) {
	      const result = data.trim();
	
	      if (result === "SUCCESS") {
	        Swal.fire("인증번호 전송 완료", "입력하신 이메일로 인증번호가 발송되었습니다.", "success");
	
	        if (mode === "id") {
	          $("#findIdResult")
	            .text("메일로 전송된 인증번호를 입력하세요.")     
	            .show();
	          $("#sendBtnId").hide();
	          $("#verifyBtnId").show();
	        } else {
	          $("#findPwResult")
	            .text("메일로 전송된 인증번호를 입력하세요.")
	            .show();
	          $("#sendBtnPw").hide();
	          $("#verifyBtnPw").show();
	        }
	      } else {
	        Swal.fire("전송 실패", result || "이메일 발송 중 오류가 발생했습니다.", "error");
	      }
	    },
	    error: function () {
	      Swal.fire("서버 오류", "인증번호 전송 중 문제가 발생했습니다.", "error");
	    },
	  });
	}

	// ✅ 아이디 찾기용 인증 확인 (완성형)
	function verifyAuthCodeForId() {
	  const email = document.findIdForm.m_email.value.trim();
	  const code = $("#authCodeInputId").val().trim();

	  if (!code) {
	    Swal.fire("입력 오류", "인증번호를 입력하세요.", "warning");
	    return;
	  }

	  $.ajax({
	    type: "POST",
	    url: "VerifyAuthCode",
	    data: { m_email: email, auth_code: code, mode: "id" },
	    success: function (data) {
	      if (data.includes("아이디")) {
	        Swal.fire({
	          icon: "success",
	          title: "인증 완료",
	          html: data, // ex) 회원님의 아이디는 abc123 입니다.
	        });

	        // ✅ 인증 완료 후 깔끔하게 정리
	        $("#auth-section-id").fadeOut(300);
	        $("#findIdResult").fadeOut(300, function () {
	          $(this).text(""); // 문구 지우기
	        });
	     	// ✅ 모든 입력 필드 초기화
	        document.findIdForm.reset(); // ← 폼 전체 초기화
	      } else {
	        Swal.fire("오류", data, "error");
	      }
	    },
	    error: function () {
	      Swal.fire("서버 오류", "인증 확인 중 문제가 발생했습니다.", "error");
	    },
	  });
	}



	// ✅ 비밀번호 찾기용 인증 확인
	function verifyAuthCodeForPw() {
	  const email = document.findPwForm.m_email.value.trim();
	  const code = $("#authCodeInputPw").val().trim();
	
	  if (!code) {
	    Swal.fire("입력 오류", "인증번호를 입력하세요.", "warning");
	    return;
	  }
	
	  $.ajax({
	    type: "POST",
	    url: "VerifyAuthCode",
	    data: { m_email: email, auth_code: code, mode: "password" },
	    success: function (data) {
	      if (data.trim().includes("SUCCESS") || data.includes("완료")) {
	        Swal.fire("인증 성공", "이제 새 비밀번호를 입력하세요.", "success");
	
	        $("#findPwStep2").fadeOut(300);
	        $("#findPwStep3").fadeIn(300);
	        $("#findPwResult").fadeOut(200);
	        $("#findPwStep3").after(`
	        	<p id="pwChangeGuide" class="result-box">
	        		새 비밀번호를 입력한 뒤 <br>[비밀번호 변경] 버튼을 눌러주세요.
	        	</p>
	        `);
	      } else {
	        Swal.fire("인증 실패", data, "error");
	      }
	    },
	    error: function () {
	      Swal.fire("서버 오류", "인증 확인 중 오류 발생", "error");
	    }
	  });
	}

	
	// ✅ 비밀번호 찾기 (아이디+이메일 확인 후 인증메일 전송)
	function findPassword() {
	  const id = document.findPwForm.m_id.value.trim();
	  const email = document.findPwForm.m_email.value.trim();
	
	  if (!id || !email) {
	    Swal.fire("입력 오류", "아이디와 이메일을 모두 입력하세요.", "warning");
	    return;
	  }
	
	  $.ajax({
	    type: "POST",
	    url: "UserCheck",
	    data: { m_id: id, m_email: email },
	    success: function (data) {
	      const result = data.trim();
	
	      if (result === "EXIST") {
	        $("#findPwStep2").fadeIn();
	        $("#findPwResult")
	          .html("회원 정보가 확인되었습니다.<br>이메일 인증을 진행해주세요.")
	          .show();
	        $("#authCodeInputPw").show();
	        $("#sendBtnPw").show();
	        $("#verifyBtnPw").hide();
	      } else {
	        Swal.fire("오류", "입력하신 정보와 일치하는 회원이 없습니다.", "error");
	        $("#findPwStep2").hide();
	        $("#findPwStep3").hide();
	        $("#findPwResult").hide();
	      }
	    },
	    error: function () {
	      Swal.fire("서버 오류", "회원 확인 중 문제가 발생했습니다.", "error");
	    }
	  });
	}



	// ✅ 비밀번호 변경 (새 비밀번호 최종 저장)
	function resetPassword() {
	  const id = document.findPwForm.m_id.value.trim();
	  const pw1 = $("#newPw1").val().trim();
	  const pw2 = $("#newPw2").val().trim();
	
	  if (!pw1 || !pw2) {
	    Swal.fire("입력 오류", "비밀번호를 모두 입력하세요.", "warning");
	    return;
	  }
	
	  if (pw1 !== pw2) {
	    Swal.fire("불일치", "비밀번호가 일치하지 않습니다.", "error");
	    return;
	  }
	
	  $.ajax({
	    type: "POST",
	    url: "DirectPasswordReset",
	    data: { m_id: id, newPassword: pw1 },
	    success: function (data) {
	      Swal.fire("완료", data, "success");
	
	      // ✅ 모든 입력 박스 숨기고 안내문구도 제거
	      $("#findPwStep3, #pwChangeGuide, #findPwStep2, #findPwResult").fadeOut(300);
	      document.findPwForm.reset(); // ← form 내 input 전부 초기화
	      $("#newPw1, #newPw2").val("");
	    },
	    error: function () {
	      Swal.fire("서버 오류", "비밀번호 변경 중 오류가 발생했습니다.", "error");
	    },
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
		<div id="auth-section-id" style="display:none; margin-top:15px;">
		  <input type="text" id="authCodeInputId" placeholder="인증번호 입력">
		  <button type="button" id="sendBtnId" class="login-btn" onclick="sendAuthCode('id')">인증번호 전송</button>
		  <button type="button" id="verifyBtnId" class="login-btn" onclick="verifyAuthCodeForId()" style="display:none;">인증번호 확인</button>
		</div>
		
	    <!-- ③ 결과 메시지 표시 영역 -->
	    <p class="result-box" id="findIdResult" style="margin-top:10px; color:#444; display:none;"></p>
	  </form>
	</div>
	
  <!-- ✅ 비밀번호 찾기 -->
  <!-- ✅ 비밀번호 찾기 -->
	<div class="find-box">
	  <h3>비밀번호 찾기</h3>
	  <form name="findPwForm" onkeydown="if(event.key==='Enter'){ findPassword(); return false; }">
	    <input type="hidden" name="t_gubun" value="findPassword">
	    <input type="text" name="m_id" placeholder="아이디를 입력하세요" required>
	    <input type="text" name="m_email" placeholder="가입 시 등록한 이메일" required>
	    <button type="button" class="login-btn" onclick="findPassword()">비밀번호 찾기</button>
	
	    <!-- ✅ [STEP 2] 인증번호 입력 (추가) -->
	    <div id="findPwStep2" style="display:none; margin-top:15px;">
	      <input type="text" id="authCodeInputPw" placeholder="인증번호 입력">
	      <button type="button" id="sendBtnPw" class="login-btn" onclick="sendAuthCode('password')">인증번호 전송</button>
	      <button type="button" id="verifyBtnPw" class="login-btn" onclick="verifyAuthCodeForPw()" style="display:none;">인증번호 확인</button>
	    </div>
	
	    <!-- ✅ 결과 메시지 표시 영역 (아이디 찾기와 동일한 위치로 이동) -->
	    <p class="result-box" id="findPwResult" style="display:none; margin-top:10px; color:#444;"></p>
	  </form>
	
	  <!-- ✅ [STEP 3] 새 비밀번호 입력 (추가) -->
	  <div id="findPwStep3" style="display:none; margin-top:15px;">
	    <input type="password" id="newPw1" placeholder="새 비밀번호">
	    <input type="password" id="newPw2" placeholder="비밀번호 확인">
	    <button type="button" class="login-btn" onclick="resetPassword()">비밀번호 변경</button>
	  </div>
	</div>
</div>


<%@ include file="../common_footer.jsp" %>  
</body>
</html>
