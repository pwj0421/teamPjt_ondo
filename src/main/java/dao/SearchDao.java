package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DBConnection;
import dto.NoticeDto;
import org.apache.commons.text.StringEscapeUtils;
import java.util.regex.*;

public class SearchDao {
	
	Connection con 		 = null;
	PreparedStatement ps = null;
	ResultSet rs 		 = null;

	public ArrayList<NoticeDto> selectNoticeHeaderSearchList(String search) {
		ArrayList<NoticeDto> dtos = new ArrayList<NoticeDto>();
		
		String sql = "select n_no, n_title, n_content, m.m_name, to_char(n_reg_date,'yyyy-MM-dd hh24:mi:ss') as reg_date, n_hit\r\n"
				+ "from ondo_notice n, ondo_member m\r\n"
				+ "where n_title like '%' || '"+search+"' || '%'\r\n"
				+ "and n.n_reg_id = m.m_id\r\n"
				+ "union\r\n"
				+ "select n_no, n_title, n_content, m.m_name, to_char(n_reg_date,'yyyy-MM-dd hh24:mi:ss') as reg_date, n_hit\r\n"
				+ "from ondo_notice n, ondo_member m\r\n"
				+ "where n_content like '%' || '"+search+"' || '%'\r\n"
				+ "and n.n_reg_id = m.m_id\r\n"
				+ "order by reg_date desc";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String n_no = rs.getString(1);
				String n_title = rs.getString(2);
				String content = rs.getString(3);
				String n_name = rs.getString(4);
				String reg_date = rs.getString(5);
				int n_hit = rs.getInt(6);
				
				String n_content = highlightSnippet(content, search, 50); // 앞뒤 10자
				
				NoticeDto dto = new NoticeDto(n_no, n_title, n_content, n_name, reg_date, n_hit);
				dtos.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			String method = Thread.currentThread().getStackTrace()[1].getClassName();
			System.out.println(method+"에서 오류 발생");
			System.out.println(sql);
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return dtos;
	}
	
	// Apache Commons Text 필요: org.apache.commons:commons-text
	public String highlightSnippet(String content, String q, int ctx) {
	    if (content == null) content = "";
	    String escContent = StringEscapeUtils.escapeHtml4(content); // 본문 이스케이프
	    if (q == null || q.isEmpty()) {
	        // 검색어 없으면 앞부분만 잘라서
	        int end = Math.min(escContent.length(), 2*ctx);
	        return escContent.substring(0, end) + (escContent.length() > end ? "..." : "");
	    }

	    String escQ = StringEscapeUtils.escapeHtml4(q); // 검색어도 이스케이프
	    Pattern p = Pattern.compile(Pattern.quote(escQ), Pattern.CASE_INSENSITIVE);
	    Matcher m = p.matcher(escContent);

	    if (!m.find()) {
	        // 매치 없으면 앞부분만
	        int end = Math.min(escContent.length(), 2*ctx);
	        return escContent.substring(0, end) + (escContent.length() > end ? "..." : "");
	    }
	    int s = Math.max(0, m.start() - ctx);
	    int e = Math.min(escContent.length(), m.end() + ctx);

	    StringBuilder sb = new StringBuilder();
	    
	    if (s > 0) sb.append("...");
	    sb.append(escContent, s, m.start());
	    sb.append("<strong>").append(escContent, m.start(), m.end()).append("</strong>");
	    sb.append(escContent, m.end(), e);
	    if (e < escContent.length()) sb.append("...");
	    return sb.toString();
	}

}
