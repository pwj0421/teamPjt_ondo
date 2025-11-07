package dao;

import java.sql.*;
import dto.ComuWriteDto;

public class ComuWriteDao {
	Connection 			con;
	PreparedStatement 	ps;
	ResultSet 			rs;

    // 글 작성
    public boolean insertPost(ComuWriteDto dto) {
        String sql = "INSERT INTO ondo_comu_posts(post_id, m_id, title, content, create_at, update_at, hit) "
                   + "VALUES(ondo_comu_posts_seq.NEXTVAL, ?, ?, ?, SYSDATE, SYSDATE, 0)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, dto.getM_id());
            ps.setString(2, dto.getTitle());
            ps.setString(3, dto.getContent());
            return ps.executeUpdate() > 0;
        } catch(SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // m_name 가져오기 (회원 테이블에서)
    public String getMemberName(String m_id) {
        String sql = "SELECT m_name FROM ondo_member WHERE m_id=?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, m_id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                return rs.getString("m_name");
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
