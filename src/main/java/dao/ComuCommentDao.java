package dao;

import java.sql.*;
import java.util.*;
import common.DBConnection;
import dto.ComuCommentDto;

public class ComuCommentDao {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// ✅ 댓글 목록 조회
	public List<ComuCommentDto> getCommentsByPostId(int post_id) {
		List<ComuCommentDto> list = new ArrayList<>();
		String sql = "SELECT c.comment_id, c.post_id, c.m_id, m.m_name, c.comment_content, "
				+ "TO_CHAR(c.create_at, 'YYYY-MM-DD HH24:MI') AS create_at, "
				+ "TO_CHAR(c.update_at, 'YYYY-MM-DD HH24:MI') AS update_at "
				+ "FROM ondo_comu_comments c "
				+ "JOIN ondo_member m ON c.m_id = m.m_id "
				+ "WHERE c.post_id = ? "
				+ "ORDER BY c.comment_id DESC";
		
		try {
			con = DBConnection.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, post_id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int comment_id = rs.getInt("comment_id");
				String m_id = rs.getString("m_id");
				String m_name = rs.getString("m_name");
				String comment_content = rs.getString("comment_content");
				String create_at = rs.getString("create_at");
				String update_at = rs.getString("update_at");
				
				ComuCommentDto  dto = new ComuCommentDto(m_id, m_name, 
						comment_content, create_at, update_at, comment_id, post_id);
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// ✅ 댓글 등록
	public int insertComment(int post_id, String m_id, String content) {
		int result = 0;
		String sql = "INSERT INTO ondo_comu_comments (comment_id, post_id, m_id, comment_content, create_at, update_at) "
				+ "VALUES (SEQ_ONDO_COMMENTS.NEXTVAL, ?, ?, ?, SYSDATE, SYSDATE)";
		
		try {
			con = DBConnection.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, post_id);
			pstmt.setString(2, m_id);
			pstmt.setString(3, content);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
