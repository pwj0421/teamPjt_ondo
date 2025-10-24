<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>	
<%@ include file="../quickMenu.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
<link rel="stylesheet" href="../CSS/sub.css">

<script type="text/javascript">

	function goMatchList() {
		match.t_gubun.value="list";
		
		// 체크박스 검사
	    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
	    let isChecked = false;

	    checkboxes.forEach(cb => {
	        if(cb.checked) isChecked = true;
	    });

	    if(!isChecked){
	        alert("검색을 위해 최소 하나 이상의 카테고리를 선택해주세요.");
	        return; 
	    }
		
		match.method="post";
		match.action="Match";
		match.submit();
	}
	
</script>

</head>
<body>
	
<div class="match_main_container">

  <!-- 내 프로필 -->
  <div class="match_myprofile">
    <div class="profile_image">
        <img src="image/basic_profile.png" alt="프로필 사진">
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
					
					<form name="match">
						<input type="hidden" name="t_gubun">
    				<div class="category_grid">
      				<!-- 언어 교류 -->
						<div class="category_group">
						 	<p class="category_title">💬 언어 교류</p>
						 	<label><input type="checkbox" name="t_interest_1" value="1" <c:if test="${interestList.get(0) == 1}">checked</c:if>> 한국어 배우고 싶어요</label>
						 	<label><input type="checkbox" name="t_interest_2" value="2" <c:if test="${interestList.get(1) == 2}">checked</c:if>> 일본어 배우고 싶어요</label>
						 	<label><input type="checkbox" name="t_interest_3" value="3" <c:if test="${interestList.get(2) == 3}">checked</c:if>> 서로 언어 교환</label>
						 	<label><input type="checkbox" name="t_interest_4" value="4" <c:if test="${interestList.get(3) == 4}">checked</c:if>> 언어 스터디 모집</label>
						</div>

						<!-- 취미/관심사 -->
						<div class="category_group">
						 	<p class="category_title">🎮 취미/관심사</p>
						 	<label><input type="checkbox" name="t_interest_5" value="5" <c:if test="${interestList.get(4) == 5}">checked</c:if>> 애니메이션 / 만화 / 게임</label>
						 	<label><input type="checkbox" name="t_interest_6" value="6" <c:if test="${interestList.get(5) == 6}">checked</c:if>> 음악 / 콘서트 / 아이돌</label>
						 	<label><input type="checkbox" name="t_interest_7" value="7" <c:if test="${interestList.get(6) == 7}">checked</c:if>> 드라마 / 영화 / 유튜브</label>
						 	<label><input type="checkbox" name="t_interest_8" value="8" <c:if test="${interestList.get(7) == 8}">checked</c:if>> 스포츠</label>
						 	<label><input type="checkbox" name="t_interest_9" value="9" <c:if test="${interestList.get(8) == 9}">checked</c:if>> 여행 / 사진 / 자연</label>
						 	<label><input type="checkbox" name="t_interest_10" value="10" <c:if test="${interestList.get(9) == 10}">checked</c:if>> 패션 / 뷰티</label>
						</div>

						<!-- 문화 교류 -->
						<div class="category_group">
						 	<p class="category_title">✈️ 문화 교류</p>
						 	<label><input type="checkbox" name="t_interest_11" value="11" <c:if test="${interestList.get(10) == 11}">checked</c:if>> 한일 문화 이야기</label>
						 	<label><input type="checkbox" name="t_interest_12" value="12" <c:if test="${interestList.get(11) == 12}">checked</c:if>> 명절 / 전통문화 공유</label>
						 	<label><input type="checkbox" name="t_interest_13" value="13" <c:if test="${interestList.get(12) == 13}">checked</c:if>> 지역 추천</label>
						 	<label><input type="checkbox" name="t_interest_14" value="14" <c:if test="${interestList.get(13) == 14}">checked</c:if>> 한일 트렌드 토론</label>
						</div>

						<!-- 친구 찾기 -->
						<div class="category_group">
						 	<p class="category_title">👥 친구 찾기</p>
						 	<label><input type="checkbox" name="t_interest_15" value="15" <c:if test="${interestList.get(14) == 15}">checked</c:if>> 같은 나이대 친구</label>
						 	<label><input type="checkbox" name="t_interest_16" value="16" <c:if test="${interestList.get(15) == 16}">checked</c:if>> 학생 / 직장인</label>
						 	<label><input type="checkbox" name="t_interest_17" value="17" <c:if test="${interestList.get(16) == 17}">checked</c:if>> 온라인 대화 위주</label>
						 	<label><input type="checkbox" name="t_interest_18" value="18" <c:if test="${interestList.get(17) == 18}">checked</c:if>> 오프라인 만남 가능</label>
						</div>

						<!-- 커리어 & 학습 -->
						<div class="category_group">
						 	<p class="category_title">💼 커리어 & 학습</p>
						 	<label><input type="checkbox" name="t_interest_19" value="19" <c:if test="${interestList.get(18) == 19}">checked</c:if>> 유학 정보 교류</label>
						 	<label><input type="checkbox" name="t_interest_20" value="20" <c:if test="${interestList.get(19) == 20}">checked</c:if>> 워킹홀리데이 / 취업 정보</label>
						 	<label><input type="checkbox" name="t_interest_21" value="21" <c:if test="${interestList.get(20) == 21}">checked</c:if>> 자격증 / 공부 파트너</label>
						</div>

						<!-- 연애 / 관계 -->
						<div class="category_group">
						 	<p class="category_title">❤️ 연애 / 관계</p>
						 	<label><input type="checkbox" name="t_interest_22" value="22" <c:if test="${interestList.get(21) == 22}">checked</c:if>> 국제 연애 관심</label>
						 	<label><input type="checkbox" name="t_interest_23" value="23" <c:if test="${interestList.get(22) == 23}">checked</c:if>> 장거리 연애</label>
						 	<label><input type="checkbox" name="t_interest_24" value="24" <c:if test="${interestList.get(23) == 24}">checked</c:if>> 진지한 관계</label>
						</div>

						<!-- 지역 기반 -->
						<div class="category_group">
						 	<p class="category_title">📍 지역 기반</p>
						 	<label><input type="checkbox" name="t_interest_25" value="25" <c:if test="${interestList.get(24) == 25}">checked</c:if>> 서울 / 경기</label>
						 	<label><input type="checkbox" name="t_interest_26" value="26" <c:if test="${interestList.get(25) == 26}">checked</c:if>> 부산 / 제주</label>
						 	<label><input type="checkbox" name="t_interest_27" value="27" <c:if test="${interestList.get(26) == 27}">checked</c:if>> 도쿄 / 오사카</label>
						 	<label><input type="checkbox" name="t_interest_28" value="28" <c:if test="${interestList.get(27) == 28}">checked</c:if>> 후쿠오카 / 홋카이도</label>
						</div>
						
						<!-- 기타 -->
						<div class="category_group">
							<p class="category_title">🧩 기타</p>
						 	<label><input type="checkbox" name="t_interest_29" value="29" <c:if test="${interestList.get(28) == 29}">checked</c:if>> 이벤트 / 오프라인 모임</label>
						    <label><input type="checkbox" name="t_interest_30" value="30" <c:if test="${interestList.get(29) == 30}">checked</c:if>> 봉사활동 / 프로젝트 모집</label>
						    <label><input type="checkbox" name="t_interest_31" value="31" <c:if test="${interestList.get(30) == 31}">checked</c:if>> 자유 주제</label>
						</div>
					</div>
					</form>
    				<div class="category_buttons">
      					<button id="confirmCategory">확인</button>
    				</div>
  				</div>
			</div>

