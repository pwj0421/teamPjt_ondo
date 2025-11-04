package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import dto.ComuAttachmentDto;
import common.DBConnection;

public class ComuAttachmentDao {

    public List<ComuAttachmentDto> getAttachmentsByPostId(int post_id) {
        List<ComuAttachmentDto> list = new ArrayList<>();
        String sql = "SELECT * FROM ondo_comu_attachments WHERE post_id=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, post_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ComuAttachmentDto dto = new ComuAttachmentDto();
                dto.setAttachment_id(rs.getInt("attachment_id"));
                dto.setPost_id(rs.getInt("post_id"));
                dto.setFile_path(rs.getString("file_path"));
                dto.setFile_type(rs.getString("file_type"));
                dto.setUploaded_at(rs.getDate("uploaded_at"));
                list.add(dto);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public void insertAttachment(ComuAttachmentDto dto) {
        String sql = "INSERT INTO ondo_comu_attachments(attachment_id, post_id, file_path, file_type, uploaded_at) VALUES (ondo_comu_attachments_seq.nextval, ?, ?, ?, SYSDATE)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, dto.getPost_id());
            ps.setString(2, dto.getFile_path());
            ps.setString(3, dto.getFile_type());
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
