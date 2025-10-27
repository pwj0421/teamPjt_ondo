<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

</head>
<script type="text/javascript">
	function validateStep(step) {
		if(step == 1) {
			if(checkValue(mem.m_country, "국적을 선택해주세요!")) return false;
			
			if(checkValue(mem.m_id, "ID를 입력하세요!")) return false;
			if(checkLength(mem.m_id, 5, 15, "아이디는 최소 5자 이상 15자 이하 입니다!")) return false;
			
			if(checkValue(mem.m_nickname, "사용할 닉네임을 입력해주세요")) return false;
			
			if(checkValue(mem.m_password, "비밀번호를 입력하세요!")) return false;
			if(checkLength(mem.m_password, 5, 20, "비밀번호는 최소 5자 이상 20자 이하 입니다!")) return false;
			if(checkValue(mem.m_password_confirm, "비밀번호를 재입력 하세요.")) return false;
			if(mem.m_password.value != mem.m_password_confirm.value) {
				alert("비밀번호가 같지 않습니다. 다시 입력해 주세요.");
				mem.m_password_confirm.focus();
				return false;
			}
			
			if(checkValue(mem.m_name, "본인 이름을 입력해주세요.")) return false;
			
			if(checkValue(mem.m_tel_country_code, "국가 코드를 선택해주세요.")) return false;
			if(checkValue(mem.m_tel1, "연락처를 입력해 주세요.")) return false;
			if(checkValue(mem.m_tel2, "연락처를 입력해 주세요.")) return false;
			if(checkValue(mem.m_tel3, "연락처를 입력해 주세요.")) return false;
			
			if(checkValue(mem.m_email1, "메일 주소를 입력해주세요.")) return false;
			if(checkValue(mem.m_email2, "메일 주소를 선택해주세요.")) return false;
			
			if(checkValue(mem.m_age, "나이를 입력해 주세요")) return false;
			
			if(checkValue(mem.m_gender,"성별을 선택하세요!")) return false;
			if(checkValue(mem.m_type,"회원 종류를 선택하세요!")) return false;
			return true;
		}
		if(step == 2) {
			if(checkValue(mem.m_zipcode, "주소를 입력해주세요.")) return false;
			if(checkValue(mem.m_address, "주소를 입력해주세요.")) return false;
			return true;
		}
		if(step == 3) {
			return true;
		}
		return true;
	}
	function memberSave(){
		if(!validateStep(1)) return;
		if(!validateStep(2)) return;
			
		mem.t_gubun.value="save";
		mem.method="post";
		mem.action="Member";
		mem.submit();
	}
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<body>
<form name="mem">
	<input type="hidden" name="t_gubun">
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
		      <input type="file" name="m_image" id="profileImgInput" accept="image/*">
		    </div>
		     <!-- 국적 선택 -->
		     <select id="nationality" name="m_country" class="custom-select">
		       <option value="">국적 선택</option>
		       <option value="KR">한국</option>
		       <option value="JP">일본</option>
		       <option value="CN">중국</option>
		       <option value="US">미국</option>
		     </select>
		    
		    <input type="text" name="m_id" placeholder="아이디">
		    <input type="text" name="m_nickname" placeholder="닉네임">
		    <input type="password" name="m_password" placeholder="비밀번호">
		    <input type="password" name="m_password_confirm" placeholder="비밀번호 확인">
		    <input type="text" name="m_name" placeholder="이름">
		    
		    <select id="" name="m_tel_country_code" class="custom-select" style="width:30%; margin-right:13px">
		       <option value="+82">+82(한국)</option>
		       <option value="+81">+81</option>
		     </select>
		     <input type="text" name="m_tel1" placeholder="010" style="width:15%">&nbsp;-
		     <input type="text" name="m_tel2" placeholder="1234" style="width:20%">&nbsp;-
		     <input type="text" name="m_tel3" placeholder="5678" style="width:20%">
		     
		    <input type="text" name="m_email1" placeholder="이메일" style="width:53%">&nbsp;@
		    <select id="" name="m_email2" class="custom-select" style="width:40%">
		       <option value="">선택</option>
		       <option value="naver">naver.com</option>
		       <option value="daum">daum.net</option>
		       <option value="google">gmail.com</option>
		     </select>
		    <input type="text" name="m_age" placeholder="나이">
	
		    <div class="gender-group">
			  <label><input type="radio" name="m_gender" value="M"> 남</label>
			  <label><input type="radio" name="m_gender" value="F"> 여</label>
			</div>
			<select name="m_type" class="custom-select">
			  <option value="">회원 구분 선택</option>
			  <option value="NORMAL">일반 회원</option>
			  <option value="TUTOR">튜터</option>
			</select>
		    <div class="nav_buttons">
		      <button type="button" onclick="changeStep(2)" style="margin-left:180px;">다음</button>
		    </div>
		  </div>
		
		  <!-- 2단계 -->
			<div class="form_box" id="step2">
			  <h2>주소입력</h2>
			
			  <div class="address-row">
			    <input type="text" name="m_zipcode" id="postcode" placeholder="우편번호">
			    <button type="button" class="btn-postcode" onclick="execDaumPostcode()">주소검색</button>
			  </div>
			
			  <input type="text" name="m_address" id="address" placeholder="주소">
			  <input type="text" name="m_address_detail" id="detailAddress" placeholder="상세주소(선택)">
			
			  <div class="nav_buttons">
			    <button type="button" onclick="changeStep(1)">이전</button>
			    <button type="button" onclick="changeStep(3)">다음</button>
			  </div>
			</div>


		
		  <!-- 3단계 -->
		  <div class="form_box" id="step3">
		    <h2>가입 목적 선택</h2>
		    <div class="purpose-group">
			  <c:forEach var="dto" items="${purposeList}">
			    <label class="purpose-item"><input type="checkbox" name="m_purpose_code" value="${dto.purpose_code}"><span>${dto.purpose_name}</span></label>
			  </c:forEach>
			</div>

		    
		    <div class="nav_buttons">
		      <button type="button" onclick="changeStep(2)">이전</button>
		      <button type="button" onclick="changeStep(4)">다음</button>
		    </div>
		  </div>
		  
		  
		  
		<!-- 4단계 -->
		  <div class="form_box" id="step4">
		    <h2>추천인 입력</h2>
		    <input type="text" name="m_recommender" placeholder="추천인 아이디 입력">
		    
		    <div class="nav_buttons">
		      <button type="button" onclick="changeStep(3)">이전</button>
		      <button type="button" onclick="changeStep(5)">다음</button>
		    </div>
		  </div>
		  <!-- 5단계 -->
		  <div class="form_box" id="step5">
		     <h2>가입 정보 확인</h2>
		    <p>입력한 정보를 확인해주세요.</p>
		    
		    <div class="nav_buttons">
		      <button type="button" onclick="changeStep(4)">이전</button>
		      <button type="button" onclick="memberSave()">회원가입 완료</button>
		    </div>
		  </div>
		</div>
