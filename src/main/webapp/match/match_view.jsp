<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 상세보기</title>
<style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
        background-color: #fdfbf8;
        margin: 0;
        padding: 40px;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .profile-card {
        width: 450px;
        background-color: #fff;
        border-radius: 20px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        padding: 40px;
        text-align: center;
        animation: fadeIn 0.4s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .profile-card img {
        width: 130px;
        height: 130px;
        border-radius: 50%;
        object-fit: cover;
        border: 4px solid #e8d8c3;
        margin-bottom: 20px;
    }

    .nickname {
        font-size: 1.8em;
        font-weight: bold;
        color: #3a2e25;
        margin-bottom: 10px;
    }

    .info-line {
        font-size: 0.95em;
        color: #6a5f58;
        margin-bottom: 20px;
    }

    .one-line-intro {
        font-size: 1em;
        color: #7a6f67;
        margin-bottom: 20px;
        font-style: italic;
    }

    .introduction {
	    display: flex;
	    align-items: center; /* 세로 중앙 정렬 */
	    justify-content: flex-start;
	    background-color: #faf6f1;
	    border-radius: 10px;
	    padding: 20px;
	    color: #4b3f38;
	    margin-bottom: 25px;
	    min-height: 120px;
	}
	
	.introduction p {
	    margin: 0; /* 기본 여백 제거 */
	    line-height: 1.6;
	    font-size: 0.95em;
	    white-space: pre-line;
	}


    .tags {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 8px;
    }

    .tag {
        background-color: #f1e2d0;
        color: #4a3d33;
        font-size: 0.85em;
        padding: 6px 12px;
        border-radius: 20px;
        cursor: default;
        transition: transform 0.2s ease;
    }

    .tag:hover {
        transform: scale(1.05);
    }

    .close-btn {
        margin-top: 30px;
        background-color: #d7b894;
        color: white;
        border: none;
        padding: 10px 25px;
        border-radius: 25px;
        cursor: pointer;
        transition: background-color 0.2s;
    }

    .close-btn:hover {
        background-color: #c7a67f;
    }
</style>
</head>
<body>
    <div class="profile-card">
        <img src="<c:out value='attach/member_profile/${matchViewDto.getImage()}' default='attach/member_profile/basic_profile.png 	'/>" alt="프로필 이미지">
        
        <div class="nickname">
            <c:out value="${matchViewDto.getNickname()}" default="닉네임 없음"/>
        </div>

        <div class="info-line">
            <span>성별: <c:out value="${matchViewDto.getGender()}" default="정보 없음"/></span>
            &nbsp;|&nbsp;
            <span>국적: <c:out value="${matchViewDto.getCountry()}" default="정보 없음"/></span>
        </div>

        <div class="one-line-intro">
            "<c:out value='${matchViewDto.getTagline()}' default='한 줄 소개가 없습니다.'/>"
        </div>

        <div class="introduction">
            <p><c:out value="${matchViewDto.getIntroduction()}" default="자기소개가 없습니다."/></p>
        </div>

        <div class="tags">
            <c:forEach var="tag" items="${matchViewDto.getInterestDto()}">
                <div class="tag">${tag.getItem_name()}</div>
            </c:forEach>
        </div>

        <button class="close-btn" onclick="window.close()">닫기</button>
    </div>
</body>
</html>
