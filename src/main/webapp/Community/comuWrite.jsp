<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.ComuWriteDto, dao.ComuWriteDao, java.nio.file.Paths, javax.servlet.http.Part, java.io.File" %>
<%@ include file="../common_header.jsp" %>
<%@ include file="/menu/quickMenu.jsp" %>

<%
request.setCharacterEncoding("UTF-8");

String m_id = request.getParameter("m_id"); // 로그인된 사용자 ID가 파라미터로 전달된다고 가정
String m_name = "";
String message = "";

if (m_id != null && !m_id.isEmpty()) {
    ComuWriteDao dao = null;
    try {
        dao = new ComuWriteDao();
        m_name = dao.getMemberName(m_id); // ✅ DB에서 이름 가져오기
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (dao != null) try { dao.close(); } catch (Exception e) {}
    }
}

if ("POST".equalsIgnoreCase(request.getMethod())) {
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    // --- 파일 업로드 처리 ---
    try {
        Part filePart = request.getPart("file");
        if (filePart != null) {
            String submitted = filePart.getSubmittedFileName();
            if (submitted != null && !submitted.isEmpty()) {
                String uploadDir = "C:/upload/";
                File dir = new File(uploadDir);
                if (!dir.exists()) dir.mkdirs();
                String fileName = Paths.get(submitted).getFileName().toString();
                filePart.write(uploadDir + fileName);
            }
        }
    } catch (Exception fe) {
        fe.printStackTrace();
    }

    // --- DB에 글 저장 ---
    ComuWriteDto dto = new ComuWriteDto(m_id, title, content);
    ComuWriteDao dao = null;
    try {
        dao = new ComuWriteDao();
        boolean success = dao.insertPost(dto);

        if (success) {
            message = "작성자: " + m_name + " 님<br>글 작성 완료!";
        } else {
            message = "글 작성 실패!";
        }
    } catch (Exception e) {
        e.printStackTrace();
        message = "DB 오류 발생!";
    } finally {
        if (dao != null) try { dao.close(); } catch (Exception e) { e.printStackTrace(); }
    }
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>자유게시판 글쓰기</title>
<link rel="stylesheet" href="../CSS/sub.css">
</head>
<body>

<div class="write_container">
    <div class="write_header">글쓰기</div>

    <% if (message != null && !message.isEmpty()) { %>
    <div class="message_box" style="display:block; margin-bottom:15px; color:#c89f6d;">
        <%= message %>
    </div>
    <% } %>

    <form class="write_form" method="post" enctype="multipart/form-data">
        <!-- 작성자 정보 (사용자가 수정할 수 없음) -->
        <div class="writer_info">
            <label>작성자</label>
            <span style="display:inline-block; font-weight:bold; color:#444;">
                <%= m_name != null && !m_name.isEmpty() ? m_name : "알 수 없음" %>
            </span>
            <input type="hidden" name="m_id" value="<%= m_id %>">
        </div>

        <label for="title">제목</label>
        <input type="text" name="title" id="title" required>

        <label for="content">내용</label>
        <textarea name="content" id="content" required></textarea>

        <label for="file">첨부파일</label>
        <input type="file" name="file" id="file">

        <div class="write_btn_group">
            <input type="submit" value="작성" class="submit_btn">
            <button type="button" class="cancel_btn" onclick="history.back()">취소</button>
        </div>
    </form>
</div>

</body>
</html>
