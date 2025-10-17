<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>	
<%@ include file="../quickMenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
<link rel="stylesheet" href="../CSS/sub.css">
</head>
<body>
	
<div class="match_main_container">

  <!-- 내 프로필 -->
  <div class="match_myprofile">
    <div class="profile_image">
        <img src="../image/basic_profile.png" alt="프로필 사진">
    </div>
    <div class="profile_nickname">밍땅</div>
    <div class="profile_intro">게임과 소통을 좋아하는 20대 한국인</div>
    <div class="profile_tags">
        <span>#20대</span>
        <span>#한국인</span>
        <span>#게임</span>
        <span>#소통</span>
    </div>
    <div class="profile_edit_btn">
        <button type="button">내 정보 수정하기</button>
    </div>
  </div>

  <!-- 카테고리 검색 박스 -->
  <div class="match_searchBox">
    <div class="match_category">
     	<button id="openCategoryBtn">카테고리 열기</button>
			<div class="category_modal">
  				<div class="category_content">
    				<h3>카테고리 선택</h3>

    				<div class="category_grid">
      				<!-- 언어 교류 -->
						<div class="category_group">
						 	<p class="category_title">💬 언어 교류</p>
						 	<label><input type="checkbox" value="한국어 배우고 싶어요"> 한국어 배우고 싶어요</label>
						 	<label><input type="checkbox" value="일본어 배우고 싶어요"> 일본어 배우고 싶어요</label>
						 	<label><input type="checkbox" value="서로 언어 교환"> 서로 언어 교환</label>
						 	<label><input type="checkbox" value="언어 스터디 모집"> 언어 스터디 모집</label>
						</div>

						<!-- 취미/관심사 -->
						<div class="category_group">
						 	<p class="category_title">🎮 취미/관심사</p>
						 	<label><input type="checkbox" value="애니메이션 / 만화 / 게임"> 애니메이션 / 만화 / 게임</label>
						 	<label><input type="checkbox" value="음악 / 콘서트 / 아이돌"> 음악 / 콘서트 / 아이돌</label>
						 	<label><input type="checkbox" value="드라마 / 영화 / 유튜브"> 드라마 / 영화 / 유튜브</label>
						 	<label><input type="checkbox" value="스포츠"> 스포츠</label>
						 	<label><input type="checkbox" value="여행 / 사진 / 자연"> 여행 / 사진 / 자연</label>
						 	<label><input type="checkbox" value="패션 / 뷰티"> 패션 / 뷰티</label>
						</div>

						<!-- 문화 교류 -->
						<div class="category_group">
						 	<p class="category_title">✈️ 문화 교류</p>
						 	<label><input type="checkbox" value="한일 문화 이야기"> 한일 문화 이야기</label>
						 	<label><input type="checkbox" value="명절 / 전통문화 공유"> 명절 / 전통문화 공유</label>
						 	<label><input type="checkbox" value="지역 추천"> 지역 추천</label>
						 	<label><input type="checkbox" value="한일 트렌드 토론"> 한일 트렌드 토론</label>
						</div>

						<!-- 친구 찾기 -->
						<div class="category_group">
						 	<p class="category_title">👥 친구 찾기</p>
						 	<label><input type="checkbox" value="같은 나이대 친구"> 같은 나이대 친구</label>
						 	<label><input type="checkbox" value="학생 / 직장인"> 학생 / 직장인</label>
						 	<label><input type="checkbox" value="온라인 대화 위주"> 온라인 대화 위주</label>
						 	<label><input type="checkbox" value="오프라인 만남 가능"> 오프라인 만남 가능</label>
						</div>

						<!-- 커리어 & 학습 -->
						<div class="category_group">
						 	<p class="category_title">💼 커리어 & 학습</p>
						 	<label><input type="checkbox" value="유학 정보 교류"> 유학 정보 교류</label>
						 	<label><input type="checkbox" value="워킹홀리데이 / 취업 정보"> 워킹홀리데이 / 취업 정보</label>
						 	<label><input type="checkbox" value="자격증 / 공부 파트너"> 자격증 / 공부 파트너</label>
						</div>

						<!-- 연애 / 관계 -->
						<div class="category_group">
						 	<p class="category_title">❤️ 연애 / 관계</p>
						 	<label><input type="checkbox" value="국제 연애 관심"> 국제 연애 관심</label>
						 	<label><input type="checkbox" value="장거리 연애"> 장거리 연애</label>
						 	<label><input type="checkbox" value="진지한 관계"> 진지한 관계</label>
						</div>

						<!-- 지역 기반 -->
						<div class="category_group">
						 	<p class="category_title">📍 지역 기반</p>
						 	<label><input type="checkbox" value="서울 / 경기"> 서울 / 경기</label>
						 	<label><input type="checkbox" value="부산 / 제주"> 부산 / 제주</label>
						 	<label><input type="checkbox" value="도쿄 / 오사카"> 도쿄 / 오사카</label>
						 	<label><input type="checkbox" value="후쿠오카 / 홋카이도"> 후쿠오카 / 홋카이도</label>
						</div>
						
						<!-- 기타 -->
						<div class="category_group">
							<p class="category_title">🧩 기타</p>
						 	<label><input type="checkbox" value="이벤트 / 오프라인 모임"> 이벤트 / 오프라인 모임</label>
						    <label><input type="checkbox" value="봉사활동 / 프로젝트 모집"> 봉사활동 / 프로젝트 모집</label>
						    <label><input type="checkbox" value="자유 주제"> 자유 주제</label>
						</div>
					</div>

    				<div class="category_buttons">
      					<button id="confirmCategory">확인</button>
    				</div>
  				</div>
			</div>

