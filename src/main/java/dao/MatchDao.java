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
	public ArrayList<Integer> getInterestList(String id) {
		ArrayList<Integer> interestList = new ArrayList<Integer>();
		for (int i=0; i<31; i++) {
			interestList.add(0);
		}
		String sql = "SELECT item_id\r\n"
				   + "FROM ondo_member_interest\r\n"
				   + "WHERE member_id = '"+id+"'\r\n"
				   + "ORDER BY item_id";

		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				int item_id = rs.getInt("item_id");
				
				interestList.set(item_id-1, item_id);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("getInterestList() 오류 : "+ sql);
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return interestList;
	}
	
	// MATCH LIST
	// MatchList.java
	public ArrayList<MatchDto> getMatchList(String id, ArrayList<String> searches) {
	    ArrayList<MatchDto> dtos = new ArrayList<>();
	    String sql = "SELECT * FROM ( " +
	                 "SELECT DISTINCT i.member_id, m.m_image, m.m_nickname, m.m_tagline " +
	                 "FROM ondo_member_interest i " +
	                 "JOIN ondo_member m ON i.member_id = m.m_id " +
	                 "WHERE i.item_id IN (" + String.join(",", searches) + ") " +
	                 "AND i.member_id <> ? " +
	                 "ORDER BY dbms_random.value ) " +
	                 "WHERE rownum <= 4";

	    try {
	        con = DBConnection.getConnection();
	        ps = con.prepareStatement(sql);
	        ps.setString(1, id);
	        rs = ps.executeQuery();

	        while(rs.next()) {
	            String matchId = rs.getString("member_id");
	            String image = rs.getString("m_image");
	            String nickname = rs.getString("m_nickname");
	            String tagline = rs.getString("m_tagline");

	            // 관심사 가져오기
	            ArrayList<InterestDto> interests = new ArrayList<>();
	            String sql2 = "SELECT m.item_id, i.item_name\r\n"
	            			+ "FROM ondo_member_interest m\r\n"
	            			+ "JOIN ondo_interest_item i\r\n"
	            			+ "  ON m.item_id = i.item_id\r\n"
	            			+ "WHERE member_id = ? ";
	            
	            try (PreparedStatement ps2 = con.prepareStatement(sql2)) {
	                ps2.setString(1, matchId);
	                try (ResultSet rs2 = ps2.executeQuery()) {
	                    while(rs2.next()) {
	                    	int item_id = rs2.getInt("item_id");
	                    	String item_name = rs2.getString("item_name");
	                    	
	                    	InterestDto dto = new InterestDto(item_id, item_name);
	                    	interests.add(dto);
	                    } 
	                } catch(Exception e) {
	        	        e.printStackTrace();
	        	        System.out.println("getMatchList() 오류2 : " + sql2);
	        	    }
	            }

	            MatchDto dto = new MatchDto(matchId, image, nickname, tagline, interests);
	            dtos.add(dto);
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	        System.out.println("getMatchList() 오류 : " + sql);
	    } finally {
	        DBConnection.closeDB(con, ps, rs);
	    }

	    return dtos;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
