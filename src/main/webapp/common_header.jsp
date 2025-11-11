<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/sub.css">
<script src="<%= request.getContextPath() %>/js/jquery-1.8.1.min.js"></script>
<script src="<%= request.getContextPath() %>/js/common.js"></script>
<link rel="stylesheet" href="CSS/sub.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

<!-- JSTL 헤더 임포트 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
	function goPage(svl, page){
		comHeader.t_gubun.value=page;
		comHeader.method="POST";
		comHeader.action=svl;
		comHeader.submit();
	}
	function confirmLogout() {		
		if (confirm("로그아웃 하시겠습니까?")) {			
			goPage('Member', 'logout');		
			}	
		}
	
	function goSearchHeader(svl, page){
		var searchTxt = mainSearch.indexHeaderSearch.value
		if(searchTxt == ""){
			alert("검색어를 입력해주세요.");
			return;
		}
		mainSearch.t_gubun.value=page;
		mainSearch.method="POST";
		mainSearch.action=svl;
		mainSearch.submit();
	}
	

</script>

<!-- 일반 페이지 이동용 폼 박스 -->
<form name="comHeader"> 
	<input type="hidden" name="t_gubun">
</form>

<!-- 메인헤더 -->
<header id="mainHeader">
 <div class="logo">
  <a class="no-style" href="#" onclick="goPage('Index',''); return false;">ONDO</a>
</div>

<!-- 검색기능 버튼 + 검색어 입력 후 엔터만으로 페이지 전환 가능하게 구현-->
<form name="mainSearch">
	<input type="hidden" name="t_gubun">
  	<div class="header_search">
    	<input type="text" name="indexHeaderSearch"  value="${headerSearchTxt }" placeholder="무엇이 궁금하신가요?"  onkeypress="if(event.key === 'Enter'){event.preventDefault(); goSearchHeader('Search','list');}">
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
        <button onclick="confirmLogout()">LOGOUT</button>
    </c:if>
    <button>LANG</button>
  </div>
</header>
