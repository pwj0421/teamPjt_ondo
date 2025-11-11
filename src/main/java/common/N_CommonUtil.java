package common;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class N_CommonUtil {
	
	 public static String getNoticeDir(HttpServletRequest request) {
	        // 실제 서버 경로 가져오기
	        String attachDir = request.getServletContext().getRealPath("/attach/notice/");
	       
	        return attachDir;  // 경로 반환
	    }

	
	// 오늘날짜 : yyyy-MM-dd
	public static String getToday() {
		Date date = new Date(); // 현재 시간을 가지고 있는 클래스
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 형식을 가지고 있는 클래스
		
		String today = sd.format(date);
		
		return today;
	}
	
	// 오늘날짜(시간) : yyyy-MM-dd HH:mm:ss
	public static String getTodayTime() {
		Date date = new Date(); 
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
			
		String today = sd.format(date);
			
		return today;
	}
	
	// list 페이지
	public static String getPageDisplay() {
		String result = "<a href='' class='active'>1</a>\r\n" + 
					    "<a href=''>2</a>\r\n" + 
					    "<a href=''>3</a>";
		
		return result;
	}
	
	// 페이지 설정
	public static String getPageDisplay(int current_page, int total_page, int pageNumber_count){
		int pagenumber;    //화면에 보여질 페이지 인덱스수
		int startpage;     //화면에 보여질 시작 페이지 번호
		int endpage;       //화면에 보여질 마지막 페이지 번호
		int curpage;       //이동하고자 하는 페이지 번호
		
		String strList=""; //리턴될 페이지 인덱스 리스트

		pagenumber = pageNumber_count;   //한 화면의 페이지 인덱스수
		
		//시작 페이지 번호 구하기
		startpage = ((current_page - 1)/ pagenumber) * pagenumber + 1;
		//마지막 페이지 번호 구하기
		endpage = (((startpage -1) + pagenumber) / pagenumber)*pagenumber;
		//총페이지수가 계산된 마지막 페이지 번호보다 작을 경우
		//총페이지수가 마지막 페이지 번호가 됨
		
		if(total_page <= endpage)  endpage = total_page;
					
		//첫번째 페이지 인덱스 화면이 아닌경우
		if(current_page > pagenumber){
			curpage = startpage -1;  //시작페이지 번호보다 1적은 페이지로 이동
			strList = strList +"<button onclick=\"goPageView('"+curpage+"')\">&lt;</button>";
//			strList = strList +"<a href=javascript:goPageView('"+curpage+"') ><i class='fa fa-angle-double-left'></i></a>";
		}
						
		//시작페이지 번호부터 마지막 페이지 번호까지 화면에 표시
		curpage = startpage;
		while(curpage <= endpage){
			if(curpage == current_page){
				strList = strList +"<button class='active'>"+current_page+"</button>";
			} else {
				strList = strList +"<button onclick=\"goPageView('"+curpage+"')\">"+curpage+"</button>";
			}
			curpage++;
		}
		//뒤에 페이지가 더 있는 경우
		if(total_page > endpage){
			curpage = endpage+1;
			strList = strList + "<button onclick=\"goPageView('"+curpage+"')\" >&gt;</button>";
//			strList = strList + "<a href=javascript:goPageView('"+curpage+"') ><i class='fa fa-angle-double-right'></i></a>";
		}
		return strList;
	}			
	
//	// 항상 첨부파일의 경로명을 return 해주는 method
//	public static String getNoticeDir(HttpServletRequest request) {
//		String dir = request.getSession().getServletContext().getRealPath("/") + "attach/notice/";
//		
//		return dir;
//	}

	// 항상 첨부파일의 경로명을 return 해주는 method
	public static String getPdsDir() {
		return "C:/Users/Tony/Desktop/IT/java/java_practice/web_pjt/homepage_jsp_jsl/WebContent/attach/pds";
	}

	public static String getSessionInfo(HttpServletRequest request, String gubun) {
		String result = "";
		
		HttpSession session = request.getSession();
		
		if(gubun.equals("id")) {
			result = (String)session.getAttribute("sessionId");
		} else if(gubun.equals("name")) {
			result = (String)session.getAttribute("sessionName");
		} else if(gubun.equals("level")) {
			result = (String)session.getAttribute("sessionLevel");
		}
		
		if(result == null) result = "";
		
		return result;
	}

	// 작은 따옴표 변환
	public static String setQuote(String str) {
		str = str.replaceAll("'", "&#39;");
		
		return str;
	}
	
	// 큰따옴표 변환
	public static String getQuote(String str) {
		str = str.replaceAll("\"", "&quot;");
		
		return str;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
