<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common_header.jsp" %>
<%@ include file="../menu/quickMenu.jsp" %>

<div class="mp_mypage_container">

    <!-- 왼쪽 메뉴 -->
    <div class="chat_side_menu">
        <%@ include file="../menu/chat_menu.jsp" %>
    </div>

    <!-- 오른쪽 채팅 영역 -->
    <div class="chat_main_content">
        <div class="chat_room_wrapper">

            <!-- 왼쪽: 친구 리스트 -->
            <div class="chat_friend_list">
                <div class="chat_list_header">
                    나와 대화중인 친구 : <strong>${r_dto.size()}명</strong>
                </div>
                <div class="chat_friend_items" id="friendList">
                    <c:forEach items="${r_dto}" var="dto" varStatus="status">
                        <div class="chat_friend_card ${status.index == 0 ? 'active' : ''}"
                             data-roomid="${dto.roomId}" 
                             onclick="selectFriend(this, '${dto.partnerId}', '${dto.partnerNickname}', '${dto.roomId}')">
                            <img class="friend_profile_img" 
                                 src="attach/member_profile/${dto.partnerImage != null ? dto.partnerImage : 'basic_profile.png'}" 
                                 alt="프로필">
                            <div class="friend_info">
                                <div class="friend_name">${dto.partnerNickname}</div>
                                <div class="friend_preview">
                                    <c:out value="${dto.content != null ? dto.content : '최근 메시지 없음'}"/>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!-- 페이징 -->
                <div class="chat_paging">
                    <button>&lt;</button>
                    <button class="active">1</button>
                    <button>2</button>
                    <button>3</button>
                    <button>&gt;</button>
                </div>
            </div>

            <!-- 오른쪽: 채팅창 -->
            <div class="chat_room_box">
                <div class="chat_header" id="chatHeader">
                    <c:choose>
                        <c:when test="${not empty r_dto}">
                            ${r_dto[0].partnerNickname}
                        </c:when>
                        <c:otherwise>채팅방 없음</c:otherwise>
                    </c:choose>
                </div>
                <div class="chat_content" id="chatContent">
                    <c:forEach items="${msg_dto}" var="msg">
                        <div class="chat_msg ${msg.senderId == sessionScope.m_id ? 'right' : 'left'}">
                            <span>${msg.content}</span>
                        </div>
                    </c:forEach>
                </div>
                <div class="chat_input_box">
                    <input type="text" id="chatInput" placeholder="메시지를 입력하세요">
                    <button onclick="sendMessage()">전송</button>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- CSS -->
<style>
/* 컨테이너 */
.mp_mypage_container {
    display: flex;
    width: 100%;
    min-height: 85vh;
    padding: 40px 70px;
    gap: 40px;
}

/* 메인 콘텐츠 */
.chat_main_content { 
    flex: 1; 
    border: 1px solid #e0e0e0; 
    border-radius: 16px; 
    padding: 20px; 
    background: #fff; 
}

/* 채팅방 레이아웃 */
.chat_room_wrapper { display:flex; gap:20px; width:100%; min-height:70vh; }

/* ===== 왼쪽 친구 리스트 ===== */
.chat_friend_list {
    width: 30%;
    background: #fffaf3;
    border: 1px solid #eee;
    border-radius: 12px;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
}

.chat_list_header {
    padding: 15px 20px;
    font-weight: 600;
    color: #c89f6d;
    border-bottom: 1px solid #eee;
    background: #fff;
}

.chat_friend_items {
    flex: 1;
    overflow-y: auto;
    padding: 10px 0;
}

.chat_friend_card {
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 10px 15px;
    cursor: pointer;
    border-bottom: 1px solid #f0e6da;
    transition: 0.25s;
    border-radius: 12px;
    background: inherit;
}

.chat_friend_card:hover { background: #faf4ed; }
.chat_friend_card.active { background: #c89f6d; color: #fff; }

.chat_friend_card img.friend_profile_img {
    width: 45px;
    height: 45px;
    border-radius: 50%;
    object-fit: cover;
}

.friend_info { display:flex; flex-direction:column; }
.friend_name { font-weight:600; font-size:14px; color:inherit; }
.friend_preview { font-size:12px; color:inherit; opacity:0.8; }

/* ===== 페이징 버튼 ===== */
.chat_paging {
    display: flex;
    justify-content: center;
    gap: 6px;
    padding: 10px;
    border-top: 1px solid #eee;
    background: #fffaf3;
}

.chat_paging button {
    background: #f5f1ec;
    border: none;
    border-radius: 6px;
    padding: 5px 10px;
    cursor: pointer;
    color: #444;
    font-weight: 600;
    transition: 0.2s;
}

.chat_paging button:hover { background: #e0d6c0; }
.chat_paging button.active { background: #c89f6d; color: #fff; }

/* ===== 오른쪽 채팅창 ===== */
.chat_room_box { width:70%; background:#fff; border-radius:12px; padding:20px; display:flex; flex-direction:column; }
.chat_header { font-weight:600; font-size:18px; color:#c89f6d; border-bottom:1px solid #eee; padding-bottom:10px; margin-bottom:15px; }
.chat_content { flex:1; overflow-y:auto; padding:10px; background:#fafafa; border-radius:8px; display:flex; flex-direction:column; gap:8px; }
.chat_msg { max-width:70%; padding:8px 12px; border-radius:15px; word-break:break-word; }
.chat_msg.left { background:#eee; align-self:flex-start; border-top-left-radius:0; }
.chat_msg.right { background:#c89f6d; color:#fff; align-self:flex-end; border-top-right-radius:0; }
.chat_input_box { display:flex; margin-top:10px; }
.chat_input_box input { flex:1; padding:8px 12px; border-radius:8px; border:1px solid #ddd; margin-right:10px; }
.chat_input_box button { padding:8px 16px; border-radius:8px; border:none; background:#c89f6d; color:#fff; font-weight:600; cursor:pointer; }
.chat_input_box button:hover { background:#b38a5a; }
</style>

<!-- JS -->
<script>
const loginUserId = '<%= session.getAttribute("m_id") %>';
const allMessages = [
<c:forEach items="${msg_dto}" var="msg" varStatus="status">
{roomId:'${msg.roomId}', senderId:'${msg.senderId}', content:'${msg.content}'}<c:if test="${!status.last}">,</c:if>
</c:forEach>
];

function selectFriend(element, friendId, friendNickname, roomId){
    document.querySelectorAll('.chat_friend_card').forEach(el=>el.classList.remove('active'));
    element.classList.add('active');

    document.getElementById('chatHeader').innerText = friendNickname;

    const content = document.getElementById('chatContent');
    content.innerHTML = '';

    allMessages.filter(m=>m.roomId===roomId).forEach(msg=>{
        const div = document.createElement('div');
        div.className='chat_msg '+(msg.senderId===loginUserId?'right':'left');
        div.innerHTML=`<span>${msg.content}</span>`;
        content.appendChild(div);
    });

    content.scrollTop=content.scrollHeight;
}

function sendMessage(){
    const input=document.getElementById('chatInput');
    if(input.value.trim()==='') return;

    const content=document.getElementById('chatContent');
    const msg=document.createElement('div');
    msg.className='chat_msg right';
    msg.innerHTML=`<span>${input.value}</span>`;
    content.appendChild(msg);

    content.scrollTop=content.scrollHeight;
    input.value='';
}
</script>

<%@ include file="../common_footer.jsp" %>
