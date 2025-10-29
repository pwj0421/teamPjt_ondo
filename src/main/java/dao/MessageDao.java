package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnection;

public class MessageDao {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
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

	
	 // senderId가 보낸 메시지 수신자 ID 리스트 가져오기
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

}
