<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>	
<%@ include file="../menu/quickMenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script type="text/javascript">

	function goView(no) {
		noti.t_gubun.value = "view";
		noti.n_no.value = no;
		noti.method="post";
		noti.action="Notice";
		noti.submit();
	}
	
	function goWriteForm(){
		noti.t_gubun.value="writeForm";
		noti.method="post";
		noti.action="Notice";
		noti.submit();
	}

</script>

<form name="noti">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="n_no">
</form>
</head>
<body>
<div class="notice_board">
  <div class="notice_header">
    <h2 class="notice_title">공지사항</h2>
    <div class="notice_actions">
      <input type="text" class="notice_search" placeholder="검색어를 입력하세요">
      <button class="notice_write_btn">검색</button>
    </div>
  </div>
  
  <div class="notice_list">
  <c:forEach items="${dtos}" var="dto">
    <div class="notice_item" onclick="goView('${dto.getNo()}')">
      <c:if test="${dto.getType() eq 'notice'}">
      	<div class="notice_badge notice">공지</div>
      </c:if>
      <c:if test="${dto.getType() eq 'update'}">
      	<div class="notice_badge update">업데이트</div>
      </c:if>
      <c:if test="${dto.getType() eq 'info'}">
      	<div class="notice_badge info">안내</div>
      </c:if>
      <div class="notice_content">
        <h3 class="notice_item_title" >${dto.getTitle()}</h3>
        <p class="notice_item_sub">${dto.getReg_name()} · ${dto.getReg_date()} · 조회수 ${dto.getHit()}</p>
      </div>
      <c:if test="${not empty dto.getAttach_1()}">
       	<span class="notice_attach">📎</span> <!-- 첨부파일 있음 -->
       </c:if>
    </div>
   </c:forEach>
   
<!--  
    <div class="notice_item">
      <div class="notice_badge update">업데이트</div>
      <div class="notice_content">
        <h3 class="notice_item_title">[공지] 친구 매칭 기능 업데이트 안내</h3>
        <p class="notice_item_sub">관리자 · 2025-09-22 · 조회수 214</p>
      </div>
       <span class="notice_attach">📎</span> 
    </div>
    -->
  </div>


  <div class="notice_pagination">
    <button>&lt;</button>
    <button class="active">1</button>
    <button>2</button>
    <button>3</button>
    <button>&gt;</button>
    
  </div>
  <button type="button" class="notice_write_btn" onclick="goWriteForm()">글쓰기</button>
</div>


</body>
</html>