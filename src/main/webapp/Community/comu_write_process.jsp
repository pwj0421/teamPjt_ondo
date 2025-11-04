<%@ page import="dao.ComuDao, dto.ComuDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

// 로그인 세션에서 작성자 ID 가져오기
String m_id = (String) session.getAttribute("userId");
if (m_id == null || m_id.trim().equals("")) {
    m_id = "anonymous";
}

// 폼에서 넘어온 값 받기
String title = request.getParameter("title");
String content = request.getParameter("content");

// DTO 생성
ComuDto dto = new ComuDto(String m_id, String title, String content);
dto.setM_id(m_id);
dto.setTitle(title);
dto.setContent(content);

// DAO 호출
ComuDao dao = new ComuDao();
int result = dao.insertPost(dto);

// 결과 처리
if (result > 0) {
    out.println("<script>alert('글이 성공적으로 등록되었습니다.'); location.href='free_list.jsp';</script>");
} else {
    out.println("<script>alert('글 등록에 실패했습니다.'); history.back();</script>");
}
%>
