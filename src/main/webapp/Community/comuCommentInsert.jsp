<%@ page import="dao.ComuCommentDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	int post_id = Integer.parseInt(request.getParameter("post_id"));
	String comment_content = request.getParameter("comment_content");

	// 로그인한 사용자 정보 (세션에서 가져옴)
	String m_id = (String) session.getAttribute("sessionId");
	if (m_id == null) {
		out.println("<script>alert('로그인 후 이용해주세요.'); history.back();</script>");
		return;
	}

	ComuCommentDao dao = new ComuCommentDao();
	int result = dao.insertComment(post_id, m_id, comment_content);

	if (result > 0) {
		response.sendRedirect("comuPostView.jsp?post_id=" + post_id);
	} else {
		out.println("<script>alert('댓글 등록 실패!'); history.back();</script>");
	}
%>
