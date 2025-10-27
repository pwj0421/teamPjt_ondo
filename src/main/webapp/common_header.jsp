<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/sub.css">
<script src="<%= request.getContextPath() %>/js/jquery-1.8.1.min.js"></script>
<script src="<%= request.getContextPath() %>/js/common.js"></script>
<link rel="stylesheet" href="../CSS/sub.css" />
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
</script>
<form name="comHeader">
	<input type="hidden" name="t_gubun">
</form>

<header id="mainHeader">
  <div class="logo"><a class="no-style" onclick="goPage('Index','')">ONDO</a></div>

  <div class="header_search">
    <input type="text" placeholder="무엇이 궁금하신가요?">
    <button>
      <svg xmlns="http://www.w3.org/2000/svg" height="24px"
           viewBox="0 -960 960 960" width="24px" fill="#1f1f1f">
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

  <div class="h_buttons">
  <!-- 로그인 전 -->
  	<c:if test="${empty sessionId}">
        <button onclick="goPage('Member', 'login')">LOGIN</button>
        <button onclick="goPage('Member','join')">JOIN</button>
    </c:if>
    <!-- 로그인 후 -->
    <c:if test="${not empty sessionId}">
        <li><a>${sessionName}님</a></li>
        <button onclick="goPage('Member','myInfo')">MYINFO</button>
        <button onclick="goPage('Member','logout')">LOGOUT</button>
    </c:if>
    <button>LANG</button>
  </div>
</header>
