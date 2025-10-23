package dao;

import java.sql.*;
import java.util.*;
import dto.ComuDto;

public class ComuDao {

    // DB 연결 정보 (환경에 맞게 수정)
    private final String URL = "jdbc:mysql://localhost:3306/yourDB?serverTimezone=UTC";
    private final String USER = "yourUsername";
    private final String PASS = "yourPassword";

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    // DB 연결
    private void connect() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASS);
        } catch (ClassNotFoundException e) {
            throw new SQLException("JDBC Driver 로드 실패: " + e.getMessage());
        }
    }

    // DB 연결 종료
    private void close() {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 글 등록
    public int insertPost(ComuDto dto) {
        int result = 0;
        String sql = "INSERT INTO free_board (m_id, title, content, create_at, update_at, hit) "
                   + "VALUES (?, ?, ?, NOW(), NOW(), 0)";

        try {
            connect(); // DB 연결 메서드
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getM_id());
            pstmt.setString(2, dto.getTitle());
            pstmt.setString(3, dto.getContent());
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return result;
    }


    // 조회수 증가
    public void increaseHit(int postId) {
        String sql = "UPDATE free_board SET hit = hit + 1 WHERE post_id=?";

        try {
            connect();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, postId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    // 글 수정
    public int updatePost(ComuDto dto) {
        String sql = "UPDATE free_board SET title=?, content=?, update_at=NOW() WHERE post_id=?";
        int result = 0;

        try {
            connect();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getContent());
            pstmt.setInt(3, dto.getPost_id());
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return result;
    }

    // 글 삭제
    public int deletePost(int postId) {
        String sql = "DELETE FROM free_board WHERE post_id=?";
        int result = 0;

        try {
            connect();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, postId);
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return result;
    }
}
