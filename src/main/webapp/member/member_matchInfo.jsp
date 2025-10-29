<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>	
<%@ include file="../menu/quickMenu.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이페이지 - 매칭정보수정</title>
<style>
body {
  background: #fff;
  font-family: 'Pretendard', sans-serif;
  color: #333;
  margin: 0;
  padding: 0;
}


</style>

<script>
document.addEventListener("DOMContentLoaded", () => {
  const checkboxes = document.querySelectorAll('.mp_category_group input[type="checkbox"]');
  const selectedBox = document.querySelector('.mp_selected_categories');

  function updateSelected() {
    selectedBox.innerHTML = '';
    const checked = document.querySelectorAll('.mp_category_group input:checked');
    checked.forEach(c => {
      const tag = document.createElement('span');
      tag.textContent = c.value;
      tag.addEventListener('click', () => {
        c.checked = false;
        updateSelected();
      });
      selectedBox.appendChild(tag);
    });
  }

  updateSelected();
  checkboxes.forEach(chk => chk.addEventListener('change', updateSelected));
});
</script>
</head>

<script>
	function goUpdateMatchInfo(){
		if (!nickOk) {
	        alert("닉네임 중복 확인이 필요하거나 이미 사용 중인 닉네임입니다.");
	        return;
	    }

	    const form = document.forms['matchInfoUpdate'];
		matchInfoUpdate.t_gubun.value = "matchInfoUpdate";
		matchInfoUpdate.method="post";
		matchInfoUpdate.action="Member";
		matchInfoUpdate.submit();
	}
	
</script>
<body>
	<%@ include file="../menu/quickMenu.jsp" %>
	<div class="mp_mypage_container">
	<%@ include file="../menu/mypage_menu.jsp" %>
	
	
  	<div class="mp_mypage_content">
    	<h3>매칭 정보</h3>
    
    
<!-- 매칭 정보 업데이트 입니다 -혜민 ~~-->

		<form name="matchInfoUpdate">	
			<input type="hidden" name="t_gubun">
			<input type="hidden" name="t_id" value="${m_dto.getM_id()}">
		    <div class="mp_info_row">
		      	<label>닉네임</label>
		      	<input type="text" id="m_nickName" placeholder="닉네임 입력" value="${m_dto.getM_nickname()}" name="m_nickName">
		    	<button type="button" class="mp_check_btn" onclick="checkNick()">중복확인</button>
		    	<input type="text" id="nickCheckResult" name="checkNickName" class="mp_nickCheck" value="확인 필요" disabled>

		    </div>
	<!-- 닉네임 중복검사 -->	
	<script> 
	function checkNick() {
	    const nick = document.getElementById("m_nickName").value.trim();
	    const updateBtn = document.getElementById('updateBtn');
	    const resultInput = document.getElementById('nickCheckResult');

	    if (!nick) {
	        alert("닉네임을 입력해주세요.");
	        return;
	    }

	    fetch("Member?t_gubun=checkNick&nick=" + encodeURIComponent(nick))
	        .then(response => response.json())
	        .then(data => {
	            if (data.result === "exist") {
	                resultInput.value = "이미 사용 중 ❌";
	                nickOk = false;
	                updateBtn.style.opacity = "0.5"; // 시각적으로 막힌 느낌
	            } else {
	                resultInput.value = "사용 가능 ✅";
	                nickOk = true;
	                updateBtn.style.opacity = "1"; // 활성화
	            }
	        })
	        .catch(err => console.error(err));
	}
</script>
		
		
		
		    <div class="mp_info_row">
		      <label>한줄소개</label>
		      <textarea placeholder="자신을 간단히 소개해주세요!" name="m_tagline">${m_dto.getM_tagline()}</textarea>
		    </div>
			<div class="mp_info_row">
		      <label> 자기소개</label>
		      <textarea placeholder="자신을 간단히 소개해주세요!" name="m_introduction">${m_dto.getM_introduction()}</textarea>
		    </div>
		    <div class="mp_button_box">
		      <button type="button" id="updateBtn" onclick="goUpdateMatchInfo()">수정</button>
		    </div>
		</form>



