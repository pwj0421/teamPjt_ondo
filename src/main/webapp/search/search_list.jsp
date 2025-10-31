<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>
<%@ include file="../menu/quickMenu.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<style>
/* 전체 레이아웃 */
.sr_main {
  display: flex;
  width: 100%;
  padding-top: 0px; /* 헤더 고려 */
  gap: 30px;
}

/* 네비게이션 메뉴 */
.sr_mypage_nav {
  width: 20%;
  padding: 20px;
  background: #fff;
  border-radius: 12px;
  border: 1px solid #eee;
  box-shadow: 0 2px 5px rgba(0,0,0,0.05);
  position: sticky;
  top: 60px; /* 헤더 높이 고려 */
  align-self: flex-start;
}

.sr_mypage_nav h2 {
  font-size: 20px;
  color: #c89f6d;
  font-weight: 700;
  margin-bottom: 15px;
}

.sr_mypage_nav ul {
  list-style: none;
  padding: 0;
}

.sr_mypage_nav li {
  margin-bottom: 10px;
}

.sr_mypage_nav a {
  text-decoration: none;
  color: #333;
  display: block;
  padding: 8px 12px;
  border-radius: 8px;
  transition: 0.2s;
}

.sr_mypage_nav a:hover {
  background: #f8f0e4;
  color: #c89f6d;
  font-weight: 600;
}

/* 오른쪽 콘텐츠 */
.sr_container {
  width: 75%;
  padding: 40px;
}

.sr_container h3 {
  font-size: 22px;
  margin-bottom: 30px;
}

.sr_section-title {
  font-size: 18px;
  margin: 40px 0 15px;
  color: #c89f6d;
  font-weight: 700;
}

/* 게시글 리스트 */
.sr_post-list {
  border-top: 2px solid #c89f6d;
  border-bottom: 1px solid #ddd;
}

.sr_post-item {
  display: flex;
  justify-content: space-between;
  padding: 15px 10px;
  border-bottom: 1px solid #eee;
  align-items: center;
}

.sr_post-item:hover {
  background: #fafafa;
}

.sr_post-left {
  flex: 1;
}

.sr_post-left h5 {
  font-size: 16px;
  margin: 0 0 5px;
}

.sr_post-left p {
  font-size: 14px;
  color: #555;
  margin: 0;
}

.sr_post-right {
  text-align: right;
  font-size: 13px;
  color: #999;
}

/* 퀵메뉴 위치 */
.sr_quick-menu {
  position: fixed;
  right: 30px;
  bottom: 80px;
  z-index: 100;
}

</style>
</head>
<body>

<div class="sr_main">
  <!-- 네비게이션 메뉴 -->
  <div class="sr_mypage_nav">
    <h2>검색된 게시판</h2>
    <ul>
      <li><a href="#sr_board_free">자유게시판</a></li>
      <li><a href="#sr_board_notice">공지사항</a></li>
      <li><a href="#sr_board_photo">사진게시판</a></li>
    </ul>
  </div>

  <!-- 오른쪽 콘텐츠 -->
  <div class="sr_container">
    <h3>검색어 "<strong>여행</strong>"로 검색된 내용입니다.</h3>

    <!-- 자유게시판 -->
    <div class="sr_section-title" id="sr_board_free">자유게시판</div>
    <div class="sr_post-list">
      <div class="sr_post-item">
        <div class="sr_post-left">
          <h5>이번 <strong>여행</strong> 후기 공유해요!</h5>
          <p>오사카로 <strong>여행</strong> 다녀왔는데 정말 즐거웠어요 😊</p>
        </div>
        <div class="sr_post-right">
          <span>홍길동</span> | <span>2025-10-28</span>
        </div>
      </div>
      <div class="sr_post-item">
        <div class="sr_post-left">
          <h5>겨울 <strong>여행</strong>지 추천받아요</h5>
          <p>일본 내에서 겨울에 가기 좋은 <strong>여행</strong>지 있을까요?</p>
        </div>
        <div class="sr_post-right">
          <span>김철수</span> | <span>2025-10-25</span>
        </div>
      </div>
    </div>

    <!-- 공지사항 -->
    <div class="sr_section-title" id="sr_board_notice">공지사항</div>
    <div class="sr_post-list">
      <div class="sr_post-item">
        <div class="sr_post-left">
          <h5>11월 단체 <strong>여행</strong> 행사 안내</h5>
          <p>회원분들을 위한 단체 <strong>여행</strong> 이벤트를 진행합니다!</p>
        </div>
        <div class="sr_post-right">
          <span>관리자</span> | <span>2025-10-20</span>
        </div>
      </div>
    </div>

    <!-- 사진게시판 -->
    <div class="sr_section-title" id="sr_board_photo">사진게시판</div>
    <div class="sr_post-list">
      <div class="sr_post-item">
        <div class="sr_post-left">
          <h5>벚꽃 시즌 <strong>여행</strong> 사진 공유 🌸</h5>
          <p>교토에서 찍은 벚꽃 <strong>여행</strong> 사진이에요!</p>
        </div>
        <div class="sr_post-right">
          <span>이사쿠라</span> | <span>2025-04-10</span>
        </div>
      </div>
    </div>

  </div>
</div>
<%@ include file="../common_footer.jsp" %>
<script>
// 메뉴 클릭 시 해당 섹션으로 스크롤 이동 (헤더 높이 자동 계산)
function sr_scrollToSection(sectionId) {
  const section = document.getElementById(sectionId);
  const header = document.querySelector('header'); // fixed 헤더 선택
  if(section){
    const headerHeight = header ? header.offsetHeight : 0;
    window.scrollTo({
      top: section.offsetTop - headerHeight - 10, // 약간 여유
      behavior: 'smooth'
    });
  }
}

// 메뉴 링크 이벤트 적용
document.querySelectorAll('.sr_mypage_nav a').forEach(link => {
  link.addEventListener('click', function(e){
    e.preventDefault();
    const targetId = this.getAttribute('href').substring(1);
    sr_scrollToSection(targetId);
  });
});
</script>

</body>
</html>
