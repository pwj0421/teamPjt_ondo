<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>  
<%@ include file="../menu/quickMenu.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>친구 요청 목록</title>
<style>
body {
  background: #fff;
  font-family: 'Pretendard', sans-serif;
  color: #333;
  margin: 0;
  padding: 0;
}

/* 마이페이지 컨테이너 */
.mp_mypage_container {
  display: flex;
  width: 100%;
  min-height: 85vh;
  padding: 40px 70px;
  gap: 60px;
}

/* 컨텐츠 영역 */
.mp_mypage_content {
  width: 80%;
  padding-top: 10px;
}

.mp_mypage_content h3 {
  font-size: 22px;
  font-weight: 600;
  margin-bottom: 25px;
  border-bottom: 2px solid #c89f6d;
  padding-bottom: 8px;
  color: #c89f6d;
}

/* 친구 카드 컨테이너 */
.friend_card_container {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 25px;
  margin-top: 20px;
}

/* 카드 */
.friend_card {
  background: #fff;
  border: 1px solid #eee;
  border-radius: 12px;
  padding: 15px;
  transition: 0.3s;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 10px;
}

.friend_card:hover {
  box-shadow: 0 2px 10px rgba(0,0,0,0.08);
}

/* 프로필 사진 */
.friend_card img {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  object-fit: cover;
}

/* 닉네임 */
.friend_nickname {
  font-weight: 600;
  font-size: 16px;
  color: #c89f6d;
  text-align: center;
}

/* 한줄소개 */
.friend_intro {
  font-size: 14px;
  color: #555;
  text-align: center;
  margin-bottom: 5px;
}

/* 서브 정보: 국적/성별/나이 */
.friend_subinfo {
  font-size: 13px;
  color: #777;
  text-align: center;
  margin-bottom: 10px;
}

/* 카테고리 */
.friend_categories {
  display: flex;
  flex-wrap: wrap;
  gap: 6px;
  justify-content: center;
  margin-bottom: 10px;
}

.friend_categories span {
  background: #c89f6d33;
  color: #555;
  padding: 4px 10px;
  border-radius: 15px;
  font-size: 12px;
}

/* 버튼 */
.friend_button_box {
  display: flex;
  gap: 10px;
}

.friend_button_box button {
  padding: 6px 14px;
  border-radius: 8px;
  border: none;
  font-size: 13px;
  font-weight: 600;
  cursor: pointer;
  transition: 0.2s;
}

.friend_accept {
  background: #c89f6d;
  color: #fff;
}
.friend_accept:hover {
  background: #b38a5a;
}

.friend_reject {
  background: #eee;
  color: #555;
}
.friend_reject:hover {
  background: #ccc;
}

/* 페이징 모형 */
.friend_paging {
  display: flex;
  justify-content: center;
  gap: 8px;
  margin-top: 30px;
}

.friend_paging span {
  display: inline-block;
  width: 28px;
  height: 28px;
  line-height: 28px;
  border-radius: 50%;
  background: #eee;
  text-align: center;
  cursor: pointer;
  font-weight: 600;
}
.friend_paging span.active {
  background: #c89f6d;
  color: #fff;
}
</style>
</head>
<body>
<%@ include file="../menu/quickMenu.jsp" %>
<div class="mp_mypage_container">
  <%@ include file="../menu/mypage_menu.jsp" %>

  <div class="mp_mypage_content">
    <h3>친구 요청 목록</h3>

<<<<<<< Updated upstream
	<div class="friend_card_container">		<!-- 친구 카드 1 -->
		<c:forEach items="${match_dtos}" var="dto">
			<div class="friend_card">
		        <img src="image/basic_profile.png" alt="프로필1">
		        <div class="friend_nickname">김유리</div>
		        <div class="friend_intro">안녕하세요! 일본 문화에 관심 많아요.</div>
		        <div class="friend_subinfo"> 일본 | 여 | 25</div>
