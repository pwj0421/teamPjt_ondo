package dao;

import java.sql.*;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import dto.ComuPostDto;
import dto.NoticeDto;
import common.DBConnection; // DBConnection 클래스에서 Connection 가져오기

public class ComuPostDao {

	 Connection conn = null;
     PreparedStatement ps = null;
     ResultSet rs = null;
    
    // 게시글 저장
    public int getComuNo(){
    	int no = 0;
		String sql="select nvl(max(post_id), 0000) as n_no\r\n"
				+ "from ondo_comu_posts";
		
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				no = rs.getInt("n_no");
				
				no = no + 1;
				
				DecimalFormat df = new DecimalFormat("N000");
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("getNoticeNo() 오류 : "+sql);
		} finally {
			DBConnection.closeDB(conn, ps, rs);
		}
		
		return no;
    }
     
    // 게시글 리스트
    public List<ComuPostDto> getPostList(String select, String search, int start, int end) {
        List<ComuPostDto> list = new ArrayList<>();
        String sql = "select * \r\n"
        		+ "from (\r\n"
        		+ "    select rownum as rnum, tbi.*\r\n"
        		+ "    from (\r\n"
        		+ "    SELECT p.post_id, m.m_name, p.title, p.create_at, p.hit \r\n"
        		+ "    FROM ondo_comu_posts p JOIN ondo_member m \r\n"
        		+ "    ON p.m_id = m.m_id\r\n"
        		+ "    where 1=1\r\n"
        		+ "    and "+select+" like '%' || '"+search+"' || '%'\r\n"
        		+ "    ORDER BY p.post_id DESC\r\n"
        		+ "    ) tbi\r\n"
        		+ ") where rnum >= "+start+" and rnum <= "+end;
        
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
        String sql = "SELECT p.post_id, p.m_id, p.title, p.content, p.create_at, \r\n"
        		+ " p.hit, m.m_name \r\n"
        		+ "FROM ondo_comu_posts p JOIN ondo_member m ON p.m_id = m.m_id \r\n"
        		+ "WHERE post_id = ?";


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
                dto.setHit(rs.getInt("hit"));
                dto.setM_name(rs.getString("m_name"));
            }
           
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return dto;
    }
    
    //조회수 증가
    public void increaseHit(int postId) {
        String sql = "UPDATE ondo_comu_posts SET hit = hit + 1 WHERE post_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, postId);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
    
    // 게시글 삽입
    public int insertPost(ComuPostDto dto) {
        int result = 0;
    	String sql = "INSERT INTO ondo_comu_posts(post_id, m_id, title, content, create_at, update_at, hit) VALUES (?, ?, ?, ?, SYSDATE, SYSDATE, 0)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, new String[]{"post_id"})) {

        	ps.setInt(1, dto.getPost_id());
            ps.setString(2, dto.getM_id());
            ps.setString(3, dto.getTitle());
            ps.setString(4, dto.getContent());
            result = ps.executeUpdate();

            // 방금 등록한 post_id 가져오기
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                dto.setPost_id(rs.getInt(1));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return result;
    }

    public boolean deletePost(int postId) {
        boolean result = false;
        String sql = "DELETE FROM ondo_comu_posts WHERE post_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, postId);
            int rows = pstmt.executeUpdate();

            result = rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
    
    public boolean updatePost(int postId, String title, String content) {
        boolean result = false;
        String sql = "UPDATE ondo_comu_posts SET title = ?, content = ?, update_at = SYSDATE WHERE post_id = ?";


        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setInt(3, postId);

            int rows = pstmt.executeUpdate();
            result = rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

	public int getTotalCount(String select, String search) {
		int result = 0;
		String sql = "select count(*) as count\r\n"
					+ "from ondo_comu_posts\r\n"
					+ "where "+select+" like '%' || '"+search+"' || '%'";
			
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("count");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			String method = Thread.currentThread().getStackTrace()[1].getClassName();
			System.out.println(method+"에서 오류 발생");
			System.out.println(sql);
		} finally {
			DBConnection.closeDB(conn, ps, rs);
		}
		
		
		return result;
	}
    
   

}
