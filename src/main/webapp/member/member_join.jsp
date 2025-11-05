<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="CSS/interest-tag.css">

<meta charset="UTF-8">
<title>회원가입</title>
<style>

/*회원가입*/
.signup_container {
  margin-top: 50px;
  display: flex;
  flex-direction: column;
  align-items: center;
  font-family: "Gothic A1";
}

/* 단계 표시 */
.step_indicator {
  display: flex;
  justify-content: center;
  gap: 60px;
  margin-bottom: 40px;
}
.step {
  font-size: 18px;
  color: #aaa;
  position: relative;
  transition: color 0.3s ease;
}
.step.active {
  color: #c89f6d;
  font-weight: bold;
}
.step::after {
  content: "";
  position: absolute;
  right: -40px;
  top: 50%;
  width: 30px;
  height: 2px;
  background: #ddd;
  transform: translateY(-50%);
}
.step:last-child::after { display: none; }

/* 폼 박스 */
.form_box {
  width: 400px;
  padding: 30px;
  border: 1px solid #ddd;
  border-radius: 20px;
  background: #fff;
  box-shadow: 0 2px 6px rgba(0,0,0,0.05);
  position: absolute;
  opacity: 0;
  pointer-events: none;
  transition: opacity 0.5s ease, transform 0.5s ease;
  transform: translateY(20px);
}
.form_box.active {
  opacity: 1;
  pointer-events: all;
  transform: translateY(0);
  position: relative;
}

.form_box h2 {
  font-family: "Jua";
  color: #c89f6d;
  margin-bottom: 20px;
}

.form_box input:not(.m_id_result) {
  width: 100%;
  padding: 12px;
  margin-bottom: 15px;
  border: 1px solid #ccc;
  border-radius: 10px;
  font-size: 15px;
  font-family: "Gothic A1";
}

/* ===== 텍스트에어리어 (input과 디자인 통일) ===== */
.form_box textarea {
  width: 100%;
  min-height: 100px;
  padding: 12px;
  margin-bottom: 15px;
  border: 1px solid #ccc;
  border-radius: 10px;
  font-size: 15px;
  font-family: "Gothic A1", sans-serif;
  resize: vertical; /* 크기 조절 가능 (가로는 고정, 세로만) */
  box-sizing: border-box;
  transition: border-color 0.2s ease, box-shadow 0.2s ease;
}

.form_box textarea:focus {
  border-color: #5c7cfa;
  box-shadow: 0 0 4px rgba(92, 124, 250, 0.3);
  outline: none;
}


/* ===== ID 중복확인 그룹 (디자인 통일 버전) ===== */
.id-check-group {
  display: grid;
  grid-template-columns: 1fr 90px 0px; /* ← 버튼·결과칸 폭 고정 */
  gap: 10px;
 
}

/* ===== 아이디 입력칸 ===== */
.id-check-group input[name="m_id"] {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 10px;
  font-size: 15px;
  font-family: "Gothic A1", sans-serif;
  background-color: #fff;
  color: #333;
  box-sizing: border-box;
  transition: all 0.2s ease;
}
.id-check-group input[name="m_id"]:focus {
  border-color: #5c7cfa;
  box-shadow: 0 0 4px rgba(92, 124, 250, 0.3);
  outline: none;
}

/* ===== ID중복확인 버튼 (폼 버튼 디자인과 통일) ===== */
.btn-idcheck {
  width: 100%;
  height: 47px;
  background-color: #c89f6d;
  color: #fff;
  border: none;
  border-radius: 10px;
  font-size: 15px;
  font-weight: 500;
  cursor: pointer;
  white-space: nowrap; /* ✅ 줄바꿈 방지 */
  font-family: "Gothic A1", sans-serif;
}

.btn-idcheck:active {
  transform: scale(0.98);
}

