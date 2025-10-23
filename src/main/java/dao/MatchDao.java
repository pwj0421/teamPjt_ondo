package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DBConnection;
import dto.InterestDto;
import dto.MatchDto;

public class MatchDao {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// INTEREST LIST
	// InterestList.java
	public ArrayList<InterestDto> getInterestList() {
		ArrayList<InterestDto> dtos = new ArrayList<InterestDto>();
		String sql = "SELECT i.category_code, c.category_name, i.item_id, i.item_name\r\n"
				   + "FROM ondo_interest_item i\r\n"
				   + "JOIN ondo_interest_category c\r\n"
				   + "  ON i.category_code = c.category_code\r\n"
				   + "ORDER BY category_code, item_id";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				String category_code = rs.getString("category_code");
				String category_name = rs.getString("category_name");
				String item_id = rs.getString("item_id");
				String item_name = rs.getString("item_name");
				
				InterestDto dto = new InterestDto(item_id, category_code, item_name, category_name);
				dtos.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("getInterestList() 오류 : "+ sql);
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return dtos;
	}
	
	// MATCH LIST
	// MatchList.java
	public ArrayList<MatchDto> getMatchList(String id) {
		ArrayList<MatchDto> dtos = new ArrayList<MatchDto>();
		String sql = "SELECT *\r\n"
				   + "FROM (\r\n"
				   + "    SELECT DISTINCT i.member_id, m.m_image, p.match_nickname, p.match_tagline\r\n"
				   + "    FROM ondo_member_interest i\r\n"
				   + "    JOIN ondo_member m\r\n"
				   + "      ON i.member_id = m.m_id\r\n"
				   + "    JOIN ondo_match_profile p\r\n"
				   + "      ON i.member_id = p.match_id\r\n"
				   + "    WHERE i.item_id IN (\r\n"
				   + "        SELECT item_id\r\n"
				   + "        FROM ondo_member_interest\r\n"
				   + "        WHERE member_id = 'user001'\r\n"
				   + "    )\r\n"
				   + "    AND i.member_id <> '"+id+"'\r\n"
				   + "    ORDER BY dbms_random.value\r\n"
				   + ")\r\n"
				   + "WHERE rownum <= 4";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				String match_id = rs.getString("member_id");
				String profile_image = rs.getString("m_image");
				String match_nickname = rs.getString("match_nickname");
				String match_tagline = rs.getString("match_tagline");
				
				MatchDto dto = new MatchDto(match_id, match_nickname, match_tagline, profile_image);
				dtos.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("getMatchList() 오류 : "+ sql);
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return dtos;
	}

	

	
	
	
	
}
