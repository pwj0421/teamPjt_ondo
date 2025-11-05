<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>    
<%@ include file="../menu/quickMenu.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
<link rel="stylesheet" href="../CSS/sub.css">
<link rel="stylesheet" href="CSS/match.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">

	function goMatchList() {
	    match.t_gubun.value="list";
	    
	    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
	    let isChecked = false;
	    checkboxes.forEach(cb => { if(cb.checked) isChecked = true; });
	    if(!isChecked){ alert("매칭을 위해 최소 하나 이상의 카테고리를 선택해주세요."); return; }
	    
	    match.method="post";
	    match.action="Match";
	    match.submit();
	}
	
	function goTab(tab) {
		match.t_tab.value = tab;
		match.t_gubun.value = "main";
		
		match.method="post";
		match.action="Match";
		match.submit();
	}
	
</script>

</head>
<body>
<div class="match_main_container">

  <!-- 내 프로필 -->
  <div class="match_myprofile">
    <div class="profile_image">
    	<c:choose>
    		<c:when test="${empty myInfoDto.getImage()}">
    			<img src="attach/member_profile/basic_profile.png" alt="프로필 사진">
    		</c:when>
    		<c:otherwise>
    			<img src="attach/member_profile/${myInfoDto.getImage()}" alt="프로필 사진">
    		</c:otherwise>
    	</c:choose>
        
    </div>
    <div class="profile_nickname">${myInfoDto.getNickname()}</div>
    <div class="profile_intro">${myInfoDto.getTagline()}</div>
    <div class="profile_tags">
        <c:forEach items="${myInfoDto.getInterestDto()}" var="dto">
            <span>${dto.getItem_name()}</span>
        </c:forEach>
    </div>
    <div class="profile_edit_btn">
        <button type="button" onclick="goPage('Member','matchInfo')">내 정보 수정하기</button>
    </div>
  </div>

  <!-- 카테고리 검색 박스 -->
  <div class="match_searchBox">
    <div class="match_category">
        <button id="openCategoryBtn">카테고리 열기</button>
        <div class="category_modal">
            <div class="category_content">
                <h3>카테고리 선택</h3>
                <form name="match">
                    <input type="hidden" name="t_gubun">
                    <input type="hidden" name="t_tab" value="${t_tab}">
                    <div class="category_grid">
                        <c:forEach var="category" items="${interestMap}">
                        <div class="category_group">
                            <p class="category_title">
                                ${category.value[0].category_icon} ${category.key}
                            </p>
                            <c:forEach var="item" items="${category.value}">
                                <label>
                                    <input type="checkbox" 
                                           name="t_interest_${item.item_id}" 
                                           value="${item.item_id}"
                                           <c:if test="${interestList.contains(item.item_id)}">checked</c:if>> 
                                    ${item.item_name}
                                </label>
                            </c:forEach>
                        </div>
                        </c:forEach>
                    </div>  
                </form>
                <div class="category_buttons">
                    <button id="confirmCategory">확인</button>
                </div>
            </div>
        </div>

        <div class="selected_categories_box">
            <div style="display:flex; align-items:center; flex-wrap:wrap; gap:8px;">
                <p>검색할 카테고리:</p>
                <div class="selected_categories"></div>
            </div>
            <button onclick="goMatchList()" class="search_btn">매칭</button>
        </div>
    </div>
	
	<!-- 탭 버튼 -->
	<div class="tabs">
		<button class="tab <c:if test="${t_tab eq 'NORMAL'}">active</c:if>" onclick="goTab('NORMAL')" data-target="NORMAL">👤 일반</button>
	 	<button class="tab <c:if test="${t_tab eq 'TUTOR'}">active</c:if>" onclick="goTab('TUTOR')" data-target="TUTOR">🎓 튜터</button>
	</div>
	
	<script>
		const tabs = document.querySelectorAll(".tab");
		
		tabs.forEach(tab => {
			tab.addEventListener("click", () => {
				
				tabs.forEach(t => t.classList.remove("active"));
				
				document.querySelectorAll(".match_list").forEach(c => c.style.display = "none");
				
				tab.classList.add("active");
				
				const targetId = tab.dataset.target; 
				
				document.getElementById(targetId).style.display = "block";
			});
		});
	</script>
	
    <form>
        <input type="hidden" id="sender_id" value="${myInfoDto.getMemberId()}">
        
        <c:if test="${match_dtos.size() == 0}">
        	<div class="match_noResult">😔 매칭 결과가 없습니다 </div>
        </c:if>
        
        <!-- 일반 탭 -->
        <div id="NORMAL" class="match_list">
            <c:forEach items="${match_dtos}" var="dto">
                <div class="match_item">
                    <input type="hidden" name="receiver_id" value="${dto.getMemberId()}">
                    <c:choose>
					    <c:when test="${empty dto.getImage()}">
					        <img src="attach/member_profile/basic_profile.png"
					             alt="프로필"
					             class="profile_img"
					             style="cursor:pointer;"
					             onclick="openProfilePopup('${dto.getMemberId()}')">
					    </c:when>
					    <c:otherwise>
					        <img src="attach/member_profile/${dto.getImage()}"
					             alt="프로필"
					             class="profile_img"
					             style="cursor:pointer;"
					             onclick="openProfilePopup('${dto.getMemberId()}')">
					    </c:otherwise>
					</c:choose>
                    <div class="profile_info">
                        <p class="nickname">${dto.getNickname()}</p>
                        <p class="intro">${dto.getTagline()}</p>
                        <div class="interest_box_container">
                            <c:forEach items="${dto.getInterestDto()}" var="interest">
                                <c:choose>
                                    <c:when test="${interestList.contains(interest.getItem_id())}">
                                        <span class="interest_box highlight">${interest.getItem_name()}</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="interest_box">${interest.getItem_name()}</span>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </div>
                        <span class="toggle_interest_btn">더보기 ▼</span>
                    </div>

                    <!-- JSTL로 초기 "이미 요청됨" 처리 -->
                    <c:set var="isSent" value="false"/>
                    <c:forEach var="id" items="${sentMessageList}">
                        <c:if test="${id == dto.getMemberId()}">
                            <c:set var="isSent" value="true"/>
                        </c:if>
                    </c:forEach>

                    <c:choose>
                        <c:when test="${isSent}">
                            <button type="button" class="message_btn disabled" disabled>이미 요청됨</button>
                        </c:when>
                        <c:otherwise>
                            <button type="button" class="message_btn">메세지 요청</button>
                        </c:otherwise>
                    </c:choose>

                </div>
            </c:forEach>
        </div>
        
        <!-- 튜터 탭 -->
        <div id="TUTOR" class="match_list" style="display: none;">
            <c:forEach items="${match_dtos}" var="dto">
                <div class="match_item">
                    <input type="hidden" name="receiver_id" value="${dto.getMemberId()}">
                    <c:choose>
                        <c:when test="${empty dto.getImage()}">
                            <img src="attach/member_profile/basic_profile.png" alt="프로필" class="profile_img">
                        </c:when>
                        <c:otherwise>
                            <img src="attach/member_profile/${dto.getImage()}" alt="프로필" class="profile_img">
                        </c:otherwise>
                    </c:choose>
                    <div class="profile_info">
                        <p class="nickname">${dto.getNickname()}</p>
                        <p class="intro">${dto.getTagline()}</p>
                        <div class="interest_box_container">
                            <c:forEach items="${dto.getInterestDto()}" var="interest">
                                <c:choose>
                                    <c:when test="${interestList.contains(interest.getItem_id())}">
                                        <span class="interest_box highlight">${interest.getItem_name()}</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="interest_box">${interest.getItem_name()}</span>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </div>
                        <span class="toggle_interest_btn">더보기 ▼</span>
                    </div>

                    <!-- JSTL로 초기 "이미 요청됨" 처리 -->
                    <c:set var="isSent" value="false"/>
                    <c:forEach var="id" items="${sentMessageList}">
                        <c:if test="${id == dto.getMemberId()}">
                            <c:set var="isSent" value="true"/>
                        </c:if>
                    </c:forEach>

                    <c:choose>
                        <c:when test="${isSent}">
                            <button type="button" class="message_btn disabled" disabled>이미 요청됨</button>
                        </c:when>
                        <c:otherwise>
                            <button type="button" class="message_btn">메세지 요청</button>
                        </c:otherwise>
                    </c:choose>

                </div>
            </c:forEach>
        </div>
        
    </form>