/* ===== 결과 표시 텍스트 (깔끔하게 글자만 남김) ===== */
.m_id_result {
  width: 100%;
  border: none;
  background: transparent;
  color: #555;
  text-align: left;
  font-size: 14px;
}








/* ✅ 성별 라디오 버튼 정렬 */
.gender-group {
  display: flex;
  align-items: center;
  gap: 16px; /* 남/여 간격 조정 */
}

.gender-group label {
  display: flex;
  align-items: center;
  cursor: pointer;
  font-size: 14px;
}

.gender-group input[type="radio"] {
  margin-right: 5px;
}

/* 프로필 이미지 영역 */
.profile_upload {
  text-align: center;
  margin-bottom: 15px;
}
.profile_upload img {
  width: 100px;
  height: 100px;
  border-radius: 50%;
  object-fit: cover;
  border: 2px solid #c89f6d;
  cursor: pointer;
  transition: transform 0.3s ease;
}
.profile_upload img:hover {
  transform: scale(1.05);
}
.profile_upload input[type="file"] {
  display: none;
}

/* 네비 버튼 */
.nav_buttons {
  display: flex;
  justify-content: space-between;
  margin-top: 10px;
}
.nav_buttons button {
  width: 48%;
  padding: 12px;
  border: none;
  border-radius: 10px;
  background: #c89f6d;
  color: white;
  font-size: 15px;
  cursor: pointer;
  transition: background 0.3s ease;
}
.nav_buttons button:hover {
  background: #b0804c;
}

/* 2단계 국적 선택 select 박스 */
.custom-select {
    width: 100%;
    padding: 12px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 10px;
    font-size: 15px;
    font-family: "Gothic A1";
    background: #fff;
    cursor: pointer;
    appearance: none; /* 기본 화살표 제거 */
    -webkit-appearance: none;
    -moz-appearance: none;
    position: relative;
}
/* 바로가기 아이콘 */
.sub_bar {
	display: flex;
  	justify-content: center;
  	gap: 70px;
}

.shortcut {
	width: 80px;
	height: 80px;
	border-radius: 12px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	cursor: pointer;
	transition: background-color 0.3s;
}
.shortcut:hover {
	background: #d0d0d0;
}

.shortcut_icon {
  font-size: 28px; /* 아이콘 크기 */
  margin-bottom: 6px;
}

.shortcut_label {
  font-size: 14px;
  color: #333;
}

/* 주소 입력 전체 컨테이너 */
#step2 {
  display: flex;
  flex-direction: column;
  align-items: center;
}

/* 라벨 아래 간격 */
#step2 h2 {
  margin-bottom: 20px;
  color: #7b5c3f;
  font-weight: 700;
}

/* 주소 입력 한 줄 (우편번호 + 버튼) */
.address-row {
  display: flex;
  
  justify-content: center;
  gap: 10px;
  margin-bottom: -9px;
}
/* ✅ 주소검색 버튼이 사라져도 레이아웃이 깨지지 않게 */
.address-row .btn-postcode {
  width: 110px; /* 고정 폭 유지 */
}

.address-row .btn-postcode.hidden {
  visibility: hidden; /* display:none 대신 visibility로 공간 유지 */
}

/* 우편번호 input */
#postcode {
  width: 190px;
  height: 44px;
  border: 1.5px solid #dcd2c4;
  border-radius: 8px;
  padding: 0 12px;
  font-size: 14px;
  box-sizing: border-box;
  outline: none;
}

#postcode:focus {
  border-color: #d4a373;
}

/* 주소검색 버튼 */
.btn-postcode {
  height: 44px;
  background-color: #d4a373;
  color: #fff;
  border: none;
  border-radius: 8px;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  padding: 0 20px;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all 0.2s ease;
  box-sizing: border-box;
}

.btn-postcode:hover {
  background-color: #b68c5a;
}

