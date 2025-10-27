<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, dao.ComuPostDao, dto.ComuPostDto" %>
<%@ include file="../common_header.jsp" %>
<%@ include file="../quickMenu.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>커뮤니티 게시판</title>
<link rel="stylesheet" href="CSS/sub.css">
</head>

<body>
<div class="free_container">

  <div class="board_header">
    <h2 class="board_title">커뮤니티 게시판</h2>
    <button class="write_btn" onclick="location.href='comuWrite.jsp'">글쓰기</button>
  </div>

  <!-- ✅ 게시글 리스트 -->
  <table class="free_table">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
<%
    ComuPostDao dao = new ComuPostDao();
    List<ComuPostDto> list = dao.getPostList();

    if (list == null || list.isEmpty()) {
%>
      <tr><td colspan="5">등록된 게시글이 없습니다.</td></tr>
<%
    } else {
        for (ComuPostDto dto : list) {
%>
      <tr>
        <td><%= dto.getPost_id() %></td>
        <td style="text-align:left;">
          <a href="comuDetail.jsp?post_id=<%= dto.getPost_id() %>">
            <%= dto.getTitle() %>
          </a>
        </td>
        <td><%= dto.getM_name() %></td>
        <td><%= dto.getCreate_at() %></td>
        <td><%= dto.getHit() %></td>
      </tr>
<%
        }
    }
%>
    </tbody>
  </table>

  <!-- 페이지네이션 (샘플) -->
  <div class="pagination">
    <a href="#" class="active">1</a>
    <a href="#">2</a>
    <a href="#">3</a>
  </div>

</div>
</body>
</html>
