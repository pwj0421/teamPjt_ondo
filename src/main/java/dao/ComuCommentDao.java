package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import dto.ComuCommentDto;
import common.DBConnection;

public class ComuCommentDao {

    public List<ComuCommentDto> getCommentsByPostId(int post_id) {
        List<ComuCommentDto> list = new ArrayList<>();
        String sql = "SELECT c.*, m.m_name FROM ondo_comu_comments c JOIN ondo_member m ON c.m_id=m.m_id WHERE post_id=? ORDER BY create_at";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, post_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ComuCommentDto dto = new ComuCommentDto();
                dto.setComment_id(rs.getInt("comment_id"));
                dto.setPost_id(rs.getInt("post_id"));
                dto.setM_id(rs.getString("m_id"));
                dto.setComment_content(rs.getString("comment_content"));
                dto.setCreate_at(rs.getDate("create_at"));
                dto.setUpdate_at(rs.getDate("update_at"));
                dto.setM_name(rs.getString("m_name"));
                list.add(dto);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
