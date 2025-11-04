<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	


	function goalert(){
		alert("개발중입니다");

	}
	function goSearchHeader(svl, page){
		mainSearch.t_gubun.value=page;
		mainSearch.method="POST";
		mainSearch.action=svl;
		mainSearch.submit();
	}
	
	function goSearchIndex(svl, page){
		indexMainSearch.t_gubun.value=page;
		indexMainSearch.method="POST";
		indexMainSearch.action=svl;
		indexMainSearch.submit();

	}
</script>
<body>
<form name="index">
	<input type="hidden" name="t_gubun">
</form>
<header id="mainHeader">
 <div class="logo">
  <a class="no-style" onclick="goPage('Index',''); return false;">ONDO</a>
</div>

<!-- 검색기능 버튼 + 검색어 입력 후 엔터만으로 페이지 전환 가능하게 구현-->
<form name="mainSearch">
	<input type="hidden" name="t_gubun">
  	<div class="header_search">
    	<input type="text" name="s_keyword"  value="" placeholder="무엇이 궁금하신가요?"  onkeypress="if(event.key === 'Enter'){event.preventDefault(); goSearchHeader('Search','list');}">
	    <button type ="button" onclick="goSearchHeader('Search','list')">    
	    	<!-- 돋보기 아이콘이에요 수정 ㄴㄴ  -->
				      <svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 -960 960 960" width="24px" fill="#1f1f1f">
				        <path d="M784-120 532-372q-30 24-69 38t-83 14
				                 q-109 0-184.5-75.5T120-580q0-109 
				                 75.5-184.5T380-840q109 0 
				                 184.5 75.5T640-580q0 44-14 83t-38 69
				                 l252 252-56 56ZM380-400q75 0 
				                 127.5-52.5T560-580q0-75-52.5-127.5T380-760
				                 q-75 0-127.5 52.5T200-580q0 75 
				                 52.5 127.5T380-400Z"/>
				      </svg>
	    </button>
	</div>
</form>
  <div class="h_buttons">
  	  <!-- 로그인 전 -->
  	<c:if test="${empty sessionId}">
        <button onclick="goPage('Member', 'login')">LOGIN</button>
        <button onclick="goPage('Member','join')">JOIN</button>
    </c:if>
    <!-- 로그인 후 -->
    <c:if test="${not empty sessionId}">
         <span class="sessionName">${sessionName}님</span>
        <button onclick="goPage('Member','myInfo')">MYINFO</button>
        <button onclick="goPage('Member','logout')">LOGOUT</button>
    </c:if>
      <button>LANG</button>
  </div>
</header>

