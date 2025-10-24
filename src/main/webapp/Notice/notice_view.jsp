<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common_header.jsp" %>	
<%@ include file="../menu/quickMenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="notice_view">
  <h2 class="notice_view_title">[안내] 사이트 이용약관 개정 공지</h2>
<div class="notice_view_meta">
  <div class="notice_author_meta">
    <img src="../image/basic_profile.png" alt="관리자 프로필">
    <span>관리자</span>
    <span>2025-10-10</span>
    <span>조회수 123</span>
  </div>
  <div class="notice_meta_right">
    <div class="notice_view_attach">
      <span class="attach_button" onclick="toggleAttach()">📎 첨부파일 보기</span>
      <ul class="attach_list" id="attachList">
        <li><a href="#">파일1.pdf</a></li>
        <li><a href="#">파일2.docx</a></li>
      </ul>
    </div>
  </div>
</div>

  <div class="notice_view_content">
    안녕하세요.  
    사이트 이용약관이 일부 개정되어 안내드립니다.

    1. 회원가입 관련 조항 변경  
    2. 개인정보 처리 방침 업데이트  
    3. 기타 서비스 이용 안내

    자세한 내용은 첨부파일을 확인해주세요.
  </div>

  <div class="notice_divider"></div>

  <div class="notice_related">
    <h4>공지사항</h4>   
    <ul>
      <li><a href="#">[공지] 친구 매칭 기능 업데이트 안내</a></li>
      <li><a href="#">[FAQ] 회원가입 관련 자주 묻는 질문</a></li>
      <li><a href="#">[공지] 사이트 점검 안내</a></li>
    </ul>
  </div>

  <div class="notice_view_buttons">
    <button>수정</button>
    <button>삭제</button>
    <a href="notice_list.jsp">목록으로 돌아가기</a>
  </div>
</div>

<script>
function toggleAttach() {
  const list = document.getElementById('attachList');
  list.style.display = list.style.display === 'block' ? 'none' : 'block';
}
</script>
</body>
</html>