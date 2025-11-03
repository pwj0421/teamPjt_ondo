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

.info-row {
  display: flex;
  align-items: center;
  gap: 10px;
  margin-bottom: 15px;
}

.info-row label {
  flex: 0 0 130px; /* 라벨 고정 너비 */
  font-weight: 600;
}

.info-row input[type="text"] {
  flex: 0 0 auto; /* 남은 공간 꽉 채우기 */
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 6px;
}

.info-row .btn-postcode {
  background: #caa57c;
  color: #fff;
  border: none;
  padding: 10px 18px;
  border-radius: 8px;
  cursor: pointer;
}
#postcode {
  width: 120px;
}

#address {
  width: 350px;
}

#detailAddress {
  
  width: 150px;
}
.address-group {
  display: flex;
  align-items: center;
  justify-content: flex-start;
  gap: 10px; /* 두 칸 사이 간격만 조절 */
}
.phone-group select {
    width: 95px !important; /* ✅ !important로 기존 CSS보다 우선 적용 */
  }
.phone-group input {
    width: 100px !important; /* ✅ !important로 기존 CSS보다 우선 적용 */
  }
/* ===== 기존 스타일 유지 ===== */
body {
  background: #fff;
  font-family: 'Pretendard', sans-serif;
  color: #333;
  margin: 0;
  padding: 0;
}

/* ===== 가입 목적(마이페이지용 수정 가능 스타일) ===== */
.purpose-edit {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  padding: 6px 0;
}

.purpose-option {
  display: flex;
  align-items: center;
  background-color: #f9f9f9;
  border: 1px solid #ddd;
  border-radius: 20px;
  padding: 6px 12px;
  cursor: pointer;
  transition: all 0.2s ease;
}

.purpose-option input[type="checkbox"] {
  display: none;
}

.purpose-option span {
  font-size: 14px;
  color: #444;
}

/* ✅ 체크된 상태 스타일 */
.purpose-option input[type="checkbox"]:checked + span {
  color: #fff;
  background-color: #caa57c;
  padding: 6px 12px;
  border-radius: 20px;
}

.btn-upload {
  display: inline-block;
  background-color: #caa57c;
  color: #fff;
  padding: 7px 16px;
  border-radius: 8px;
  font-size: 14px;
  font-weight: 600;
  font-family: "Pretendard", sans-serif;
  cursor: pointer;
  transition: background 0.2s ease;
  vertical-align: middle;
}
.btn-upload:hover {
  background-color: #b9926a;
}

.file-name {
  margin-left: 10px;
  color: #444;
  font-size: 14px;
  font-family: "Pretendard", sans-serif;
  vertical-align: middle;
}


</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">


