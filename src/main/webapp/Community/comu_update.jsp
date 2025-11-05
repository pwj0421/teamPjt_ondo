<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.ComuPostDto" %>
<%@ include file="../common_header.jsp" %>	
<%@ include file="../menu/quickMenu.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>자유게시판 글수정</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/sub.css">
  <script type="text/javascript">
  	function goUpdate(){
  		comu.t_gubun.value = "updateProc";
  		comu.method = "post";
  		comu.action = "Community";
  		comu.submit();
  	}
  </script>
</head>
<body>

<%
    // 서블릿에서 전달된 post 객체 받기
    ComuPostDto post = (ComuPostDto) request.getAttribute("post");
    if (post == null) {
%>
    <script>
        alert("잘못된 접근입니다.");
        location.href = "<%= request.getContextPath() %>/Community?t_gubun=list";
    </script>
<%
        return;
    }
%>

<div class="write_container">
  <div class="write_header">자유게시판 글수정</div>

  <!-- 수정 폼 -->
  <form name="comu" class="write_form" method="post" enctype="multipart/form-data">
    <input type="hidden" name="t_gubun" value="">
    <input type="hidden" name="post_id" value="<%= post.getPost_id() %>">

    <label for="title">제목</label>
    <input type="text" name="title" id="title" value="<%= post.getTitle() %>" required>

    <label for="content">내용</label>
    <textarea name="content" id="content" required><%= post.getContent() %></textarea>

    <!-- 파일 첨부 영역 -->
 

    <div class="write_btn_group">
      <button type="button" class="submit_btn" onclick="goUpdate()">수정 완료</button>
      <button type="button" class="cancel_btn" onclick="history.back()">취소</button>
    </div>
  </form>
</div>

</body>
</html>