</div>
</div>

<script>
const openBtn = document.getElementById("openCategoryBtn");
const modal = document.querySelector(".category_modal");
const confirmBtn = document.getElementById("confirmCategory");
const selectedContainer = document.querySelector(".selected_categories");

// 카테고리 선택
openBtn.addEventListener("click", () => {
  modal.classList.toggle("active");
  openBtn.textContent = modal.classList.contains("active") ? "카테고리 닫기" : "카테고리 열기";
});

const valueMap = {
  "1": "한국어 배우고 싶어요", "2": "일본어 배우고 싶어요", "3": "서로 언어 교환",
  "4": "언어 스터디 모집", "5": "애니메이션 / 만화 / 게임", "6": "음악 / 콘서트 / 아이돌",
  "7": "드라마 / 영화 / 유튜브", "8": "스포츠", "9": "여행 / 사진 / 자연",
  "10": "패션 / 뷰티", "11": "한일 문화 이야기", "12": "명절 / 전통문화 공유",
  "13": "지역 추천", "14": "한일 트렌드 토론", "15": "같은 나이대 친구",
  "16": "학생 / 직장인", "17": "온라인 대화 위주", "18": "오프라인 만남 가능",
  "19": "유학 정보 교류", "20": "워킹홀리데이 / 취업 정보", "21": "자격증 / 공부 파트너",
  "22": "국제 연애 관심", "23": "장거리 연애", "24": "진지한 관계",
  "25": "서울 / 경기", "26": "부산 / 제주", "27": "도쿄 / 오사카",
  "28": "후쿠오카 / 홋카이도", "29": "이벤트 / 오프라인 모임", "30": "봉사활동 / 프로젝트 모집",
  "31": "자유 주제"
};

