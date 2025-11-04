package command.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.MatchDao;
import dao.MyInfoUpdateDao;

public class MatchInfoInterestUpdate implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MyInfoUpdateDao dao = new MyInfoUpdateDao();
		MatchDao MatchDao = new MatchDao();
		
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("sessionId");
		
		// 새로운 관심사
		ArrayList<Integer> newInterests = new ArrayList<Integer>();
		
		for(int i=0; i<31; i++){
		    String interest = request.getParameter("t_interest_" + (i+1));
		    
		    if(interest != null) newInterests.add(Integer.parseInt(interest));
		}
		
		// 기존 관심사
		ArrayList<Integer> oriInterests = MatchDao.getInterestList(id);
		
		// 추가할 관심사
		ArrayList<Integer> addInterests = new ArrayList<Integer>();
		
		for(int i=0; i<newInterests.size(); i++) {
			int count = 0;
			for(int j=0; j<oriInterests.size(); j++) {
				if(newInterests.get(i) != oriInterests.get(j)) count++;
			}
			if(oriInterests.size() == count) addInterests.add(newInterests.get(i));
		}
		
		// 삭제할 관심사
		ArrayList<Integer> delInterests = new ArrayList<Integer>();
		for(int i=0; i<oriInterests.size(); i++) {
			int count = 0;
			for(int j=0; j<newInterests.size(); j++) {
				if(oriInterests.get(i) != newInterests.get(j)) count++;
			}
			if(newInterests.size() == count) delInterests.add(oriInterests.get(i));
		}
		
		int count_1 = 0;
		if(addInterests.size() > 0) count_1 = dao.addMyInterest(id, addInterests);
		
		int count_2 = 0;
		if(delInterests.size() > 0) count_2 = dao.delMyInterest(id, delInterests);
		
		String msg = "";  
		if(count_1 == addInterests.size() && count_2 == delInterests.size()) msg = "관심사가 수정되었습니다.";
		else msg = "관심사 수정이 실패하였습니다. 관리자에게 문의 부탁드립니다.";
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_gubun", "matchInfo");
		request.setAttribute("t_url", "Member");
		
	}

}
