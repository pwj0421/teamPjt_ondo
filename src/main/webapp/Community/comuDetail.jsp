<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.ComuPostDao, dto.ComuPostDto" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<link rel="stylesheet" href="CSS/sub.css">
</head>
<body>

<%
    String postIdParam = request.getParameter("post_id");
    if (postIdParam == null || postIdParam.isEmpty()) {
%>
    <p>잘못된 접근입니다.</p>
<%
    } else {
        int postId = Integer.parseInt(postIdParam);
        ComuPostDao dao = new ComuPostDao();
        ComuPostDto post = dao.getPostById(postId);

        if (post == null) {
%>
    <p>해당 게시글을 찾을 수 없습니다.</p>
<%
        } else {
%>

    <h2><%= post.getTitle() %></h2>
    <p>작성자: <%= post.getM_name() %></p>
    <p>작성일: <%= post.getCreate_at() %></p>
    <p>조회수: <%= post.getHit() %></p>
    <hr>
    <div><pre><%= post.getContent() %></pre></div>
    <hr>
    <button onclick="location.href='comuList.jsp'">목록</button>

<%
        }
    }
%>

</body>
</html>