function updateSelectedList() {
  const checked = document.querySelectorAll('.category_group input[type="checkbox"]:checked');
  selectedContainer.innerHTML = "";
  checked.forEach(item => {
    const tag = document.createElement("span");
    tag.classList.add("tag");
    tag.textContent = valueMap[item.value];
    tag.addEventListener("click", () => { item.checked = false; tag.remove(); });
    selectedContainer.appendChild(tag);
  });
}

document.addEventListener("DOMContentLoaded", () => {
    updateSelectedList();

    // 메시지 버튼 클릭 이벤트 (AJAX)
    document.querySelectorAll('.match_item').forEach(item => {
        const btn = item.querySelector('.message_btn');
        if(btn.disabled) return; // 이미 요청됨인 경우 클릭 막기

        btn.addEventListener('click', function(e) {
            e.preventDefault();
            const receiverId = item.querySelector('input[name="receiver_id"]').value;
            const senderId = document.getElementById('sender_id').value;

            const greetings = [
                "안녕하세요! 처음 뵙네요 😊",
                "언어 교류해요~ 🇯🇵🤝🇰🇷",
                "요즘 날씨 좋죠? ☀️",
                "잘 지내세요? 같이 이야기 나눠요!",
                "취미 이야기해봐요 🎨",
                "오늘 하루도 화이팅이에요 💪"
            ];
            const randomGreeting = greetings[Math.floor(Math.random() * greetings.length)];

            // 메시지 박스 생성
            let messageBox = item.nextElementSibling;
            if(!messageBox || !messageBox.classList.contains('message_box')) {
                messageBox = document.createElement('div');
                messageBox.className = 'message_box';

                const input = document.createElement('input');
                input.type = 'text';
                input.name = 'greeting_message';
                input.value = randomGreeting;

                const sendBtn = document.createElement('button');
                sendBtn.type = 'button';
                sendBtn.textContent = '전송';

                sendBtn.addEventListener('click', (e) => {
                    e.preventDefault();
                    const text = input.value.trim();
                    if(!text){ alert("메세지를 입력해주세요!"); return; }

                    $.ajax({
                        type:"POST",
                        url:"Message",
                        data:{ sender_id: senderId, receiver_id: receiverId, greeting_message: text, t_gubun:"messageRequest" },
                        dataType:"text",
                        success:function(res){
                            if(res.trim()==="SUCCESS"){
                                alert("메세지 요청 완료!");
                                btn.textContent="이미 요청됨";
                                btn.disabled=true;
                                btn.classList.add('disabled');
                                if(messageBox){ messageBox.remove(); }
                                item.classList.remove('active');
                            } else alert("메세지 전송 실패!");
                        },
                        error:function(){ alert("서버 통신 실패!"); }
                    });
                });

                messageBox.appendChild(input);
                messageBox.appendChild(sendBtn);
                item.insertAdjacentElement('afterend', messageBox);
                setTimeout(()=> messageBox.classList.add('open'), 10);
                item.classList.add('active');
            } else {
                const isOpen = messageBox.classList.contains('open');
                messageBox.classList.toggle('open', !isOpen);
                item.classList.toggle('active', !isOpen);
            }
        });
    });

    // 관심사 더보기
    document.querySelectorAll('.match_item').forEach(item => {
        const container = item.querySelector('.interest_box_container');
        const btn = item.querySelector('.toggle_interest_btn');
        if(container.scrollHeight <= container.clientHeight) btn.style.display='none';
        btn.addEventListener('click',()=> {
            container.classList.toggle('expanded');
            btn.textContent = container.classList.contains('expanded') ? '접기 ▲' : '더보기 ▼';
        });
    });
});

