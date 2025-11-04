package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.DBConnection;
import dto.MessageDto;



public class MessageDao {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	

	//메세지 요청 저장하기 > match > match_main
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

	
	 // senderId가 보낸 메시지 수신자 ID 리스트 가져오기 match > match_main 
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
	
//mypage 
	//마이페이지 내가 받은 요청 목록 >mypage / message > messageRequestList
	public ArrayList<MessageDto> getReceiveRequest(String myId) {
		ArrayList<MessageDto> dtos = new ArrayList<>();
		String sql="select r.request_id, r.sender_id, r.receiver_id, r.greeting_message,\r\n"
				+ "        to_char(r.requested_at,'yy-mm-dd') as requested_At,\r\n"
				+ "        m.m_gender, m.m_age, m.m_country, m.m_nickname, m.m_image\r\n"
				+ "from ondo_message_request r, ondo_member m\r\n"
				+ "where r.sender_id = m.m_id\r\n"
				+ "and status = 'pending'\r\n"
				+ "and r.receiver_id = '"+myId+"'";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				String request_id = Integer.toString(rs.getInt("request_id")); 
				String sender_id = rs.getString("sender_id"); 
				String receiver_id = rs.getString("receiver_id"); 
				String greetingMsg = rs.getString("greeting_message"); 
				String request_date = rs.getString("requested_At");
				String gender = rs.getString("m_gender");
					if(gender.equals("F"))gender="남자";
					else if(gender.equals("M"))gender="여자";
				String age = rs.getString("m_age");
				String country = rs.getString("m_country");
					if(gender.equals("KR"))gender="대한민국";
					else if(gender.equals("JP"))gender="일본";
				String nickname = rs.getString("m_nickname");
				String profileImg = rs.getString("m_image");
					if(profileImg == null) profileImg = "basic_profile.png";
				
				MessageDto dto = new MessageDto(request_id, sender_id, receiver_id, greetingMsg, request_date, gender,age,country,nickname,profileImg);
				dtos.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("getReceiveRequest() 오류 : "+sql);
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return dtos;
	}

		//마이페이지 내가 보낸 요청 목록 myRequestList
		public ArrayList<MessageDto> myRequestMessageList(String myId) {
			ArrayList<MessageDto> dtos = new ArrayList<>();
			String sql="select r.request_id, r.sender_id, r.receiver_id, r.greeting_message, r.requested_at,\r\n"
					+ "        m.m_gender, m.m_age, m.m_country, m.m_nickname, m.m_image\r\n"
					+ "from ondo_message_request r, ondo_member m\r\n"
					+ "where r.receiver_id = m.m_id\r\n"
					+ "and status = 'pending'\r\n"
					+ "and r.sender_id = '"+myId+"'";
			System.out.println(sql);
			try {
				con = DBConnection.getConnection();
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()) {
					String request_id = Integer.toString(rs.getInt("request_id")); 
					String sender_id = rs.getString("sender_id"); 
					String receiver_id = rs.getString("receiver_id"); 
					String greetingMsg = rs.getString("greeting_message"); 
					String request_date = rs.getString("requested_At");
					String gender = rs.getString("m_gender");
						if(gender.equals("F"))gender="여자";
						else if(gender.equals("M"))gender="남자";
					String age = rs.getString("m_age");
					String country = rs.getString("m_country");
						if(country.equals("KR"))gender="대한민국";
						else if(country.equals("JP"))gender="일본";
					String nickname = rs.getString("m_nickname");
					String profileImg = rs.getString("m_image");
						if(profileImg == null) profileImg = "basic_profile.png";
					
					MessageDto dto = new MessageDto(request_id, sender_id, receiver_id, greetingMsg, request_date, gender,age,country,nickname,profileImg);
					dtos.add(dto);
				}
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("getReceiveRequest() 오류 : "+sql);
			} finally {
				DBConnection.closeDB(con, ps, rs);
			}
			return dtos;
		}

		//요청 수락 / 거절  > message receiveRequest update
		public int updateRequestState(String requestId, String state) {
			int result = 0;
			String sql="update ondo_message_request \r\n"
					+ "set status = '"+state+"' \r\n"
					+ "where request_id = "+requestId;
			
			try {
				con = DBConnection.getConnection();
				ps = con.prepareStatement(sql);
				result = ps.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("updateRequestState() 오류 : "+sql);
			} finally {
				DBConnection.closeDB(con, ps, rs);
			}
			
			
			return result;
		}



			//요청 취소 my_request cancel
		public int RequestStateCancel(String requestId) {
			int result = 0;
			String sql="delete ondo_message_request\r\n"
					+ "where request_id = "+requestId;
			
			try {
				con = DBConnection.getConnection();
				ps = con.prepareStatement(sql);
				result = ps.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("RequestStateCancel() 오류 : "+sql);
			} finally {
				DBConnection.closeDB(con, ps, rs);
			}
			
			
			return result;
		}

		
	
	
}