<!-- 선택된 카테고리 박스 -->
   			<div class="selected_categories_box">
				<div style="display:flex; align-items:center; flex-wrap:wrap; gap:8px;">
    				<p>검색할 카테고리:</p>
    				<div class="selected_categories"></div>
  				</div>
  				<button onclick="goMatchList()" class="search_btn">검색</button>
			</div>

    	</div>

	    <div class="match_list">
	    	<c:forEach items="${match_dtos}" var="dto">
		  		<div class="match_item">
		    		<img src="image/basic_profile.png" alt="프로필" class="profile_img">
		    		<div class="profile_info">
				    	<p class="nickname">${dto.getNickname()}</p>
				      	<p class="intro">${dto.getTagline()}</p>
						<div class="interest_box_container">
						  <c:forEach items="${dto.getInterestDto()}" var="interest">
						      <c:set var="interestId" value="${interest.getItem_id()}" />
						      <c:choose>
						          <c:when test="${interestList[interestId - 1] != 0}">
						              <span class="interest_box highlight">${interest.getItem_name()}</span>
						          </c:when>
						          <c:otherwise>
						              <span class="interest_box">${interest.getItem_name()}</span>
						          </c:otherwise>
						      </c:choose>
						  </c:forEach>
						</div>
						<span class="toggle_interest_btn">더보기 ▼</span>
					</div>
		    		<button class="message_btn">메세지 요청</button>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<script>