</form>
<script>
// 현재 단계
let currentStep = 1;

// 단계 전환 함수
function changeStep(to) {
  if (to > currentStep && !validateStep(currentStep)) {
	  return;
  }
	
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
 // ✅ 2단계로 이동할 때 자동 적용
    if (to === 2) setTimeout(applyAddressMode, 100);
  }, 300);
}
//주소 검색 API (카카오 우편번호)
function execDaumPostcode() {
  new daum.Postcode({
    oncomplete: function(data) {
      // 도로명 주소 또는 지번 주소 선택에 따라 처리
      let addr = ''; 
      if (data.userSelectedType === 'R') { 
        addr = data.roadAddress; 
      } else { 
        addr = data.jibunAddress; 
      }

      // 우편번호와 주소 입력칸에 넣기
      document.getElementById('postcode').value = data.zonecode;
      document.getElementById('address').value = addr;

      // 상세주소 입력칸으로 포커스 이동
      document.getElementById('detailAddress').focus();
    }
  }).open();
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

//✅ 국적에 따라 주소 입력 모드 제어
function applyAddressMode() {
  const nationality = document.getElementById("nationality").value;
  const addrSearchBtn = document.querySelector(".btn-postcode");
  const postcodeInput = document.getElementById("postcode");
  const addrInput = document.getElementById("address");
  const detailAddrInput = document.getElementById("detailAddress");

  if (!addrSearchBtn) return; // 2단계 DOM이 아직 안 뜬 경우 방지

  if (nationality === "KR") {
	  addrSearchBtn.classList.remove("hidden");
	  postcodeInput.readOnly = false;
	  addrInput.readOnly = true;
	  addrInput.placeholder = "주소 (주소검색으로 입력)";
	  detailAddrInput.placeholder = "상세주소";
	  postcodeInput.placeholder = "우편번호";
	} else if (nationality === "") {
	  addrSearchBtn.classList.remove("hidden");
	  addrInput.readOnly = true;
	  postcodeInput.placeholder = "우편번호";
	  addrInput.placeholder = "주소";
	} else {
	  addrSearchBtn.classList.add("hidden");
	  postcodeInput.readOnly = false;
	  addrInput.readOnly = false;
	  postcodeInput.placeholder = "우편번호 (직접 입력)";
	  addrInput.placeholder = "도도부현 / 시 / 구 등 직접 입력";
	  detailAddrInput.placeholder = "상세주소 (빌딩명, 호수 등)";
	}
}

// ✅ 국적 선택 시 즉시 반영
document.addEventListener("DOMContentLoaded", () => {
  const nationalitySelect = document.getElementById("nationality");
  nationalitySelect.addEventListener("change", function() {
    // 2단계에 있을 경우 바로 적용
    if (currentStep === 2) applyAddressMode();
  });
});

// ✅ 2단계로 이동할 때 자동 적용
/* const originalChangeStep = changeStep;
changeStep = function(to) {
  originalChangeStep(to);
  if (to === 2) setTimeout(applyAddressMode, 100); // DOM 렌더 후 적용
}; */

</script>

</body>
</html>