=======
<<<<<<< Updated upstream
    <div class="friend_card_container">
      <!-- 친구 카드 1 -->
      <div class="friend_card">
        <img src="image/basic_profile.png" alt="프로필1">
        <div class="friend_nickname">김유리</div>
        <div class="friend_intro">안녕하세요! 일본 문화에 관심 많아요.</div>
        <div class="friend_subinfo"> 일본 | 여 | 25</div>
        <div class="friend_categories">
          <span>언어 교류</span>
          <span>여행</span>
          <span>문화</span>
        </div>
        <div class="friend_button_box">
          <button class="friend_accept">수락</button>
          <button class="friend_reject">거절</button>
        </div>
      </div>

      <!-- 친구 카드 2 -->
      <div class="friend_card">
        <img src="image/basic_profile.png" alt="프로필2">
        <div class="friend_nickname">박준호</div>
        <div class="friend_intro">한국어 배우고 싶어요~</div>
        <div class="friend_subinfo"> 한국 | 남 | 27</div>
        <div class="friend_categories">
          <span>언어 교류</span>
          <span>게임</span>
          <span>음악</span>
        </div>
        <div class="friend_button_box">
          <button class="friend_accept">수락</button>
          <button class="friend_reject">거절</button>
        </div>
      </div>

      <!-- 친구 카드 3 -->
      <div class="friend_card">
        <img src="image/basic_profile.png" alt="프로필3">
        <div class="friend_nickname">사토 루이</div>
        <div class="friend_intro">애니와 만화 좋아합니다!</div>
        <div class="friend_subinfo"> 일본 | 남 | 23</div>
        <div class="friend_categories">
          <span>애니</span>
          <span>게임</span>
          <span>여행</span>
        </div>
        <div class="friend_button_box">
          <button class="friend_accept">수락</button>
          <button class="friend_reject">거절</button>
        </div>
      </div>

      <!-- 친구 카드 4 -->
      <div class="friend_card">
        <img src="image/basic_profile.png" alt="프로필4">
        <div class="friend_nickname">이하나</div>
        <div class="friend_intro">음악 콘서트 자주 다녀요!</div>
        <div class="friend_subinfo"> 한국 | 여 | 24</div>
        <div class="friend_categories">
          <span>음악</span>
          <span>문화</span>
        </div>
        <div class="friend_button_box">
          <button class="friend_accept">수락</button>
          <button class="friend_reject">거절</button>
        </div>
      </div>

      <!-- 친구 카드 5 -->
      <div class="friend_card">
        <img src="image/basic_profile.png" alt="프로필5">
        <div class="friend_nickname">오사카 히로</div>
        <div class="friend_intro">한국어 배우고 싶어요!</div>
        <div class="friend_subinfo"> 일본 | 남 | 28</div>
        <div class="friend_categories">
          <span>언어 교류</span>
          <span>여행</span>
          <span>언어교류</span>
          <span>한국음식</span>
        </div>
        <div class="friend_button_box">
          <button class="friend_accept">수락</button>
          <button class="friend_reject">거절</button>
        </div>
      </div>

      <!-- 친구 카드 6 -->
      <div class="friend_card">
        <img src="image/basic_profile.png" alt="프로필6">
        <div class="friend_nickname">정민지</div>
        <div class="friend_intro">드라마와 영화 좋아합니다!</div>
        <div class="friend_subinfo"> 한국 | 여 | 26</div>
        <div class="friend_categories">
          <span>드라마</span>
          <span>영화</span>
          <span>여행</span>
          <span>언어교류</span>
          <button class="category_more_btn">더보기</button>
        </div>
        <div class="friend_button_box">
          <button class="friend_accept">수락</button>
          <button class="friend_reject">거절</button>
        </div>
      </div>
    </div>

=======
	<div class="friend_card_container">	
		<c:forEach items="${r_dtos}" var="dto">
			<div class="friend_card">
		        <img src="attach/member_profile/${dto.getProfileImg()}" alt="프로필">
		        <div class="friend_nickname">${dto.getR_nickname()}</div>
		        <div class="friend_intro">${dto.getGreetingMsg()}</div>
		        <div class="friend_subinfo"> ${dto.getR_country()} | ${dto.getR_gender()} | ${dto.getR_age()}</div>
>>>>>>> Stashed changes
		        <div class="friend_categories">
					<span>언어 교류</span>
					<span>여행</span>
					<span>문화</span>
	        	</div>
	        	<div class="friend_button_box">
					<button type="button"  onclick=""  class="friend_accept">수락</button>
					<button type="button" onclick="" class="friend_reject">거절</button>
	        	</div>
	      	</div>
		</c:forEach>
  
	</div>
	
	
<<<<<<< Updated upstream
=======
>>>>>>> Stashed changes
>>>>>>> Stashed changes
    <!-- 페이징 모형 -->
    <div class="friend_paging">
      <span class="active">1</span>
      <span>2</span>
      <span>3</span>
    </div>

  </div>
</div>
</body>
<%@ include file="../common_footer.jsp" %> 
</html>