const openBtn = document.getElementById("openCategoryBtn");
const modal = document.querySelector(".category_modal");
const confirmBtn = document.getElementById("confirmCategory");
const selectedContainer = document.querySelector(".selected_categories");

// 모달 열기/닫기
openBtn.addEventListener("click", () => {
  modal.classList.toggle("active");

  if (modal.classList.contains("active")) {
    openBtn.textContent = "카테고리 닫기";
  } else {
    openBtn.textContent = "카테고리 열기";
  }
});

// 선택 항목 표시 함수 (공통으로 사용)
const valueMap = {
  "1": "한국어 배우고 싶어요",
  "2": "일본어 배우고 싶어요",
  "3": "서로 언어 교환",
  "4": "언어 스터디 모집",
  "5": "애니메이션 / 만화 / 게임",
  "6": "음악 / 콘서트 / 아이돌",
  "7": "드라마 / 영화 / 유튜브",
  "8": "스포츠",
  "9": "여행 / 사진 / 자연",
  "10": "패션 / 뷰티",
  "11": "한일 문화 이야기",
  "12": "명절 / 전통문화 공유",
  "13": "지역 추천",
  "14": "한일 트렌드 토론",
  "15": "같은 나이대 친구",
  "16": "학생 / 직장인",
  "17": "온라인 대화 위주",
  "18": "오프라인 만남 가능",
  "19": "유학 정보 교류",
  "20": "워킹홀리데이 / 취업 정보",
  "21": "자격증 / 공부 파트너",
  "22": "국제 연애 관심",
  "23": "장거리 연애",
  "24": "진지한 관계",
  "25": "서울 / 경기",
  "26": "부산 / 제주",
  "27": "도쿄 / 오사카",
  "28": "후쿠오카 / 홋카이도",
  "29": "이벤트 / 오프라인 모임",
  "30": "봉사활동 / 프로젝트 모집",
  "31": "자유 주제"
};

function updateSelectedList() {
  const checked = document.querySelectorAll('.category_group input[type="checkbox"]:checked');
  selectedContainer.innerHTML = "";

  checked.forEach(item => {
    const tag = document.createElement("span");
    tag.classList.add("tag");
    tag.textContent = valueMap[item.value]; // 숫자 → 글씨 변환

    tag.addEventListener("click", () => {
      item.checked = false;
      tag.remove();
    });

    selectedContainer.appendChild(tag);
  });
}


// ✅ 페이지 로드 시 이미 체크된 항목 표시
document.addEventListener("DOMContentLoaded", () => {
  updateSelectedList();
});

// 확인 버튼 클릭 시 리스트 갱신
confirmBtn.addEventListener("click", () => {
  updateSelectedList();
  modal.classList.remove("active");
  openBtn.textContent = "카테고리 열기"; // ✅ 버튼 텍스트 동기화
});

document.querySelectorAll('.match_item').forEach(item => {
    const container = item.querySelector('.interest_box_container');
    const btn = item.querySelector('.toggle_interest_btn');

    if(container.scrollHeight <= container.clientHeight){
        btn.style.display = 'none'; // 한 줄이면 버튼 숨김
    }

    btn.addEventListener('click', () => {
        container.classList.toggle('expanded');
        if(container.classList.contains('expanded')){
            btn.textContent = '접기 ▲';
        } else {
            btn.textContent = '더보기 ▼';
        }
    });
});

</script>
</body>
</html>
