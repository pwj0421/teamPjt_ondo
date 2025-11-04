package common;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class CommonUtil {
	//오늘 날짜 (yyyy-MM-dd)
		public static String getToday() {
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			String today = sdf.format(date);
			
			return today;
		}
		
		//오늘 날짜 (yyyy-MM-dd HH:mm:ss)
		public static String getTodayTime() {
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			String today = sdf.format(date);
			
			return today;
		}
		
		public static String getSessionInfo(HttpServletRequest request, String gubun) {
			String result = "";
			
			HttpSession session = request.getSession();
			
			if(gubun.equals("id")) {
				result = (String) session.getAttribute("sessionId");
			}else if(gubun.equals("name")) {
				result = (String) session.getAttribute("sessionName");
			}else if(gubun.equals("level")) {
				result = (String) session.getAttribute("sessionLevel");
			}
			return result;		
		}
		public static String getQuote(String str) {
		      str = str.replaceAll("\"", "&quot;");
		      
		      return str;
		   }
			
}

