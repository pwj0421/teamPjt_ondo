package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import dto.ComuPostDto;
import common.DBConnection; // DBConnection 클래스에서 Connection 가져오기

public class ComuPostDao {

	 Connection conn = null;
     PreparedStatement ps = null;
     ResultSet rs = null;
     
    // 게시글 리스트
    public List<ComuPostDto> getPostList() {
        List<ComuPostDto> list = new ArrayList<>();
        String sql = "SELECT p.post_id, m.m_name, p.title, p.create_at, p.hit " +
                "FROM ondo_comu_posts p " +
                "JOIN ondo_member m ON p.m_id = m.m_id " +
                "ORDER BY p.post_id DESC";
        System.out.println(sql);
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                ComuPostDto dto = new ComuPostDto();
                dto.setPost_id(rs.getInt("post_id"));
               // dto.setM_id(rs.getString("m_id"));
                dto.setTitle(rs.getString("title"));
               // dto.setContent(rs.getString("content"));
                dto.setCreate_at(rs.getDate("create_at"));
                //dto.setUpdate_at(rs.getDate("update_at"));
                dto.setHit(rs.getInt("hit"));
                dto.setM_name(rs.getString("m_name"));
                list.add(dto);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // 게시글 조회
    public ComuPostDto getPostById(int post_id) {
        ComuPostDto dto = null;
        String sql = "SELECT p.*, m.m_name FROM ondo_comu_posts p JOIN ondo_member m ON p.m_id=m.m_id WHERE post_id=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, post_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                dto = new ComuPostDto();
                dto.setPost_id(rs.getInt("post_id"));
                dto.setM_id(rs.getString("m_id"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setCreate_at(rs.getDate("create_at"));
                dto.setUpdate_at(rs.getDate("update_at"));
                dto.setHit(rs.getInt("hit"));
                dto.setM_name(rs.getString("m_name"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return dto;
    }

    // 게시글 삽입
    public void insertPost(ComuPostDto dto) {
        String sql = "INSERT INTO ondo_comu_posts(post_id, m_id, title, content, create_at, update_at, hit) VALUES (ondo_comu_posts_seq.nextval, ?, ?, ?, SYSDATE, SYSDATE, 0)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, new String[]{"post_id"})) {

            ps.setString(1, dto.getM_id());
            ps.setString(2, dto.getTitle());
            ps.setString(3, dto.getContent());
            ps.executeUpdate();

            // 방금 등록한 post_id 가져오기
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                dto.setPost_id(rs.getInt(1));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