<!-- 카테고리 업데이트   준영상 부탁합니다 ~~-->
			<div class="mp_match_searchBox">
			
		    	<div class="mp_selected_categories_box">
		        	<div style="display:flex; align-items:center; flex-wrap:wrap; gap:8px;">
		          		<p style="font-weight:600;">내 카테고리:</p>
		          			<div class="mp_selected_categories"></div>
		        	</div>
		        	<button class="mp_search_btn">저장</button>
		      	</div>
	
	      		<div class="mp_category_container">
	        		<div class="mp_category_grid">
	
	          			<div class="mp_category_group">
				            <p class="mp_category_title">💬 언어 교류</p>
				            <label><input type="checkbox" value="한국어 배우고 싶어요"> 한국어 배우고 싶어요</label>
				            <label><input type="checkbox" value="일본어 배우고 싶어요"> 일본어 배우고 싶어요</label>
				            <label><input type="checkbox" value="서로 언어 교환"> 서로 언어 교환</label>
				            <label><input type="checkbox" value="언어 스터디 모집"> 언어 스터디 모집</label>
	          			</div>
	
	          			<div class="mp_category_group">
				            <p class="mp_category_title">🎮 취미/관심사</p>
				            <label><input type="checkbox" value="애니메이션 / 만화 / 게임"> 애니메이션 / 만화 / 게임</label>
				            <label><input type="checkbox" value="음악 / 콘서트 / 아이돌"> 음악 / 콘서트 / 아이돌</label>
				            <label><input type="checkbox" value="드라마 / 영화 / 유튜브"> 드라마 / 영화 / 유튜브</label>
				            <label><input type="checkbox" value="스포츠"> 스포츠</label>
				            <label><input type="checkbox" value="여행 / 사진 / 자연"> 여행 / 사진 / 자연</label>
				            <label><input type="checkbox" value="패션 / 뷰티"> 패션 / 뷰티</label>
				        </div>
	
	          			<div class="mp_category_group">
				            <p class="mp_category_title">✈️ 문화 교류</p>
				            <label><input type="checkbox" value="한일 문화 이야기"> 한일 문화 이야기</label>
				            <label><input type="checkbox" value="명절 / 전통문화 공유"> 명절 / 전통문화 공유</label>
				            <label><input type="checkbox" value="지역 추천"> 지역 추천</label>
				            <label><input type="checkbox" value="한일 트렌드 토론"> 한일 트렌드 토론</label>
	         			</div>
	
	          			<div class="mp_category_group">
				            <p class="mp_category_title">👥 친구 찾기</p>
				            <label><input type="checkbox" value="같은 나이대 친구"> 같은 나이대 친구</label>
				            <label><input type="checkbox" value="학생 / 직장인"> 학생 / 직장인</label>
				            <label><input type="checkbox" value="온라인 대화 위주"> 온라인 대화 위주</label>
				            <label><input type="checkbox" value="오프라인 만남 가능"> 오프라인 만남 가능</label>
	         			</div>
	
	          			<div class="mp_category_group">
							<p class="mp_category_title">💼 커리어 & 학습</p>
							<label><input type="checkbox" value="유학 정보 교류"> 유학 정보 교류</label>
							<label><input type="checkbox" value="워킹홀리데이 / 취업 정보"> 워킹홀리데이 / 취업 정보</label>
							<label><input type="checkbox" value="자격증 / 공부 파트너"> 자격증 / 공부 파트너</label>
	          			</div>
	
	          			<div class="mp_category_group">
				            <p class="mp_category_title">❤️ 연애 / 관계</p>
				            <label><input type="checkbox" value="국제 연애 관심"> 국제 연애 관심</label>
				            <label><input type="checkbox" value="장거리 연애"> 장거리 연애</label>
				            <label><input type="checkbox" value="진지한 관계"> 진지한 관계</label>
	          			</div>
	
	          			<div class="mp_category_group">
				            <p class="mp_category_title">📍 지역 기반</p>
				            <label><input type="checkbox" value="서울 / 경기"> 서울 / 경기</label>
				            <label><input type="checkbox" value="부산 / 제주"> 부산 / 제주</label>
				            <label><input type="checkbox" value="도쿄 / 오사카"> 도쿄 / 오사카</label>
				            <label><input type="checkbox" value="후쿠오카 / 홋카이도"> 후쿠오카 / 홋카이도</label>
	          			</div>
	
	          			<div class="mp_category_group">
				            <p class="mp_category_title">🧩 기타</p>
				            <label><input type="checkbox" value="이벤트 / 오프라인 모임"> 이벤트 / 오프라인 모임</label>
				            <label><input type="checkbox" value="봉사활동 / 프로젝트 모집"> 봉사활동 / 프로젝트 모집</label>
				            <label><input type="checkbox" value="자유 주제"> 자유 주제</label>
	          			</div>
	
	        		</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>
