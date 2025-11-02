<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>	
<%@ include file="../menu/quickMenu.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이페이지 - 매칭정보수정</title>
<style>
body {
  background: #fff;
  font-family: 'Pretendard', sans-serif;
  color: #333;
  margin: 0;
  padding: 0;
}
</style>

<script>
	document.addEventListener("DOMContentLoaded", () => {
	  const checkboxes = document.querySelectorAll('.mp_category_group input[type="checkbox"]');
	  const selectedBox = document.querySelector('.mp_selected_categories');

	  function updateSelected() {
	    selectedBox.innerHTML = '';
	    const checked = document.querySelectorAll('.mp_category_group input:checked');
	    checked.forEach(c => {
	      const tag = document.createElement('span');
	      tag.textContent = c.parentNode.textContent.trim();
	      tag.addEventListener('click', () => {
	        c.checked = false;
	        updateSelected();
	      });
	      selectedBox.appendChild(tag);
	    });
	  }

	  // ✅ change 이벤트: 체크 허용 8개까지, 9개부터 막기
	  checkboxes.forEach(cb => {
	    cb.addEventListener('change', () => {
	      const checkedCount = Array.from(checkboxes).filter(c => c.checked).length;

	      // 🔽 9개째 선택 시 차단 (즉, 8개까지 허용)
	      if (checkedCount > 8) {
	        cb.checked = false;
	        alert("최대 8개까지만 선택할 수 있습니다.");
	      }

	      // UI 업데이트
	      updateSelected();
	    });
	  });

	  // 초기 렌더링 시 표시
	  updateSelected();
	});
</script>

</head>

<script>
	function goUpdateMatchInfo() {
		if(matchInfoUpdate.m_nickName.value != matchInfoUpdate.ori_nickname.value) {
			if(matchInfoUpdate.checkNickName.value == "") {
				alert("닉네임 중복 확인이 필요합니다.");
		        return;
			}
			
			if (!nickOk) {
		        alert("이미 사용 중인 닉네임입니다.");
		        return;
		    }
		}
		
	    const form = document.forms['matchInfoUpdate'];
		matchInfoUpdate.t_gubun.value = "matchInfoUpdate";
		matchInfoUpdate.method="post";
		matchInfoUpdate.action="Member";
		matchInfoUpdate.submit();
	}
	
	function goInterestUpdate() {
		interest.t_gubun.value = "interestUpdate";
		
		interest.method="post";
		interest.action="Member";
		interest.submit();
	}
	
</script>
<body>
	<%@ include file="../menu/quickMenu.jsp" %>
	<div class="mp_mypage_container">
	<%@ include file="../menu/mypage_menu.jsp" %>
	
	
  	<div class="mp_mypage_content">
    	<h3>매칭 정보</h3>
    
    
<!-- 매칭 정보 업데이트 입니다 -혜민 ~~-->

		<form name="matchInfoUpdate">	
			<input type="hidden" name="t_gubun">
			<input type="hidden" name="t_id" value="${m_dto.getM_id()}">
		    <div class="mp_info_row">
		      	<label>닉네임</label>
		      	<input type="text" id="m_nickName" placeholder="닉네임 입력" value="${m_dto.getM_nickname()}" name="m_nickName" onInput="setEmpty()">
		      	<input type="hidden" name="ori_nickname" value="${m_dto.getM_nickname()}">
		    	<button type="button" class="mp_check_btn" onclick="checkNick()">중복확인</button>
		    	<input type="text" id="nickCheckResult" name="checkNickName" class="mp_nickCheck" disabled>
		    </div>
		    
<!-- 닉네임 중복검사 -->	
<script> 
	function checkNick() {
	    const nick = document.getElementById("m_nickName").value.trim();
	    const updateBtn = document.getElementById('updateBtn');
	    const resultInput = document.getElementById('nickCheckResult');

	    if (!nick) {
	        alert("닉네임을 입력해주세요.");
	        return;
	    }
	    
	    if(matchInfoUpdate.m_nickName.value == matchInfoUpdate.ori_nickname.value) {
	    	resultInput.value = "현재 닉네임 ✅";
	    	nickOk = true;
	    	updateBtn.style.opacity = "1"; // 활성화
	    	
	    } else {
	    	fetch("Member?t_gubun=checkNick&nick=" + encodeURIComponent(nick))
	        .then(response => response.json())
	        .then(data => {
	            if (data.result === "exist") {
	                resultInput.value = "이미 사용 중 ❌";
	                nickOk = false;
	                updateBtn.style.opacity = "0.5"; // 시각적으로 막힌 느낌
	            } else {
	                resultInput.value = "사용 가능 ✅";
	                nickOk = true;
	                updateBtn.style.opacity = "1"; // 활성화
	            }
	        })
	        .catch(err => console.error(err));
	    }
	}
	
	function setEmpty() {
		matchInfoUpdate.checkNickName.value = "";
	}
	
</script>
		
		    <div class="mp_info_row">
		      <label>한줄소개</label>
		      <textarea placeholder="자신을 간단히 소개해주세요!" name="m_tagline">${m_dto.getM_tagline()}</textarea>
		    </div>
			<div class="mp_info_row">
		      <label> 자기소개</label>
		      <textarea placeholder="자신을 간단히 소개해주세요!" name="m_introduction">${m_dto.getM_introduction()}</textarea>
		    </div>
		    <div class="mp_button_box">
		      <button type="button" id="updateBtn" onclick="goUpdateMatchInfo()">수정</button>
		    </div>
		</form>

			<div class="mp_match_searchBox">
			
		    	<div class="mp_selected_categories_box">
		        	<div style="display:flex; align-items:center; flex-wrap:wrap; gap:8px;">
		          		<p style="font-weight:600;">내 카테고리:</p>
		          			<div class="mp_selected_categories"></div>
		        	</div>
		        	<button onclick="goInterestUpdate()" class="mp_search_btn">저장</button>
		      	</div>
			
				<form name="interest">
					<input type="hidden" name="t_gubun">
	      		<div class="mp_category_container">
	        		<div class="mp_category_grid">
					<c:forEach var="category" items="${interestMap}">
	          			<div class="mp_category_group">
				            <p class="mp_category_title">
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
				</div>
				</form>
				
			</div>
		</div>
	</div>
	
</body>
</html>