function goUpdate() {
	if(confirm("정말 수정 하겠습니까?")) {
	    mem_info.action = "Member?t_gubun=memberUpdate";
	    mem_info.submit();
	}
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
function showFileName(input) {
	  const fileNameField = document.getElementById('fileNameDisplay');
	  fileNameField.innerText = input.files.length > 0 ? input.files[0].name : '';
	}
	
function goDeleteAccount() {
	if(confirm("정말 탈퇴 하겠습니까?")){
		deleteForm.submit();
	}
}

</script>
</head>

<body>
<%@ include file="../menu/quickMenu.jsp" %>
<div class="mypage-container">
  <%@ include file="../menu/mypage_menu.jsp" %>

  <div class="mypage-content">
    <h3>개인정보</h3>
    
<form name="deleteForm" method="post" action="Member">
  <input type="hidden" name="t_gubun" value="memberDelete">
</form>    
<form name="mem_info" method="post" enctype="multipart/form-data">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="m_id" value="${dto.m_id}">
	
    <div class="info-row">
	  <label>프로필 사진</label>
	  
	  <c:if test="${not empty dto.m_image}">
  <img src="${pageContext.request.contextPath}/image/${dto.m_image}" 
       alt="프로필 이미지" width="80" height="80" 
       style="border-radius:10px; border:1px solid #ddd; object-fit:cover; margin-right:10px;">
		  <br>
		</c:if>
		
		<!-- ✅ 기존 파일명 hidden 전달 -->
		<input type="hidden" name="origin_image" value="${empty dto.m_image ? '' : dto.m_image}">
		
		<!-- ✅ 파일 업로드 input 숨김 -->
		<input type="file" name="m_image" accept="image/*" id="fileUpload" style="display:none;" onchange="showFileName(this)">
		
		<!-- ✅ 업로드 버튼 -->
		<label for="fileUpload" class="btn-upload">파일 선택</label>
		
		<!-- ✅ 파일명 표시 -->
		<span id="fileNameDisplay" class="file-name">
		  <c:out value="${empty dto.m_image ? '등록된 파일 없음' : dto.m_image}" />
		</span>


	</div>
    <div class="info-row">
        <label>아이디</label>
    	${dto.getM_id()}
    </div>
    <div class="info-row">
      <label>이름</label>
      <input type="text" name="m_name" value="${dto.getM_name()}" placeholder="이름 입력">
    </div>
	
    <div class="info-row">
      <label>성별</label>
      <div class="gender-group">
        <input type="radio" name="m_gender" <c:if test="${dto.getM_gender() eq 'M'}">checked</c:if> value="M"> 남
        <input type="radio" name="m_gender" <c:if test="${dto.getM_gender() eq 'F'}">checked</c:if> value="F"> 여
      </div>
    </div>
	<div class="info-row">
      <label>나이</label>
      <input type="text" name="m_age" value="${dto.getM_age()}">
    </div>
    
    <div class="info-row">
      <label>국적</label>
      <select id="nationality" name="m_country">
		<option value="">국적 선택</option>
		       <c:forEach var="country" items="${countryList}">
		       		<option value="${country.country_code}" <c:if test="${country.country_code eq dto.getM_country()}">selected</c:if>>${country.country_name}</option>
		       </c:forEach>
	  </select>
    </div>

    <div class="info-row">
      <label>전화번호</label>
      <div class="phone-group">
        <select name="m_tel_country_code" >
          <option value="+81" <c:if test="${dto.getM_tel_country_code() eq '+81'}">selected</c:if>>+81(JP)</option>
          <option value="+82" <c:if test="${dto.getM_tel_country_code() eq '+82'}">selected</c:if>>+82(KR)</option>
        </select>
        <select name="m_tel1" >
          <option value="010" <c:if test="${dto.getM_tel1() eq '010'}">selected</c:if>>010</option>
          <option value="011" <c:if test="${dto.getM_tel1() eq '011'}">selected</c:if>>011</option>
          <option value="070" <c:if test="${dto.getM_tel1() eq '070'}">selected</c:if>>070</option>
        </select>
        <input type="text" name="m_tel2" value="${dto.getM_tel2()}" maxlength="4" placeholder="1234">
        <input type="text" name="m_tel3" value="${dto.getM_tel3()}" maxlength="4" placeholder="5678">
      </div>
    </div>

	<div class="info-row">
	  <label>우편번호</label>
	  <input type="text" id="postcode" name="m_zipcode" value="${dto.m_zipcode}" placeholder="우편번호">
	  <button type="button" class="btn-postcode" onclick="execDaumPostcode()">주소검색</button>
	</div>
	
	<div class="info-row">
	  <label>주소(상세주소)</label>
	  <input type="text" id="address" name="m_address" value="${dto.m_address}" placeholder="주소">
	  <input type="text" id="detailAddress" name="m_address_detail" value="${dto.m_address_detail}" placeholder="상세주소(선택)">
	</div>
	
    <div class="info-row">
      <label>이메일</label>
      <div class="email-group">
        <input type="text" name="m_email1" value="${dto.m_email1 }" placeholder="example">
        <span>@</span>
       		 <select name="m_email2">
		       <option value="">선택</option>
		       <option value="naver" <c:if test="${dto.m_email2 eq 'naver'}">selected</c:if>>naver.com</option>
		       <option value="daum" <c:if test="${dto.m_email2 eq 'daum'}">selected</c:if>>daum.net</option>
		       <option value="google" <c:if test="${dto.m_email2 eq 'google'}">selected</c:if>>gmail.com</option>
		     </select>
      </div>
    </div>
    <div class="info-row">
      <label>회원구분</label>
      <select name="m_type">
			<option value="NORMAL" <c:if test="${dto.m_type eq 'NORMAL'}">selected</c:if>>일반 회원</option>
			<option value="TUTOR" <c:if test="${dto.m_type eq 'TUTOR'}">selected</c:if>>튜터</option>
	  </select>
    </div>
    <div class="info-row">
	  <label>가입 목적</label>
	  <div class="purpose-edit"
	       oninput="if(this.querySelectorAll('input[name=m_purpose_code]:checked').length>3){
	         alert('가입 목적은 최대 3개까지만 선택할 수 있습니다.');
	         event.target.checked = false;
	       }">
	    <c:forEach var="purpose" items="${purposeList}">
	      <label class="purpose-option">
	        <input type="checkbox" name="m_purpose_code" value="${purpose.purpose_code}"
	               <c:if test="${fn:contains(dto.purposeCode, purpose.purpose_code)}">checked</c:if>>
	        <span>${purpose.purpose_name}</span>
	      </label>
	    </c:forEach>
	  </div>
	</div>
    <div class="info-row">
    	<label>추천인</label>
    	${dto.m_recommender}
	</div>
	<div class="info-row">
		<label>가입일자</label>
		${dto.m_reg}
	</div>
	<div class="info-row">
		<label>수정일자</label>
		${dto.m_updated}
	</div>
</form>	
    <div class="button-box">
      <button type="button" onclick="goUpdate()">수정하기</button>&nbsp;&nbsp;
      <button type="button" onclick="goDeleteAccount()">회원탈퇴</button>
    </div>
  </div>
</div>
</body>
</html>
