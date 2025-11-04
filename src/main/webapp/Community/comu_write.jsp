<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>	
<%@ include file="../menu/quickMenu.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>자유게시판 글쓰기</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/sub.css">
  <script type="text/javascript">
  	function goSave(){
  		comu.t_gubun.value="insert";
  		comu.method = "post";
  		comu.action = "Community";
		comu.submit();
  	}
  </script>

</head>
</head>
<body>

<div class="write_container">
  <div class="write_header">자유게시판 글쓰기</div>

  <!-- 글쓰기 폼 -->
  <form name="comu" class="write_form" action="<%= request.getContextPath() %>/CommunityWrite" method="post" enctype="multipart/form-data">
	<input type="hidden" name="t_gubun">
    <label for="title">제목</label>
    <input type="text" name="title" id="title" required>

    <label for="content">내용</label>
    <textarea name="content" id="content" required></textarea>

    
    <!-- 파일 첨부 영역 -->
<div class="file_upload_group">
  <label for="file">파일 첨부</label>
  <input type="file" name="file" id="file">
</div>

    

    <div class="write_btn_group">
      <button type="submit" class="submit_btn" onclick="goSave()">등록</button>
      <button type="button" class="cancel_btn" onclick="history.back()">취소</button>
    </div>
  </form>
</div>

</body>
</html>
