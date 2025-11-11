<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common_header.jsp" %>	
<%@ include file="../menu/quickMenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<style>
.notice_related ul {
  list-style: none;
  padding-left: 0;
  margin-top: 10px;
}

.notice_related li {
  margin-bottom: 6px;
}

.notice_related a {
  display: inline-block;
  color: #333;
  text-decoration: none;
  padding: 4px 6px;
  border-radius: 5px;
  transition: all 0.2s ease;
}

.notice_related a:hover {
  background-color: #f2f2f2;
  color: #007bff;
}

.notice_related li a,
.notice_related li .current_notice {
  display: inline-block;  /* 또는 block */
  margin: 0;              /* 불필요한 여백 제거 */
  padding: 0;             /* 필요 없으면 패딩 제거 */
}


/* 현재 보고 있는 글 스타일 (글씨만 강조) */
.current_notice {
  font-weight: 500;       /* 조금 더 얇게 */
  color: #8B4513;         /* 갈색 느낌 (#8B4513은 브라운 계열) */
  cursor: default;
  pointer-events: none;   /* 클릭 비활성화 유지 */
  background-color: transparent; /* 배경색 제거 */
}


</style>

<script type="text/javascript">
function goUpdateForm(){
	work.t_gubun.value="updateForm";	
	work.method="post";
	work.action="Notice";
	work.submit();
}
function goDelete(){
	if(confirm("삭제하시겠습니까?")){
		work.t_gubun.value="delete";
		work.method="post";
		work.action="Notice";
		work.submit();
	}
}
</script>
</head>
<body>
<form name="work">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="n_no" value="${t_dto.getNo()}">
	<input type="hidden" name="n_del_attach_1" value="${t_dto.getAttach_1()}">
	<input type="hidden" name="n_del_attach_2" value="${t_dto.getAttach_2()}">
	<input type="hidden" name="n_del_attach_3" value="${t_dto.getAttach_3()}">
</form>
<div class="notice_view">
  <c:if test="${t_dto.getType() eq 'notice'}">
  	<div class="notice_badge notice" style="margin-left:0px; margin-bottom:7px;">공지</div>
  </c:if>
  <c:if test="${t_dto.getType() eq 'update'}">
  	<div class="notice_badge update" style="margin-left:0px; margin-bottom:7px;">업데이트</div>
  </c:if>
  <c:if test="${t_dto.getType() eq 'info'}">
  	<div class="notice_badge info" style="margin-left:0px; margin-bottom:7px;">안내</div>
  </c:if>
  
  <h2 class="notice_view_title">${t_dto.getTitle()}</h2>

  <div class="notice_view_meta">
    <div class="notice_author_meta">
      <img src="attach/member_profile/${t_dto.getProfileImg()}" alt="관리자 프로필">
      <span>${t_dto.getReg_name()} ·</span>
      <span>${t_dto.getReg_date()} ·</span>
      <span>${t_dto.getHit()}</span>
    </div>
    <div class="notice_meta_right">
  <div class="notice_view_attach">
    <c:if test="${not empty t_dto.getAttach_1()}">
      <span class="attach_button" onclick="toggleAttach()">📎 첨부파일 보기</span>
      <ul class="attach_list" id="attachList">
        <c:if test="${not empty t_dto.getAttach_1()}">
          <li><a href="attach/notice/${t_dto.getAttach_1()}" download>${t_dto.getAttach_1()}</a></li>
        </c:if>
        <c:if test="${not empty t_dto.getAttach_2()}">
          <li><a href="attach/notice/${t_dto.getAttach_2()}" download>${t_dto.getAttach_2()}</a></li>
        </c:if>
        <c:if test="${not empty t_dto.getAttach_3()}">
          <li><a href="attach/notice/${t_dto.getAttach_3()}" download>${t_dto.getAttach_3()}</a></li>
        </c:if>
      </ul>
    </c:if>
  </div>
</div>

  </div>

  <div class="notice_view_content">${t_dto.getContent()}</div>

  <div class="notice_divider"></div>

  <div class="notice_related">
    <h4>최근 공지사항</h4>   
    <ul>
        <c:forEach items="${t_recentList}" var="rDto">
		  <li>
		    <c:choose>
		      <c:when test="${rDto.getNo() eq t_dto.getNo()}">
		        <span class="current_notice"> ${rDto.getTitle()}</span>
		      </c:when>
		      <c:otherwise>
		        <a href="Notice?t_gubun=view&n_no=${rDto.getNo()}">${rDto.getTitle()}</a>
		      </c:otherwise>
		    </c:choose>
		  </li>
		</c:forEach>
      
    </ul>
  </div>

  <div class="notice_view_buttons">
    <button onclick="goUpdateForm()">수정</button>
    <button onclick="goDelete()">삭제</button>
    <a href="Notice">목록으로 돌아가기</a>
  </div>
</div>
<%@ include file="../common_footer.jsp" %>
<script>
function toggleAttach() {
  const list = document.getElementById('attachList');
  list.style.display = list.style.display === 'block' ? 'none' : 'block';
}


</script>
</body>
</html>