confirmBtn.addEventListener("click", () => { 
    updateSelectedList(); 
    modal.classList.remove("active"); 
    openBtn.textContent = "카테고리 열기"; 
});

// 상세보기 팝업창
function openProfilePopup(memberId) {
    // 원하는 크기
    const width = 800;
    const height = 1000;

    // 화면(현재 브라우저 윈도우) 기준 중앙 위치 계산 (듀얼모니터/브라우저 위치 보정)
    const left = Math.round(window.screenX + (window.outerWidth - width) / 2);
    const top  = Math.round(window.screenY + (window.outerHeight - height) / 2);

    // ① 기존과 다르게 '고유한' 이름을 만든다 -> 기존 창 재사용 문제 회피
    const winName = "profilePopup_" + Date.now(); // 혹은 Math.random()

    // ② features 문자열: 콤마로만 구분, 공백 NO
    const features = 
      `width=${width},height=${height},left=${left},top=${top},` +
      `resizable=yes,scrollbars=yes,menubar=no,toolbar=no,status=no,location=no`;

    // ③ 팝업 먼저 연다 (빈 URL)
    const popup = window.open("", winName, features);

    // 팝업 차단 검사
    if (!popup || popup.closed || typeof popup.closed === 'undefined') {
        alert("팝업이 차단되었거나 열리지 않았습니다. 브라우저의 팝업 설정을 확인해주세요.");
        return;
    }

    // ④ 폼을 동적으로 생성해서 POST로 전송 (Match 서블릿)
    const form = document.createElement("form");
    form.method = "POST";
    form.action = "Match";      // 필요하면 contextPath 포함: `${pageContext.request.contextPath}/Match`
    form.target = winName;     // 여기서도 popup 이름과 일치시킴

    // hidden: t_gubun=view
    const gubun = document.createElement("input");
    gubun.type = "hidden"; gubun.name = "t_gubun"; gubun.value = "view";
    form.appendChild(gubun);

    // hidden: memberId
    const mid = document.createElement("input");
    mid.type = "hidden"; mid.name = "memberId"; mid.value = memberId;
    form.appendChild(mid);

    document.body.appendChild(form);
    form.submit();
    form.remove();

    // ⑤ (선택) 브라우저가 허용하는 경우 위치/크기 강제 보정
    try {
        // resizeTo/moveTo는 브라우저가 허용할 때만 동작
        popup.focus();
        popup.resizeTo(width, height);
        popup.moveTo(left, top);
    } catch (e) {
        // 일부 브라우저는 보안을 이유로 예외를 던질 수 있음 — 무시해도 됨
        // console.log("resize/move not allowed:", e);
    }
}

</script>

<%@ include file="../common_footer.jsp" %>    
</body>
</html>
