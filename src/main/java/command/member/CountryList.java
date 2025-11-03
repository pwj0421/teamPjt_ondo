package command.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.CountryDao;
import dto.CountryDto;

public class CountryList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		CountryDao dao = new CountryDao();
		List<CountryDto> list = dao.getCountryList();
		
		request.setAttribute("countryList", list);
		
	}

}
