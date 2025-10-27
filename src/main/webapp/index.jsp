<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ONDO</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/index.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
</head>
<script>
	function goPage(svl, page){
		index.t_gubun.value=page;
		index.method="POST";
		index.action=svl;
		index.submit();
	}
</script>
<body>
<form name="index">
	<input type="hidden" name="t_gubun">
</form>
<header id="mainHeader">
  <div class="logo">ONDO</div>

  <!-- 헤더 검색창 -->
  <div class="header_search">
    <input type="text" placeholder="무엇이 궁금하신가요?">
    <button><svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M784-120 532-372q-30 24-69 38t-83 14q-109 0-184.5-75.5T120-580q0-109 75.5-184.5T380-840q109 0 184.5 75.5T640-580q0 44-14 83t-38 69l252 252-56 56ZM380-400q75 0 127.5-52.5T560-580q0-75-52.5-127.5T380-760q-75 0-127.5 52.5T200-580q0 75 52.5 127.5T380-400Z"/></svg></button>
  </div>

  <div class="h_buttons">
      <button onclick="goPage('Member','')">JOIN</button>
      <button>LANG</button>
  </div>
</header>

<div class="container_box">
	<div class="logo_main">ONDO</div>

	<!-- 메인 검색창 -->
	<div class="search_bar">
		<input type="text" placeholder="무엇이 궁금하신가요?" style="padding-left: 20px;">
		<button><svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M784-120 532-372q-30 24-69 38t-83 14q-109 0-184.5-75.5T120-580q0-109 75.5-184.5T380-840q109 0 184.5 75.5T640-580q0 44-14 83t-38 69l252 252-56 56ZM380-400q75 0 127.5-52.5T560-580q0-75-52.5-127.5T380-760q-75 0-127.5 52.5T200-580q0 75 52.5 127.5T380-400Z"/></svg></button>
	</div>
  
	<div class="keyword_bar">
		<div class="keyword_box">#일본워홀</div>
		<div class="keyword_box">#도쿄맛집</div>
		<div class="keyword_box">#홋카이도여행</div>
		<div class="keyword_box">#11월불꽃놀이</div>
		<div class="keyword_box">#일본친구</div>
	</div>
	<div class="sub_bar">	
		<div class="shortcut" onclick="goPage('Notice','list')">
			<div class="shortcut_icon">
				<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M438-226 296-368l58-58 84 84 168-168 58 58-226 226ZM200-80q-33 0-56.5-23.5T120-160v-560q0-33 23.5-56.5T200-800h40v-80h80v80h320v-80h80v80h40q33 0 56.5 23.5T840-720v560q0 33-23.5 56.5T760-80H200Zm0-80h560v-400H200v400Zm0-480h560v-80H200v80Zm0 0v-80 80Z"/></svg>
			</div>
			<div class="shortcut_label">공지사항</div>
		</div>
	    <div class="shortcut" onclick="goPage('Matching','list')">
	    	<div class="shortcut_icon">
	    		<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M40-160v-160q0-34 23.5-57t56.5-23h131q20 0 38 10t29 27q29 39 71.5 61t90.5 22q49 0 91.5-22t70.5-61q13-17 30.5-27t36.5-10h131q34 0 57 23t23 57v160H640v-91q-35 25-75.5 38T480-200q-43 0-84-13.5T320-252v92H40Zm440-160q-38 0-72-17.5T351-386q-17-25-42.5-39.5T253-440q22-37 93-58.5T480-520q63 0 134 21.5t93 58.5q-29 0-55 14.5T609-386q-22 32-56 49t-73 17ZM160-440q-50 0-85-35t-35-85q0-51 35-85.5t85-34.5q51 0 85.5 34.5T280-560q0 50-34.5 85T160-440Zm640 0q-50 0-85-35t-35-85q0-51 35-85.5t85-34.5q51 0 85.5 34.5T920-560q0 50-34.5 85T800-440ZM480-560q-50 0-85-35t-35-85q0-51 35-85.5t85-34.5q51 0 85.5 34.5T600-680q0 50-34.5 85T480-560Z"/></svg>
	    	</div>
    		<div class="shortcut_label" >매칭시스템</div>
	    </div>
	    <div class="shortcut" onclick="goPage('Community','list')">
	    	<div class="shortcut_icon">
	    		<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M200-120q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h357l-80 80H200v560h560v-278l80-80v358q0 33-23.5 56.5T760-120H200Zm280-360ZM360-360v-170l367-367q12-12 27-18t30-6q16 0 30.5 6t26.5 18l56 57q11 12 17 26.5t6 29.5q0 15-5.5 29.5T897-728L530-360H360Zm481-424-56-56 56 56ZM440-440h56l232-232-28-28-29-28-231 231v57Zm260-260-29-28 29 28 28 28-28-28Z"/></svg>
	    	</div>
    		<div class="shortcut_label">자유커뮤니티</div>
	    </div>
	    <div class="shortcut" onclick="goPage('Member','myInfo')">
	    	<div class="shortcut_icon">
	    		<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M240-400q-33 0-56.5-23.5T160-480q0-33 23.5-56.5T240-560q33 0 56.5 23.5T320-480q0 33-23.5 56.5T240-400Zm240 0q-33 0-56.5-23.5T400-480q0-33 23.5-56.5T480-560q33 0 56.5 23.5T560-480q0 33-23.5 56.5T480-400Zm240 0q-33 0-56.5-23.5T640-480q0-33 23.5-56.5T720-560q33 0 56.5 23.5T800-480q0 33-23.5 56.5T720-400Z"/></svg>
	    	</div>
    		<div class="shortcut_label">마이페이지</div>
	    </div>
	</div>
	
	<!-- 하단부분 -->
	<div class="pv_preview_area">
  <div class="pv_card_container">

    <!-- 인기글 카드형 (최상단 하나) -->
    <div class="pv_card pv_popular">
      <h3 class="pv_card_title">🔥 인기글</h3>
      <div class="pv_post pv_post_large">
        <div class="pv_post_title">도쿄 맛집 TOP5 후기</div>
        <div class="pv_post_info">조회수 256 | 작성자: 혜민</div>
      </div>
      <div class="pv_post pv_post_medium">
        <div class="pv_post_title">홋카이도 여행 인기 게시글</div>
        <div class="pv_post_info">조회수 198 | 작성자: 준호</div>
      </div>
      <div class="pv_post pv_post_small">
        <div class="pv_post_title">일본 워홀 정보 공유</div>
        <div class="pv_post_info">조회수 176 | 작성자: 민수</div>
      </div>
    </div>

    <!-- 자유게시판 테이블 -->
    <div class="pv_card pv_freeboard">
      <h3 class="pv_card_title">자유게시판</h3>
      <table class="pv_table">
        <thead>
          <tr>
            <th>제목</th>
            <th>작성자</th>
            <th>날짜</th>
          </tr>
        </thead>
        <tbody>
          <tr><td><a href="#">도쿄 카페 추천 부탁해요</a></td><td>혜민</td><td>2025-10-22</td></tr>
          <tr><td><a href="#">홋카이도 여행 후기</a></td><td>준호</td><td>2025-10-19</td></tr>
          <tr><td><a href="#">오사카 쇼핑 정보 공유</a></td><td>민수</td><td>2025-10-18</td></tr>
          <tr><td><a href="#">일본 생활 꿀팁</a></td><td>지연</td><td>2025-10-16</td></tr>
          <tr><td><a href="#">워홀 필수 앱 추천</a></td><td>현우</td><td>2025-10-14</td></tr>
          <tr><td><a href="#">일본에서 사진 잘 찍는 곳</a></td><td>하은</td><td>2025-10-12</td></tr>
          <tr><td><a href="#">여행 준비물 체크리스트</a></td><td>수민</td><td>2025-10-10</td></tr>
        </tbody>
      </table>
    </div>

    <!-- 공지사항 테이블 -->
    <div class="pv_card pv_notice">
      <h3 class="pv_card_title">📢 공지사항</h3>
      <table class="pv_table">
        <thead>
          <tr>
            <th>제목</th>
            <th>작성자</th>
            <th>날짜</th>
          </tr>
        </thead>
        <tbody>
          <tr><td><a href="#">서버 점검 안내</a></td><td>관리자</td><td>2025-10-23</td></tr>
          <tr><td><a href="#">10월 이벤트 안내</a></td><td>관리자</td><td>2025-10-20</td></tr>
          <tr><td><a href="#">신규 기능 업데이트</a></td><td>관리자</td><td>2025-10-18</td></tr>
          <tr><td><a href="#">회원 등급 안내</a></td><td>관리자</td><td>2025-10-15</td></tr>
          <tr><td><a href="#">이용약관 변경</a></td><td>관리자</td><td>2025-10-12</td></tr>
          <tr><td><a href="#">프리미엄 서비스 안내</a></td><td>관리자</td><td>2025-10-10</td></tr>
          <tr><td><a href="#">연말 이벤트 계획</a></td><td>관리자</td><td>2025-10-08</td></tr>
        </tbody>
      </table>
    </div>

  </div>