<div class="container_box">
	<div class="logo_main" >ONDO</div>
	
	<!-- 메인 검색창 -->
	<form name="indexMainSearch">
		<input type="hidden" name="t_gubun">
		<div class="search_bar">
			<input type="text" placeholder="무엇이 궁금하신가요?" 
				onkeypress="if(event.key === 'Enter'){event.preventDefault(); goSearchHeader('Search','list');}" style="padding-left: 20px;">
			
			<button type="button" onclick="goSearchHeader('Search','list')">
				<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M784-120 532-372q-30 24-69 38t-83 14q-109 0-184.5-75.5T120-580q0-109 75.5-184.5T380-840q109 0 184.5 75.5T640-580q0 44-14 83t-38 69l252 252-56 56ZM380-400q75 0 127.5-52.5T560-580q0-75-52.5-127.5T380-760q-75 0-127.5 52.5T200-580q0 75 52.5 127.5T380-400Z"/></svg>
			</button>
		</div>
  	</form>
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
	    <div class="shortcut" onclick="goPage('Match','main')">
	    	<div class="shortcut_icon">
	    		<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M40-160v-160q0-34 23.5-57t56.5-23h131q20 0 38 10t29 27q29 39 71.5 61t90.5 22q49 0 91.5-22t70.5-61q13-17 30.5-27t36.5-10h131q34 0 57 23t23 57v160H640v-91q-35 25-75.5 38T480-200q-43 0-84-13.5T320-252v92H40Zm440-160q-38 0-72-17.5T351-386q-17-25-42.5-39.5T253-440q22-37 93-58.5T480-520q63 0 134 21.5t93 58.5q-29 0-55 14.5T609-386q-22 32-56 49t-73 17ZM160-440q-50 0-85-35t-35-85q0-51 35-85.5t85-34.5q51 0 85.5 34.5T280-560q0 50-34.5 85T160-440Zm640 0q-50 0-85-35t-35-85q0-51 35-85.5t85-34.5q51 0 85.5 34.5T920-560q0 50-34.5 85T800-440ZM480-560q-50 0-85-35t-35-85q0-51 35-85.5t85-34.5q51 0 85.5 34.5T600-680q0 50-34.5 85T480-560Z"/></svg>
	    	</div>
    		<div class="shortcut_label" >매칭시스템</div>
	    </div>
	    <div class="shortcut"  onclick="goalert()"> <!-- onclick="goPage('Community','list')" -->
	    	<div class="shortcut_icon">
	    		<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M200-120q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h357l-80 80H200v560h560v-278l80-80v358q0 33-23.5 56.5T760-120H200Zm280-360ZM360-360v-170l367-367q12-12 27-18t30-6q16 0 30.5 6t26.5 18l56 57q11 12 17 26.5t6 29.5q0 15-5.5 29.5T897-728L530-360H360Zm481-424-56-56 56 56ZM440-440h56l232-232-28-28-29-28-231 231v57Zm260-260-29-28 29 28 28 28-28-28Z"/></svg>
	    	</div>
    		<div class="shortcut_label">자유커뮤니티</div>
	    </div>
	    <div class="shortcut" onclick="goPage('Member','myInfo')">
	    	<div class="shortcut_icon">
				<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#000000"><path d="m370-80-16-128q-13-5-24.5-12T307-235l-119 50L78-375l103-78q-1-7-1-13.5v-27q0-6.5 1-13.5L78-585l110-190 119 50q11-8 23-15t24-12l16-128h220l16 128q13 5 24.5 12t22.5 15l119-50 110 190-103 78q1 7 1 13.5v27q0 6.5-2 13.5l103 78-110 190-118-50q-11 8-23 15t-24 12L590-80H370Zm70-80h79l14-106q31-8 57.5-23.5T639-327l99 41 39-68-86-65q5-14 7-29.5t2-31.5q0-16-2-31.5t-7-29.5l86-65-39-68-99 42q-22-23-48.5-38.5T533-694l-13-106h-79l-14 106q-31 8-57.5 23.5T321-633l-99-41-39 68 86 64q-5 15-7 30t-2 32q0 16 2 31t7 30l-86 65 39 68 99-42q22 23 48.5 38.5T427-266l13 106Zm42-180q58 0 99-41t41-99q0-58-41-99t-99-41q-59 0-99.5 41T342-480q0 58 40.5 99t99.5 41Zm-2-140Z"/></svg>	    
	    	</div>
    		<div class="shortcut_label">마이페이지</div>
	    </div>
	</div>
	
	<!-- 하단부분 -->
	<div class="pv_preview_area">
  <div class="pv_card_container">

    <!-- 🔥 인기글 -->
    <div class="pv_card pv_popular">
    
      <h3 class="pv_card_title">🔥 인기글</h3>
      <div class="pv_popular_list">
        <div class="pv_post_card">
          <div class="pv_post_title">도쿄 맛집 TOP5 후기</div>
           <div class="pv_board_label">[자유게시판]</div>
          <div class="pv_post_content">도쿄의 숨은 맛집을 직접 돌아다니며 정리해봤어요! 라멘, 초밥, 디저트까지…</div>
          <div class="pv_post_info">조회수 256 | 댓글 12 | 작성자: 혜민</div>
        </div>
        <div class="pv_post_card">
          <div class="pv_post_title">홋카이도 여행 인기 게시글</div>
           <div class="pv_board_label">[자유게시판]</div>
          <div class="pv_post_content">눈 내리는 삿포로의 겨울 분위기 속에서 즐기는 온천 여행, 진짜 최고였어요...</div>
          <div class="pv_post_info">조회수 198 | 댓글 7 | 작성자: 준호</div>
        </div>
        <div class="pv_post_card">
          <div class="pv_post_title">일본 워홀 정보 공유</div>
           <div class="pv_board_label">[자유게시판]</div>
          <div class="pv_post_content">처음 일본에 와서 겪은 다양한 워킹홀리데이 경험을 나눠요. 일자리, 집 구하기...</div>
          <div class="pv_post_info">조회수 176 | 댓글 9 | 작성자: 민수</div>
        </div>
      </div>
    </div>

    <!-- 📋 자유게시판 / 📢 공지사항 / 👤 내정보 -->
    <div class="pv_bottom_row">

      <!-- 자유게시판 -->
      <div class="pv_card pv_freeboard">
        <h3 class="pv_card_title">자유게시판</h3>
        <ul class="pv_list">
          <li><a href="#">도쿄 카페 추천 부탁해요</a><span>혜민</span><span>2025-10-22</span></li>
          <li><a href="#">홋카이도 여행 후기</a><span>준호</span><span>2025-10-19</span></li>
          <li><a href="#">오사카 쇼핑 정보 공유</a><span>민수</span><span>2025-10-18</span></li>
          <li><a href="#">일본 생활 꿀팁</a><span>지연</span><span>2025-10-16</span></li>
          <li><a href="#">워홀 필수 앱 추천</a><span>현우</span><span>2025-10-14</span></li>
        </ul>
      </div>

      <!-- 공지사항 -->
      <div class="pv_card pv_notice">
        <h3 class="pv_card_title">📢 공지사항</h3>
        <ul class="pv_list">
          <li><a href="#">서버 점검 안내</a><span>관리자</span><span>2025-10-23</span></li>
          <li><a href="#">10월 이벤트 안내</a><span>관리자</span><span>2025-10-20</span></li>
          <li><a href="#">신규 기능 업데이트</a><span>관리자</span><span>2025-10-18</span></li>
          <li><a href="#">회원 등급 안내</a><span>관리자</span><span>2025-10-15</span></li>
          <li><a href="#">이용약관 변경</a><span>관리자</span><span>2025-10-12</span></li>
        </ul>
      </div>

      <!-- 👤 내정보 -->
      <div class="pv_card my_profile_card">
        <h3 class="pv_card_title">👤 내 정보</h3>
        <div class="profile_box">
          <img src="image/basic_profile.png" alt="프로필 이미지" class="profile_img">
          <div class="profile_text">
            <p class="nickname">혜민</p>
            <p class="intro">“오늘도 일본어 공부 중 🇯🇵”</p>
          </div>
        </div>

        <%-- 로그인 세션 체크 (예시: userName) --%>
        
        <c:if test="${empty sessionId}">
	        <div class="profile_overlay">
	            <div class="overlay_content">
	              <p>로그인 후에 보이는 화면입니다</p>
	              <a href="javascript:goPage('Member','login')" class="login_btn" >로그인하러 가기</a>
	            </div>
	         </div>
    	</c:if>
   
      </div>

    </div>
  </div>
</div>
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

<div class="site_footer">
    <div class="footer_container">
        <p>&copy; 2025 TEAM ONDO</p>
        <div class="footer_links">
            <a href="/about.jsp">About</a>
            <a href="/terms.jsp">Terms of Service</a>
            <a href="/privacy.jsp">Privacy Policy</a>
            <a href="/contact.jsp">Contact</a>
        </div>
    </div>
</div>

</body>
</html>
