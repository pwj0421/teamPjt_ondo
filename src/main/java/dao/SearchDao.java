package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.CommonUtil;
import common.DBConnection;
import dto.ComuPostDto;
import dto.NoticeDto;
import dto.SearchDto;

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
				
				String n_content = CommonUtil.highlightSnippet(content, search, 50); // 앞뒤 10자
				
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

	public ArrayList<ComuPostDto> selectComuHeaderSearchList(String search) {
		ArrayList<ComuPostDto> dtos = new ArrayList<ComuPostDto>();
		
		String sql = "select p.post_id, m.m_name, title, content, to_char(create_at, 'yyyy-MM-dd hh24:mi:ss') as reg_date, hit\r\n"
				+ "from ondo_comu_posts p, ondo_member m\r\n"
				+ "where title like '%' || '"+search+"' || '%'\r\n"
				+ "and p.m_id = m.m_id\r\n"
				+ "union\r\n"
				+ "select p.post_id, m.m_name, title, content, to_char(create_at, 'yyyy-MM-dd hh24:mi:ss') as reg_date, hit\r\n"
				+ "from ondo_comu_posts p, ondo_member m\r\n"
				+ "where content like '%' || '"+search+"' || '%'\r\n"
				+ "and p.m_id = m.m_id\r\n"
				+ "order by reg_date desc";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int n_no = rs.getInt(1);
				String n_name = rs.getString(2);
				String n_title = rs.getString(3);
				String content = rs.getString(4);
				String reg_date = rs.getString(5);
				int n_hit = rs.getInt(6);
				
				String n_content = CommonUtil.highlightSnippet(content, search, 50); // 앞뒤 10자
				
				ComuPostDto dto = new ComuPostDto(n_no, reg_date, n_title, n_content, n_hit, n_name);
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

	//검색이력 저장 및 저장된 이력인경우 검색수(hit)증가
	public int mergeSearchTxt(String search, String nowDate) {
		int result = 0;
		String sql = "MERGE INTO ondo_search t\r\n"
				+ "USING (\r\n"
				+ "    SELECT '"+search+"' AS keyword\r\n"
				+ "    FROM dual\r\n"
				+ ") s\r\n"
				+ "ON (t.s_keyword = s.keyword)          \r\n"
				+ "WHEN MATCHED THEN\r\n"
				+ "    UPDATE SET\r\n"
				+ "        t.s_hit = t.s_hit+1          \r\n"
				+ "		 , t.s_recentdate = to_date('"+nowDate+"','yyyy-MM-dd hh24:mi:ss') \r\n"
				+ "WHEN NOT MATCHED THEN\r\n"
				+ "    INSERT (s_id, s_keyword, s_hit, s_recentdate)\r\n"
				+ "    VALUES ((select 'S' || LPAD(nvl(max(substr(s_id, 2)),0)+1,9,0) from ondo_search), '"+search+"', 1, to_date('"+nowDate+"','yyyy-MM-dd hh24:mi:ss'))";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			String method = Thread.currentThread().getStackTrace()[1].getClassName();
			System.out.println(method+"에서 오류 발생");
			System.out.println(sql);
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return result;
	}

	public ArrayList<SearchDto> selectSearchList() {
		ArrayList<SearchDto> dtos = new ArrayList<SearchDto>();
		
		String sql = "select s_id, s_keyword, s_hit, to_char(s_recentdate, 'yyyy-MM-ss hh24:mi:ss') as recentDate from ondo_search\r\n"
				+ "order by s_recentdate desc, s_hit desc";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString(1);
				String keyword = rs.getString(2);
				String snipKeyword = rs.getString(2);
				int hit = rs.getInt(3);
				String reg_date = rs.getString(4);
				
				snipKeyword = CommonUtil.highlightSnippet(keyword, "", 8); // 8자 정도만 보이게..
				
				SearchDto dto = new SearchDto(id, keyword, reg_date, snipKeyword, hit);
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

}
