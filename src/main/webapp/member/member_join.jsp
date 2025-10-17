<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

</head>
<body>
	
<div class="signup_container">
  <!-- 단계 표시 -->
  <div class="step_indicator">
    <div class="step active">1. 기본정보</div>
    <div class="step">2. 주소</div>
    <div class="step">3. 개인프로필</div>
    <div class="step">4. 추천인 입력</div>
    <div class="step">5. 확인</div>
  </div>

  <!-- 1단계 -->
  <div class="form_box active" id="step1">
    <h2>기본 정보 입력</h2>
    <div class="profile_upload">
      <label for="profileImgInput">
        <img id="profileImgPreview" src="../image/basic_profile.png" alt="프로필 이미지">
      </label>
      <input type="file" id="profileImgInput" accept="image/*">
    </div>
     <!-- 국적 선택 -->
  	<select id="nationality" class="custom-select">
	    <option value="">국적 선택</option>
	    <option value="korea">한국</option>
	    <option value="japan">일본</option>
	    <option value="other">중국</option>
	    <option value="other">미국</option>
	    <option value="other">필리핀</option>
  	</select>
    <input type="text" placeholder="이메일 입력">
    <input type="text" placeholder="아이디 입력">
    <input type="password" placeholder="비밀번호 입력">
    <input type="text" placeholder="나이 입력">
    <input type="radio" name="m_gender" value="m">남
    <input type="radio" name="m_gender" value="w">여
    <div class="nav_buttons">
      <button onclick="changeStep(2)" style="margin-left:180px;">다음</button>
    </div>
  </div>

  <!-- 2단계 -->
  <div class="form_box" id="step2">
    <h2>주소입력</h2>
    <input type="text" placeholder="닉네임 입력">
    
    <input type="text" placeholder="">
    <input type="text" placeholder="주소 입력">
    <div class="nav_buttons">
      <button onclick="changeStep(1)">이전</button>
      <button onclick="changeStep(3)">다음</button>
    </div>
  </div>

  <!-- 3단계 -->
  <div class="form_box" id="step3">
    <h2>매칭용프로필</h2>
    <input type="text" placeholder="취미 입력">
    
    <div class="nav_buttons">
      <button onclick="changeStep(2)">이전</button>
      <button onclick="changeStep(4)">다음</button>
    </div>
  </div>
<!-- 4단계 -->
  <div class="form_box" id="step3">
    <h2>추천인 입력</h2>
    <input type="text" placeholder="추천인 아이디 입력">
    
    <div class="nav_buttons">
      <button onclick="changeStep(3)">이전</button>
      <button onclick="changeStep(5)">다음</button>
    </div>
  </div>
  <!-- 5단계 -->
  <div class="form_box" id="step4">
  	<h2>가입 정보 확인</h2>
    <p>입력한 정보를 확인해주세요.</p>
    
    <div class="nav_buttons">
      <button onclick="changeStep(4)">이전</button>
      <button>회원가입 완료</button>
    </div>
  </div>
</div>

<script>
// 현재 단계
let currentStep = 1;

// 단계 전환 함수
function changeStep(to) {
  if (to === currentStep) return;

  const fromBox = document.getElementById("step" + currentStep);
  const toBox = document.getElementById("step" + to);

  // fade out
  fromBox.style.opacity = "0";
  fromBox.style.transform = "translateY(-20px)";
  fromBox.style.pointerEvents = "none";

  // fade in
  setTimeout(() => {
    fromBox.classList.remove("active");
    toBox.classList.add("active");
    toBox.style.opacity = "1";
    toBox.style.transform = "translateY(0)";
    toBox.style.pointerEvents = "all";

    // 단계 표시 갱신
    document.querySelectorAll(".step").forEach(s => s.classList.remove("active"));
    document.querySelector(".step:nth-child(" + to + ")").classList.add("active");

    currentStep = to;
  }, 300);
}

// 프로필 이미지 미리보기
const profileInput = document.getElementById("profileImgInput");
const profilePreview = document.getElementById("profileImgPreview");

profileInput.addEventListener("change", function(event) {
  const file = event.target.files[0];
  if (file) {
    const reader = new FileReader();
    reader.onload = function(e) {
      profilePreview.src = e.target.result;
    };
    reader.readAsDataURL(file);
  }
});
</script>

</body>
</html>
