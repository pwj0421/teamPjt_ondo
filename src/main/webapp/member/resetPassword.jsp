<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>

<!-- ✅ 기본 스타일 -->
<style>
  body {
    font-family: 'Gothic A1', sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background: #faf7f2;
  }

  .box {
    background: #fff;
    padding: 30px;
    border-radius: 14px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    width: 380px;
    text-align: center;
  }

  h2 {
    font-family: 'Jua';
    color: #c89f6d;
    margin-bottom: 20px;
  }

  input,
  button {
    width: 100%;
    padding: 12px;
    margin: 6px 0;
    border-radius: 8px;
    border: 1px solid #ccc;
    font-size: 15px;
  }

  button {
    background: #c89f6d;
    color: #fff;
    border: none;
    cursor: pointer;
    font-weight: bold;
  }

  button:hover {
    background: #b0804c;
  }

  .msg {
    color: #c89f6d;
    margin-top: 12px;
    font-weight: 500;
    min-height: 20px;
  }
</style>
</head>
<body>

  <div class="box">
    <h2>비밀번호 재설정</h2>

    <!-- 새 비밀번호 입력 -->
    <input type="password" id="pw1" placeholder="새 비밀번호">
    <input type="password" id="pw2" placeholder="비밀번호 확인">

    <!-- 변경 버튼 -->
    <button onclick="resetPassword()">변경하기</button>

    <!-- 메시지 출력 영역 -->
    <div id="msg" class="msg"></div>
  </div>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <script>
    /**
     * ✅ 비밀번호 재설정 요청
     * - 두 비밀번호 일치 여부 검사
     * - 서버로 토큰 + 새 비밀번호 전송
     */
    function resetPassword() {
      const pw1 = $("#pw1").val().trim();
      const pw2 = $("#pw2").val().trim();
      const token = new URLSearchParams(window.location.search).get("token");

      // 입력값 검증
      if (!pw1 || !pw2) {
        alert("비밀번호를 모두 입력하세요.");
        return;
      }
      if (pw1 !== pw2) {
        alert("비밀번호가 일치하지 않습니다.");
        return;
      }

      // AJAX 요청
      $.ajax({
        type: "POST",
        url: "PasswordResetConfirm",
        data: {
          token: token,
          newPassword: pw1
        },
        success: function (response) {
          $("#msg").text(response);
        },
        error: function () {
          $("#msg").text("서버 오류가 발생했습니다. 다시 시도해주세요.");
        }
      });
    }
  </script>
</body>
</html>