/* 나머지 주소 입력칸 */
#address,
#detailAddress {
  width: 310px;
  height: 44px;
  border: 1.5px solid #dcd2c4;
  border-radius: 8px;
  padding: 0 12px;
  font-size: 14px;
  box-sizing: border-box;
  display: block;
  margin: 8px auto;
  outline: none;
}

#address:focus,
#detailAddress:focus {
  border-color: #d4a373;
}

/* 네비게이션 버튼 */
.nav_buttons {
  display: flex;
  justify-content: center;
  gap: 20px;
  margin-top: 20px;
}

.nav_buttons button {
  background-color: #d4a373;
  color: #fff;
  border: none;
  border-radius: 8px;
  padding: 10px 36px;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  transition: background-color 0.2s ease;
}

.nav_buttons button:hover {
  background-color: #b68c5a;
}

/* ✅ 6단계 확인 화면 고급 스타일 */
.confirm-box {
  text-align: left;
  width: 100%;
  background: #fffefc;
  border: 1px solid #eadbc8;
  border-radius: 16px;
  padding: 25px 28px;
  margin-top: 20px;
  box-shadow: 0 3px 8px rgba(0, 0, 0, 0.06);
  font-size: 15px;
  line-height: 1.8;
  color: #333;
}

.confirm-box h4 {
  font-size: 16px;
  color: #b6854d;
  margin-top: 18px;
  margin-bottom: 8px;
  border-left: 4px solid #c89f6d;
  padding-left: 8px;
}

.confirm-item {
  margin-bottom: 6px;
  display: flex;
  align-items: flex-start;
}

.confirm-item strong {
  width: 110px;
  color: #5f4a3d;
  font-weight: 600;
}

.confirm-item span {
  flex: 1;
  color: #333;
  word-break: break-all;
}

/* 구분선 스타일 */
.confirm-section {
  margin-top: 12px;
  padding-top: 10px;
  border-top: 1px dashed #e0d6c8;
}


