package command.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.InterestDao;
import dto.InterestDto;

public class InterestList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		InterestDao dao = new InterestDao();
		
		Map<String, List<InterestDto>> interestMap = dao.getInterestMap();
		
//		 콘솔에 Map 전체 구조 확인
//	    for (String category : interestMap.keySet()) {
//	        System.out.println("카테고리: " + category);
//	        for (InterestDto dto : interestMap.get(category)) {
//	            System.out.println("  - " + dto.getItem_id() + " / " + dto.getItem_name());
//	        }
//	    }
		
		request.setAttribute("interestMap", interestMap);
	}

}