<!-- 선택된 카테고리 박스 -->
   			<div class="selected_categories_box">
				<div style="display:flex; align-items:center; flex-wrap:wrap; gap:8px;">
    				<p>선택한 카테고리:</p>
    				<div class="selected_categories"></div>
  				</div>
  				<button class="search_btn">검색!</button>
			</div>

    	</div>

	    <div class="match_list">
	  		<div class="match_item">
	    		<img src="../image/basic_image.png" alt="프로필" class="profile_img">
	    		<div class="profile_info">
			      <p class="nickname">Sakura</p>
			      <p class="intro">한국 친구랑 교류하고 싶어요!</p>
				</div>
	    		<button class="message_btn">메세지 보내기</button>
			</div>
	
			<div class="match_item">
		    	<img src="https://via.placeholder.com/80" alt="프로필" class="profile_img">
		    	<div class="profile_info">
			      	<p class="nickname">민수</p>
			      	<p class="intro">일본 문화를 배우고 싶어요.</p>
		    	</div>
		    	<button class="message_btn">메세지 보내기</button>
			</div>
		
			<div class="match_item">
		    	<img src="https://via.placeholder.com/80" alt="프로필" class="profile_img">
		    	<div class="profile_info">
		      		<p class="nickname">Yuna</p>
		      		<p class="intro">같이 카페 탐방할 친구 찾아요 ☕</p>
		    	</div>
		    	<button class="message_btn">메세지 보내기</button>
			</div>
		
			<div class="match_item">
		    	<img src="https://via.placeholder.com/80" alt="프로필" class="profile_img">
		    	<div class="profile_info">
		      		<p class="nickname">Tomo</p>
		      		<p class="intro">게임 좋아하는 친구 환영!</p>
		    	</div>
		    	<button class="message_btn">메세지 보내기</button>
		  	</div>
		</div>
	</div>
</div>

<script>
const openBtn = document.getElementById("openCategoryBtn");
const modal = document.querySelector(".category_modal");
const confirmBtn = document.getElementById("confirmCategory");
const selectedContainer = document.querySelector(".selected_categories");

// 모달 열기/닫기 (애니메이션)
openBtn.addEventListener("click", () => {
  modal.classList.toggle("active");

  if(modal.classList.contains("active")){
    openBtn.textContent = "카테고리 닫기";
  } else {
    openBtn.textContent = "카테고리 열기";
  }
});


// 확인 버튼 클릭
confirmBtn.addEventListener("click", () => {
  const checked = document.querySelectorAll('.category_group input[type="checkbox"]:checked');
  selectedContainer.innerHTML = "";

  checked.forEach(item => {
    const tag = document.createElement("span");
    tag.classList.add("tag");
    tag.textContent = item.value;

    // 태그 클릭 시 삭제
    tag.addEventListener("click", () => {
      item.checked = false;
      tag.remove();
    });

    selectedContainer.appendChild(tag);
  });

  modal.classList.remove("active");
});
</script>
</body>
</html>