</style>
</head>
<script type="text/javascript">

	
	function checkId() {
	    if (checkValue(mem.m_id, "ID입력 후 검사")) return;
	
	    var id = mem.m_id.value.trim();
	
	    if(id.length < 5 || id.length > 15) {
	    	alert("아이디는 5자 이상 15자 이하로 입력해주세요.");
	    	mem.m_id.focus();
	    	return;
	    }
	    
	    $.ajax({
	      type: "POST",
	      url: "MemberCheckId",
	      data: { m_id: id },
	      dataType: "text",
	      error: function () {
	        alert("통신 실패!");
	      },
	      
	      success: function (data) {
	        var result = $.trim(data); // 앞뒤 공백 제거
	
	        // 결과 텍스트 반영
	        mem.m_id_result.value = result;
			
	     	// 결과 색상 표시 추가
	        if (result === "사용가능") {
	          mem.m_id_result.style.color = "green";
	        } else {
	          mem.m_id_result.style.color = "red";
	        }
	     
	        // 간단한 시각 피드백 (선택)
	        var $idInput = $(mem.m_id);
	        if (result === "사용가능") {
	          $idInput.removeClass("error").addClass("ok");
	        } else {
	          $idInput.removeClass("ok").addClass("error");
	        }
	      }
	    });
	  }
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
		
		if(mem.m_id_result.value != "사용가능") {
			alert("아이디 중복 확인을 완료해주세요!");
			return;
		}
		
		/* // 비밀번호 정규식 검사
		var pw = mem.m_password.value;
		var rule = /^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9!@#$%^&*]{5,20}$/;
		if(!rule.test(pw)) {
			alert("비밀번호는 영문+숫자 조합의 5~20자로 입력해주세요.");
			mem.m_password.focus();
			return;
		} */
		
		
 
		// 2.첨부 용량 체크	
		var file = mem.m_image;
		var fileMaxSize  = 10; // 첨부 최대 용량 설정
		if(file.value !=""){
			// 사이즈체크
			var maxSize  = 1024 * 1024 * fileMaxSize;
			var fileSize = 0;
			// 브라우저 확인
			var browser=navigator.appName;
			// 익스플로러일 경우
			if (browser=="Microsoft Internet Explorer"){
				var oas = new ActiveXObject("Scripting.FileSystemObject");
				fileSize = oas.getFile(file.value).size;
			}else {
			// 익스플로러가 아닐경우
				fileSize = file.files[0].size;
			}
		
			if(fileSize > maxSize){
				alert(" 첨부파일 사이즈는 "+fileMaxSize+"MB 이내로 등록 가능합니다. ");
				return;
			}	
		}
			
		mem.method="post" 
		//multipart/form=data로 폼 전송시 
		//<input type="hidden" name="t_gubun" value="save"> 이런방식으로는 전달이 안됨
		mem.action="Member?t_gubun=save"
		mem.submit();
	}
	
	function onlyNumber(obj) {
		  const val = obj.value;
		  
		  // 숫자만 남기기
		  const onlyNum = val.replace(/[^0-9]/g, '');

		  // 숫자 외 문자가 있었을 경우 경고
		  if (val !== onlyNum) {
		    alert("숫자만 입력 가능합니다.");
		  }

		  obj.value = onlyNum;
		}
	
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<body>
<form name="mem" enctype="multipart/form-data">
	<input type="hidden" name="t_gubun">
		<div class="signup_container">
		  <!-- 단계 표시 -->
		  <div class="step_indicator">
		    <div class="step active">1. 기본정보</div>
		    <div class="step">2. 주소</div>
		    <div class="step">3. 가입목적</div>
		    <div class="step">4. 관심사</div>
		    <div class="step">5. 추천인</div>
		    <div class="step">6. 가입정보확인</div>
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
		       <c:forEach var="country" items="${countryList}">
		       		<option value="${country.country_code}">${country.country_name}</option>
		       </c:forEach>
		     </select>
		    
		    <div class="id-check-group">
			  <input type="text" name="m_id" id="c_id" placeholder="아이디">
			  <button type="button" class="btn-idcheck" onclick="checkId()">중복확인</button>
			  <input type="text" name="m_id_result" class="m_id_result" disabled>
			</div>

		    <!-- 닉네임 입력 + 중복확인 -->
			<div class="id-check-group">
			  <input type="text" name="m_nickname" id="m_nickName" placeholder="닉네임">
			  <button type="button" class="btn-idcheck" onclick="checkNick()">중복확인</button>
			  <input type="text" id="nickCheckResult" name="checkNickName" class="m_id_result" disabled>
			</div>

		    <input type="password" name="m_password" placeholder="비밀번호">
		    <input type="password" name="m_password_confirm" placeholder="비밀번호 확인">
		    <input type="text" name="m_name" placeholder="이름">
		    
		    <select id="" name="m_tel_country_code" class="custom-select" style="width:30%; margin-right:13px">
		       <option value="+82">+82(한국)</option>
		       <option value="+81">+81</option>
		     </select>
		     <input type="text" name="m_tel1" placeholder="010" onkeyup="onlyNumber(this)" style="width:15%">&nbsp;-
		     <input type="text" name="m_tel2" placeholder="1234" onkeyup="onlyNumber(this)" style="width:20%">&nbsp;-
		     <input type="text" name="m_tel3" placeholder="5678" onkeyup="onlyNumber(this)" style="width:20%">
		     
		    <input type="text" name="m_email1" placeholder="이메일" style="width:53%">&nbsp;@
		    <select id="m_email2" name="m_email2" class="custom-select" style="width:40%">
		       <option value="">선택</option>
		       <option value="naver">naver.com</option>
		       <option value="daum">daum.net</option>
		       <option value="google">gmail.com</option>
		     </select>
		    <input type="text" name="m_age" placeholder="나이" onkeyup="onlyNumber(this)">
	
		    <div class="gender-group">
			  <label><input type="radio" name="m_gender" value="M"> 남</label>
			  <label><input type="radio" name="m_gender" value="F"> 여</label>
			</div>
			<select name="m_type" class="custom-select">
			  <option value="">회원 구분 선택</option>
			  <option value="NORMAL">일반 회원</option>
			  <option value="TUTOR">튜터</option>
			</select>
			
			<input name="m_tagline" placeholder="한줄로 나를 표현해 보세요.">
			<textarea name="m_introduction" placeholder="간단한 자기소개를 작성해주세요."></textarea>
			
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
			<div class="form_box" id="step3"
			     oninput="if(this.querySelectorAll('input[name=m_purpose_code]:checked').length>3){
			       alert('가입 목적은 최대 3개까지만 선택할 수 있습니다.');
			       event.target.checked=false;
			     }">
			  <h2>가입 목적 선택</h2>
			  <h5 class="sub-info">최대 3개 선택 가능</h5>
			
			  <div class="purpose-container">
			    <div class="purpose-grid">
			      <div class="purpose-group">
			        <c:forEach var="dto" items="${purposeList}">
			          <label class="purpose-tag">
			            <input type="checkbox" name="m_purpose_code" value="${dto.purpose_code}">
			            <span>${dto.purpose_name}</span>
			          </label>
			        </c:forEach>
			      </div>
			    </div>
			  </div>
			
			  <div class="nav_buttons">
			    <button type="button" onclick="changeStep(2)">이전</button>
			    <button type="button" onclick="changeStep(4)">다음</button>
			  </div>
			</div>


		  
		<!-- 4단계 -->
		  <div class="form_box" id="step4"
		     oninput="if(this.querySelectorAll('input[name=m_interest]:checked').length>8){
		       alert('관심사는 최대 8개까지만 선택할 수 있습니다.');
		       event.target.checked=false;
		     }">
			  <h2>관심사 선택</h2>
			  <h5 class="sub-info">최대 8개 선택 가능</h5>
			  <div class="interest-container">
			    <div class="interest-grid">
					<c:forEach var="category" items="${interestMap}">
						<div class="interest-group">
							<p class="interest-title">
								${category.value[0].category_icon} ${category.key}
							</p>
							<c:forEach var="item" items="${category.value}">
								<label class="tag">
									<input type="checkbox" name="m_interest" value="${item.item_id}">
									<span>${item.item_name}</span>
								</label>
							</c:forEach>
						</div>
					</c:forEach>
					
			    </div>
			  </div>
			
			  <div class="nav_buttons">
			    <button type="button" onclick="changeStep(3)">이전</button>
			    <button type="button" onclick="changeStep(5)">다음</button>
			  </div>
			</div>

		  
		<!-- 5단계 -->
		  <div class="form_box" id="step5">
		    <h2>추천인 입력</h2>
		    <input type="text" name="m_recommender" placeholder="추천인 아이디 입력">
		    
		    <div class="nav_buttons">
		      <button type="button" onclick="changeStep(4)">이전</button>
		      <button type="button" onclick="changeStep(6)">다음</button>
		    </div>
		  </div>
		  <!-- 6단계 -->
		  <div class="form_box" id="step6">
		     <h2>가입 정보 확인</h2>
		    <p>입력한 정보를 확인해주세요.</p>
		    
		    <div id="confirm-info" class="confirm-box">
		        <!-- JS로 내용이 채워집니다 -->
		    </div>
		    
		    
		    
		    <div class="nav_buttons">
		      <button type="button" onclick="changeStep(5)">이전</button>
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
//✅ 현재단계를 미리 갱신
  currentStep = to;
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

 // ✅ 2단계로 이동할 때 자동 적용
    if (to === 2) setTimeout(applyAddressMode, 100);
    if (to === 6) {
    	  const infoBox = document.getElementById("confirm-info");

    	  const genderEl = document.querySelector('input[name="m_gender"]:checked');
    	  const gender = genderEl ? (genderEl.value === "M" ? "남성" : "여성") : "선택 안함";

    	  const email2 = document.querySelector('select[name="m_email2"]');
    	  const email =
    	    mem.m_email1.value && email2.value
    	      ? mem.m_email1.value + "@" + email2.options[email2.selectedIndex].text
    	      : "미입력";

    	  const tel =
    	    mem.m_tel_country_code.value + " " +
    	    [mem.m_tel1.value, mem.m_tel2.value, mem.m_tel3.value].filter(Boolean).join("-");

    	  const purposes = Array.from(document.querySelectorAll('input[name="m_purpose_code"]:checked'))
    	    .map(el => el.nextElementSibling.textContent)
    	    .join(", ") || "선택 안함";

    	  const interests = Array.from(document.querySelectorAll('input[name="m_interest"]:checked'))
    	    .map(el => el.nextElementSibling.textContent)
    	    .join(", ") || "선택 안함";

    	  const tagline = (document.querySelector('input[name="m_tagline"]')?.value || "").trim() || "미입력";
    	  const intro = (document.querySelector('textarea[name="m_introduction"]')?.value || "").trim() || "미입력";
    	  const recommender = (document.querySelector('input[name="m_recommender"]')?.value || "").trim() || "없음";

    	  infoBox.innerHTML =
    		  '<h4>기본 정보</h4>' +
    		  '<div class="confirm-item"><strong>국적:</strong><span>' + mem.m_country.options[mem.m_country.selectedIndex].text + '</span></div>' +
    		  '<div class="confirm-item"><strong>아이디:</strong><span>' + mem.m_id.value + '</span></div>' +
    		  '<div class="confirm-item"><strong>닉네임:</strong><span>' + mem.m_nickname.value + '</span></div>' +
    		  '<div class="confirm-item"><strong>이름:</strong><span>' + mem.m_name.value + '</span></div>' +
    		  '<div class="confirm-item"><strong>성별:</strong><span>' + gender + '</span></div>' +
    		  '<div class="confirm-item"><strong>나이:</strong><span>' + mem.m_age.value + '</span></div>' +
    		  '<div class="confirm-item"><strong>회원 유형:</strong><span>' + mem.m_type.options[mem.m_type.selectedIndex].text + '</span></div>' +
    		  '<div class="confirm-item"><strong>이메일:</strong><span>' + email + '</span></div>' +
    		  '<div class="confirm-item"><strong>연락처:</strong><span>' + tel + '</span></div>' +

    		  '<div class="confirm-section"></div>' +
    		  '<h4>주소 정보</h4>' +
    		  '<div class="confirm-item"><strong>우편번호:</strong><span>' + mem.m_zipcode.value + '</span></div>' +
    		  '<div class="confirm-item"><strong>주소:</strong><span>' + mem.m_address.value + ' ' + mem.m_address_detail.value + '</span></div>' +

    		  '<div class="confirm-section"></div>' +
    		  '<h4>개인 프로필</h4>' +
    		  '<div class="confirm-item"><strong>한줄소개:</strong><span>' + tagline + '</span></div>' +
    		  '<div class="confirm-item"><strong>자기소개:</strong><span>' + intro + '</span></div>' +

    		  '<div class="confirm-section"></div>' +
    		  '<h4>가입 목적</h4>' +
    		  '<div class="confirm-item"><span>' + purposes + '</span></div>' +

    		  '<div class="confirm-section"></div>' +
    		  '<h4>관심사</h4>' +
    		  '<div class="confirm-item"><span>' + interests + '</span></div>' +

    		  '<div class="confirm-section"></div>' +
    		  '<h4>추천인</h4>' +
    		  '<div class="confirm-item"><span>' + recommender + '</span></div>';

    	}

 // ✅ 새 단계로 전환 후 자동 스크롤 위로 이동
    window.scrollTo({ top: 0, behavior: "smooth" });
 
    
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
