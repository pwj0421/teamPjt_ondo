package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DBConnection;
import dto.MatchDto;
import dto.MemberDto;

public class MyInfoUpdateDao {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// mypage > match Info - 내 매칭 정보 불러오기
	public MemberDto getMatchInfo(String id) {
		MemberDto dto = null;
		String sql="select m_nickname, m_tagline, M_INTRODUCTION\r\n"
				+ "from ondo_member\r\n"
				+ "where m_id = '"+id+"'";
		
		try {
    		con = DBConnection.getConnection();
    		ps = con.prepareStatement(sql);
    		rs = ps.executeQuery();
    		
    		if(rs.next()) {
    			String nickName = rs.getString("m_nickname");
    			String tagline = rs.getString("m_tagline");
    			String introduction = rs.getString("M_INTRODUCTION");
    			
    			dto = new MemberDto(nickName, tagline, introduction);
    			
    		}
    		
    	} catch(Exception e) {
    		e.printStackTrace();
    		System.out.println("getMatchInfo() 오류 : "+sql);
    	} finally {
    		DBConnection.closeDB(con, ps, rs);
    	}
		return dto;
	}
	
	// mypage > match Info - 내 매칭 정보 수정 정보 저장
	public int matchInfoUpdate(String id, String nickName, String tagline, String introduction, String updated) {
		int result = 0;
		String sql="update ondo_member\r\n"
				+ "set m_nickname = '"+nickName+"',\r\n"
				+ "    m_tagline ='"+tagline+"',\r\n"
				+ "    m_introduction = '"+introduction+"',  \r\n"
				+ "    m_updated = to_date('"+updated+"', 'yyyy-MM-dd hh24:mi:ss')\r\n"
				+ "where m_id='"+id+"'";
		
		try {
    		con = DBConnection.getConnection();
    		ps = con.prepareStatement(sql);
    		result = ps.executeUpdate();
    		
    	} catch(Exception e) {
    		e.printStackTrace();
    		System.out.println("matchInfoUpdate() 오류 : "+sql);
    	} finally {
    		DBConnection.closeDB(con, ps, rs);
    	}
		
		return result;
	}

	public boolean isNickExist(String nick) {
	    boolean result = false;
	    String sql = "SELECT COUNT(*) FROM ondo_member WHERE m_nickname=?";
	    try {
	        con = DBConnection.getConnection(); // ✅ DB 연결
	        ps = con.prepareStatement(sql);
	        ps.setString(1, nick);
	        rs = ps.executeQuery();
	        if (rs.next() && rs.getInt(1) > 0) result = true;
	    } catch (Exception e) {
	        e.printStackTrace();
	        System.out.println("isNickExist() 오류: " + sql);
	    } finally {
	        DBConnection.closeDB(con, ps, rs); // ✅ 연결 닫기
	    }
	    return result;
	}

	// 나의 관심사 추가
	public int addMyInterest(String id, ArrayList<Integer> addInterests) {
		int count = 0;
		String sql = "";
		
		try {
    		con = DBConnection.getConnection();
    		for(int i=0; i<addInterests.size(); i++) {
    			sql = "insert into ondo_member_interest\r\n"
				    + "(member_id, item_id)\r\n"
				    + "values\r\n"
				    + "('"+id+"', "+addInterests.get(i)+")";
    			
    			ps = con.prepareStatement(sql);
    			count += ps.executeUpdate();
    		}
    	} catch(Exception e) {
    		e.printStackTrace();
    		System.out.println("addMyInterest() 오류 : "+sql);
    	} finally {
    		DBConnection.closeDB(con, ps, rs);
    	}
		
		return count;
	}

	// 나의 관심사 삭제
		public int delMyInterest(String id, ArrayList<Integer> delInterests) {
			int count = 0;
			String sql = "";
			
			try {
	    		con = DBConnection.getConnection();
	    		for(int i=0; i<delInterests.size(); i++) {
	    			sql = "delete ondo_member_interest\r\n"
	 					+ "where member_id = '"+id+"'\r\n"
	 				    + "and item_id = "+delInterests.get(i)+"";
	    			
	    			ps = con.prepareStatement(sql);
	    			count += ps.executeUpdate();
	    		}
	    	} catch(Exception e) {
	    		e.printStackTrace();
	    		System.out.println("delMyInterest() 오류 : "+sql);
	    	} finally {
	    		DBConnection.closeDB(con, ps, rs);
	    	}
			
			return count;
		}
	
}
