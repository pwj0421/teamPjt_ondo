package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import common.DBConnection;
import dto.MessageChatDto;

public class MessageChatDao {

    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    // 로그인 사용자(myId) 기준 방 목록 조회
    public List<MessageChatDto> getChatRoomList(String myId) {
        List<MessageChatDto> list = new ArrayList<>();
        try {
            con = DBConnection.getConnection();
            
            String sql = "SELECT \r\n"
            		+ "    r.room_id, r.request_id, r.partner_id, r.my_id,\r\n"
            		+ "    g.message_id, g.content, g.sender_id, \r\n"
            		+ "    m.m_nickname AS partnerNickname, m.m_image AS partnerImage\r\n"
            		+ "FROM ondo_message_room r\r\n"
            		+ "JOIN ondo_member m ON m.m_id = r.partner_id\r\n"
            		+ "JOIN ondo_message g ON g.room_id = r.room_id\r\n"
            		+ "WHERE r.my_id = '"+myId+"'\r\n"
            		+ "  AND g.sent_at = (\r\n"
            		+ "      SELECT MAX(sent_at)\r\n"
            		+ "      FROM ondo_message\r\n"
            		+ "      WHERE room_id = r.room_id\r\n"
            		+ "  )\r\n"
            		+ "ORDER BY g.sent_at DESC ";
            
         
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                MessageChatDto dto = new MessageChatDto();
                dto.setRoomId(rs.getString("room_id"));
                dto.setRequestId(rs.getString("request_id"));
                dto.setPartnerId(rs.getString("partner_id"));
                dto.setMyId(rs.getString("my_id"));
                dto.setMessageId(rs.getString("message_id"));
                dto.setContent(rs.getString("content"));
                dto.setSenderId(rs.getString("sender_id"));
                dto.setPartnerNickname(rs.getString("partnerNickname"));
                dto.setPartnerImage(rs.getString("partnerImage"));

                list.add(dto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try { if(rs != null) rs.close(); } catch(Exception e) {}
            try { if(ps != null) ps.close(); } catch(Exception e) {}
            try { if(con != null) con.close(); } catch(Exception e) {}
        }
        return list;
    }
    
    
    //메세지 컨테이너
    // 특정 방의 전체 메시지
    public List<MessageChatDto> getMessageListByRoomId(String roomId) {
        List<MessageChatDto> list = new ArrayList<>();
        String sql = "SELECT message_id, content, sender_id, to_char(sent_at, 'hh24:mi') as sent_At \r\n"
        		+ "        FROM ondo_message WHERE room_id = "+roomId+" ORDER BY sent_at ASC";
        System.out.println("ddddd :::: "+sql);
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, roomId);
            try (ResultSet rs = ps.executeQuery()) {
                while(rs.next()) {
                    MessageChatDto dto = new MessageChatDto();
                    dto.setMessageId(rs.getString("message_id"));
                    dto.setContent(rs.getString("content"));
                    dto.setSenderId(rs.getString("sender_id"));
                    dto.setSentAt(rs.getTimestamp("sent_at"));
                    list.add(dto);
                }
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}