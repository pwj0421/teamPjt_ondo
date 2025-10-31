package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnection;
import dto.MessageDto;
import dto.NoticeDto;

public class MessageDao {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// 메세지 보내기 match_main 
	public int saveMessage(String senderId, String receiverId, String message) {
	    int result = 0;
	    String sql = "INSERT INTO ondo_message_request (sender_id, receiver_id, greeting_message) VALUES (?, ?, ?)";

	    try {
	        con = DBConnection.getConnection();
	        ps = con.prepareStatement(sql);
	        ps.setString(1, senderId);
	        ps.setString(2, receiverId);
	        ps.setString(3, message);

	        result = ps.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	        System.out.println("saveMessage() 오류 : " + sql);
	    } finally {
	        DBConnection.closeDB(con, ps, rs);
	    }

	    return result;
	}

	
	 // senderId가 보낸 메시지 수신자 ID 리스트 가져오기 match_main 
	public List<String> getSentMessageReceiverIds(String senderId) {
	    List<String> receiverIds = new ArrayList<>();
	     String sql = "SELECT receiver_id FROM ondo_message_request WHERE sender_id = '"+senderId+"'";
	     
	     
	    try {
	    	con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

	        while (rs.next()) {
	            receiverIds.add(rs.getString("receiver_id"));
	        }

	    } catch(Exception e) {
			e.printStackTrace();
			System.out.println("getSentMessageReceiverIds() 오류 : "+sql);
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		

	    return receiverIds;
	}


	public ArrayList<MessageDto> getReceiveRequestList(String myId) {
		ArrayList<MessageDto> dtos = new ArrayList<>();
		String sql ="select r.request_id, r.sender_id, r.receiver_id, r.greeting_message, \r\n"
				+ "        TO_CHAR(r.requested_at, 'YY-MM-DD') AS requested_at, \r\n"
				+ "        m.m_nickname, m.m_image, m.m_age, m.m_gender, m.m_country\r\n"
				+ "from ondo_message_request r, ondo_member m\r\n"
				+ "where r.receiver_id = '"+myId+"'\r\n"
				+ "and r.sender_id = m.m_id\r\n"
				+ "and r.status ='pending'";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String requestNo= Integer.toString(rs.getInt("request_id")); 
				String senderId= rs.getString("sender_id"); 
				String receiverId = rs.getString("receiver_id"); 
				String greetingMsg = rs.getString("greeting_message"); 
				String sendDate = rs.getString("requested_at");
				String profileImg = rs.getString("m_image");
					if(profileImg == null) profileImg = "basic_profile.png";
				
				String nickname = rs.getString("m_nickname");
				String gender = rs.getString("m_gender");
					if(gender.equals("F")) gender="여성";
					else if(gender.equals("M")) gender="남성";
					
				String country = rs.getString("m_country");
				if(country.equals("KR")) country="한국";
				else if(country.equals("JP")) country="일본";
				
				String age = rs.getString("m_age");
				
				MessageDto dto = new MessageDto(requestNo, senderId, receiverId, greetingMsg, sendDate, profileImg, nickname, gender, country, age);
				dtos.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("getReceiveRequestList() 오류 : "+sql);
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return dtos;
	}

	
	
}
