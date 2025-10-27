package common;

import java.text.SimpleDateFormat;
import java.util.Date;

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
}
