package dao;

import java.sql.*;
import java.util.*;

import common.DBConnection;
import dto.ComuPostDto;

public class ComuPostDao {
	Connection 			con = null;
	PreparedStatement 	pstmt  = null;
	ResultSet 			rs  = null;
	
    // ✅ 전체 게시글 조회
    public List<ComuPostDto> getPostList() {
        List<ComuPostDto> list = new ArrayList<>();
        String sql = "SELECT p.post_id, p.m_id, m.m_name, p.title, p.content, "
                + "p.create_at, p.update_at, p.hit "
                + "FROM ondo_comu_posts p "
                + "JOIN ondo_member m ON p.m_id = m.m_id "
                + "ORDER BY p.post_id DESC";

        try {
        		con = DBConnection.getConnection();
    			pstmt  = con.prepareStatement(sql);
    			rs  = pstmt.executeQuery();

            while (rs.next()) {
                String m_id  = rs.getString("m_id");
                String m_name  = rs.getString("m_name");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String create_at = rs.getString("create_at");
                String update_at = rs.getString("update_at");
                int post_id = rs.getInt("post_id");
                int hit     = rs.getInt("hit");
                ComuPostDto dto = new ComuPostDto(m_id, m_name, title, content, create_at, update_at, post_id, hit);
                list.add(dto);
            }

            System.out.println("✅ 조회된 게시글 수: " + list.size()); // 확인용 로그
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ✅ 게시글 상세 조회
    public ComuPostDto getPostById(int postId) {
        ComuPostDto dto = null;

        String sql = "SELECT p.post_id, p.m_id, m.m_name, p.title, p.content, p.create_at, p.update_at, p.hit "
                + "FROM ondo_comu_posts p "
                + "JOIN ondo_member m ON p.m_id = m.m_id "
                + "WHERE p.post_id = ?";

        try {
        	con = DBConnection.getConnection();
			pstmt  = con.prepareStatement(sql);
			rs  = pstmt.executeQuery();
            pstmt.setInt(1, postId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                //  dto = new ComuPostDto(sql, sql, sql, sql, sql, postId, postId);
                    String m_id  = rs.getString("m_id");
                    String m_name  = rs.getString("m_name");
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    String create_at = rs.getString("create_at");
                    String update_at = rs.getString("update_at");
                    int post_id = rs.getInt("post_id");
                    int hit     = rs.getInt("hit");
                    dto = new ComuPostDto(m_id, m_name, title, content, create_at, update_at, post_id, hit);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return dto;
    }
}
