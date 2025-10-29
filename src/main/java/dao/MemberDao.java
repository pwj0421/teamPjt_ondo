package dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.DBConnection;
import dto.MemberDto;

public class MemberDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public int memberSave(MemberDto dto) {
	    int result = 0;
	    String sql = "INSERT INTO ondo_member ("
	        + "m_id, m_password, m_name, m_age, m_gender, m_country, "
	        + "m_zipcode, m_address, m_address_detail, "
	        + "m_tel1, m_tel2, m_tel3, "
	        + "m_email1, m_email2, "
	        + "m_type, m_purpose, m_recommender, "
	        + "m_reg,"
	        + "m_nickname, m_image"
	        + ") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,TO_DATE(?,'YYYY-MM-DD HH24:MI:SS'),?,?)";
	    
	    try {
	        conn = DBConnection.getConnection();
	        pstmt = conn.prepareStatement(sql);

	        pstmt.setString(1,  dto.getM_id());
	        pstmt.setString(2,  dto.getM_password());
	        pstmt.setString(3,  dto.getM_name());
	        pstmt.setInt(4,     dto.getM_age());
	        pstmt.setString(5,  dto.getM_gender());
	        pstmt.setString(6,  dto.getM_country());
	        pstmt.setString(7,  dto.getM_zipcode());
	        pstmt.setString(8,  dto.getM_address());
	        pstmt.setString(9,  dto.getM_address_detail());
	        pstmt.setString(10, dto.getM_tel1());
	        pstmt.setString(11, dto.getM_tel2());
	        pstmt.setString(12, dto.getM_tel3());
	        pstmt.setString(13, dto.getM_email1());
	        pstmt.setString(14, dto.getM_email2());
	        pstmt.setString(15, dto.getM_type());
	        pstmt.setString(16, dto.getM_purpose());
	        pstmt.setString(17, dto.getM_recommender());
	        pstmt.setString(18, dto.getM_reg());      // 문자열 날짜 ("YYYY-MM-DD HH24:MI:SS")
	        pstmt.setString(19, dto.getM_nickname());
	        pstmt.setString(20, dto.getM_image());

	        result = pstmt.executeUpdate();
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        System.out.println("memberSave() 오류: " + sql);
	    } finally {
	        DBConnection.closeDB(conn, pstmt, null);
	    }

	    return result;
	}

	// 비밀번호 암호화
	   public String encryptSHA256(String value) throws NoSuchAlgorithmException{
	        String encryptData ="";
	        
	        MessageDigest sha = MessageDigest.getInstance("SHA-256");
	        sha.update(value.getBytes());
	 
	        byte[] digest = sha.digest();
	        for (int i=0; i<digest.length; i++) {
	            encryptData += Integer.toHexString(digest[i] &0xFF).toUpperCase();
	        }
	         
	        return encryptData;
	    }

	   public String memberLogin(String id, String password) {
		   String name = "";
		   String sql = "select m_name from ondo_member\n"
		   		+ "where m_id = ?\n"
		   		+ "and m_password = ?\n"
		   		+ "and m_quit is null";
		   try {
			   conn = DBConnection.getConnection();
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setString(1, id);
			   pstmt.setString(2, password);
			   rs = pstmt.executeQuery();
			   if(rs.next()) {
				   name = rs.getString("m_name");
			   }
		   } catch (Exception e) {
			   e.printStackTrace();
			   System.out.println("memberLogin() 오류" + sql);
		   } finally {
			   DBConnection.closeDB(conn, pstmt, rs);
		   }
		   return name;
	   }

	   public int memberCheckId(String id) {
		   int count = 0;
		   String sql = "select count(*) as count\n"
		   		+ "from ondo_member\n"
		   		+ "where m_id = ?";
		   try {
			   conn = DBConnection.getConnection();
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setString(1, id);
			   rs = pstmt.executeQuery();
			   if(rs.next()) {
				   count = rs.getInt("count");
			   }
		   } catch(Exception e) {
			   e.printStackTrace();
			   System.out.println("memberCheckId() 오류 : " + sql);
		   } finally {
			   DBConnection.closeDB(conn, pstmt, rs);
		   }
		   return count;
	   }
}