</div>

<style>
.pv_preview_area {
  width: 100%;
  margin-top: 50px;
  padding: 20px;
  display: flex;
  justify-content: center;
}

/* 카드 컨테이너 */
.pv_card_container {
  display: flex;
  flex-wrap: wrap;
  gap: 40px; /* 카드 간격 넓힘 */
  justify-content: center;
  margin-top: 100px; /* 상단 마진 */
}

/* 카드 기본 스타일 */
.pv_card {
  background: #fff;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0,0,0,0.05);
  padding: 16px;
  display: flex;
  flex-direction: column;
  gap: 12px;
  min-width: 320px;
  max-width: 380px;
}

/* 카드 타이틀 */
.pv_card_title {
  font-size: 18px;
  font-weight: 600;
  color: #c89f6d;
  margin-bottom: 8px;
}

/* 인기글 카드 */
.pv_popular .pv_post {
  background: #fef5e6;
  border-radius: 10px;
  padding: 10px;
  transition: none; /* hover 효과 삭제 */
  margin-bottom: 8px;
}

.pv_post_large { height: 120px; }
.pv_post_medium { height: 90px; }
.pv_post_small { height: 60px; }

.pv_post_title {
  font-weight: 500;
  margin-bottom: 4px;
}

.pv_post_info {
  font-size: 12px;
  color: #777;
}

/* 인기글 hover 색상만 변경 */
.pv_post:hover {
  background: #ffe5b4;
}

/* 테이블 게시판 */
.pv_table {
  width: 100%;
  border-collapse: collapse;
}

.pv_table th, .pv_table td {
  border: 1px solid #eee;
  padding: 6px 10px;
  font-size: 14px;
  text-align: left;
}

.pv_table th {
  background: #f7f7f7;
  color: #333;
}

.pv_table td a {
  text-decoration: none;
  color: #333;
}

.pv_table td a:hover {
  text-decoration: underline;
  color: #c89f6d; /* 내용만 hover 색 변경 */
}
</style>
	
	
	
</div>

<script>
window.addEventListener('scroll', () => {
  const header = document.getElementById('mainHeader');
  if (window.scrollY > 100) {
    header.classList.add('scrolled');
  } else {
    header.classList.remove('scrolled');
  }
});
</script>

</body>
</html>
